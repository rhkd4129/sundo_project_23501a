package com.postgres.sample.controller.lkh;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.kjo.BoardService;
import com.postgres.sample.service.lkh.WaterResourcesService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LkhController {
	private final WaterResourcesService waterResourcesService;
	
	
	
	@GetMapping("/hello")
	public String hello(Model model) {
		  List<WaterResources> waterResourcesList = waterResourcesService.SelectWaterResourceList();
		    
		   for (WaterResources waterResource : waterResourcesList) {
		        System.out.println(waterResource.getFacility_code()); // getFacilityCode()가 올바른 메서드라고 가정합니다.
		   }
		    
		   model.addAttribute("waterResourcesList", waterResourcesList);
	
	
		
		return "lkh/aa";
			//해버렷다 ...
	}
}
