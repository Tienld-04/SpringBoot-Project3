package com.javaweb.service;

import com.javaweb.model.dto.AssginCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface ICustomerService {
    List<CustomerSearchResponse> searchCustomers(CustomerSearchRequest customerSearchRequest);
    ResponseDTO listStaffs(Long customerId);
    void doneCustomerToStaff(AssginCustomerDTO assginCustomerDTO);
    void deleteCustomerByIds(List<Long> ids);
    void addorUpdateCustomer(CustomerDTO customerDTO);
    CustomerDTO getCustomerById(Long id);
}
