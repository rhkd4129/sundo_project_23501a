package com.postgres.sample.service.impl.dao.jmh;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.AccessLog;
import com.postgres.sample.dto.JmhDaysDataVO;

@Mapper
public interface AccessLogDAO {
	public int 					JmhTotalCount(AccessLog accessLog);		//총문서 수
	public int 					JmhSearchCount(AccessLog accessLog);	//검색결과 수
	public List<AccessLog> 		JmhSearchList(AccessLog accessLog);		//검색결과 목록
	public List<AccessLog> 		JmhBoardList(AccessLog accessLog);		//목록
	public List<JmhDaysDataVO>  JmhSearchMonthList(String year_month); 	//월선택
}
