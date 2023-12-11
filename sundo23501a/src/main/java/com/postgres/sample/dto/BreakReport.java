package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BreakReport {
	private Integer 	don_no;
	private String 	user_id;
	private String 	facility_category;
	private String 	facility_code;
	
	private String 	check_target;
	
	private String 	m_category;
	private String 	s_category;
	
	private String 	subject;
	
	private Date 	break_date;
	
	private String 	break_cause;
	private String 	current_state;
	private String 	handling_flag;
	private String 	handling_content;
	
	private String 	future_plan;
	private String 	alarm_code;
	
	private Date 	create_datetime;
	private Date 	modify_datetime;
}
