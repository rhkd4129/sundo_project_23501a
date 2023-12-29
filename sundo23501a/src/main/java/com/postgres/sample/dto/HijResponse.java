package com.postgres.sample.dto;

import java.util.List;

import lombok.Data;

@Data
public class HijResponse {
	List<?> list;
	Object  obj;
}
