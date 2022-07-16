package main.puvg.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {
	Logger logger = LogManager.getLogger(MainController.class);
	ModelAndView mav = new ModelAndView();
	
	@GetMapping(value="mainpage")
	public ModelAndView mainPage(HttpServletRequest request) {
		mav.setViewName("main/MainPage");
		
		return mav;
	}
	
	@GetMapping(value="mapapi")
	public ModelAndView mapapi(HttpServletRequest request) {
		mav.setViewName("Company/KakaoMapAPI");
		
		return mav;
	}
}
