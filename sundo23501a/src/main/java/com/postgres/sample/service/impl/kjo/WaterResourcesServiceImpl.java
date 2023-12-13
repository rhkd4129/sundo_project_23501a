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
	public List<WaterResources> findfacility_category() {
		// TODO Auto-generated method stub
		return (List<WaterResources>) waterResourcesDAO.findfacility_category();
	}

}
