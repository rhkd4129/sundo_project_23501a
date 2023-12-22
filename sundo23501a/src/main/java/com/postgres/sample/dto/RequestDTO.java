package com.postgres.sample.dto;

import java.util.List;

import lombok.Data;

@Data
public class RequestDTO {
    private List<String> user_id;
    private List<String> user_auth;
    private Object obj;
    private List<?> firList;
    private List<?> secList;
}
