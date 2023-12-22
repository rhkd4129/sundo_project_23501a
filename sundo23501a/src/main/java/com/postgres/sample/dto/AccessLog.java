package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AccessLog {
	private int	 	log_no;
	private String 	program_url;
	private String 	user_id;
	private Date 	access_datetime;
	private String 	ip;
	private Date 	create_datetime;
	
	//조회용
	private int		rn;					//목록 rownum번호
	private int		start;				//페이지 시작번호
	private int		end;				//페이지 끝번호
	private String	search;				//검색대상 필드
	private String	keyword;			//검색어 키워드
	private String  user_name;			//성명
	private String  system_name;		//시스템 이름
	
	private String	from_date;			//기간검색from
	private String	to_date;			//기간검색to
	private String  system_category;	//권한(시스템)
	
	private String  year_month;			//월선택
}
