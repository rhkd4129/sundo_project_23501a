package com.postgres.sample.controller.lkh;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.Paging;
import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.kjo.BoardService;
import com.postgres.sample.service.lkh.WaterResourcesService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LkhController {
	private final WaterResourcesService waterResourcesService;
	
	
	
	@GetMapping("/waterResourcesList")
	public String waterResourcesList( 
			 @RequestParam(required = false) String facility_category,
			 @RequestParam(required = false) String facility_code,
			 @RequestParam(required = false) String org_code,
			 @RequestParam(required = false) String org_area,
			 @RequestParam(required = false) String currentPage,
			Model model) {
		
		  
		  System.out.println(facility_code);
		  System.out.println(org_code);
		  System.out.println(org_area);
		  
		  
		  WaterResources waterResources = new  WaterResources();
		  waterResources.setTotal(waterResourcesService.countWaterResource().getTotal());
		  Paging page  = new Paging(waterResources.getTotal(), currentPage,10);
		  
		  
		  
		  waterResources.setStart(page.getStart());
		  waterResources.setEnd(page.getEnd());
		  
		  
		  List<WaterResources> waterResourcesList = waterResourcesService.SelectWaterResourceList(waterResources );
		  List<WaterResources> findfacility_category = waterResourcesService.findfacility_category();
		  List<Organization> organization_category= waterResourcesService.organization_category();
		  
		  
		 
		  model.addAttribute("findfacility_category", findfacility_category);
		  model.addAttribute("waterResourcesList", waterResourcesList);
		  model.addAttribute("organization_category", organization_category);
		  model.addAttribute("page",page);
	
		
		return "lkh/waterResourcesList";
			//해버렷다 ...
	}
}
