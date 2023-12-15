package com.postgres.sample.service.impl.kjo;

import org.springframework.stereotype.Service;

import com.postgres.sample.dto.UserInfo;
import com.postgres.sample.service.impl.dao.kjo.Kjo_UserInfoDAO;
import com.postgres.sample.service.kjo.UserInfoService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserInfoServiceImpl implements UserInfoService{

	private final Kjo_UserInfoDAO kjo_userInfoDAO;
	
	
	@Override
	public UserInfo findByUserId(UserInfo ui) {
		// TODO Auto-generated method stub
		return kjo_userInfoDAO.findByUserId(ui);
	}

	@Override
	public UserInfo findUserId(UserInfo ui) {
		return kjo_userInfoDAO.findUserId(ui);
	}

}
