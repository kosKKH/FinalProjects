package main.puvg.main.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import main.puvg.member.service.MemberService;
import main.puvg.member.vo.MemberVO;

@RestController
public class MainController {
	Logger logger = LogManager.getLogger(MainController.class);
	ModelAndView mav = new ModelAndView();
	
	@Autowired(required=false)
	private MemberService memberService;
	
	@GetMapping(value="mainpage")
	public ModelAndView mainPage(HttpServletRequest request, MemberVO mvo) {
		logger.info("MainController.mainpage() 진입");
		mav.setViewName("main/MainPage");
		
		HttpSession Session = request.getSession(false);
		String VNUM = (String)Session.getAttribute("VID");
		String VNAME = (String)Session.getAttribute("VNAME");
		String VDEPT = (String)Session.getAttribute("VDEPT");
		
		//Date date = new Date();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		//String nowdate = sdf.format(date);
		//logger.info("noewdate = " + nowdate);
		
		List<MemberVO> newmember = memberService.NewMember(mvo);
		mav.addObject("newmember", newmember);
		
		List<MemberVO> birthmember = memberService.BirthMember(mvo);
		mav.addObject("birthmember", birthmember);
		
		mvo.setVdept(VDEPT);
		List<MemberVO> mydept = memberService.Mydept(mvo);
		mav.addObject("mydept", mydept);
		
		mvo.setVnum(VNUM);
		List<MemberVO> myinfo = memberService.MyInformation(mvo);
		mav.addObject("myinfo", myinfo);
		
		String strLine = "";

		
		try {
			String strUrl = "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109";
			
			BufferedReader br = new BufferedReader(new InputStreamReader((new URL(strUrl)).openConnection().getInputStream(),"UTF-8"));

			
			String filePath = request.getSession().getServletContext().getRealPath("");
			String fileName = "ajax_weathergokr_rss.xml";
			File xmlFile = new File(filePath +"/"+ fileName);

			FileWriter fw = new FileWriter(xmlFile);
			while ((strLine = br.readLine()) != null){
				fw.write(strLine);
			}
							
			fw.flush();
			fw.close();
			
		} catch(Exception e) {		
			logger.info(e.getMessage());
		}
		
		return mav;
	}
	
	@GetMapping(value="mapapi")
	public ModelAndView mapapi(HttpServletRequest request) {
		mav.setViewName("Company/KakaoMapAPI");
		
		return mav;
	}
}
