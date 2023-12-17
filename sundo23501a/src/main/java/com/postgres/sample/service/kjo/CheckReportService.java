package com.postgres.sample.service.kjo;

import com.postgres.sample.dto.CheckReport;
import com.postgres.sample.dto.CheckReport;

public interface CheckReportService {

    public CheckReport cntByFacilityCode(CheckReport checkReport);

    int inputChkReport(CheckReport checkReport);


}
