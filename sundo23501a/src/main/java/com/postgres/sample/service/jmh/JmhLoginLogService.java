package com.postgres.sample.service.jmh;

import java.util.List;

import com.postgres.sample.dto.BoardNotice;
import com.postgres.sample.dto.LoginLog;

public interface JmhLoginLogService {
	public int 				totalCount(LoginLog loginLog);	//총문서수
	public List<LoginLog> 	boardList(LoginLog loginLog);	//목록
}
