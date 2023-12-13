package com.postgres.sample.service.impl.dao.lkh;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.WaterResources;



@Mapper("waterResourcesDAO")
public interface LKH_WaterResourcesDAO {
	
	public List<WaterResources> SelectWaterResourceList(WaterResources waterResources);
	
	public List<WaterResources> findfacility_category();
	
	public List<Organization> organization_category();
	
	public WaterResources countWaterResource();
	
	
	
}								
 