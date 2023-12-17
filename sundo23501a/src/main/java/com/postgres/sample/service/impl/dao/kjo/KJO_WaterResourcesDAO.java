package com.postgres.sample.service.impl.dao.kjo;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.WaterResources;

@Mapper
public interface KJO_WaterResourcesDAO {
	public List<WaterResources> findFacilityCategory();
	public List<WaterResources> findFacilityAddr();
	public List<WaterResources> findWaterResourceLists();
	public WaterResources cntWaterResource();
	public List<WaterResources> PaingWaterResourceLists(WaterResources wr);
	public List<WaterResources> findFacilityAddrbyCategory(WaterResources wr);
	public List<WaterResources> searchWaterResources(WaterResources wr);
	public WaterResources findWaterResourcesById(WaterResources wr);

	public WaterResources searchCnt(WaterResources wr);
}
