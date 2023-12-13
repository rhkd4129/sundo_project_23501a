package com.postgres.sample.service.impl.dao.kjo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import com.postgres.sample.dto.BoardVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class  BoardDAOv2{   
	private final SqlSession session;
	
    public List<BoardVO> SelectBoardList() {
    	System.out.println("fds");
    	System.out.println(session.selectList("SelectBoardList"));
    	
		return session.selectList("SelectBoardList");
	}
}