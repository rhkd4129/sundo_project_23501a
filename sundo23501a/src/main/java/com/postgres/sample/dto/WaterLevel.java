package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class WaterLevel {
//	관측번호(PK)			N/A	INTEGER
//	표준코드(PK)(FK)		N/A	VARCHAR(30)
//	관측일시				N/A	DATE

	private Integer observe_no;
	private String river_code;
	private Date observe_datetime;
	private Integer hour01;
	private Integer hour02;
	private Integer hour03;
	private Integer hour04;
	private Integer hour05;
	private Integer hour06;
	private Integer hour07;
	private Integer hour08;
	private Integer hour09;
	private Integer hour10;
	private Integer hour11;
	private Integer hour12;
	private Integer hour13;
	private Integer hour14;
	private Integer hour15;
	private Integer hour16;
	private Integer hour17;
	private Integer hour18;
	private Integer hour19;
	private Integer hour20;
	private Integer hour21;
	private Integer hour22;
	private Integer hour23;
	private Integer hour24;
}
