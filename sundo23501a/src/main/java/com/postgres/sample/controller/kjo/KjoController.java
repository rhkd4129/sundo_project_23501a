package com.postgres.sample.controller.kjo;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.postgres.sample.dto.BoardVO;
import com.postgres.sample.dto.Observation;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.Paging;
import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.kjo.BoardService;
import com.postgres.sample.service.kjo.ObservationService;
import com.postgres.sample.service.kjo.WaterResourcesService;

import lombok.RequiredArgsConstructor;


//@RestController
@Controller
@RequestMapping("/api")
@RequiredArgsConstructor
public class KjoController {
	private static final Logger Logger = LoggerFactory.getLogger(KjoController.class);
	
	
    private final BoardService boardservice;
    private final ObservationService observice;
    private final WaterResourcesService wrservice;

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
    @GetMapping("/checkresult")
    public String checkresult() throws Exception {
    	System.out.println("checkresult");
        return "check/checkresult";
    }
    

    @GetMapping("/water_resourcesList")
    public String water_resoucesList(@RequestParam(defaultValue = "1") String currentPage, Model model) {
    	System.out.println("water_resourcesList");
    	WaterResources wr = new WaterResources();
    	//	페이징 위한 수자원시설물 개수
    	wr.setTotal(wrservice.cntWaterResource().getTotal());
    	Paging page = new Paging(wr.getTotal(), currentPage,10);
    	wr.setStart(page.getStart());
    	wr.setEnd(page.getEnd());
    	
    	List<WaterResources> wrctgList = wrservice.findfacility_category();
    	List<WaterResources> wradrList = wrservice.findfacility_addr();
    	List<WaterResources> wrList = wrservice.PaingWaterResourceLists(wr);

    	model.addAttribute("wrctgList",wrctgList);
    	model.addAttribute("wradrList",wradrList);
    	model.addAttribute("wrList",wrList);
    	model.addAttribute("page",page);
    	return "kjo/water_resources/water_resourcesList";
    }
    
    
    @GetMapping("/check_result_form")
    public String check_result_form(Model model) {
    	System.out.println("water_resourcesList");

    	List<WaterResources> wrctgList = wrservice.findfacility_category();
    	List<WaterResources> wradrList = wrservice.findfacility_addr();
    	List<WaterResources> wrList = wrservice.findfacility_addr();

    	model.addAttribute("wrctgList",wrctgList);
    	model.addAttribute("wradrList",wradrList);
    	model.addAttribute("wrList",wrList);
    	return "kjo/water_resources/water_resourcesList";
    }
    
    
	
}