package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.StatusCode;
import com.javaweb.model.response.CustomerSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class CustomerSearchResultConverter {
    @Autowired
    private ModelMapper modelMapper;

    public CustomerSearchResponse converterToCustomerSearchResponse(CustomerEntity customerEntity) {
        if (customerEntity == null) {
            return null;
        }
        CustomerSearchResponse customerSearchResponse = modelMapper.map(customerEntity, CustomerSearchResponse.class);
        String st = customerEntity.getStatus();

        Map<String, String> map = StatusCode.getStatusCode();
        String res = "";

        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (st != null && st.equals(entry.getKey())) {
                res = entry.getValue();
                break;
            }
        }

        customerSearchResponse.setStatus(res);
        return customerSearchResponse;
    }

}
