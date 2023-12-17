package com.postgres.sample.service.kjo;

import com.postgres.sample.dto.UserInfo;

public interface UserInfoService {
	public UserInfo findByUserId(UserInfo ui);

	UserInfo findUserId(UserInfo ui);
}
