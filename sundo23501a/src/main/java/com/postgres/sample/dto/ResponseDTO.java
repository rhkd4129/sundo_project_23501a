package com.postgres.sample.dto;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class ResponseDTO {
    private List<?> firList;
    private Object obj;
    private Object secobj;
    private Object trdobj;
    private List<?> secList;
    private Map<?, ?> firMap;
}
