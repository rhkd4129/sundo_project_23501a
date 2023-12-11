package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class UserInfo {
	private String 	user_pw;
	private String 	system;
	private String 	user_name;
	private String 	user_email;
	private String 	user_tel;
	private String 	org_code;
	private String	department;
	private String	use_flag;
	private Date 	create_datetime;
	private Date 	modify_datetime;
	private String 	user_id;
}
