package com.javaweb.converter;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.model.request.CustomerSearchRequest;
import org.springframework.stereotype.Component;

@Component
public class CustomerSearchBuilderConverter {
    public CustomerSearchBuilder converterToCustomerSearchBuilder(CustomerSearchRequest request){
        return new CustomerSearchBuilder.CustomerBuilder()
                .setCustomerName(request.getCustomerName())
                .setEmail(request.getEmail())
                .setPhone(request.getPhone())
                .setStaffId(request.getStaffId())
                .build();
    }
}
