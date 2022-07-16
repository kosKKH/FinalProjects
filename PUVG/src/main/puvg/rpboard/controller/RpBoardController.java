package main.puvg.rpboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import main.puvg.util.ChabunSetting;
import main.puvg.util.service.ChabunService;
import main.puvg.rpboard.service.RpBoardService;
import main.puvg.rpboard.vo.RpBoardVO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

@Controller
public class RpBoardController {
	Logger logger = LogManager.getLogger(RpBoardController.class);
	
	@Autowired(required=false)
	private ChabunService chabunService;

	@Autowired(required=false)
	private RpBoardService rpBoardService;

//--------------- FORM----------------------------
	@GetMapping("RpBoardForm")
	public String RpBoardForm() {
		logger.info("RpBoardController RpBoardForm 함수 진입 >>> : ");
	
		return "rpboard/RpBoardForm";
	}
	//---------------INSERT FORM END----------------------------		


//---------------INSERT ----------------------------	 
	@PostMapping("RpBoardInsert")
	@ResponseBody
	public String RpBoardInsert(HttpServletRequest req, RpBoardVO rbvo) {
		logger.info("RpBoardController RpBoardInsert 함수 진입 >>> : ");
		logger.info("RpBoardController RpBoardInsert rbvo 함수 진입 >>> : " + rbvo);

		//채번 구하기
		String vrpnum = ChabunSetting.RpBoardChabun(chabunService.RpBoardChabun().getVrpnum());
		logger.info("RpBoardController RpBoardInsert vrpnum >>> : " + vrpnum);
		
		rbvo.setVrpnum(vrpnum);
		
		HttpSession Session = req.getSession(false);
		String VNAME = (String)Session.getAttribute("VNAME");
		rbvo.setVname(VNAME);
		
		int nCnt = rpBoardService.RpBoardInsert(rbvo);
		logger.info("RpBoardController RpBoardInsert nCnt >>> : " + nCnt);

		if(nCnt == 1) {return "GOOD";}
		else {return "BAD";}
		//---------------INSERT END----------------------------	
	}
		//---------------SELECTALL----------------------------	
		@PostMapping(value="RpBoardSelectAll", produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String RpBoardSelectAll(RpBoardVO rbvo) {
			logger.info("RpBoardController RpBoardSelectAll 함수 진입 >>> : ");	
	
		List<RpBoardVO> list = rpBoardService.RpBoardSelectAll(rbvo);
		logger.info("RpBoardController RpBoardSelectAll list >>> : " + list);	
		
		String ss = "";
		String listStr="";
		for (int i=0; i < list.size(); i++) {
			RpBoardVO _rbvo = list.get(i);
			String s0 = _rbvo.getVrpnum();
			String s1 = _rbvo.getVname();
			String s2 = _rbvo.getVrpcontent();
			String s3 = _rbvo.getInsertdate();
			logger.info("s0 >>> :" + s0);
			logger.info("s1 >>> :" + s1);
			logger.info("s2 >>> :" + s2);
			logger.info("s3 >>> :" + s3);
			
			ss = s0 +"," + s1+","+s2+","+s3;
			//플레인 텍스트(plain text)
			listStr += ss+"&";
		}
		logger.info("listStr >>> :" + listStr);
		return listStr;
	}
		//---------------SELECTALL EMD----------------------------		
		
		
	//---------------DELETE----------------------------	
		@PostMapping("RpBoardDelete")
		@ResponseBody
		public String RpBoardDelete(RpBoardVO rbvo) {
			logger.info("RpBoardController RpBoardDelete 함수 진입 >>> : ");	
			logger.info("RpBoardController RpBoardDelete rbvo.getVrpnum >>> : " + rbvo.getVrpnum());
			
			int nCnt = rpBoardService.RpBoardDelete(rbvo);
			logger.info("RpBoardController RpBoardDelete nCnt >>> : " + nCnt);
			
			if(1 ==nCnt) {return "GOOD";}
			else {return "BAD";}
		}
	}
