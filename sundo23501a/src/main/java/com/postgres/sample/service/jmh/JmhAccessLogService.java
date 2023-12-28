package com.postgres.sample.service.jmh;

import java.util.List;

import com.postgres.sample.dto.AccessLog;
import com.postgres.sample.dto.JmhDaysDataVO;
import com.postgres.sample.dto.LoginLog;

public interface JmhAccessLogService {
	public int 					totalCount(AccessLog accessLog);//총문서수
	public List<AccessLog> 		boardList(AccessLog accessLog);	//목록
	public List<JmhDaysDataVO> 	searchMonthList(String year_month); //접속통계
}
