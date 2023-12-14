package com.postgres.sample.controller.kjo;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.postgres.sample.dto.BoardVO;
import com.postgres.sample.dto.Observation;
import com.postgres.sample.dto.OrgArea;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.Paging;
import com.postgres.sample.dto.UserInfo;
import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.kjo.BoardService;
import com.postgres.sample.service.kjo.ObservationService;
import com.postgres.sample.service.kjo.OrgAreaService;
import com.postgres.sample.service.kjo.UserInfoService;
import com.postgres.sample.service.kjo.WaterResourcesService;

import lombok.RequiredArgsConstructor;


//@RestController
@Controller
@RequiredArgsConstructor
public class KjoController {
	private static final Logger Logger = LoggerFactory.getLogger(KjoController.class);
	
	
    private final BoardService boardservice;
    private final ObservationService observice;
    private final WaterResourcesService wrservice;
    private final UserInfoService userservice;
    private final OrgAreaService orgService;
    

    @GetMapping("/hello")
    public List<BoardVO> HelloWorld() throws Exception {
        return (List<BoardVO>) boardservice.SelectBoardList();
    }
    @ResponseBody
    @GetMapping("/hello2")
    public List<Organization> HelloWorld_v2() throws Exception {
    	System.out.println("hello2");
        return (List<Organization>) boardservice.SelectBoardList();
    }
    @ResponseBody
    @GetMapping("/observationtest")
    public List<Observation> HelloWorld_v10() throws Exception {
    	System.out.println("hi");
    	
        return (List<Observation>) observice.SelectObsList();
    }   
    

    @GetMapping("/water_resourcesList")
    public String waterResoucesList(@RequestParam(defaultValue = "1") String currentPage, Model model) {
    	System.out.println("water_resourcesList");
    	WaterResources wr = new WaterResources();
    	//	페이징 위한 수자원시설물 개수
    	wr.setTotal(wrservice.cntWaterResource().getTotal());
    	Paging page = new Paging(wr.getTotal(), currentPage,10);
    	wr.setStart(page.getStart());
    	wr.setEnd(page.getEnd());
    	
    	List<WaterResources> wrctgList = wrservice.findFacilityCategory();
    	List<OrgArea> orgList = orgService.findAllOrgArea();
    	List<WaterResources> wrList = wrservice.PaingWaterResourceLists(wr);

    	model.addAttribute("wrctgList",wrctgList);
    	model.addAttribute("orgList",orgList);
    	model.addAttribute("wrList",wrList);
    	model.addAttribute("page",page);
    	return "kjo/water_resources/water_resourcesList";
    }

    @ResponseBody
    @GetMapping("/facility_code_List")
    public List<WaterResources> facilityCodeList(@RequestParam String facility_category) {
    	
        WaterResources wr = new WaterResources();
        wr.setFacility_category(facility_category);
        List<WaterResources> wrList = wrservice.findFacilityAddrbyCategory(wr);
        System.out.println(wrList);
        return wrList;
    }
    
    @ResponseBody
    @GetMapping("/searchWaterResources")
    public List<WaterResources> searchWaterResources(WaterResources wr) {
    	wr.toString();
    	
        List<WaterResources> wrList = wrservice.searchWaterResources(wr);
        System.out.println(wrList);
        return wrList;
    }
    

    @GetMapping("/checkresultform")
    public String checkresult(WaterResources wr, Model model) throws Exception {
    	System.out.println("checkresult");
        wr= wrservice.findWaterResourcesById(wr);
    	
        model.addAttribute("WaterResources",wr);
    	
        return "kjo/check/checkresultform";
    }
    
    @RequestMapping("/checkresultSave" )
    public String checkresultSave(UserInfo ui) {
    	ui = userservice.findByUserId(ui);
    	System.out.println(ui.toString());
		return null;
    }



    
    
	
}