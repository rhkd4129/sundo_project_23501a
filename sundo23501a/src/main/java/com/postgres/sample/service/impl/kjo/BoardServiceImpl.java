package com.postgres.sample.service.impl.kjo;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.postgres.sample.dto.BoardVO;
import com.postgres.sample.service.impl.dao.kjo.BoardDAO;
import com.postgres.sample.service.impl.dao.kjo.BoardDAOv2;
import com.postgres.sample.service.kjo.BoardService;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService{


	private final BoardDAO boardDAO;
	
	@Override
	public List<?> SelectBoardList() {
		System.out.println("fdsfds");
		System.out.println(boardDAO.SelectBoardList());
		
		return boardDAO.SelectBoardList();
	}

}