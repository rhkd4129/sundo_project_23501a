package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Flow {
//	유량
//	관측번호(PK)		N/A	INTEGER
//	표준코드(PK)(FK)	N/A	VARCHAR(30)

	private Integer observe_no;
	private String river_code;
	private Date observe_date;
	private Integer jan;
	private Integer feb;
	private Integer mar;
	private Integer apr;
	private Integer may;
	private Integer jun;
	private Integer jul;
	private Integer aug;
	private Integer sep;
	private Integer oct;
	private Integer nov;
	private Integer dec;
	

}
