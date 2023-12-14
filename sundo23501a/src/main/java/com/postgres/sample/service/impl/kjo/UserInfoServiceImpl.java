package com.postgres.sample.service.impl.kjo;

import org.springframework.stereotype.Service;

import com.postgres.sample.dto.UserInfo;
import com.postgres.sample.service.impl.dao.kjo.Kjo_UserInfoDAO;
import com.postgres.sample.service.kjo.UserInfoService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserInfoServiceImpl implements UserInfoService{

	private final Kjo_UserInfoDAO userInfoDAO;
	
	
	@Override
	public UserInfo findByUserId(UserInfo ui) {
		// TODO Auto-generated method stub
		return userInfoDAO.findByUserId(ui);
	}

}
