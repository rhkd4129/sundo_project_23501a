package com.postgres.sample.service.impl.dao.kjo;

import com.postgres.sample.dto.CheckReport;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface Kjo_CheckReportDAO {
    public CheckReport cntByFacilityCode(CheckReport checkReport);

    public int inputChkReport(CheckReport checkReport);
}
