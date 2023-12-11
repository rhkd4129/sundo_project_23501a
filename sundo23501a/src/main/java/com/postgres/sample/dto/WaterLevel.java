package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class WaterLevel {
//	관측번호(PK)			N/A	Double
//	표준코드(PK)(FK)		N/A	VARCHAR(30)
//	관측일시				N/A	DATE


	private String river_code;
	private Date observe_datetime;
	private Double hour01;
	private Double hour02;
	private Double hour03;
	private Double hour04;
	private Double hour05;
	private Double hour06;
	private Double hour07;
	private Double hour08;
	private Double hour09;
	private Double hour10;
	private Double hour11;
	private Double hour12;
	private Double hour13;
	private Double hour14;
	private Double hour15;
	private Double hour16;
	private Double hour17;
	private Double hour18;
	private Double hour19;
	private Double hour20;
	private Double hour21;
	private Double hour22;
	private Double hour23;
	private Double hour24;
}
