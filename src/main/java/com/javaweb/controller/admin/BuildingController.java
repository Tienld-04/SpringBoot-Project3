package com.javaweb.controller.admin;



import com.javaweb.enums.TypeCode;
import com.javaweb.enums.DistrictCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IBuildingService buildingService;

    @GetMapping("/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request, Model model) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch",buildingSearchRequest);
        List<BuildingSearchResponse> responseList = buildingService.getBuildingSearch(buildingSearchRequest);
        mav.addObject("buildingList",responseList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districts", DistrictCode.type());
        mav.addObject("typeCodes", TypeCode.type());
        return mav;
    }
    @GetMapping("/admin/building-edit")
    public ModelAndView addBuilding(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", DistrictCode.type());
        mav.addObject("typeCodes", TypeCode.type());
        return mav;
    }
    @GetMapping("/admin/building-edit-{buildingId}")
    public ModelAndView updateBuilding(@PathVariable("buildingId") Long buildingId, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = buildingService.findBuildingById(buildingId);
        if (buildingDTO == null) {
            mav.setViewName("error/404");
            return mav;
        }
        mav.addObject("districts", DistrictCode.type());
        mav.addObject("typeCodes", TypeCode.type());
        mav.addObject("buildingEdit",buildingDTO);
        return mav;
    }

}
