package com.postgres.sample.service.impl.lkh;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.impl.dao.kjo.BoardDAOv2;

import com.postgres.sample.service.impl.dao.lkh.WaterResourcesDAO;
import com.postgres.sample.service.lkh.WaterResourcesService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WaterResourcesServiceImpl extends EgovAbstractServiceImpl implements WaterResourcesService {
	private final WaterResourcesDAO waterResourcesDAO;

	@Override
	public List<WaterResources> SelectWaterResourceList() {
		System.out.println("머야");
		List<WaterResources> obs = waterResourcesDAO.SelectWaterResourceList(); 
		
		System.out.println(obs.get(1).getFacility_category());
		
		return waterResourcesDAO.SelectWaterResourceList();
	}

	
		
}
