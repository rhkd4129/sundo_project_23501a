package com.postgres.sample.service.impl.kjo;

import com.postgres.sample.dto.CheckReport;
import com.postgres.sample.service.impl.dao.kjo.Kjo_CheckReportDAO;
import com.postgres.sample.service.kjo.CheckReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CheckReportServiceImpl implements CheckReportService {
    private final Kjo_CheckReportDAO kjo_CheckReportDAO;

    @Override
    public CheckReport cntByFacilityCode(CheckReport checkReport) {
        return kjo_CheckReportDAO.cntByFacilityCode(checkReport);
    }

    @Override
    public int inputChkReport(CheckReport checkReport) {
        return kjo_CheckReportDAO.inputChkReport(checkReport);
    }
}
