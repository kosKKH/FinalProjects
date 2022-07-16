package main.puvg.approval.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import main.puvg.approval.dao.ApprovalDAO;
import main.puvg.approval.service.ApprovalService;
import main.puvg.approval.vo.Appr1DocVO;
import main.puvg.approval.vo.ApprovalListVO;
import main.puvg.approval.vo.ApprovalTempVO;
import main.puvg.member.service.MemberService;
import main.puvg.util.ChabunSetting;
import main.puvg.util.service.ChabunService;

@RestController
public class ApprovalController {
	
	Logger logger = LogManager.getLogger(ApprovalController.class);
	
	private ApprovalService approvalService;
	private ChabunService chabunService;
	
	@Autowired(required=false)
	public ApprovalController(ApprovalService approvalService, ChabunService chabunService) {
		this.approvalService = approvalService;
		this.chabunService = chabunService;
	}
	
	
	ModelAndView mav = new ModelAndView();
	
	@GetMapping(value="ApprovalListSelectAll")
	public ModelAndView ApprovalListSelectAll(ApprovalListVO avo) {
		
		logger.info("ApprovalController ApprovalListSelectAll 함수진입");
		
		List<ApprovalListVO> listAll = approvalService.ApprovalListSelectAll(avo);
		
		if(listAll.size() > 0) {
			logger.info("ApprovalController ApprovalListSelectAll listAll");
			
			mav.addObject("listAll", listAll);
			mav.addObject("avo", avo);
			
			mav.setViewName("approval/ApprovalListSelectAll");
			
			return mav;
		}
		mav.setViewName("approval/ApprovalListSelectAll");
		return mav;
	}
	
	@GetMapping(value="Appr1DocSelect")
	public ModelAndView Appr1DocSelect(ApprovalListVO mvo, Appr1DocVO avo) {
		
		logger.info("ApprovalController Appr1DocSelect 함수진입");

		String chabun = ChabunSetting.getApprovalChabun("d", chabunService.getApprovalChabun().getVdocnum());

		mav.addObject("vdocnum", chabun);
		avo.setVdocnum(chabun);
		
		List<Appr1DocVO> listD1 = approvalService.Appr1DocSelect(avo);
		
		mav.setViewName("approval/Appr1DocSelect");
		return mav;
	}
	
	@PostMapping(value="Appr1DocInsert")
	public ModelAndView Appr1DocInsert(Appr1DocVO avo) {
		
		int nCnt = approvalService.Appr1DocInsert(avo);
		
		mav.setViewName("approval/ApprovalListSelectAll");
		return mav;
	}
	
	@GetMapping(value="ApprovalLineInsertForm")
	public ModelAndView ApprovalLineInsertForm() {
		
		mav.setViewName("approval/ApprovalLineInsert");
		return mav;
	}
	
	@GetMapping(value="ApprovalLineInsert")
	public ModelAndView ApprovalLineInsert(Appr1DocVO avo) {
		
		mav.setViewName("approval/Appr1DocSelect");
		return mav;
	}
	
	@PostMapping(value="ApprovalInsert1")
	public ModelAndView ApprovalInsert1(ApprovalListVO lvo, Appr1DocVO avo) {

		int nCnt1 = approvalService.Appr1DocInsert(avo);
		List<ApprovalListVO> listAll = approvalService.ApprovalListSelectAll(lvo);
		
		if(listAll.size() > 0) {
			logger.info("ApprovalController ApprovalListSelectAll listAll");
			
			mav.addObject("listAll", listAll);
			mav.addObject("avo", avo);
			
			mav.setViewName("approval/ApprovalListSelectAll");
			
			return mav;
		}
		mav.setViewName("approval/ApprovalListSelectAll");
		return mav;
	}
	
	@PostMapping(value="ApprovalTempInsert1")
	public ModelAndView ApprovalTempInsert1(ApprovalListVO lvo, Appr1DocVO avo, ApprovalTempVO tvo) {
		
		String chabun = ChabunSetting.getApprovalTempChabun("d", chabunService.getApprovalTempChabun().getVsubnum());
		int nCnt1;
		
		//if((tvo.getVsubnum()) == "") {
			tvo.setVsubnum(chabun);
			nCnt1 = approvalService.ApprovalTempInsert(tvo);
			nCnt1 = approvalService.Appr1DocInsert(avo);
		//}else {
		//	nCnt1 = approvalService.ApprovalTempUpdate(avo);
		//}
		
		List<ApprovalListVO> listAll = approvalService.ApprovalListSelectAll(lvo);
		
		if(listAll.size() > 0) {
			logger.info("ApprovalController ApprovalListSelectAll listAll");
			
			mav.addObject("listAll", listAll);
			mav.addObject("avo", avo);
			
			mav.setViewName("approval/ApprovalTemps");
			
			return mav;
		}
		
		mav.setViewName("approval/ApprovalTemps");
		return mav;
	}
	
