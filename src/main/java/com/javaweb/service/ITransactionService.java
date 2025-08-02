package com.javaweb.service;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.TransactionResponseDTO;

import java.util.List;

public interface ITransactionService {
    List<TransactionDTO> findByCodeAndCustomerId(String code, Long CustomerId);
    void addOrUpdateTransaction(TransactionDTO  transactionDTO);
    String loadTransactionDetail(Long id);
}
