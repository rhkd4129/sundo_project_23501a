package com.postgres.sample.service.impl.dao.jmh;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.OrgArea;
import com.postgres.sample.dto.Organization;

@Mapper
public interface OrganizationDAO {
	public int 					JmhTotalCount(Organization orgInfo);		//총문서 수
	public int 					JmhSearchCount(Organization orgInfo);		//검색결과 수
	public List<Organization> 	JmhSearchList(Organization orgInfo);		//검색결과 목록
	public List<Organization> 	JmhBoardList(Organization orgInfo);			//목록
	public int 					JmhInsertBoard(Organization orgInfo);		//등록
	public Organization 		JmhSelectBoard(Organization orgInfo);		//조회
	public int 					JmhUpdateBoard(Organization orgInfo);		//수정
	public int 					JmhDeleteBoard(Organization orgInfo);		//삭제
	public int 					JmhReadCount(Organization orgInfo); 		//조회수
	public List<OrgArea> 		JmhOrgAreaList();							//분류
	public List<Organization> 	JmhOrgList();								//기간코드/기관명 정보
}
