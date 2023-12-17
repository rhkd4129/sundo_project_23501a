package com.postgres.sample.service.impl.kjo;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.postgres.sample.dto.BoardVO;
import com.postgres.sample.dto.Observation;
import com.postgres.sample.service.impl.dao.kjo.BoardDAO;
import com.postgres.sample.service.impl.dao.kjo.BoardDAOv2;
import com.postgres.sample.service.impl.dao.kjo.ObservationDAO;
import com.postgres.sample.service.kjo.BoardService;
import com.postgres.sample.service.kjo.ObservationService;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class ObservationServiceImpl extends EgovAbstractServiceImpl implements ObservationService{


	private final ObservationDAO observationDAO;



	@Override
	public List<Observation> SelectObsList() throws Exception {
		// TODO Auto-generated method stub
		List<Observation> obs = observationDAO.SelectObsList();
		return observationDAO.SelectObsList();
	}

}