package com.postgres.sample.service.jmh;

import java.util.List;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.OrgArea;
import com.postgres.sample.dto.Organization;

public interface JmhOrgService {
	public int 					totalCount(Organization orgInfo);	//총문서수
	public List<Organization>	boardList(Organization  orgInfo);	//목록
	int 						insertBoard(Organization orgInfo);	//등록
	Organization 				selectBoard(Organization orgInfo);	//조회
	int 						updateBoard(Organization orgInfo);	//수정
	int 						deleteBoard(Organization orgInfo);	//삭제
	public List<OrgArea>		orgAreaList();						//분류 코드
	public List<Organization>	orgList();							//기간코드/기관명 정보
}
