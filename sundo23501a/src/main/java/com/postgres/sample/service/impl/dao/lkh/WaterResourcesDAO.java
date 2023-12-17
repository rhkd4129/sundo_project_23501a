package com.postgres.sample.service.impl.dao.lkh;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.WaterResources;



@Mapper("waterResourcesDAO")
public interface WaterResourcesDAO {
	public List<WaterResources> SelectWaterResourceList();
}								
 