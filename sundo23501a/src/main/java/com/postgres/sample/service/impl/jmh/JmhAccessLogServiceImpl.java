package com.postgres.sample.service.impl.jmh;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.postgres.sample.dto.AccessLog;
import com.postgres.sample.dto.JmhDaysDataVO;
import com.postgres.sample.service.impl.dao.jmh.AccessLogDAO;
import com.postgres.sample.service.jmh.JmhAccessLogService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class JmhAccessLogServiceImpl extends EgovAbstractServiceImpl implements JmhAccessLogService {

	private final AccessLogDAO accessLogDAO;
	
	@Override
	public int totalCount(AccessLog accessLog) {
		System.out.println("JmhAccessLogServiceImpl totalCount START...");

		int totalCnt = 0;
		
		if(accessLog.getSystem_category() != null) {
			System.out.println("totalCount ★검색 권한---->"+accessLog.getSystem_category());
			if(!accessLog.getSystem_category().equals("")) {
				System.out.println("totalCount ★검색 기간 from---->"+accessLog.getFrom_date());
				System.out.println("totalCount ★검색 기간 to---->"+accessLog.getTo_date());
				System.out.println("totalCount ★검색 사용자---->"+accessLog.getUser_name());
				System.out.println("totalCount ★검색 ip---->"+accessLog.getIp());
				//검색 건수 가져오기
				//-------------------------------------------------------------------
				totalCnt = accessLogDAO.JmhSearchCount(accessLog);
				//-------------------------------------------------------------------
				System.out.println("JmhAccessLogServiceImpl totalCount totalCnt->" + totalCnt);
				System.out.println("JmhAccessLogServiceImpl totalCount END...");
				return totalCnt;
			}
		}
		//-------------------------------------------------------------------
		totalCnt = accessLogDAO.JmhTotalCount(accessLog);
		//-------------------------------------------------------------------

		System.out.println("JmhAccessLogServiceImpl totalCount totalCnt->" + totalCnt);
		System.out.println("JmhAccessLogServiceImpl totalCount END...");
		return totalCnt;
	}

	@Override
	public List<AccessLog> boardList(AccessLog accessLog) {
		System.out.println("JmhAccessLogServiceImpl boardList START...");
		
		List<AccessLog> boardList = null;
		
		if(accessLog.getSystem_category() != null) {
			System.out.println("boardList ★검색 권한---->"+accessLog.getSystem_category());
			if(!accessLog.getSystem_category().equals("")) {
				System.out.println("boardList ★검색 기간 from---->"+accessLog.getFrom_date());
				System.out.println("boardList ★검색 기간 to---->"+accessLog.getTo_date());
				System.out.println("boardList ★검색 사용자---->"+accessLog.getUser_name());
				System.out.println("boardList ★검색 ip---->"+accessLog.getIp());
				//----------------------------------------------------
				boardList = accessLogDAO.JmhSearchList(accessLog);
				//----------------------------------------------------
				System.out.println("JmhAccessLogServiceImpl boardList > searchList END...");
				return boardList;
			}
		}
		System.out.println("accessLog start: "+accessLog.getStart());
		System.out.println("accessLog end: "+accessLog.getEnd());
		//---------------------------------------------------
		boardList = accessLogDAO.JmhBoardList(accessLog);
		//---------------------------------------------------
		System.out.println("boardList.size()->"+boardList.size());
		System.out.println("JmhAccessLogServiceImpl boardList END...");
		return boardList;
	}

	@Override
	public List<JmhDaysDataVO> searchMonthList(String year_month) {
		System.out.println("JmhAccessLogServiceImpl searchMonthList START...");
		
		List<JmhDaysDataVO> boardList = null;
		System.out.println("year_month->"+year_month);
		//------------------------------------------------------
		boardList = accessLogDAO.JmhSearchMonthList(year_month);
		//------------------------------------------------------
		System.out.println("boardList.size()->"+boardList.size());
		System.out.println("JmhAccessLogServiceImpl searchMonthList END...");
		return boardList;
	}

}
