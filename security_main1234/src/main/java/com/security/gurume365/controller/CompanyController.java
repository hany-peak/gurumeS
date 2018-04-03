package com.security.gurume365.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CompanyController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	@RequestMapping(value="/join/joinInfoPage",method=RequestMethod.GET)
	public String jusoInfoPage(){
		return "join/joinInfoPage";
	}
	
	
	@RequestMapping(value="/join/jusoPopup",method=RequestMethod.GET)
	public String jusoPopup(){
		return "join/jusoPopup";
	}
	
	@RequestMapping(value="/join/jusoPopup",method=RequestMethod.POST)
	public String jusoPopup(Model model){
		
		return "join/jusoData";
	}
}
