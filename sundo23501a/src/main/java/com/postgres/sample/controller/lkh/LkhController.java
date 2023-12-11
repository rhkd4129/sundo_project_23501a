package com.postgres.sample.controller.lkh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LkhController {
	
	@GetMapping("/hello")
	public String hello() {
		return "lkh/aa";
	}
}
