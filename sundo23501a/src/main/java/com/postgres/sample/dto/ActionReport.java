package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ActionReport {
	private Integer don_no;
	private String 	user_id;
	private String 	facility_category;
	private String 	facility_code;
	private String 	check_target;
	private String 	m_category;
	private String 	s_category;
	
	
	private Date 	break_date;
	private Date 	action_date;
	
	private String 	break_content;
	private String 	action_content;
	private String 	specific;
	private String 	future_plan;
	
	
	private Date 	create_datetime;
	private Date 	modify_datetime;
	
	
}
