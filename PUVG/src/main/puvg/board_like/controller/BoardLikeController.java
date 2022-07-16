package main.puvg.board_like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.puvg.board_like.service.BoardLikeService;
import main.puvg.board_like.vo.BoardLikeVO;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

@Controller
public class BoardLikeController {
	Logger logger = LogManager.getLogger(BoardLikeController.class);

	// 필드 오토와이어드 
	@Autowired(required=false)
	private BoardLikeService boardLikeService;
	
	@GetMapping("BoardLikeForm")
	public String BoardLikeForm(BoardLikeVO vblvo, Model model) {	
		logger.info("BoardLikeController BoardLikeForm >>> : ");
		
		
		List<BoardLikeVO> listAll = boardLikeService.BoardLikeSelectAll(vblvo);
		model.addAttribute("listAll", listAll);
		return "like/BoardLikeForm";
	}
	
	
	//-----------------------------
	@PostMapping("BoardLikeInsert_1")
	@ResponseBody
	public String BoardLikeInsert_1(BoardLikeVO vblvo) {
		logger.info("BoardLikeController BoardLikeInsert_1 >>> : ");
		
		logger.info("BoardLikeController BoardLikeInsert_1 vblvo.getVblike_cnt_1() >>> : " +  vblvo.getVblike_cnt_1());
		logger.info("BoardLikeController BoardLikeInsert_1 vblvo.getVmnum() >>> : " + vblvo.getVmnum());
		logger.info("BoardLikeController BoardLikeInsert_1 vblvo.getVbnum() >>> : " + vblvo.getVbnum());
							
		List<BoardLikeVO> listCnt = boardLikeService.BoardLikeSelect(vblvo);
		logger.info("BoardLikeController BoardLikeSelect listCnt >>> : " + listCnt);
		
		int nCnt = 0;
		if (listCnt !=null && listCnt.size() >  0) {
			nCnt = boardLikeService.BoardLikeUpdate_1(vblvo);
			logger.info("BoardLikeController BoardLikeUpdate_1 nCnt >>> : " + nCnt);
		}else {
			nCnt = boardLikeService.BoardLikeInsert(vblvo);
			logger.info("BoardLikeController BoardLikeInsert nCnt >>> : " + nCnt);		
		}
		
		String vblike_cnt_1 = "";
		List<BoardLikeVO> listAll = boardLikeService.BoardLikeSelectAll(vblvo);
		if (listAll !=null && listAll.size() > 0) {
			vblike_cnt_1 = listAll.get(0).getVblike_cnt_1(); 
		}
		return vblike_cnt_1;
	}
	
	@PostMapping("BoardLikeInsert_2")
	@ResponseBody
	public String BoardLikeInsert_2(BoardLikeVO vblvo) {
		logger.info("BoardLikeController BoardLikeInsert_1 >>> : ");
		
		logger.info("BoardLikeController BoardLikeInsert_2 vblvo.getVblike_cnt_1() >>> : " +  vblvo.getVblike_cnt_2());
		logger.info("BoardLikeController BoardLikeInsert_2 vblvo.getVmnum() >>> : " + vblvo.getVmnum());
		logger.info("BoardLikeController BoardLikeInsert_2 vblvo.getVbnum() >>> : " + vblvo.getVbnum());
							
		List<BoardLikeVO> listCnt = boardLikeService.BoardLikeSelect(vblvo);
		logger.info("BoardLikeController BoardLikeSelect listCnt >>> : " + listCnt);
		
		int nCnt = 0;
		if (listCnt !=null && listCnt.size() >  0) {
			nCnt = boardLikeService.BoardLikeUpdate_2(vblvo);
			logger.info("BoardLikeController BoardLikeUpdate_2 nCnt >>> : " + nCnt);
		}else {
			nCnt = boardLikeService.BoardLikeInsert(vblvo);
			logger.info("BoardLikeController BoardLikeInsert nCnt >>> : " + nCnt);		
		}
		
		String vblike_cnt_2 = "";
		List<BoardLikeVO> listAll = boardLikeService.BoardLikeSelectAll(vblvo);
		if (listAll !=null && listAll.size() > 0) {
			vblike_cnt_2 = listAll.get(0).getVblike_cnt_1(); 
		}
		return vblike_cnt_2;
	}
}
