package com.postgres.sample.controller.kjo;

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


//@RestController
@Controller
@RequestMapping("/api")
@RequiredArgsConstructor
public class KjoController {
	private static final Logger Logger = LoggerFactory.getLogger(KjoController.class);
	
	
    private final BoardService boardservice;

    @GetMapping("/hello")
    public List<BoardVO> HelloWorld() throws Exception {
        return (List<BoardVO>) boardservice.SelectBoardList();
    }
    @GetMapping("/hello2")
    public List<BoardVO> HelloWorld_v2() throws Exception {
        return (List<BoardVO>) boardservice.SelectBoardList();
    }
    @GetMapping("/hello10")
    public String HelloWorld_v10() throws Exception {
    	System.out.println("hi");
        return "kjo/hello";
    }
//	fdskljfdklfksdjklfdsafdsfdsfds
}