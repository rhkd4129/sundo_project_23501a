package com.postgres.sample.controller.lkh;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Organization;
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
			Model model) {
		  System.out.println(facility_category);
		  System.out.println(facility_code);
		  System.out.println(org_code);
		  System.out.println(org_area);
		  List<WaterResources> waterResourcesList = waterResourcesService.SelectWaterResourceList();
		  List<Code> codeList = waterResourcesService.codeSelectList();
		  List<Organization> organizationList= waterResourcesService.organizationSelectList();
		  model.addAttribute("codeList", codeList);
		  model.addAttribute("waterResourcesList", waterResourcesList);
		  model.addAttribute("organizationList", organizationList);
	
		
		return "lkh/waterResourcesList";
			//해버렷다 ...
	}
}
