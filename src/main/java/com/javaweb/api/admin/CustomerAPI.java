package com.javaweb.api.admin;

import com.javaweb.model.dto.*;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.TransactionResponseDTO;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController("customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {

    @Autowired
    private ICustomerService customerService;

    @Autowired
    private ITransactionService transactionService;

    @PostMapping
    public void addCustomer(@RequestBody CustomerDTO customerDTO) {
        customerService.addorUpdateCustomer(customerDTO);
    }

    @PostMapping("/transaction")
    public void createTransaction(@RequestBody TransactionDTO transactionDTO) {
        transactionService.addOrUpdateTransaction(transactionDTO);
    }

    @GetMapping("/{transactionId}/details")
    public String loadTransactionDetail(@PathVariable Long transactionId) {
        return transactionService.loadTransactionDetail(transactionId);
    }

    @PutMapping("/{customerId}")
    public void updateCustomer(@RequestBody CustomerDTO customerDTO, @PathVariable("customerId") Long customerId) {
        customerDTO.setId(customerId);
        customerService.addorUpdateCustomer(customerDTO);
    }

    @DeleteMapping("/{ids}")
    public void deleteCustomer(@PathVariable List<Long> ids) {
        customerService.deleteCustomerByIds(ids);
        System.out.println("đã xóa ds customer: " + ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = customerService.listStaffs(id);
        return result;
    }

    @PostMapping("/assignment")
    public void doneCustomer(@RequestBody AssginCustomerDTO assginCustomerDTO) {
        customerService.doneCustomerToStaff(assginCustomerDTO);
        System.out.println("done customer");

    }
}
