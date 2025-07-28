package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.utils.DistrictCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class BuildingSearchResultConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse converterToBuildingSearchResponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse building = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        Map<String, String> districtCode = DistrictCode.type();
        String districtName = "";
        for(Map.Entry<String, String> item : districtCode.entrySet()) {
            if(item.getKey().equals(buildingEntity.getDistrict())){
                districtName = item.getValue();
            }
        }
        building.setAddress(buildingEntity.getStreet()+" , "+buildingEntity.getWard() + " , "+ districtName);
        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreaEntities();
        building.setRentArea(rentAreaEntities.stream().map(it-> it.getValue().toString()).collect(Collectors.joining(",")));
        return building;
    }

}
