package com.postgres.sample.service.impl.dao.kjo;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.springframework.stereotype.Repository;

import com.postgres.sample.dto.BoardVO;
import com.postgres.sample.dto.Observation;

import lombok.RequiredArgsConstructor;

@Mapper
public interface  ObservationDAO {   

    public List<Observation> SelectObsList();
}