package com.postgres.sample.service.impl.dao.lkh;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.WaterResources;



@Mapper("waterResourcesDAO")
public interface LKH_WaterResourcesDAO {
	
	public List<WaterResources> SelectWaterResourceList(WaterResources waterResources);
	
	public List<WaterResources> findfacilityCategory();
	
	public List<Organization> organizationCategory();
	
	public WaterResources countWaterResource();
	
	
	public List<Code>	facilityCategoryType(String divison);
	
	public int	waterResourcesInsert(WaterResources waterResources);
	
	
	
}								
 