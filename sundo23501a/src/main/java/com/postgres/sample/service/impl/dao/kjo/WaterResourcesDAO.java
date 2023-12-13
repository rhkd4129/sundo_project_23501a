package com.postgres.sample.service.impl.dao.kjo;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.WaterResources;

@Mapper
public interface WaterResourcesDAO {
	public List<WaterResources> findfacility_category();
	public List<WaterResources> findfacility_addr();
	public List<WaterResources> findWaterResourceLists();
	public WaterResources cntWaterResource();
	public List<WaterResources> PaingWaterResourceLists(WaterResources wr);
}
