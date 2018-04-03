package com.security.gurume365.controller;

import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.security.gurume365.dao.UsersDAO;
import com.security.gurume365.vo.Users;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	UsersDAO usersDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	

	@RequestMapping(value = "/login/loginForm", method = RequestMethod.GET)
	public String loginFor(Locale locale, Model model) {
		logger.info("Welcome Login Form!");
		
		return "login/loginForm";
	}
	@RequestMapping(value = "/loginInfo", method = RequestMethod.GET)
	public String loginInfo(Locale locale, Model model, Authentication auth) {
		return "home";
	}
	
	@RequestMapping(value = "/login/accessDenied", method = RequestMethod.GET)
	public String accessDenied(Locale locale, Model model) {
		logger.info("Welcome Access Denied!");
		
		return "login/accessDenied";
	}
	
	
	@RequestMapping(value="/join/joinPermission",method=RequestMethod.GET)
	public String joinPermission(Locale locale, Model model){
		logger.info("Welcome JoinPermission");
		return "join/joinPermission";
	}
	
	@RequestMapping(value="/join/joinForm",method=RequestMethod.GET)
	public String joinForm(Locale locale){
		logger.info("Welcome JoinForm");
		return "join/joinForm";
	}
	

	@RequestMapping(value="/join/insertUsers",method=RequestMethod.POST)
	@ResponseBody
	public void insertUsers(Users users){
		usersDAO.insertUsers(users);
		
		String setfrom = "GURUME365";
		String tomail = users.getId();
		String title = "GURUME365 ";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(new StringBuffer().append("��������")
					.append("http://localhost:8888/gurume365/join/joinPermit?id="+users.getId())
							.append(" �̸��� ���� Ȯ��").toString());
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

	}
	
	@RequestMapping(value="/join/joinComplement",method=RequestMethod.GET)
	public String joinComplement(){
		return "join/joinComplement";
	}
	
	@RequestMapping(value="/join/joinPermit",method=RequestMethod.GET)
	public String joinPermit(String id){
		Users users = usersDAO.selectUsers(id);
		if(users.getPermit().equals("N")&&users!=null){
			usersDAO.permitUsers(users);
		}
		
		return "join/joinPermitComplement";
	}
	
}
