package com.postgres.sample.dto;

import lombok.Data;

@Data
public class Attach {
	private String 	table_name;
	private int 	doc_no;
	private int 	attach_no;
	private String 	attach_name;
	private String 	attach_path;
	private String 	attach_saved_name;
	
}
