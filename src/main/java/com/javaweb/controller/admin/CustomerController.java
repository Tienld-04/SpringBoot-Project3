package com.javaweb.controller.admin;

import com.javaweb.enums.StatusCode;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.ITransactionService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "customerMangementController")
public class CustomerController {
    @Autowired
    private IUserService iUserService;
    @Autowired
    private ICustomerService iCustomerService;
    @Autowired
    private ITransactionService transactionService;


    @GetMapping(value = "/admin/customer-list")
    public ModelAndView customerList(@ModelAttribute("customerSearch") CustomerSearchRequest customerSearchRequest, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/customer/list");
        modelAndView.addObject("modelSearch", customerSearchRequest);
        // lấy dữ liệu từ db
        List<CustomerSearchResponse> responseList = iCustomerService.searchCustomers(customerSearchRequest);
        modelAndView.addObject("customers", responseList);
       // modelAndView.addObject("statusCode", StatusCode.getStatusCode());
        modelAndView.addObject("staffs", iUserService.getStaffs());
        return modelAndView;
    }

    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView addCustomer(@ModelAttribute("customerEdit") CustomerDTO customerDTO) {
        ModelAndView modelAndView = new ModelAndView("/admin/customer/edit");
        modelAndView.addObject("statusCode", StatusCode.getStatusCode());
        return modelAndView;
    }

    @GetMapping(value = "/admin/customer-edit-{customerId}")
    public ModelAndView updateCustomer(@PathVariable("customerId") Long id) {
        ModelAndView modelAndView = new ModelAndView("/admin/customer/edit");
        CustomerDTO customerDTO = iCustomerService.getCustomerById(id);
        modelAndView.addObject("customerEdit", customerDTO);
        modelAndView.addObject("statusCode", StatusCode.getStatusCode());
        modelAndView.addObject("transactionType", TransactionType.getTransactionType());
        modelAndView.addObject("CSKHList", transactionService.findByCodeAndCustomerId("CSKH", id));
        modelAndView.addObject("DDXList", transactionService.findByCodeAndCustomerId("DDX", id));
        return modelAndView;
    }
}
