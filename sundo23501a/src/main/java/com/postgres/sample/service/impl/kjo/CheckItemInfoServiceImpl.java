package com.postgres.sample.service.impl.kjo;

import com.postgres.sample.dto.CheckItemInfo;
import com.postgres.sample.service.impl.dao.kjo.Kjo_CheckItemInfoDAO;
import com.postgres.sample.service.kjo.CheckItemInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CheckItemInfoServiceImpl implements CheckItemInfoService {

    private final Kjo_CheckItemInfoDAO kjo_CheckItemInfoDAO;

    @Override
    public List<CheckItemInfo> findAllCheckItemInfo() {
        return kjo_CheckItemInfoDAO.findAllCheckItemInfo();
    }
}
