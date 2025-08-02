package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum City {
    HA_NOI("TP Hà Nội"),
    TP_HCM("TP Hồ Chí Minh"),
    DA_NANG("TP Đà Nẵng"),
    CAN_THO("TP Cần Thơ"),
    HAI_PHONG("TP Hải Phòng"),
    BAC_GIANG("TP Bắc Giang"),
    BAC_NINH("TP Bắc Ninh"),
    HUNG_YEN("TP Hưng Yên");

    private final String name;

    City(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public static Map<String, String> type() {
        Map<String, String> city = new TreeMap<>();
        for (City type : City.values()) {
            city.put(type.name(), type.name);
        }
        return city;
    }
}
