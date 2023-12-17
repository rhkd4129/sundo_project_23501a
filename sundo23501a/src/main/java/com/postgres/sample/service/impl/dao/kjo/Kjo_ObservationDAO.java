package com.postgres.sample.service.impl.dao.kjo;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.Observation;

@Mapper
public interface Kjo_ObservationDAO {

    public List<Observation> SelectObsList();
}