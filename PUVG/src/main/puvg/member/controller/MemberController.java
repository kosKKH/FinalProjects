package main.puvg.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import main.puvg.member.service.MemberService;
import main.puvg.member.vo.MemberVO;
import main.puvg.util.ChabunSetting;
import main.puvg.util.FileUploadUtil;
import main.puvg.util.service.ChabunService;

@RestController
public class MemberController {
	Logger logger = LogManager.getLogger(MemberController.class);
	ModelAndView mav = new ModelAndView();
	
	private MemberService memberService;
	private ChabunService chabunService;
	
	@Autowired(required=false)
	public MemberController(MemberService memberService, ChabunService chabunService) {
		this.memberService = memberService;
		this.chabunService = chabunService;
	}
	
	@GetMapping(value="memberSelect")
	public ModelAndView memberSelect(HttpServletRequest request, MemberVO mvo) {
		logger.info("MemberController.memberSelect() 진입");
		HttpSession Session = request.getSession(true);
		String VID = (String)Session.getAttribute("VID");
		mvo.setVnum(VID);
		
		List<MemberVO> selectmem = memberService.MemberSelect(mvo);	
		mav.setViewName("member/MemberSelect");
		mav.addObject("selectmem", selectmem);
		
		return mav;
	}
	
	@GetMapping(value="memberSelectAdmin")
	public ModelAndView memberSelectAdmin(HttpServletRequest request, MemberVO mvo) {
		logger.info("MemberController.memberSelectAdmin() 진입");
		mvo.setVnum(request.getParameter("vnum"));
		
		List<MemberVO> selectmem = memberService.MemberSelect(mvo);
		mav.setViewName("member/MemberSelect");
		mav.addObject("selectmem", selectmem);
		
		return mav;
	}
	
	@GetMapping(value="memberInsertForm")
	public ModelAndView memberInsertForm(MemberVO mvo) {
		logger.info("MemberController.memberInsertForm() 진입");
		mav.setViewName("member/MemberInsertForm");
		return mav;
	}
	
	@PostMapping(value="memberInsert")
	public ModelAndView memberInsert(@ModelAttribute MemberVO mvo, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("MemberController.memberInsert() 진입");
		mav.setViewName("member/MemberInsertForm");
		
		String chabun = ChabunSetting.getMemberChabun("d", chabunService.getMemberChabun().getVnum());
		logger.info("생성된 채번  : " + chabun);
		mvo.setVnum(chabun);
		
		String fileupload = FileUploadUtil.fileUpload(mvo.getVfile(), request);
		mvo.setVimg(fileupload);
		mvo.setVpw(mvo.getVbirth());
		mvo.setVdeleteyn("근무");
		mvo.setVauthority(0);
		int insertcount = memberService.MemberInsert(mvo);
		
		if(insertcount > 0) {
			mav.setViewName("main/MainPage");
		}
		return mav;
	}
	
	@GetMapping(value="memberSelectAll")
	public ModelAndView memberSelectAll(MemberVO mvo) {
		logger.info("MemberController.memberSelectAll() 진입");
		mav.setViewName("member/MemberSelectAll");
		
		
		List<MemberVO> selectall = memberService.MemberSelectAll(mvo);	
		mav.addObject("selectall", selectall);
		
		return mav;
	}
	
	@GetMapping(value="memberSelectWork")
	public ModelAndView memberSelectWork(MemberVO mvo) {
		logger.info("MemberController.memberSelectWork() 진입");
		mav.setViewName("member/MemberSelectWork");
		
		
		List<MemberVO> selectwork = memberService.MemberSelectWork(mvo);	
		mav.addObject("selectwork", selectwork);
		
		return mav;
	}
	
	@GetMapping(value="updatePassWord")
	public ModelAndView updatePassWord() {
		logger.info("MemberController.updatePassWord() 진입");
		mav.setViewName("member/Update_pw_Popup");
		return mav;
	}
	
	@GetMapping(value="changePassWord")
	public ModelAndView changePassWord() {
		logger.info("MemberController.changePassWord() 진입");
		mav.setViewName("member/Update_pw");
		return mav;
	}
	
