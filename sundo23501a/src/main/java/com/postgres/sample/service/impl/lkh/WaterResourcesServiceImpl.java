package com.postgres.sample.service.impl.lkh;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.impl.dao.kjo.BoardDAOv2;

import com.postgres.sample.service.impl.dao.lkh.LKH_WaterResourcesDAO;
import com.postgres.sample.service.lkh.WaterResourcesService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WaterResourcesServiceImpl extends EgovAbstractServiceImpl implements WaterResourcesService {
	private final LKH_WaterResourcesDAO waterResourcesDAO;

	@Override
	public List<WaterResources> SelectWaterResourceList(WaterResources resources) {
		return waterResourcesDAO.SelectWaterResourceList(resources);
	}

	@Override
	public List<WaterResources> findfacility_category() {
		return  waterResourcesDAO.findfacility_category(); 
	
	}

	@Override
	public List<Organization> organization_category() {
		return waterResourcesDAO.organization_category();
	}

	@Override
	public WaterResources countWaterResource() {
		return waterResourcesDAO.countWaterResource();
	}

	
		
}
