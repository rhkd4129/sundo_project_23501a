package com.postgres.sample.service.impl.dao.kjo;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import com.postgres.sample.dto.BoardVO;

@Repository
public interface  BoardDAO {

    List<BoardVO> SelectBoardList();
}