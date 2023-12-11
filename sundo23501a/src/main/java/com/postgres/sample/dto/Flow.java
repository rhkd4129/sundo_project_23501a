package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Flow {
//	유량
//	관측번호(PK)		N/A	INTEGER
//	표준코드(PK)(FK)	N/A	VARCHAR(30)

	private String river_code;
	private Integer observe_year;
	private Integer observe_day;
	private Double jan;
	private Double feb;
	private Double mar;
	private Double apr;
	private Double may;
	private Double jun;
	private Double jul;
	private Double aug;
	private Double sep;
	private Double oct;
	private Double nov;
	private Double dec;
	

}
