package com.security.gurume365.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class FloorController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "/floor/floor_edit", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "floor/floor_edit";
	}
	
	
	@RequestMapping(value = "/floor/setFloorSize", method = RequestMethod.POST)
	@ResponseBody
	public int setFloorSize(float floorH, float floorW, int floor_no, HttpSession session) {
		int shop_no;
		
		/*Restaurant restaurant = (Restaurant)session.getAttribute("restaurant");
		shop_no = restaurant.shop_no; */
		
		return 1;
		
	}
	
	@RequestMapping(value = "/floor/getFloorSize", method = RequestMethod.GET)
	@ResponseBody
	public int getFloorSize(HttpSession session) {
		int shop_no;
		
		/*Restaurant restaurant = (Restaurant)session.getAttribute("restaurant");
		shop_no = restaurant.shop_no; */
		
		return 1;
		
	}
	
	
	@RequestMapping(value = "/floor/createTableLayout", method = RequestMethod.GET)
	@ResponseBody
	public String getValidTableNo(HttpSession session) {
		String tableNo = "02";
		
		return tableNo;
	}
	
	
	
	
	
	
	
}

/*
 * 
 * 1. 레이아웃/뷰 구성
 * 2. 플로어 사이즈 입력, 영역 설정
 * 3. 테이블 아이콘 프리셋, 화면 영역과 실제 플로어 사이즈 스케일에 따라...
 * 4. 테이블 아이콘을 플로어 영역으로 끌어다 넣으면 그 위치(좌표) 받아오기
 * 5. 
 * 
 * 
 * 
 * 
 * */

