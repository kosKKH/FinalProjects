package main.puvg.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import main.puvg.login.service.LoginService;
import main.puvg.member.vo.MemberVO;

@RestController
public class LoginController {
	Logger logger = LogManager.getLogger(LoginController.class);
	ModelAndView mav = new ModelAndView();
	
	@Autowired(required=false)
	private LoginService loginService;
	
	@GetMapping(value="loginpage")
	public ModelAndView loginPage() {
		mav.setViewName("main/LoginPage");
		
		return mav;
	}
	
	@PostMapping(value="logincheck")
	public String LoginCheck(HttpServletRequest request, MemberVO mvo) {
		logger.info("LoginController.loginCheck() 진입");
		List<MemberVO> loginlist = loginService.LoginCheck(mvo);
		mav.setViewName("main/LoginPage");
		
		
		if (loginlist.size() == 0) {
			logger.info("로그인 실패");
			return "fail";
		} else {
			logger.info("로그인 성공");
			HttpSession Session = request.getSession(true);
			// 로그인시 사원번호를 ID로 사용
			Session.setAttribute("VID", (loginlist.get(0)).getVnum());
			Session.setAttribute("VNAME", (loginlist.get(0)).getVname());
			Session.setAttribute("VDEPT", (loginlist.get(0)).getVdept());
			Session.setAttribute("VAUTHORITY", (loginlist.get(0)).getVauthority());
			logger.info("Session 생성 = " +Session);
			
			mav.addObject("loginlist", loginlist);
			return "success";
		}
	}
	
	@PostMapping(value="pwcheck")
	public String pwCheck(HttpServletRequest request, MemberVO mvo) {
		logger.info("LoginController.pwCheck() 진입");
		List<MemberVO> loginlist = loginService.LoginCheck(mvo);
		mav.setViewName("main/LoginPage");
		
		
		if (loginlist.size() == 0) {
			logger.info("비밀번호 불일치");
			return "fail";
		} else {
			logger.info("비밀번호 일치");
			return "success";
		}
	}
	
	@GetMapping(value="logout")
	public ModelAndView Logout(HttpServletRequest request) {
		mav.setViewName("main/LoginPage");
		HttpSession Session = request.getSession(false);
		Session.invalidate();
		Session = request.getSession(false);
		logger.info("Session 삭제 = " + Session);
		
		return mav;
		
	}
}
