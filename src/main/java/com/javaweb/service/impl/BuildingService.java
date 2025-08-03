package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchConverter;
import com.javaweb.converter.BuildingSearchResultConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class BuildingService implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingSearchConverter buildingSearchConverter;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private BuildingSearchResultConverter buildingSearchResultConverter;
    @Autowired
    private BuildingRepositoryCustom buildingRepositoryCustom;
    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Override
    public List<BuildingSearchResponse> getBuildingSearch(BuildingSearchRequest buildingSearchRequest) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchConverter.converterToBuildingSearchBuilder(buildingSearchRequest);
        List<BuildingEntity> result = buildingRepositoryCustom.getBuildings(buildingSearchBuilder);
        List<BuildingSearchResponse> buildingSearchResponseList = new ArrayList<>();
        for (BuildingEntity buildingEntity : result) {
            BuildingSearchResponse buildingSearchResponse = buildingSearchResultConverter.converterToBuildingSearchResponse(buildingEntity);
            buildingSearchResponseList.add(buildingSearchResponse);
        }
        return buildingSearchResponseList;
    }

    @Override
    public BuildingDTO findBuildingById(Long id) {
        Optional<BuildingEntity> op = buildingRepository.findById(id);
        BuildingEntity buildingEntity = new BuildingEntity();
        if (op.isPresent()) {
            buildingEntity = op.get();
        }
        return buildingConverter.converterToBuildingDTO(buildingEntity);
    }

    @Override
    @Transactional
    public void addOrUpdateBuilding(BuildingDTO buildingDTO) {
        Long buildingId = buildingDTO.getId();
        if(buildingId == null){
            BuildingEntity buildingEntity = buildingConverter.converterToBuildingEntity(buildingDTO);
            buildingRepository.save(buildingEntity);
        }else {
            BuildingEntity updateBuildingEntity = buildingRepository.findById(buildingId).orElseThrow(() -> new NotFoundException("Building not found with ID: " + buildingId));
            updateBuildingEntity = buildingConverter.converterToBuildingEntity(buildingDTO);
            buildingRepository.save(updateBuildingEntity);
        }

//        Long buildingId = buildingDTO.getId();
//        BuildingEntity buildingEntity = buildingConverter.converterToBuildingEntity(buildingDTO);
//        //List<RentAreaEntity> rentAreaEntity = buildingEntity.getRentAreaEntities();
//        if (buildingId != null) {
//            BuildingEntity updatedBuilding = buildingRepository.findById(buildingId).orElseThrow(() -> new NotFoundException("Building Not Found"));
//        }
//        buildingRepository.save(buildingEntity);
    }

    @Override
    @Transactional
    public void deleteBuildingByIds(List<Long> ids) {
        List<BuildingEntity> buildings = buildingRepository.findAllById(ids);

        for (BuildingEntity buildingEntity : buildings) {
            List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreaEntities();
            List<UserEntity> userEntities = buildingEntity.getUserEntities();
            if (!userEntities.isEmpty()) {
                buildingEntity.getUserEntities().clear();
                buildingRepository.save(buildingEntity);
            }
            if (rentAreaEntities != null) {
                rentAreaRepository.deleteAll(rentAreaEntities);
            }
        }
        buildingRepository.deleteAll(buildings);
    }

    @Override
    @Transactional
    public void doneBuildingToStaff(AssignmentBuildingDTO assignmentBuildingDTO) {
        Long buildingId = assignmentBuildingDTO.getBuildingId();
        List<Long> staffId = assignmentBuildingDTO.getStaffs();
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).orElseThrow(() -> new NotFoundException("Building not found with ID: " + buildingId));
        List<UserEntity> staffEntities = userRepository.findAllById(staffId);
        if (staffEntities.size() != staffId.size()) {
            throw new NotFoundException("One or more staff not found");
        }
        buildingEntity.setUserEntities(staffEntities);
        buildingRepository.save(buildingEntity);
    }

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = building.getUserEntities();
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
