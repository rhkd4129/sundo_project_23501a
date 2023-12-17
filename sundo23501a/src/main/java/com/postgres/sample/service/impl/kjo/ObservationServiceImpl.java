package com.postgres.sample.service.impl.kjo;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.postgres.sample.dto.Observation;
import com.postgres.sample.service.impl.dao.kjo.Kjo_ObservationDAO;
import com.postgres.sample.service.kjo.ObservationService;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class ObservationServiceImpl extends EgovAbstractServiceImpl implements ObservationService{


	private final Kjo_ObservationDAO observationDAO;



	@Override
	public List<Observation> SelectObsList() throws Exception {
		// TODO Auto-generated method stub
		List<Observation> obs = observationDAO.SelectObsList();
		return observationDAO.SelectObsList();
	}

}