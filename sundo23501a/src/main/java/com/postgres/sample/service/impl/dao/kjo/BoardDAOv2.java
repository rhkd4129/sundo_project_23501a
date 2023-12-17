package com.postgres.sample.service.impl.dao.kjo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.postgres.sample.dto.BoardVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDAOv2 {
	private final SqlSession session;
	
	public List<BoardVO> SelectBoardList() {
		List<BoardVO> boardList = null;
		
		try {
			//-------------------------------------------------
			boardList = session.selectList("test");
			//-------------------------------------------------
		} catch (Exception e) {
			System.out.println("Exception->"+e.getMessage());
		}
		
		return boardList;
	}
}
