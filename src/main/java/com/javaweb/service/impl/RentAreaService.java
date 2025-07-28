package com.javaweb.service.impl;

import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.IRentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RentAreaService implements IRentAreaService {

    @Autowired
    private RentAreaRepository rentAreaRepository;

}
