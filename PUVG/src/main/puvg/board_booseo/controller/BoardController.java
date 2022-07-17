package main.puvg.board_booseo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import main.puvg.board_booseo.service.BoardService;
import main.puvg.board_booseo.vo.BoardVO;
import main.puvg.util.ChabunSetting;
import main.puvg.util.service.ChabunService;
import main.puvg.util.FileUploadUtil;

@Controller
public class BoardController {
	Logger logger = LogManager.getLogger(BoardController.class);

	@Autowired(required=false)
	private BoardService boardService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	//---------------INSERT----------------------------
	@GetMapping("BoardInsert")
	public String BoardInsert() {
		
		logger.info("BoardController.boardInsert() 함수 진입 >>>: ");
		return "board/BoardInsertForm";
	}
	//---------------INSERT  END----------------------------
	

	//---------------INSERT FORM----------------------------
	@PostMapping("BoardInsertForm")
	public String BoardInsertForm(@ModelAttribute BoardVO vbvo, HttpServletRequest req, Model model) throws IOException {
		
		logger.info("BoardController.BoardInsertForm() 함수 진입 >>> : ");
		
		int result = 0;
		
		//채번 구하기
		String vbnum = ChabunSetting.BoardChabun(chabunService.BoardChabun().getVbnum());
		logger.info("BoardController.BoardInsertForm() :: vbnum >>> : " + vbnum);
		vbvo.setVbnum(vbnum);
		
		HttpSession Session = req.getSession(false);
		String VNAME = (String)Session.getAttribute("VNAME");
		vbvo.setVname(VNAME);
		
		//파일 업로드
		String vfile = FileUploadUtil.fileUpload(vbvo.getFile(), req);
		logger.info("vfile >>> :" + vfile);
		vbvo.setVfile(vfile);
		
		result = boardService.BoardInsert(vbvo);

		if(result == 1) {
			List<BoardVO> ListAll = boardService.BoardSelectAll(vbvo);
			model.addAttribute("ListAll", ListAll);
			return "board/BoardSelectAll";
			}
		
			return  "board/BoardInsertForm";
		}
	//---------------INSERT FORM END----------------------------
	

	//---------------SELECTALL----------------------------
	@GetMapping("BoardSelectAll")
	public String BoardSelectAll(BoardVO vbvo, Model model) {
		
		logger.info("BoardController.BoardSelectAll() 함수 진입 >>> : ");
		
		
		//서비스 호출
		List<BoardVO> ListAll = boardService.BoardSelectAll(vbvo);
		if (ListAll.size() > 0) {
			logger.info("BoardController BoardSelectAll ListAll.size() >>> : " + ListAll.size());
			
			model.addAttribute("ListAll", ListAll);
			return "board/BoardSelectAll";
			
		}
		return "board/BoardInsertForm";
	}
	//---------------SELECTALL END----------------------------
	
	
	//---------------SELECT----------------------------
	@GetMapping("BoardSelect")
	public String BoardSelect(BoardVO vbvo, Model model) {
	
		logger.info("BoardController.BoardSelect() 함수 진입 >>> : ");
	
		logger.info("BoardController.BoardSelect() ::: vbvo.getVbnum() >>> : " + vbvo.getVbnum());
		

		List<BoardVO> listS = boardService.BoardSelect(vbvo);
		if(listS.size() == 1) {
		
			logger.info("BoardController.BoardSelectAll() ::: listS.size() >>> : " + listS.size());
	
			model.addAttribute("listS", listS);
	
			return "board/BoardSelect";
	}
		return "board/BoardSelectAll";
	}
	//---------------SELECT END----------------------------
	
	
	//---------------UPDATE----------------------------	
	@PostMapping("BoardUpdateForm")
	public String BoardUpdateForm(BoardVO vbvo, Model model) {
		
		logger.info("BoardController.BoardUpdateForm() 함수 진입 >>> : ");
		logger.info("BoardController.BoardSelect() ::: vbvo.getVbnum() >>> : " + vbvo.getVbnum());
		
		List<BoardVO> ListS = boardService.BoardSelect(vbvo);
		
		if(ListS.size() == 1) { 
			logger.info("BoardController.BoardSelect() ::: listS.size() >>> : " + ListS.size());
			
			model.addAttribute("listS", ListS);
		
		return "board/BoardUpdateForm";
		}
		return "board/BoardSelect";
	}
	
	//---------------UPDATE FORM----------------------------
	@PostMapping("BoardUpdate")
	public String BoardUpdate(BoardVO vbvo, HttpServletRequest req, Model model) throws IllegalStateException, IOException {
		
		logger.info("BoardController.BoardUpdate() 함수 진입 >>> : ");

		
		int result = 0;
		String Vfile ="";
				
		
		//파일 업로드
				String vfile = FileUploadUtil.fileUpload(vbvo.getFile(), req);
				logger.info("vfile >>> :" + vfile);
				vbvo.setVfile(vfile); 
		
			
		logger.info("V+file >>> :" + vbvo.getVfile());
		
		result = boardService.BoardUpdate(vbvo);
		
		if(result == 1) {
			List<BoardVO> ListAll = boardService.BoardSelectAll(vbvo);
			model.addAttribute("ListAll", ListAll);
			return "board/BoardSelectAll";
			}
		
			return  "board/BoardSelectAll";			
	}
	
	
	//---------------DELETE----------------------------
	@GetMapping("BoardDelete")
	public String BoardDelete(BoardVO vbvo, Model model) {
		
		logger.info("BoardController.BoardDelete() 함수 진입 >>> : ");
		
		int deleteCnt = boardService.BoardDelete(vbvo);
		
		if(deleteCnt > 0) {
			
			logger.info("BoardController.BoardDelete(). deleteCnt >>> : " + deleteCnt);
			
			List<BoardVO> ListAll = boardService.BoardSelectAll(vbvo);
			model.addAttribute("ListAll", ListAll);
			
			return "board/BoardDelete";
		}
				return "board/BoardSelectAll";
	}
}
