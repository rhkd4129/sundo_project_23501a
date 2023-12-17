package com.postgres.sample.service.kjo;

import java.util.List;

import com.postgres.sample.dto.BoardVO;

public interface ObservationService {
	public List<?> SelectObsList() throws Exception;
}