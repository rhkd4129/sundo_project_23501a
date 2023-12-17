package com.postgres.sample.service.kjo;

import java.util.List;

import com.postgres.sample.dto.WaterResources;

public interface WaterResourcesService {

	public WaterResources cntWaterResource();
	public List<WaterResources> findFacilityCategory();
	public List<WaterResources> findFacilityAddr();
	public List<WaterResources> findWaterResourceLists();
	public List<WaterResources> PaingWaterResourceLists(WaterResources wr);
	public List<WaterResources> findFacilityAddrbyCategory(WaterResources wr);
	public List<WaterResources> searchWaterResources(WaterResources wr);
	public WaterResources searchcnt(WaterResources wr);
	public WaterResources findWaterResourcesById(WaterResources wr);
	
	
}
