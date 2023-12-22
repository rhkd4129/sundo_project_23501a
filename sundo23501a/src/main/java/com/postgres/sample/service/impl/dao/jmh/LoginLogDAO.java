package com.postgres.sample.service.impl.dao.jmh;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.LoginLog;

@Mapper
public interface LoginLogDAO {
	public int 				JmhTotalCount(LoginLog loginLog);	//총문서 수
	public int 				JmhSearchCount(LoginLog loginLog);	//검색결과 수
	public List<LoginLog> 	JmhSearchList(LoginLog loginLog);	//검색결과 목록
	public List<LoginLog> 	JmhBoardList(LoginLog loginLog);	//목록

}
