package com.postgres.sample.controller.lkh;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.LKH_WaterResources;
import com.postgres.sample.dto.OrgArea;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.Paging;
import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.impl.dao.lkh.LKH_WaterResourcesDAO;
import com.postgres.sample.service.kjo.BoardService;
import com.postgres.sample.service.lkh.WaterResourcesService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LkhController {
	private final WaterResourcesService waterResourcesService;
	
	
	
	@GetMapping("/waterResourcesList")
	public String waterResourcesList( 
		
			 LKH_WaterResources lkh_WaterResources,
			 @RequestParam(required = false) String currentPage,
			Model model) {
		
		
		  WaterResources waterResources = new  WaterResources();
		  waterResources.setTotal(waterResourcesService.countWaterResource().getTotal());
		  Paging page  = new Paging(waterResources.getTotal(), currentPage,10);
		  
		  
		  
		  waterResources.setStart(page.getStart());
		  waterResources.setEnd(page.getEnd());
		  
		  
		  List<WaterResources> waterResourcesList = waterResourcesService.SelectWaterResourceList(waterResources );
		  List<WaterResources> findfacility_category = waterResourcesService.findfacilityCategory();
		  List<Organization> organization_category= waterResourcesService.organizationCategory();
		  
		  
		  List<OrgArea> orgArea_category = waterResourcesService.OrgAreaCategory();
		  model.addAttribute("orgArea_category", orgArea_category);
		  
		  model.addAttribute("findfacility_category", findfacility_category);
		  model.addAttribute("waterResourcesList", waterResourcesList);
		  model.addAttribute("organization_category", organization_category);
		  
		  model.addAttribute("page",page);
	
		
		return "lkh/waterResource/waterResourcesList";
			//해버렷다 ...
	}
	

	@GetMapping("/waterResourcesInsertForm")
	public String waterResourcesInsertForm(Model model) {
		
		 
		List<Organization> organization_category= waterResourcesService.organizationCategory();
		List<WaterResources> findfacility_category = waterResourcesService.findfacilityCategory();	
		List<Code> codeList = waterResourcesService.facilityCategoryType("a");
		List<OrgArea> orgArea_category = waterResourcesService.OrgAreaCategory();
		
		model.addAttribute("organization_category", organization_category);
		model.addAttribute("orgArea_category", orgArea_category);
		model.addAttribute("codeList", codeList);
		model.addAttribute("findfacility_category", findfacility_category);
		return "lkh/waterResource/waterResourceInsetForm";
	}
	
	@ResponseBody
	@GetMapping("/facilityCategoryType")
	public List<Code> facilityCategoryType(String divison) {
		List<Code> codeList = waterResourcesService.facilityCategoryType(divison);
		return codeList;
	}
	
	
	@PostMapping("/waterResourcesInsert")
	public String waterResourcesInsert(WaterResources waterResources) {
		int result = waterResourcesService.waterResourcesInsert(waterResources);
		
		
		System.out.print("결과"+result);
		return "redirect:/waterResourcesList";
	}
	

	@GetMapping("waterResourcesListDetail")
	public String waterResourcesListDetail(String facility_code) {
		return "lkh/waterResource/waterResourceDetail";
	}
	
	
	@GetMapping("/waterResourcesUpdateForm")
	public String waterResourcesUpdateForm(WaterResources waterResources) {
		/* int result = waterResourcesService.waterResourcesUpdate(waterResources); */
		return "lkh/waterResource/waterResourceUpdateForm";
	}
	
	@PostMapping("/waterResourcesUpdate")
	public String waterResourcesUpdate(WaterResources waterResources) {
		/* int result = waterResourcesService.waterResourcesUpdate(waterResources); */
		return "redirect:/waterResourcesList";
	}
}
