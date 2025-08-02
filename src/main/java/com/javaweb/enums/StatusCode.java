package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum StatusCode {
    DANG_XU_LY("Đang xử lý"),
    CHUA_XU_LY("Chưa xử lý"),
    DA_XU_LY("Đã xử lý");
    private final String status;

    StatusCode(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
    public static Map<String,String> getStatusCode(){
        Map<String,String> map = new HashMap<>();
        for(StatusCode x : StatusCode.values()){
            map.put(x.toString(),x.getStatus());
        }
        return map;
    }
}