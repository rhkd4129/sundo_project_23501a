package com.postgres.sample.service.impl.kjo;

import com.postgres.sample.dto.*;
import com.postgres.sample.service.impl.dao.kjo.KjoDao;
import com.postgres.sample.service.kjo.KjoService;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class KjoServiceImpl extends EgovAbstractServiceImpl implements KjoService {

    private final KjoDao KjoDao;

    @Override
    public List<CheckItemInfo> findAllCheckItemInfo() {
        return KjoDao.findAllCheckItemInfo();
    }

    @Override
    public int inputChkList(CheckList checkList) {
        return KjoDao.inputChkList(checkList);
    }

    @Override
    public CheckList cntChkListByFacilityCode(CheckList chkList) {
        return KjoDao.cntChkListByFacilityCode(chkList);
    }

    @Override
    public CheckReport cntByFacilityCode(CheckReport checkReport) {
        return KjoDao.cntByFacilityCode(checkReport);
    }

    @Override
    public int inputChkReport(CheckReport checkReport) {
        return KjoDao.inputChkReport(checkReport);
    }

    @Override
    public CheckReport cntAllReport() {
        return KjoDao.cntAllReport();
    }

    @Override
    public List<CheckReport> findChkReport() {
        return KjoDao.findChkReport();
    }

    @Override
    public List<CheckReport> pageChkReport(CheckReport crt) {
        return KjoDao.pageChkReport(crt);
    }

    @Override
    public List<CheckReport> pageSearchChkReport(CheckReport crt) {
        return KjoDao.pageSearchChkReport(crt);
    }

    @Override
    public CheckReport cntSearchChkReport(CheckReport cr) {
        return KjoDao.cntSearchChkReport(cr);
    }

    @Override
    public List<?> SelectObsList() {
        return KjoDao.SelectObsList();
    }

    @Override
    public List<Organization> findAllOrgList() {
        return KjoDao.findAllOrgList();
    }

    @Override
    public List<OrgArea> findAllOrgArea() {
        return KjoDao.findAllOrgArea();
    }

    @Override
    public UserInfo findByUserId(UserInfo ui) {
        return KjoDao.findByUserId(ui);
    }

    @Override
    public UserInfo findUserId(UserInfo ui) {
        return KjoDao.findUserId(ui);
    }

    @Override
    public WaterResources cntWaterResource() {
        return KjoDao.cntWaterResource();
    }

    @Override
    public List<WaterResources> findFacilityCategory() {
        return KjoDao.findFacilityCategory();
    }

    @Override
    public List<WaterResources> findFacilityAddr() {
        return KjoDao.findFacilityAddr();
    }

    @Override
    public List<WaterResources> findWaterResourceLists() {
        return KjoDao.findWaterResourceLists();
    }

    @Override
    public List<WaterResources> PaingWaterResourceLists(WaterResources wr) {
        return KjoDao.PaingWaterResourceLists(wr);
    }

    @Override
    public List<WaterResources> findFacilityAddrbyCategory(WaterResources wr) {
        return KjoDao.findFacilityAddrbyCategory(wr);
    }

    @Override
    public List<WaterResources> searchWaterResources(WaterResources wr) {
        return KjoDao.searchWaterResources(wr);

    }

    @Override
    public WaterResources searchCnt(WaterResources wr) {
        return KjoDao.searchCnt(wr);
    }

    @Override
    public WaterResources findWaterResourcesById(WaterResources wr) {
        return KjoDao.findWaterResourcesById(wr);
    }

    @Override
    public CheckReport findCheckReportByDocNo(CheckReport cr) {
        return KjoDao.findCheckReportByDocNo(cr);

    }

    @Override
    public List<CheckList> findCheckListByDocNo(CheckList cl) {
        return KjoDao.findCheckListByDocNo(cl);
    }

    @Override
    public List<CheckList> findCheckListAndCodeByDocNo(CheckList cl) {
        return KjoDao.findCheckListAndCodeByDocNo(cl);
    }

    @Override
    public List<WaterResources> PaingWaterResourceAndCheckReport(WaterResources wr) {
        return KjoDao.PaingWaterResourceAndCheckReport(wr);
    }

    @Override
    public WaterResources searchCntWRAndCR(WaterResources wr) {
        return KjoDao.searchCntWRAndCR(wr);
    }

    @Override
    public List<WaterResources> searchWRAndCR(WaterResources wr) {
        return KjoDao.searchWRAndCR(wr);
    }

    @Override
    public List<CheckReport> findCheckReportByFcCode(CheckReport checkReport) {
        return KjoDao.findCheckReportByFcCode(checkReport);

    }

    @Override
    public CheckReport cntCheckReportByFcCode(CheckReport checkReport) {
        return KjoDao.cntCheckReportByFcCode(checkReport);
    }

    @Override
    public Observation CntObservationAll() {
        return KjoDao.CntObservationAll();
    }

    @Override
    public List<Observation> findObservationAll(Observation ov) {
        return KjoDao.findObservationAll(ov);
    }

    @Override
    public WaterResources nullcheck(WaterResources wr) {
//        facility_category: $('#facility_code_List').val(),
//                org_area: $('#org_area_List').val(),
//                cate_name: $('#cate_name').val(),
//                facility_code: $('#facility_code').val(),
        if (wr.getFacility_code() == null) {
            wr.setFacility_code("");
        }
        if (wr.getOrg_area() == null) {
            wr.setOrg_area("");
        }
        if (wr.getCate_name() == null) {
            wr.setCate_name("");
        }
        if (wr.getFacility_category() == null) {
            wr.setFacility_category("");
        }
        if (wr.getSecdate() == null) {
            wr.setSecdate("");
        }
        if (wr.getFirstdate() == null) {
            wr.setFirstdate("");
        }
        if (wr.getOrg_name() == null) {
            wr.setOrg_name("");
        }
        if (wr.getUser_department() == null) {
            wr.setUser_department("");
        }
        if (wr.getCate_name() == null) {
            wr.setCate_name("");
        }
        return wr;
    }
}
