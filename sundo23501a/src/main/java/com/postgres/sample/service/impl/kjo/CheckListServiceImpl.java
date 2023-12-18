package com.postgres.sample.service.impl.kjo;

import com.postgres.sample.dto.CheckList;
import com.postgres.sample.service.impl.dao.kjo.Kjo_CheckListDAO;
import com.postgres.sample.service.kjo.CheckListService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CheckListServiceImpl implements CheckListService {
    private final Kjo_CheckListDAO kjo_CheckListDAO;


    @Override
    public int inputChkList(CheckList checkList) {
        return kjo_CheckListDAO.inputChkList(checkList);
    }

    @Override
    public CheckList cntChkListByFacilityCode(CheckList chkList) {
        return kjo_CheckListDAO.cntChkListByFacilityCode(chkList);
    }
}
