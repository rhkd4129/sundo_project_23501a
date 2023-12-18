package com.postgres.sample.service.impl.dao.kjo;

import com.postgres.sample.dto.CheckList;

public interface Kjo_CheckListDAO {
    int inputChkList(CheckList checkList);

    CheckList cntChkListByFacilityCode(CheckList chkList);
}
