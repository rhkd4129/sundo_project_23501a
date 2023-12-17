package com.postgres.sample.service.impl.dao.kjo;

import com.postgres.sample.dto.CheckItemInfo;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface Kjo_CheckItemInfoDAO {

    List<CheckItemInfo> findAllCheckItemInfo();
}
