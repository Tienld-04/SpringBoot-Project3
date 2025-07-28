package com.javaweb.builder;

import java.util.ArrayList;
import java.util.List;

public class BuildingSearchBuilder {
    private String name;
    private String district;
    private Long numberOfBasement;
    private Long rentPriceFrom;
    private Long rentPriceTo;
    private String managerName;
    private String managerPhone;
    private Long floorArea;
    private String ward;
    private String street;
    private String level;
    private String direction;
    private Long rentAreaFrom;
    private Long rentAreaTo;
    private Long staffId;
    private List<String> typeCode = new ArrayList<>();

    public BuildingSearchBuilder(BuildingBuilder builder){
        this.name = builder.name;
        this.district = builder.district;
        this.numberOfBasement = builder.numberOfBasement;
        this.rentPriceFrom = builder.rentPriceFrom;
        this.rentPriceTo = builder.rentPriceTo;
        this.managerName = builder.managerName;
        this.managerPhone = builder.managerPhone;
        this.floorArea = builder.floorArea;
        this.ward = builder.ward;
        this.street = builder.street;
        this.level = builder.level;
        this.direction = builder.direction;
        this.rentAreaFrom = builder.rentAreaFrom;
        this.rentAreaTo = builder.rentAreaTo;
        this.staffId = builder.staffId;
        this.typeCode = builder.typeCode;
    }

    public String getName() {
        return name;
    }

    public String getDistrictCode() {
        return district;
    }

    public Long getNumberOfBasement() {
        return numberOfBasement;
    }

    public Long getRentPriceFrom() {
        return rentPriceFrom;
    }

    public Long getRentPriceTo() {
        return rentPriceTo;
    }

    public String getMangerName() {
        return managerName;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public Long getFloorArea() {
        return floorArea;
    }

    public String getWard() {
        return ward;
    }

    public String getStreet() {
        return street;
    }

    public String getLevel() {
        return level;
    }

    public String getDirection() {
        return direction;
    }

    public Long getRentAreaFrom() {
        return rentAreaFrom;
    }

    public Long getRentAreaTo() {
        return rentAreaTo;
    }

    public Long getStaffId() {
        return staffId;
    }

    public List<String> getTypeCode() {
        return typeCode;
    }


    public static class BuildingBuilder{
        private String name;
        private String district;
        private Long numberOfBasement;
        private Long rentPriceFrom;
        private Long rentPriceTo;
        private String managerName;
        private String managerPhone;
        private Long floorArea;
        private String ward;
        private String street;
        private String level;
        private String direction;
        private Long rentAreaFrom;
        private Long rentAreaTo;
        private Long staffId;
        private List<String> typeCode = new ArrayList<>();
        public BuildingBuilder setName(String name){
            this.name = name;
            return this;
        }
        public BuildingBuilder setDistrictCode(String districtCode){
            this.district = districtCode;
            return this;
        }
        public BuildingBuilder setNumberOfBasement(Long numberOfBasement){
            this.numberOfBasement = numberOfBasement;
            return this;
        }
        public BuildingBuilder setRentPriceFrom(Long rentPriceFrom){
            this.rentPriceFrom = rentPriceFrom;
            return this;
        }
        public BuildingBuilder setRentPriceTo(Long rentPriceTo){
            this.rentPriceTo = rentPriceTo;
            return this;
        }
        public BuildingBuilder setManagerName(String managerName){
            this.managerName = managerName;
            return this;
        }
        public BuildingBuilder setManagerPhone(String managerPhone){
            this.managerPhone = managerPhone;
            return this;
        }
        public BuildingBuilder setFloorArea(Long floorArea){
            this.floorArea = floorArea;
            return this;
        }
        public BuildingBuilder setWard(String ward){
            this.ward = ward;
            return this;
        }
        public BuildingBuilder setStreet(String street){
            this.street = street;
            return this;
        }
        public BuildingBuilder setLevel(String level){
            this.level = level;
            return this;
        }
        public BuildingBuilder setDirection(String direction){
            this.direction = direction;
            return this;
        }
        public BuildingBuilder setRentAreaFrom(Long rentAreaFrom){
            this.rentAreaFrom = rentAreaFrom;
            return this;
        }
        public BuildingBuilder setRentAreaTo(Long rentAreaTo){
            this.rentAreaTo = rentAreaTo;
            return this;
        }
        public BuildingBuilder setStaffId(Long staffId){
            this.staffId = staffId;
            return this;
        }
        public BuildingBuilder setTypeCode(List<String> typeCode){
            this.typeCode = typeCode;
            return this;
        }
        public BuildingSearchBuilder build(){
            return new BuildingSearchBuilder(this);
        }
    }
}