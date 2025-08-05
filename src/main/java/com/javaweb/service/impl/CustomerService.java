package com.javaweb.service.impl;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.converter.CustomerConverter;
import com.javaweb.converter.CustomerSearchBuilderConverter;
import com.javaweb.converter.CustomerSearchResultConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssginCustomerDTO;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CustomerSearchBuilderConverter customerSearchBuilderConverter;
    @Autowired
    private CustomerSearchResultConverter customerSearchResultConverter;
    @Autowired
    private CustomerConverter customerConverter;

    @Autowired
    private TransactionRepository transactionRepository;

    @Override
    public List<CustomerSearchResponse> searchCustomers(CustomerSearchRequest customerSearchRequest) {
        CustomerSearchBuilder customerSearchBuilder = customerSearchBuilderConverter.converterToCustomerSearchBuilder(customerSearchRequest);
        List<CustomerEntity> customerEntities = customerRepository.searchCustomers(customerSearchBuilder);
        List<CustomerSearchResponse> result = new ArrayList<>();
        for (CustomerEntity i : customerEntities) {
            CustomerSearchResponse customerSearchResponse = customerSearchResultConverter.converterToCustomerSearchResponse(i);
            result.add(customerSearchResponse);
        }
        return result;
    }

    @Override
    @Transactional
    public void doneCustomerToStaff(AssginCustomerDTO assginCustomerDTO) {
        Long customerId = assginCustomerDTO.getCustomerId();
        List<Long> staffId = assginCustomerDTO.getStaffs();
        CustomerEntity customerEntity = customerRepository.findById(customerId).orElseThrow(() -> new NotFoundException("Customer not found with ID: " + customerId));
        List<UserEntity> staffEntities = userRepository.findAllById(staffId);
        if (staffEntities.size() != staffId.size()) {
            throw new NotFoundException("One or more staff not found");
        }
        customerEntity.setUserEntityList(staffEntities);
        customerRepository.save(customerEntity);
    }

    @Override
    @Transactional
    public void fromContractAddCustomer(CustomerDTO customerDTO){
        Long id = customerDTO.getId();
        CustomerEntity customerEntity = customerConverter.converterToCustomerEntity(customerDTO);
        customerEntity.setActive(true);
        customerRepository.save(customerEntity);
    }
    @Override
    @Transactional
    public void addorUpdateCustomer(CustomerDTO customerDTO) {
        Long customerId = customerDTO.getId();
//        CustomerEntity customerEntity = customerConverter.converterToCustomerEntity(customerDTO);
//        if(id != null){
//            customerEntity.setCreatedBy(customerDTO.getCreatedBy());
//            customerEntity.setCreatedDate(customerDTO.getCreatedDate());
//        }
//        customerEntity.setActive(true);
//        customerRepository.save(customerEntity);
        if (customerId == null) {
            CustomerEntity customerEntity = customerConverter.converterToCustomerEntity(customerDTO);
            Long staffId = SecurityUtils.getPrincipal().getId();
            UserEntity userEntity = userRepository.findById(staffId).get();
            List<UserEntity> us = new ArrayList<>();
            us.add(userEntity);
            customerEntity.setUserEntityList(us);
            customerEntity.setActive(true);
            customerRepository.save(customerEntity);
        } else {
            CustomerEntity updateCustomerEntity = customerConverter.converterToCustomerEntity(customerDTO);
            List<Long> staffList = customerDTO.getStaffId();
            List<UserEntity> us = new ArrayList<>();
            for (Long staffId : staffList) {
                UserEntity userEntity = userRepository.findById(staffId).get();
                if (userEntity != null) {
                    us.add(userEntity);
                }
            }
            updateCustomerEntity.setUserEntityList(us);
            updateCustomerEntity.setCreatedBy(customerDTO.getCreatedBy());
            updateCustomerEntity.setCreatedDate(customerDTO.getCreatedDate());
            updateCustomerEntity.setModifiedBy(customerDTO.getModifiedBy());
            updateCustomerEntity.setModifiedDate(customerDTO.getModifiedDate());
            updateCustomerEntity.setActive(true);
            customerRepository.save(updateCustomerEntity);
        }
    }

    @Override
    public CustomerDTO getCustomerById(Long id) {
        Optional<CustomerEntity> op = customerRepository.findById(id);
        CustomerEntity customerEntity = new CustomerEntity();
        if (op.isPresent()) {
            customerEntity = op.get();
        }
        return customerConverter.converterToCustomerDTO(customerEntity);
    }

    @Override
    @Transactional
    public void deleteCustomerByIds(List<Long> ids) {
        List<CustomerEntity> customers = customerRepository.findAllById(ids);
        for (CustomerEntity customerEntity : customers) {
            List<TransactionEntity> transactionEntities = customerEntity.getTransactionEntities();
            // List<UserEntity> userEntities = customerEntity.getUserEntityList();
            if (!transactionEntities.isEmpty()) {
                customerEntity.getTransactionEntities().clear();
                transactionRepository.deleteAll(transactionEntities);
            }
            customerEntity.setActive(false);
            //customerEntity.getUserEntityList().clear();
            customerRepository.save(customerEntity);
        }
        // customerRepository.deleteAll(customers);
    }

    @Override
    public ResponseDTO listStaffs(Long customerId) {
        CustomerEntity customer = customerRepository.findById(customerId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = customer.getUserEntityList();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity item : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(item.getFullName());
            staffResponseDTO.setStaffId(item.getId());
            if (staffAssignment.contains(item)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("unchecked");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");

        return responseDTO;
    }
}
