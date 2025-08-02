package com.javaweb.repository.custom;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.entity.CustomerEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerRepositoryCustom {
    List<CustomerEntity> searchCustomers(CustomerSearchBuilder customerSearchBuilder);
    int countTotalItems();
    Page<CustomerEntity> searchCustomers(CustomerSearchBuilder customerSearchBuilder, Pageable pageable);
}
