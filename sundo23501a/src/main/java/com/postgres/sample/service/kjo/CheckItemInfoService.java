package com.postgres.sample.service.kjo;

import com.postgres.sample.dto.CheckItemInfo;

import java.util.List;

public interface CheckItemInfoService {
    List<CheckItemInfo> findAllCheckItemInfo();
}
