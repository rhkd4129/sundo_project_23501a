package com.postgres.sample.service.kjo;

import com.postgres.sample.dto.CheckReport;

import java.util.List;

public interface CheckReportService {


    public CheckReport cntByFacilityCode(CheckReport checkReport);

    int inputChkReport(CheckReport checkReport);

    CheckReport cntAllReport();

    List<CheckReport> findChkReport();

    List<CheckReport> pageChkReport(CheckReport crt);
    List<CheckReport> pageSearchChkReport(CheckReport crt);

    CheckReport cntSearchChkReport(CheckReport cr);
}
