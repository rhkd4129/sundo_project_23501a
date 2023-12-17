package com.postgres.sample.service.impl.kjo;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.impl.dao.kjo.KJO_WaterResourcesDAO;
import com.postgres.sample.service.kjo.WaterResourcesService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WaterResourcesServiceImpl extends EgovAbstractServiceImpl implements WaterResourcesService{

	private final KJO_WaterResourcesDAO KJOWaterResourcesDAO;

	@Override
	public List<WaterResources> findFacilityCategory() {
		// TODO Auto-generated method stub
		return (List<WaterResources>) KJOWaterResourcesDAO.findFacilityCategory();
	}

	@Override
	public List<WaterResources> findFacilityAddr() {
		// TODO Auto-generated method stub
		return (List<WaterResources>) KJOWaterResourcesDAO.findFacilityAddr();
	}

	@Override
	public List<WaterResources> findWaterResourceLists() {
		// TODO Auto-generated method stub
		return (List<WaterResources>) KJOWaterResourcesDAO.findWaterResourceLists();
	}

	@Override
	public WaterResources cntWaterResource() {
		// TODO Auto-generated method stub
		return (WaterResources) KJOWaterResourcesDAO.cntWaterResource();
	}

	@Override
	public List<WaterResources> PaingWaterResourceLists(WaterResources wr) {
		// TODO Auto-generated method stub
		return (List<WaterResources>) KJOWaterResourcesDAO.PaingWaterResourceLists(wr);
	}

	@Override
	public List<WaterResources> findFacilityAddrbyCategory(WaterResources wr) {
		// TODO Auto-generated method stub
		return (List<WaterResources>) KJOWaterResourcesDAO.findFacilityAddrbyCategory(wr);
	}

	@Override
	public List<WaterResources> searchWaterResources(WaterResources wr) {
		// TODO Auto-generated method stub
		return (List<WaterResources>) KJOWaterResourcesDAO.searchWaterResources(wr);
	}

	@Override
	public WaterResources searchcnt(WaterResources wr) {
		return KJOWaterResourcesDAO.searchCnt(wr);
	}

	@Override
	public WaterResources findWaterResourcesById(WaterResources wr) {
		// TODO Auto-generated method stub
		WaterResources rr = KJOWaterResourcesDAO.findWaterResourcesById(wr);
		System.out.println(rr);
		return KJOWaterResourcesDAO.findWaterResourcesById(wr);
	}

}
