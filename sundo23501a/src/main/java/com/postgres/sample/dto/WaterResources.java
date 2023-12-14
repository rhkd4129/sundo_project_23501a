package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class WaterResources {
	private String 	facility_code;
	private String 	facility_category;
	private String	facility_addr;
	private String	facility_type;

	private String 	org_code;
	private String 	org_area;
	
	private Double 	latitude;
	private Double 	longitude;
	private Date 	create_datetime;
	private Date 	modify_datetime;
	

	//조회용
	private String org_name;
	
	
	
	private String cate_name;
	
	private String rn;
	private String pageNum;		private int total;
	private int start; 		 	private int end;
	private String search;   	private String keyword;

	

}
