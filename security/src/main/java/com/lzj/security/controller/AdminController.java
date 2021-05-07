package com.lzj.security.controller;

import com.sun.org.slf4j.internal.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {


	@GetMapping("/main.html")
	public String main(){
		LoggerFactory.getLogger(AdminController.class).error("/main.html ==========》 转发");
		System.err.println("/main.html ==========》 转发");
		return "main";
	}

	@RequestMapping("/unauth.html")
	public String unauth(){
		return "unauth";
	}

}
