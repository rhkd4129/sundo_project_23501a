package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CheckReport {
	private Integer	 	doc_no;
	private String 		facility_code;
	private Date 		check_date;	
	private String 		weather;	
	private String 		user_id;	
	private String 		check_result;
	
	private String 		spec_memo;	
	private String		create_datetime;
	private String 		modify_datetime;
	

}
