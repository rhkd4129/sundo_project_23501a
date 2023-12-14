package com.postgres.sample.service.impl.dao.kjo;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.UserInfo;

@Mapper
public interface Kjo_UserInfoDAO {
	public UserInfo findByUserId(UserInfo ui);

}
