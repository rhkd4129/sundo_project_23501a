package com.postgres.sample.service.impl.dao.kjo;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface WaterResourcesDAO {
	public List<?> findfacility_category();
}