	@PostMapping(value="UpdatePassWord")
	public String UpdatePassWord(HttpServletRequest request,@ModelAttribute MemberVO mvo) {
		logger.info("MemberController.UpdatePassWord() 진입");
		
		HttpSession Session = request.getSession(false);
		String VNUM= (String)Session.getAttribute("VID");
		mvo.setVnum(VNUM);
		mvo.setVpw(request.getParameter("vpw"));
		
		logger.info(mvo.getVnum());
		logger.info(mvo.getVpw());
		int updatepw = memberService.MemberUpdatepw(mvo);
		if(updatepw == 1) {
			logger.info("업데이트 완료");
			return "success";
		}
		logger.info("업데이트 실패");
		return "fail";
	}
	
	@GetMapping(value="updateMemberForm")
	public ModelAndView updateMember(HttpServletRequest request, MemberVO mvo) {
		logger.info("MemberController.updateMemberForm() 진입");
		
		mvo.setVnum(request.getParameter("vnum"));
		List<MemberVO> updatelist = memberService.MemberSelectAdmin(mvo);
		mav.addObject("updatelist", updatelist);
		
		mav.setViewName("member/MemberUpdateForm");
		return mav;
	}
	
	@PostMapping(value="memberUpdate")
	public ModelAndView memberUpdate(@ModelAttribute MemberVO mvo, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("MemberController.memberUpdate() 진입");
		mav.setViewName("member/MemberUpdateForm");
		logger.info("get file = " + mvo.getVfile().getOriginalFilename());
		if(mvo.getVfile().getOriginalFilename() == null || mvo.getVfile().getOriginalFilename() == "") {
			logger.info("기존 사진 파일 유지");
			int updatecount = memberService.MemberUpdate(mvo);
			
			if(updatecount > 0) {
				List<MemberVO> selectmem = memberService.MemberSelect(mvo);	
				mav.setViewName("member/MemberSelect");
				mav.addObject("selectmem", selectmem);
				
			}
		} else {
			logger.info("새 사진 파일 등록");
			String fileupload = FileUploadUtil.fileUpload(mvo.getVfile(), request);
			logger.info(fileupload);
			mvo.setVimg(fileupload);
			
			int updatecount = memberService.MemberUpdateImg(mvo);
			if(updatecount > 0) {
				List<MemberVO> selectmem = memberService.MemberSelect(mvo);	
				mav.setViewName("member/MemberSelect");
				mav.addObject("selectmem", selectmem);
			}
		}
		
		return mav;
	}
	
	@GetMapping(value="memberSearch")
	public ModelAndView memberSearch(MemberVO mvo) {
		logger.info("MemberController.memberSearch() 진입");
		mav.setViewName("member/MemberSelectAll");
		
		
		List<MemberVO> search = memberService.MemberSearch(mvo);
		if(search.size() > 0) {
			mav.addObject("selectall", search);
		} else {
			logger.info("이름 검색 결과가 없습니다.");
			
			mav.setViewName("member/SearchError");
			
		}
		return mav;
	}
	
	@GetMapping(value="memberSearch2")
	public ModelAndView memberSearch2(MemberVO mvo) {
		logger.info("MemberController.memberSearch() 진입");
		mav.setViewName("member/MemberSelectWork");
		
		
		List<MemberVO> search = memberService.MemberSearch(mvo);
		if(search.size() > 0) {
			mav.addObject("selectwork", search);
		} else {
			logger.info("이름 검색 결과가 없습니다.");
			
			mav.setViewName("member/SearchError");
			
		}
		return mav;
	}
	
	@GetMapping(value="memberSearchData")
	public ModelAndView memberSearchData(MemberVO mvo, HttpServletRequest request) {
		logger.info("MemberController.memberSearchData() 진입");
		mav.setViewName("member/MemberSelectAll");
		logger.info("nowpage = " + request.getParameter("nowpage"));
		logger.info("searchdept = " + request.getParameter("searchdept"));
		logger.info("searchrank = " + request.getParameter("searchrank"));
		if(request.getParameter("nowpage") == null || request.getParameter("nowpage") == "") {
			mvo.setNowpage("1");
		}
		logger.info("vdept = " + request.getParameter("vdept"));
		logger.info("vrank = " + request.getParameter("vrank"));
		logger.info("nowpage = " + mvo.getNowpage());
		List<MemberVO> search = memberService.MemberSearchData(mvo);
		if(search.size() > 0) {
			mav.addObject("selectall", search);
		} else {
			logger.info("검색 결과가 없습니다.");
			
			mav.setViewName("member/SearchError");
			
		}
		return mav;
	}
	
}
