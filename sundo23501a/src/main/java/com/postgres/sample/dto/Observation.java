package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Observation{
//	관측소
//	관측소코드(PK)		N/A	INTEGER
//	표준코드(PK)(FK)	N/A	VARCHAR(30)
//	관측소명			N/A	VARCHAR(200)
//	관측유형			N/A	VARCHAR(10)
//	위도				N/A	VARCHAR(30)
//	경도				N/A	VARCHAR(30)
//	관측방식			N/A	VARCHAR(10)
//	운영기관코드(FK)	N/A	VARCHAR(30)
//	등록일시			N/A	DATE
//	수정일시			N/A	DATE

	private Integer 	observe_code;	//	N/A	INTEGER
	private String		river_code;
	private String		observe_post;
	private String		observe_type;
	private String		latitude;
	private String		longitude;
	private String		observe_method;
	private String		org_code;
	private Date		create_datetime;
	private Date		modify_datetime;
	
	

}
