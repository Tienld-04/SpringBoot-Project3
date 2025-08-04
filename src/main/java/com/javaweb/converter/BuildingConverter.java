package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingDTO converterToBuildingDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);

        // 8/4/2025
        List<UserEntity> userEntities = buildingEntity.getUserEntities();
        List<Long> idStaff = new ArrayList<>();
        for (UserEntity userEntity : userEntities) {
            idStaff.add(userEntity.getId());
        }
        buildingDTO.setStaffId(idStaff);
        //
        String typeCode = buildingEntity.getTypeCode();
        List<String> typeCodes = Arrays.asList(typeCode.split(","));
        buildingDTO.setTypeCode(typeCodes);
        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreaEntities();
        if (rentAreaEntities != null && !rentAreaEntities.isEmpty()) {
            buildingDTO.setRentArea(
                    rentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","))
            );
        }

        return buildingDTO;
    }

    public BuildingEntity converterToBuildingEntity(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        List<String> typeCodes = buildingDTO.getTypeCode();
        String typeCode = String.join(",", typeCodes);
        buildingEntity.setTypeCode(typeCode);
        List<RentAreaEntity> rentAreaEntities = Arrays.stream(buildingDTO.getRentArea().split(",")).map(
                value -> {
                    RentAreaEntity rentAreaEntity = new RentAreaEntity();
                    rentAreaEntity.setValue(Long.parseLong(value));
                    rentAreaEntity.setBuildingEntity(buildingEntity);
                    return rentAreaEntity;
                }).collect(Collectors.toList());

        buildingEntity.setRentAreaEntities(rentAreaEntities);
        return buildingEntity;
    }
//    public BuildingEntity converterToBuildingEntity(BuildingDTO buildingDTO) {
//        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
//
//        if (buildingDTO.getRentArea() != null && !buildingDTO.getRentArea().isEmpty()) {
//            List<RentAreaEntity> rentAreaEntities = Arrays.stream(buildingDTO.getRentArea().split(","))
//                    .map(value -> {
//                        try {
//                            RentAreaEntity rentAreaEntity = new RentAreaEntity();
//                            rentAreaEntity.setValue(Long.parseLong(value.trim()));
//                            rentAreaEntity.setBuildingEntity(buildingEntity);
//                            return rentAreaEntity;
//                        } catch (NumberFormatException e) {
//                            return null;
//                        }
//                    })
//                    .filter(Objects::nonNull) // Lọc các giá trị null nếu có lỗi
//                    .collect(Collectors.toList());
//
//            buildingEntity.setRentAreaEntities(rentAreaEntities);
//        }
//
//        return buildingEntity;
//    }
}
