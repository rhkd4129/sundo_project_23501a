package com.postgres.sample.service.impl.jmh;

import java.util.Date;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.OrgArea;
import com.postgres.sample.service.impl.dao.jmh.OrganizationDAO;
import com.postgres.sample.service.jmh.JmhOrgService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class JmhOrgServiceImpl extends EgovAbstractServiceImpl implements JmhOrgService {

	private final OrganizationDAO 		orgDAO;
	
	@Override
	public int totalCount(Organization orgInfo) {
		System.out.println("JmhServicImpl totalCount START...");

		int totalCnt = 0;
		
		if(orgInfo.getOrg_area() != null) {
			System.out.println("totalCount ★검색 행정구역---->"+orgInfo.getOrg_area());
			if(!orgInfo.getOrg_area().equals("")) {
				System.out.println("totalCount ★검색 기관 명칭---->"+orgInfo.getOrg_name());
				//검색 건수 가져오기
				//-------------------------------------------------------------------
				totalCnt = orgDAO.JmhSearchCount(orgInfo);
				//-------------------------------------------------------------------
				System.out.println("JmhServicImpl totalCount totalCnt->" + totalCnt);
				System.out.println("JmhServicImpl totalCount END...");
				return totalCnt;
			}
		}
		//-------------------------------------------------------------------
		totalCnt = orgDAO.JmhTotalCount(orgInfo);
		//-------------------------------------------------------------------

		System.out.println("JmhServicImpl totalCount totalCnt->" + totalCnt);
		System.out.println("JmhServicImpl totalCount END...");
		return totalCnt;
	}

	//--------------------------------------------------------------------------------------
	@Override
	public List<Organization> boardList(Organization orgInfo) {
		System.out.println("JmhOrgServiceImpl boardList START...");
		
		List<Organization> boardList = null;
		
		if(orgInfo.getOrg_area() != null) {
			System.out.println("boardList ★검색 행정구역---->"+orgInfo.getOrg_area());
			if(!orgInfo.getOrg_area().equals("")) {
				System.out.println("boardList ★검색 기관 명칭---->"+orgInfo.getOrg_name());
				//----------------------------------------------------
				boardList = orgDAO.JmhSearchList(orgInfo);
				//----------------------------------------------------
				System.out.println("JmhOrgServiceImpl boardList > searchList END...");
				return boardList;
			}
		}
		
		System.out.println("orgInfo start: "+orgInfo.getStart());
		System.out.println("orgInfo end: "+orgInfo.getEnd());
		//---------------------------------------------------
		boardList = orgDAO.JmhBoardList(orgInfo);
		//---------------------------------------------------
		System.out.println("boardList.size()->"+boardList.size());
		System.out.println("JmhOrgServiceImpl boardList END...");
		return boardList;
	}

	//등록
	@Override
	public int insertBoard(Organization orgInfo) {
		System.out.println("JmhOrgServiceImpl insertBoard START...");
		int resultCount = 0;	
		//----------------------------------------------
		resultCount = orgDAO.JmhInsertBoard(orgInfo);
		//----------------------------------------------
		System.out.println("JmhOrgServiceImpl insertBoard resultCount->"+resultCount);
		System.out.println("JmhOrgServiceImpl insertBoard END...");
		return resultCount;
	}

	//조회
	@Override
	public Organization selectBoard(Organization orgInfo) {
		System.out.println("JmhOrgServiceImpl selectBoard START...");
		Organization selectorgInfo = null;		
		//--------------------------------------------------
		selectorgInfo = orgDAO.JmhSelectBoard(orgInfo);
		//--------------------------------------------------
		System.out.println("JmhOrgServiceImpl selectBoard END...");
		return selectorgInfo;
	}

	//수정
	@Override
	public int updateBoard(Organization orgInfo) {
		System.out.println("JmhOrgServiceImpl updateBoard START...");
		int resultCount = 0;				
		//----------------------------------------------
		resultCount = orgDAO.JmhUpdateBoard(orgInfo);
		//----------------------------------------------
		System.out.println("JmhOrgServiceImpl updateBoard resultCount->"+resultCount);
		System.out.println("JmhOrgServiceImpl updateBoard END...");
		return resultCount;
	}

	//삭제
	@Override
	public int deleteBoard(Organization orgInfo) {
		System.out.println("JmhOrgServiceImpl deleteBoard START...");
		int resultCount = 0;
		//----------------------------------------------
		resultCount = orgDAO.JmhDeleteBoard(orgInfo);
		//----------------------------------------------
		if(resultCount > 0) {System.out.println("문서 삭제완료:"+resultCount);}		
		System.out.println("JmhOrgServiceImpl deleteBoard resultCount->"+resultCount);
		System.out.println("JmhOrgServiceImpl deleteBoard END...");
		return resultCount;
	}

	//--------------------------------------------------------------------------------------
	//분류 가져오기
	@Override
	public List<OrgArea> orgAreaList() {
		List<OrgArea> orgAreaList = null;
		System.out.println("JmhOrgServiceImpl orgAreaList Start...");
		//------------------------------------
		orgAreaList = orgDAO.JmhOrgAreaList();
		//------------------------------------
		System.out.println("JmhOrgServiceImpl orgAreaList.size()->" +orgAreaList.size());
		
		return orgAreaList;
	}
	//--------------------------------------------------------------------------------------
	//기관명 가져오기
	@Override
	public List<Organization> orgList() {
		List<Organization> orgList = null;
		System.out.println("JmhOrgServiceImpl orgList Start...");
		//-------------------------------------------------
		orgList = orgDAO.JmhOrgList();
		//-------------------------------------------------
		System.out.println("JmhOrgServiceImpl orgList.size()->" +orgList.size());
		
		return orgList;
	}

}
