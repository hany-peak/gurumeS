package com.security.gurume365;

import java.util.Locale;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
		String title = "GURUME365 인증메일";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(new StringBuffer().append("메일인증")
					.append("http://localhost:8888/gurume365/join/joinPermit?id="+users.getId())
							.append(" 이메일 인증 확인").toString()); // 메일 내용
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
