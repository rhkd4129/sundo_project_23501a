package com.postgres.sample.service.impl.dao.kjo;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.OrgArea;

@Mapper
public interface Kjo_OrgAreaDAO {

	public List<OrgArea> findAllOrgArea();

}
