package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IRentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController("buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {

    @Autowired
    private IBuildingService buildingService;

    @PostMapping
    public void addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        buildingService.addOrUpdateBuilding(buildingDTO);
    }
    @PutMapping("/{buildingId}")
    public void updateBuilding(@RequestBody BuildingDTO buildingDTO, @PathVariable("buildingId") Long buildingId){
        buildingDTO.setId(buildingId);
        buildingService.addOrUpdateBuilding(buildingDTO);
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids){
        buildingService.deleteBuildingByIds(ids);
        System.out.println("đã xóa ds building: "+ ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }

    @PostMapping("/assignment")
    public void doneBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        buildingService.doneBuildingToStaff(assignmentBuildingDTO);
        System.out.println("done");

    }

}
