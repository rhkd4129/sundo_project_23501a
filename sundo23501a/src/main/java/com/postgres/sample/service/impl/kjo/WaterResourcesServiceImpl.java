package com.postgres.sample.service.impl.kjo;

import java.util.List;

import org.antlr.grammar.v3.ANTLRParser.finallyClause_return;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.impl.dao.kjo.ObservationDAO;
import com.postgres.sample.service.impl.dao.kjo.WaterResourcesDAO;
import com.postgres.sample.service.kjo.ObservationService;
import com.postgres.sample.service.kjo.WaterResourcesService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WaterResourcesServiceImpl extends EgovAbstractServiceImpl implements WaterResourcesService{

	private final WaterResourcesDAO waterResourcesDAO;
	
	@Override
	public List<WaterResources> findFacilityCategory() {
		// TODO Auto-generated method stub
		return (List<WaterResources>) waterResourcesDAO.findFacilityCategory();
	}

	@Override
	public List<WaterResources> findFacilityAddr() {
		// TODO Auto-generated method stub
		return (List<WaterResources>) waterResourcesDAO.findFacilityAddr();
	}

	@Override
	public List<WaterResources> findWaterResourceLists() {
		// TODO Auto-generated method stub
		return (List<WaterResources>) waterResourcesDAO.findWaterResourceLists();
	}

	@Override
	public WaterResources cntWaterResource() {
		// TODO Auto-generated method stub
		return (WaterResources) waterResourcesDAO.cntWaterResource();
	}

	@Override
	public List<WaterResources> PaingWaterResourceLists(WaterResources wr) {
		// TODO Auto-generated method stub
		return (List<WaterResources>) waterResourcesDAO.PaingWaterResourceLists(wr);
	}

	@Override
	public List<WaterResources> findFacilityAddrbyCategory(WaterResources wr) {
		// TODO Auto-generated method stub
		return (List<WaterResources>) waterResourcesDAO.findFacilityAddrbyCategory(wr);
	}

	@Override
	public List<WaterResources> searchWaterResources(WaterResources wr) {
		// TODO Auto-generated method stub
		return (List<WaterResources>) waterResourcesDAO.searchWaterResources(wr);
	}

	@Override
	public WaterResources findWaterResourcesById(WaterResources wr) {
		// TODO Auto-generated method stub
		return (WaterResources) waterResourcesDAO.findWaterResourcesById(wr);
	}

}
