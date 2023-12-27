package com.postgres.sample.service.impl.jmh;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.postgres.sample.dto.LoginLog;
import com.postgres.sample.service.impl.dao.jmh.LoginLogDAO;
import com.postgres.sample.service.jmh.JmhLoginLogService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class JmhLoginLogServiceImpl extends EgovAbstractServiceImpl implements JmhLoginLogService {

	private final LoginLogDAO loginLogDAO;
	
	@Override
	public int totalCount(LoginLog loginLog) {
		System.out.println("JmhLoginLogServiceImpl totalCount START...");

		int totalCnt = 0;
		
		if(loginLog.getSystem_category() != null) {
			System.out.println("totalCount ★검색 권한---->"+loginLog.getSystem_category());
			if(!loginLog.getSystem_category().equals("")) {
				System.out.println("totalCount ★검색 기간 from---->"+loginLog.getFrom_date());
				System.out.println("totalCount ★검색 기간 to---->"+loginLog.getTo_date());
				System.out.println("totalCount ★검색 사용자---->"+loginLog.getUser_name());
				System.out.println("totalCount ★검색 ip---->"+loginLog.getIp());
				//검색 건수 가져오기
				//-------------------------------------------------------------------
				totalCnt = loginLogDAO.JmhSearchCount(loginLog);
				//-------------------------------------------------------------------
				System.out.println("JmhLoginLogServiceImpl totalCount totalCnt->" + totalCnt);
				System.out.println("JmhLoginLogServiceImpl totalCount END...");
				return totalCnt;
			}
		}
		//-------------------------------------------------------------------
		totalCnt = loginLogDAO.JmhTotalCount(loginLog);
		//-------------------------------------------------------------------

		System.out.println("JmhLoginLogServiceImpl totalCount totalCnt->" + totalCnt);
		System.out.println("JmhLoginLogServiceImpl totalCount END...");
		return totalCnt;
	}

	@Override
	public List<LoginLog> boardList(LoginLog loginLog) {
		System.out.println("JmhLoginLogServiceImpl boardList START...");
		
		List<LoginLog> boardList = null;
		
		if(loginLog.getSystem_category() != null) {
			System.out.println("boardList ★검색 권한---->"+loginLog.getSystem_category());
			if(!loginLog.getSystem_category().equals("")) {
				System.out.println("boardList ★검색 기간 from---->"+loginLog.getFrom_date());
				System.out.println("boardList ★검색 기간 to---->"+loginLog.getTo_date());
				System.out.println("boardList ★검색 사용자---->"+loginLog.getUser_name());
				System.out.println("boardList ★검색 ip---->"+loginLog.getIp());
				//----------------------------------------------------
				boardList = loginLogDAO.JmhSearchList(loginLog);
				//----------------------------------------------------
				System.out.println("JmhLoginLogServiceImpl boardList > searchList END...");
				return boardList;
			}
		}
		System.out.println("loginLog start: "+loginLog.getStart());
		System.out.println("loginLog end: "+loginLog.getEnd());
		//---------------------------------------------------
		boardList = loginLogDAO.JmhBoardList(loginLog);
		//---------------------------------------------------
		System.out.println("boardList.size()->"+boardList.size());
		System.out.println("JmhLoginLogServiceImpl boardList END...");
		return boardList;
	}

}
