package com.postgres.sample.service.lkh;

import java.util.List;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.WaterResources;

public interface WaterResourcesService {
	
	
	 List<WaterResources> SelectWaterResourceList(WaterResources waterResources);
	 
	 List<WaterResources> findfacility_category();
	 
	 List<Organization> organization_category();
	 
	 WaterResources countWaterResource();
}
