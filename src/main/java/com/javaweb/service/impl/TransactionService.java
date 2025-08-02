package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.TransactionResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TransactionService implements ITransactionService {

    @Autowired
    private TransactionRepository  transactionRepository;
    @Autowired
    private TransactionConverter transactionConverter;
    @Autowired
    private CustomerRepository customerRepository;
    @Override
    public List<TransactionDTO> findByCodeAndCustomerId(String code, Long customerId){
        List<TransactionEntity> transactions = transactionRepository.findByCodeAndCustomerEntity_Id(code, customerId);
        List<TransactionDTO> transactionDTOs = new ArrayList<>();
        for(TransactionEntity transactionEntity : transactions){
                TransactionDTO  transactionDTO = transactionConverter.converterToTransactionDTO(transactionEntity);
                transactionDTOs.add(transactionDTO);
        }

        return transactionDTOs;
    }

    @Override
    public void addOrUpdateTransaction(TransactionDTO  transactionDTO){
        TransactionEntity transactionEntity = transactionConverter.converterToTransactionEntity(transactionDTO);
        Long customerId = transactionDTO.getCustomerId();
        CustomerEntity customerEntity = customerRepository.findById(customerId).get();
        transactionEntity.setCustomerEntity(customerEntity);
        if(transactionDTO.getId() != null){
            TransactionEntity transaction = transactionRepository.findById(transactionDTO.getId()).get();
            transactionEntity.setCreatedDate(transaction.getCreatedDate());
           // transactionEntity.setModifiedDate(transaction.getModifiedDate());
            transactionEntity.setCreatedBy(transaction.getCreatedBy());
           // transactionEntity.setModifiedBy(transaction.getModifiedBy());
        }
        transactionRepository.save(transactionEntity);
    }

    @Override
    public String loadTransactionDetail(Long id){
        TransactionEntity transactionEntity = transactionRepository.findById(id).get();
        String note = transactionEntity.getNote();
        return note;
    }

}
