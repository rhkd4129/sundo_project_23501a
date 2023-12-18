package com.postgres.sample.service.impl.dao.kjo;

import com.postgres.sample.dto.CheckReport;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface Kjo_CheckReportDAO {
    public CheckReport cntByFacilityCode(CheckReport checkReport);

    public int inputChkReport(CheckReport checkReport);

    CheckReport cntAllReport();

    List<CheckReport> findChkReport();

    List<CheckReport> pageChkReport();

    List<CheckReport> pageSearchChkReport(CheckReport cr);

    CheckReport cntSearchChkReport(CheckReport cr);
}
