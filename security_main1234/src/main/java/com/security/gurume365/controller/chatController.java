package com.security.gurume365.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class chatController {

	@RequestMapping(value="chat/chatRoom", method = RequestMethod.GET)
	public String goChatPage(){
		
		return "chat/chatRoom";
	}
}
