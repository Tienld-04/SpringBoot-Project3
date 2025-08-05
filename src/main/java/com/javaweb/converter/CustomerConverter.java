package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.CustomerDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;

    public CustomerDTO converterToCustomerDTO(CustomerEntity customerEntity) {
        CustomerDTO customerDTO = modelMapper.map(customerEntity, CustomerDTO.class);
        List<UserEntity> userEntities = customerEntity.getUserEntityList();
        List<Long> idStaff = new ArrayList<>();
        for(UserEntity userEntity : userEntities){
            idStaff.add(userEntity.getId());
        }
        customerDTO.setStaffId(idStaff);
        return customerDTO;
    }

    public CustomerEntity converterToCustomerEntity(CustomerDTO customerDTO) {
        return modelMapper.map(customerDTO, CustomerEntity.class);
    }
}
