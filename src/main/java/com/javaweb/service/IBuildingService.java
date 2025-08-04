package com.javaweb.service;

import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface IBuildingService {
    void addOrUpdateBuilding(BuildingDTO buildingDTO);
    void deleteBuildingByIds(List<Long> ids);
    ResponseDTO listStaffs(Long buildingId);
    List<BuildingSearchResponse> getBuildingSearch(BuildingSearchRequest buildingSearchRequest);
    BuildingDTO findBuildingById(Long id);
    void doneBuildingToStaff(AssignmentBuildingDTO assignmentBuildingDTO);
    List<Long> getUsersByBuildingId(Long BuildingId);
}
