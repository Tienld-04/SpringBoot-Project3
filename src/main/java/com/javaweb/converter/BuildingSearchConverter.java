package com.javaweb.converter;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.stereotype.Component;

@Component
public class BuildingSearchConverter {
    public BuildingSearchBuilder converterToBuildingSearchBuilder(BuildingSearchRequest buildingSearchRequest) {
        return new BuildingSearchBuilder.BuildingBuilder()
                .setName(buildingSearchRequest.getName())
                .setDistrictCode(buildingSearchRequest.getDistrict())
                .setRentAreaFrom(buildingSearchRequest.getAreaFrom())
                .setNumberOfBasement(buildingSearchRequest.getNumberOfBasement())
                .setRentAreaTo(buildingSearchRequest.getAreaTo())
                .setDirection(buildingSearchRequest.getDirection())
                .setLevel(buildingSearchRequest.getLevel())
                .setFloorArea(buildingSearchRequest.getFloorArea())
                .setRentPriceFrom(buildingSearchRequest.getRentPriceFrom())
                .setRentPriceTo(buildingSearchRequest.getRentPriceTo())
                .setManagerName(buildingSearchRequest.getManagerName())
                .setManagerPhone(buildingSearchRequest.getManagerPhone())
                .setWard(buildingSearchRequest.getWard())
                .setStreet(buildingSearchRequest.getStreet())
                .setStaffId(buildingSearchRequest.getStaffId())
                .setTypeCode(buildingSearchRequest.getTypeCode())
                .build();
    }
}
