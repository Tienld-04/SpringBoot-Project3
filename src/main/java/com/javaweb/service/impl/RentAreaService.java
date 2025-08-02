package com.javaweb.service.impl;

import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.IRentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentAreaService implements IRentAreaService {
    @Autowired
    private RentAreaRepository rentAreaRepository;

}
