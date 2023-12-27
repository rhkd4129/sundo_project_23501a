package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Organization {
	private String 	org_code;
	private String 	org_name;
	private String 	org_area;
	private String 	org_addr;
	private String 	org_tel;
	private Date 	create_datetime;
	private Date	modify_datetime;
	
	//조회용
	private int		rn;					//목록 rownum번호
	private int		start;				//페이지 시작번호
	private int		end;				//페이지 끝번호
	private String	user_name;			//작성자명
	private String  attach_delete_flag; //편집저장시 기존첨부 삭제여부(D)
	private String	search;				//검색대상 필드
	private String	keyword;			//검색어 키워드
	private String  org_area_name;		//행정구역명
}
