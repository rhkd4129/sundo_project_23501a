package com.postgres.sample.service.kjo;

import java.util.List;

import com.postgres.sample.dto.WaterResources;

public interface WaterResourcesService {

	public WaterResources cntWaterResource();
	public List<WaterResources> findfacility_category();
	public List<WaterResources> findfacility_addr();
	public List<WaterResources> findWaterResourceLists();
	public List<WaterResources> PaingWaterResourceLists(WaterResources wr);
	
	
}
