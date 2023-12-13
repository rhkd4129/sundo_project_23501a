package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardNotice {
	private Integer doc_no;
	private String 	subject;
	private String 	user_id;
	private Date 	create_date;
	private Integer bd_count;
	private String 	body;
	private Date 	create_datetime;
	private Date 	modify_datetime;

}
