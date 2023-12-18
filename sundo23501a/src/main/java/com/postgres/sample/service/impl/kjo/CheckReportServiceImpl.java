package com.postgres.sample.service.impl.kjo;

import com.postgres.sample.dto.CheckReport;
import com.postgres.sample.service.impl.dao.kjo.Kjo_CheckReportDAO;
import com.postgres.sample.service.kjo.CheckReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CheckReportServiceImpl implements CheckReportService {
    private final Kjo_CheckReportDAO kjo_CheckReportDAO;

    @Override
    public List<CheckReport> pageSearchChkReport(CheckReport cr) {
        return kjo_CheckReportDAO.pageSearchChkReport(cr);
    }

    @Override
    public CheckReport cntSearchChkReport(CheckReport cr) {
        return kjo_CheckReportDAO.cntSearchChkReport(cr);
    }

    @Override
    public CheckReport cntByFacilityCode(CheckReport checkReport) {
        return kjo_CheckReportDAO.cntByFacilityCode(checkReport);
    }

    @Override
    public int inputChkReport(CheckReport checkReport) {
        return kjo_CheckReportDAO.inputChkReport(checkReport);
    }

    @Override
    public CheckReport cntAllReport() {
        return kjo_CheckReportDAO.cntAllReport();
    }

    @Override
    public List<CheckReport> findChkReport() {
        return kjo_CheckReportDAO.findChkReport();

    }

    @Override
    public List<CheckReport> pageChkReport(CheckReport crt) {
        return kjo_CheckReportDAO.pageChkReport();
    }
}