	@GetMapping(value="ApprovalTempSelectAll")
	public ModelAndView ApprovalTempSelectAll(ApprovalTempVO avo) {
		
		logger.info("ApprovalController ApprovalTempSelectAll 함수진입");
		
		List<ApprovalTempVO> listAll = approvalService.ApprovalTempSelectAll(avo);
		
		if(listAll.size() > 0) {
			logger.info("ApprovalController ApprovalTempSelectAll listAll");
			
			mav.addObject("listAll", listAll);
			mav.addObject("avo", avo);
			
			mav.setViewName("approval/ApprovalTempSelectAll");
			
			return mav;
		}
		mav.setViewName("approval/ApprovalTempSelectAll");
		return mav;
	}
	
	@GetMapping(value="Appr1DocSelectTemps")
	public ModelAndView Appr1DocSelectTemps(Appr1DocVO avo, ApprovalTempVO tvo) {
		
		logger.info("ApprovalController Appr1DocSelectTemps 함수진입");
		
		List<Appr1DocVO> listD1 = approvalService.Appr1DocSelect(avo);
		
		for(int i = 0; i < listD1.size(); i++) {
			Appr1DocVO _avo = listD1.get(i);
			
			mav.addObject("vdocnum", _avo.getVdocnum());
			mav.addObject("vdept", _avo.getVdept());
			mav.addObject("vnum", _avo.getVnum());
			mav.addObject("vname", _avo.getVname());
			mav.addObject("vsubj", _avo.getVsubj());
			mav.addObject("vlinecode", _avo.getVlinecode());
			mav.addObject("vtype", _avo.getVtype());
			mav.addObject("vstart", _avo.getVstart());
			mav.addObject("vend", _avo.getVend());
			mav.addObject("vdate", _avo.getVdate());
			mav.addObject("vleft", _avo.getVleft());
			mav.addObject("vline", _avo.getVline());
			mav.addObject("vfile", _avo.getVfile());
			
		}
		
		mav.setViewName("approval/Appr1DocSelect");
		return mav;
	}
	
	@GetMapping(value="ApprovalListAcceptAll")
	public ModelAndView ApprovalListAcceptAll(ApprovalListVO lvo, Appr1DocVO avo) {

		List<Appr1DocVO> listAll = approvalService.ApprovalListAcceptAll(avo);
		
		if(listAll.size() > 0) {
			logger.info("ApprovalController ApprovalListSelectAll listAll");
			
			mav.addObject("listAll", listAll);
			mav.addObject("avo", avo);
			
			mav.setViewName("approval/ApprovalListAcceptAll");
			
			return mav;
		}
		mav.setViewName("approval/ApprovalListAcceptAll");
		return mav;
	}
	
	@GetMapping(value="ApprovalAcceptSelect")
	public ModelAndView ApprovalAcceptSelect(Appr1DocVO avo) {
		
		logger.info("ApprovalController ApprovalAcceptSelect 함수진입");
		
		List<Appr1DocVO> listD1 = approvalService.ApprovalAcceptSelect(avo);
		
		for(int i = 0; i < listD1.size(); i++) {
			Appr1DocVO _avo = listD1.get(i);
			
			mav.addObject("vdocnum", _avo.getVdocnum());
			mav.addObject("vdept", _avo.getVdept());
			mav.addObject("vnum", _avo.getVnum());
			mav.addObject("vname", _avo.getVname());
			mav.addObject("vsubj", _avo.getVsubj());
			mav.addObject("vlinecode", _avo.getVlinecode());
			mav.addObject("vtype", _avo.getVtype());
			mav.addObject("vstart", _avo.getVstart());
			mav.addObject("vend", _avo.getVend());
			mav.addObject("vdate", _avo.getVdate());
			mav.addObject("vleft", _avo.getVleft());
			mav.addObject("vline", _avo.getVline());
			mav.addObject("vfile", _avo.getVfile());
			mav.addObject("vcheck", _avo.getVcheck());
			mav.addObject("insertdate", _avo.getInsertdate());
		}

		mav.setViewName("approval/Appr1DocAccept");
		return mav;
	}
	
	@GetMapping(value="ApprovalAcceptUpdate")
	public ModelAndView ApprovalAcceptUpdate(Appr1DocVO avo) {
		
		String vline = avo.getVline();
		String vcheck = avo.getVcheck();
		logger.info(vline);
		logger.info(vcheck);
		String[] lists = vline.split("->");
		int stamp = Integer.parseInt(vcheck);
		
		if(stamp <= lists.length) {
			stamp ++;
		}
		avo.setVcheck(Integer.toString(stamp));
		mav.addObject("vcheck", stamp);
		
		int nCnt = approvalService.ApprovalAcceptUpdate(avo);
		
		return mav;
		
	}
	
}