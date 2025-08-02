package com.javaweb.api.web;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CustomerContractAPI {
    @Autowired
    private CustomerService customerService;

    @PostMapping("/contract/customer")
    public String customerContract(@ModelAttribute("modalCustomerContract") CustomerDTO customerDTO, RedirectAttributes redirectAttributes) {
        customerDTO.setStatus("CHUA_XU_LY");
        customerService.addorUpdateCustomer(customerDTO);
        redirectAttributes.addFlashAttribute("message", "Gửi liên hệ thành công!");
        return "redirect:/lien-he";
    }

}
