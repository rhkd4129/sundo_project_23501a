package com.postgres.sample.controller.hij;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.postgres.sample.dto.BoardVO;
import com.postgres.sample.service.kjo.BoardService;

import lombok.RequiredArgsConstructor;


@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class HijController {
	private static final Logger Logger = LoggerFactory.getLogger(HijController.class);
	
	
    private final BoardService boardservice;

    @GetMapping("/hello3")
    public List<BoardVO> HelloWorld_v3() throws Exception {
        return (List<BoardVO>) boardservice.SelectBoardList();
    }
    @GetMapping("/hello4")
    public List<BoardVO> HelloWorld_v4() throws Exception {
        return (List<BoardVO>) boardservice.SelectBoardList();
    }
	
}