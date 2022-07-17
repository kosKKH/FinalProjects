package main.puvg.schedule.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.puvg.util.service.ChabunService;
import main.puvg.schedule.service.ScheduleService;
import main.puvg.schedule.vo.ScheduleCheckVO;
import main.puvg.schedule.vo.ScheduleMEMVO;
import main.puvg.schedule.vo.ScheduleShareVO;
import main.puvg.schedule.vo.ScheduleVO;
import main.puvg.util.ChabunSetting;

@Controller
public class ScheduleController {
	
	Logger logger = LogManager.getLogger(ScheduleController.class);
	
	@Autowired(required=false)
	private ScheduleService scheduleService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	
	/*
	@GetMapping(value="scheduleMain")
	public String scheduleMain() {
		logger.info("ScheduleController.scheduleMain >>> ");
		return "schedule/scheduleMain";
	}
	*/
	
	// �޷¿� ǥ��� ��ü JSON�� �ҷ����� ===========================================================
	@GetMapping(value="scheduleMain") 
	public String scheduleMain(ScheduleVO svo, ScheduleCheckVO scvo, Model model, HttpServletRequest request) {
		logger.info("ScheduleController.scheduleMain >>> " );
		
		HttpSession Session = request.getSession(false);
		String VNUM = (String)Session.getAttribute("VID");
		
		svo.setVnum(VNUM);
		String status = scvo.getCheckstatus();
		logger.info("status : " + status);
		
		List<ScheduleVO> selectAll = null;
		
		if(status.equals("123")) {
			selectAll = scheduleService.scheduleBoardSelectAll(svo);	
		}else if(status.equals("1")) {
			selectAll = scheduleService.scheduleMain01(svo);	
		}else if(status.equals("2")) {
			selectAll = scheduleService.scheduleMain02(svo);	
		}else if(status.equals("3")) {
			selectAll = scheduleService.scheduleMain03(svo);	
		}else if(status.equals("12")) {
			selectAll = scheduleService.scheduleMain12(svo);	
		}else if(status.equals("23")) {
			selectAll = scheduleService.scheduleMain23(svo);	
		}else if(status.equals("13")) {
			selectAll = scheduleService.scheduleMain13(svo);	
		}

		JSONArray jsonCalendar = new JSONArray();
		
		String start = "";
		String end = "";
		String start_first = "";
		String start_last = "";
		String end_first = "";
		String end_last = "";
		int startdayN = 0;
		int enddayN = 0;
		
		for(int i = 0 ; i < selectAll.size(); i ++ ) {
			ScheduleVO svo2 = selectAll.get(i);
			
			start = svo2.getVsstart();
			end = svo2.getVsend();
			
			start_first = start.substring(0, 10);
			start_last = start.substring(10, 16);
			end_first = end.substring(0, 10);
			end_last = end.substring(10, 16);

			String startYear = start.substring(0, 4);
			String startMonth = start.substring(5, 7);
			String startday = start.substring(8, 10);
			String endYear = end.substring(0, 4);
			String endMonth = end.substring(5, 7);
			String endday = end.substring(8, 10);
			startdayN = Integer.parseInt(startday);
			enddayN = Integer.parseInt(endday);
			int startmonthN = Integer.parseInt(startMonth);
			int endmonthN = Integer.parseInt(endMonth);
			int startYearN = Integer.parseInt(startYear);
			int endYearN = Integer.parseInt(endYear);

			logger.info("startYear : " + startYear);
			logger.info("startMonth : " + startMonth);
			logger.info("startday : " + startday);

			JSONObject jObject = new JSONObject();
			jObject.put("title", svo2.getVsname());
			
			if(startMonth.equals(endMonth) && startdayN == enddayN -1 && start_last.equals("T00:00") && end_last.equals("T00:00")) {
				jObject.put("start", start_first);
			}else if(startYear.equals(endYear) &&startmonthN == endmonthN -1 && endday.equals("01") && start_last.equals("T00:00") && end_last.equals("T00:00")){
				jObject.put("start", start_first);
			}else if(startYearN == endYearN -1 && endMonth.equals("01") && endday.equals("01") && start_last.equals("T00:00") && end_last.equals("T00:00")){
				jObject.put("start", start_first);
			}else {
				jObject.put("start", start);
				jObject.put("end", end);
			}
			jsonCalendar.add(jObject);
		}
		if(selectAll.size() > 0 ) {
			model.addAttribute("jsonCalendar", jsonCalendar);
			return "schedule/scheduleMain";
		}
		 return "schedule/scheduleMain";
	}
	// �޷¿� ǥ��� ��ü JSON�� �ҷ����� ===========================================================
	
	// �޴���, ���� ������ �޷� �̵� ===========================================================
	@GetMapping(value="scheduleCalender") 
	public String scheduleCalendar(HttpServletRequest request, ScheduleVO svo, Model model) {
		logger.info("ScheduleController.scheduleCalendar >>> " );
		
		HttpSession Session = request.getSession(false);
		String VID = (String)Session.getAttribute("VID");
		logger.info("Vnum = " + VID);
		svo.setVnum("V202207100001");
		
		List<ScheduleVO> selectAll = scheduleService.scheduleBoardSelectAll(svo);

		JSONArray jsonCalendar = new JSONArray();
		
		String start = "";
		String end = "";
		String start_first = "";
		String start_last = "";
		String end_first = "";
		String end_last = "";
		int startdayN = 0;
		int enddayN = 0;
		
		for(int i = 0 ; i < selectAll.size(); i ++ ) {
			ScheduleVO svo2 = selectAll.get(i);
			
			start = svo2.getVsstart();
			end = svo2.getVsend();
			
			start_first = start.substring(0, 10);
			start_last = start.substring(10, 16);
			end_first = end.substring(0, 10);
			end_last = end.substring(10, 16);

			String startYear = start.substring(0, 4);
			String startMonth = start.substring(5, 7);
			String startday = start.substring(8, 10);
			String endYear = end.substring(0, 4);
			String endMonth = end.substring(5, 7);
			String endday = end.substring(8, 10);
			startdayN = Integer.parseInt(startday);
			enddayN = Integer.parseInt(endday);
			int startmonthN = Integer.parseInt(startMonth);
			int endmonthN = Integer.parseInt(endMonth);
			int startYearN = Integer.parseInt(startYear);
			int endYearN = Integer.parseInt(endYear);

			logger.info("startYear : " + startYear);
			logger.info("startMonth : " + startMonth);
			logger.info("startday : " + startday);

			JSONObject jObject = new JSONObject();
			jObject.put("title", svo2.getVsname());
			
			// �ҷ����� �����Ͱ� �Ϸ� ������ ��� start���� ��ϵ�.
			if(startMonth.equals(endMonth) && startdayN == enddayN -1 && start_last.equals("T00:00") && end_last.equals("T00:00")) {
				logger.info("�Ϸ����� �Դϴ� >>>>  ");
				jObject.put("start", start_first);
				//jObject.put("end", end_first);
			}else if(startYear.equals(endYear) &&startmonthN == endmonthN -1 && endday.equals("01") && start_last.equals("T00:00") && end_last.equals("T00:00")){
				logger.info("�Ϸ����� �Դϴ� >>>>  ");
				jObject.put("start", start_first);
				//jObject.put("end", end_first);
			}else if(startYearN == endYearN -1 && endMonth.equals("01") && endday.equals("01") && start_last.equals("T00:00") && end_last.equals("T00:00")){
				logger.info("�Ϸ����� �Դϴ� >>>>  ");
				jObject.put("start", start_first);
				//jObject.put("end", end_first);
			}else {
				
				logger.info("�Ⱓ�� �ִ� ���� �Դϴ� >>>   " );
				jObject.put("start", start);
				jObject.put("end", end);
			}
			jsonCalendar.add(jObject);
		}
		if(selectAll.size() > 0 ) {
			model.addAttribute("jsonCalendar", jsonCalendar);
			return "schedule/scheduleMain";
		}
		 return "schedule/error";
	}
	// �޷¿� ǥ��� ��ü JSON�� �ҷ����� ===========================================================
	
	
	
	//����������2�̵�(�˻�)
	@GetMapping(value="selecterror")
	public String error2() {
		logger.info("ScheduleController.error2 >>> ");
		return "schedule/scheduleBoardSelectError";
	}
	
	
	//���� ����ϱ� ==============================================================
	@PostMapping(value="schedulInsert")
	@ResponseBody 
	public Object schedulInsert(ScheduleVO svo) {
		logger.info("ScheduleController.schedulInsert >>> " );
		logger.info("svo.getVnum() : " + svo.getVnum());
		logger.info("svo.getVdept() : " + svo.getVdept());
		logger.info("svo.getVscalendarnum() : " + svo.getVscalendarnum());

		logger.info("svo.getVsname() : " + svo.getVsname());
		logger.info("svo.getVsstart() : " + svo.getVsstart());
		logger.info("svo.getVsend() : " + svo.getVsend());
		logger.info("svo.getVsalarm() : " + svo.getVsalarm());
		logger.info("svo.getVsalarmtime() : " + svo.getVsalarmtime());
		logger.info("svo.getVsmemo() : " + svo.getVsmemo());
		logger.info("svo.getVspublic() : " + svo.getVspublic());
		
		String vsnum = ChabunSetting.numberKosmoProduct(chabunService.getScheduleChabun().getVsnum());
		svo.setVsnum(vsnum);
		logger.info("svo.getVsnum() : " + svo.getVsnum());
		
		String status = "";
		int nCnt = scheduleService.schedulInsert(svo);
		logger.info("nCnt : " + nCnt);
		if(nCnt > 0 ) {
			status = "Schedule insert OK";
		}else {
			status = "Schedule insert NOT";
		}
		return status;
	}
	
	// �Խñ� ��ü ��ȸ�ϱ�
	@GetMapping(value="scheduleBoardSelectAll")
	public String cheduleBoardSelectAll(HttpServletRequest request, ScheduleVO svo, Model model) {
		logger.info("ScheduleController.scheduleBoardSelectAll >>> " );
		
		HttpSession Session = request.getSession(false);
		String VNUM = (String)Session.getAttribute("VID");
		logger.info("Vnum = " + VNUM);
		svo.setVnum(VNUM);
		
		List<ScheduleVO> selectAll = scheduleService.scheduleBoardSelectAll(svo);
		logger.info("selectall = " + selectAll);
		if(selectAll.size() > 0 ) {
			model.addAttribute("selectAll", selectAll);
			return "schedule/scheduleBoardSelectAll";
		}
		 return "schedule/error";
	}
	
	// �Խñ� �����ؼ� ��ȸ�ϱ� =======================================================
	@GetMapping(value="scheduleBoardSelect")
	public String cheduleBoardSelect(ScheduleVO svo, Model model) {
		logger.info("ScheduleController.scheduleBoardSelect >>> " );
		String vsnum = svo.getVsnum();
		logger.info("vsnum : " + vsnum);
		
		List<ScheduleVO> select = scheduleService.scheduleBoardSelect(svo);
		logger.info("select.size() : " + select.size());
		if(select.size() > 0 ) {
			model.addAttribute("select", select);
			return "schedule/scheduleBoardSelect";
		}
		 return "schedule/error";
	}
	// �Խñ� �����ؼ� ��ȸ�ϱ� =======================================================
	
	// �Խñ� �˻��ؼ� ��ȸ�ϱ� =======================================================
	@GetMapping(value="sheduleBoardSerch")
	public String sheduleBoardSerch(ScheduleVO svo, Model model) {
		logger.info("ScheduleController.sheduleBoardSerch >>> " );
		String vsname = svo.getVsname();
		logger.info("vsname : " + vsname);
		
		List<ScheduleVO> serch = scheduleService.sheduleBoardSerch(svo);
		logger.info("select.size() : " + serch.size());
		if(serch.size() > 0 ) {
			model.addAttribute("serch", serch);
			return "schedule/scheduleBoardSerch";
		}
		
		 return "schedule/scheduleBoardSelectError";
	}
	// �Խñ� �˻��ؼ� ��ȸ�ϱ� =======================================================
	
	// �Խñ� ���� ��� �� �̵� =======================================================
	@GetMapping(value="sheduleBoardInsertForm")
	public String sheduleBoardInsertForm() {
		logger.info("ScheduleController.sheduleBoardInsertForm >>> " );
		return "schedule/scheduleBoardInsertForm";
	}
	// �Խñ� ���� ��� �� �̵� =======================================================
	
	// �Խñ۷� ���� ����ϱ� =======================================================
	@GetMapping(value="sheduleBoardInsert")
	public String sheduleBoardInsert(ScheduleVO svo, ScheduleShareVO ssvo, Model model) {
		logger.info("ScheduleController.sheduleBoardInsert >>> " );
		logger.info("svo.getVnum() : " + svo.getVnum());
		logger.info("svo.getVdept() : " + svo.getVdept());
		logger.info("svo.getVscalendarnum() : " + svo.getVscalendarnum());
		logger.info("svo.getVsname() : " + svo.getVsname());
		logger.info("svo.getVsstart() : " + svo.getVsstart());
		logger.info("svo.getVsend() : " + svo.getVsend());
		logger.info("svo.getVsalarm() : " + svo.getVsalarm());
		logger.info("svo.getVsalarmtime() : " + svo.getVsalarmtime());
		logger.info("svo.getVsmemo() : " + svo.getVsmemo());
		logger.info("svo.getVspublic() : " + svo.getVspublic());
		logger.info("svo.getVsstatus() : " + svo.getVsstatus());

		logger.info("ssvo.getShare1() : " + ssvo.getShare1());
		logger.info("ssvo.getShare2() : " + ssvo.getShare2());
		logger.info("ssvo.getShare3() : " + ssvo.getShare3());
		logger.info("ssvo.getShare4() : " + ssvo.getShare4());
		logger.info("ssvo.getShare5() : " + ssvo.getShare5());
		logger.info("ssvo.getShare6() : " + ssvo.getShare6());
		logger.info("ssvo.getShare7() : " + ssvo.getShare7());
		logger.info("ssvo.getShare8() : " + ssvo.getShare8());
		logger.info("ssvo.getShare9() : " + ssvo.getShare9());
		logger.info("ssvo.getShare10() : " + ssvo.getShare10());
		
		String vsnum = ChabunSetting.numberKosmoProduct(chabunService.getScheduleChabun().getVsnum());
		svo.setVsnum(vsnum);
		logger.info("svo.getVsnum() : " + svo.getVsnum());
		ssvo.setVsnum(vsnum);
		String vspublic = svo.getVspublic();
		
		List<ScheduleVO> list =  scheduleService.scheduleBoardSelectAll(svo);

		int sCnt = 0;
		int nCnt = 0;
		if(vspublic.equals("04")) {
			sCnt = scheduleService.sheduleShareInsert(ssvo);
			logger.info("sCnt : " + sCnt);
			nCnt = scheduleService.sheduleBoardInsert(svo);
			logger.info("nCnt : " + nCnt);
			
			if(sCnt > 0 && nCnt > 0) {
				return "schedule/scheduleBoardInsert";
			}else {
				return "schedule/error";
			}
		}else {
			nCnt = scheduleService.sheduleBoardInsert(svo);
			logger.info("nCnt : " + nCnt);
			
			if(nCnt > 0 ) {
				model.addAttribute("list", list);
				return "schedule/scheduleBoardInsert";
			}else {
				return "schedule/error";
			}
		}
	}
	// �Խñ۷� ���� ����ϱ� =======================================================
	
	//�Խñ� �ۼ��� ������ ��� ã�� ================================================================
	@PostMapping(value="sheduleMemSerch", produces = "application/text; charset=UTF-8")
	@ResponseBody 
	public Object sheduleMemSerch(ScheduleMEMVO smvo) {
		
		logger.info("ScheduleController.sheduleBoardSerch >>> " );
		String vname = smvo.getVname();
		logger.info("vname : " + vname);
		
		String name = "";
		List<ScheduleMEMVO> listmem =  scheduleService.sheduleMemSerch(smvo);
		
		if(listmem.size() > 0 ) {
			ScheduleMEMVO memvo = listmem.get(0);
			name = memvo.getVname() + "@" + memvo.getVdept();
		}else {
			name = "��ϵ� ��� �̸��� �����ϴ�. �ٽ� �˻����ּ���.";
		}
		return name;
	}
	//�Խñ� �ۼ��� ������ ��� ã�� ================================================================
	
	// �Խñ� ���� ��� �� �̵� =======================================================
	@GetMapping(value="scheduleBoardUpdateForm")
	public String scheduleBoardUpdateForm(ScheduleVO svo, ScheduleShareVO ssvo, Model model) {
		logger.info("ScheduleController.sheduleBoardInsertForm >>> " );
	
		List<ScheduleVO> select = scheduleService.scheduleBoardSelect(svo);
		logger.info("select.size() : " + select.size());
		if(select.size() > 0 ) {
			model.addAttribute("select", select);
			return "schedule/scheduleBoardUpdateForm";
		}
		return "schedule/error";
	}
	// �Խñ� ���� ��� �� �̵� =======================================================
	
	
	// �Խñ۷� ���� �����ϱ� =======================================================
	@GetMapping(value="sheduleBoardUpdateForm")
	public String sheduleBoardUpdateForm(ScheduleVO svo, ScheduleShareVO ssvo, Model model) {
		logger.info("ScheduleController.sheduleBoardInsert >>> " );
		logger.info("svo.getVnum() : " + svo.getVnum());
		logger.info("svo.getVdept() : " + svo.getVdept());
		logger.info("svo.getVscalendarnum() : " + svo.getVscalendarnum());
		logger.info("svo.getVsname() : " + svo.getVsname());
		logger.info("svo.getVsstart() : " + svo.getVsstart());
		logger.info("svo.getVsend() : " + svo.getVsend());
		logger.info("svo.getVsalarm() : " + svo.getVsalarm());
		logger.info("svo.getVsalarmtime() : " + svo.getVsalarmtime());
		logger.info("svo.getVsmemo() : " + svo.getVsmemo());
		logger.info("svo.getVspublic() : " + svo.getVspublic());
		logger.info("svo.getVsstatus() : " + svo.getVsstatus());

		logger.info("ssvo.getShare1() : " + ssvo.getShare1());
		logger.info("ssvo.getShare2() : " + ssvo.getShare2());
		logger.info("ssvo.getShare3() : " + ssvo.getShare3());
		logger.info("ssvo.getShare4() : " + ssvo.getShare4());
		logger.info("ssvo.getShare5() : " + ssvo.getShare5());
		logger.info("ssvo.getShare6() : " + ssvo.getShare6());
		logger.info("ssvo.getShare7() : " + ssvo.getShare7());
		logger.info("ssvo.getShare8() : " + ssvo.getShare8());
		logger.info("ssvo.getShare9() : " + ssvo.getShare9());
		logger.info("ssvo.getShare10() : " + ssvo.getShare10());
		
		String vsnum = ChabunSetting.numberKosmoProduct(chabunService.getScheduleChabun().getVsnum());
		svo.setVsnum(vsnum);
		logger.info("svo.getVsnum() : " + svo.getVsnum());
		ssvo.setVsnum(vsnum);
		String vspublic = svo.getVspublic();

		int sCnt = 0;
		int nCnt = 0;
		if(vspublic.equals("04")) {
			sCnt = scheduleService.sheduleShareInsert(ssvo);
			logger.info("sCnt : " + sCnt);
			nCnt = scheduleService.sheduleBoardInsert(svo);
			logger.info("nCnt : " + nCnt);
			
			if(sCnt > 0 && nCnt > 0) {
				return "schedule/scheduleBoardInsert";
			}else {
				return "schedule/error";
			}
		}else {
			nCnt = scheduleService.sheduleBoardInsert(svo);
			logger.info("nCnt : " + nCnt);
			
			if(nCnt > 0 ) {
				return "schedule/scheduleBoardInsert";
			}else {
				return "schedule/error";
			}
		}
	}
	// �Խñ۷� ���� ����ϱ� =======================================================
	
	// ���� �����ϱ� =======================================================
	@GetMapping(value="sheduleBoardUpdate")
	public String sheduleBoardUpdate(ScheduleVO svo, ScheduleShareVO ssvo, Model model) {
		logger.info("ScheduleController.sheduleBoardUpdate >>> " );
		logger.info("svo.getVnum() : " + svo.getVnum());
		logger.info("svo.getVdept() : " + svo.getVdept());
		logger.info("svo.getVscalendarnum() : " + svo.getVscalendarnum());
		logger.info("svo.getVsname() : " + svo.getVsname());
		logger.info("svo.getVsstart() : " + svo.getVsstart());
		logger.info("svo.getVsend() : " + svo.getVsend());
		logger.info("svo.getVsalarm() : " + svo.getVsalarm());
		logger.info("svo.getVsalarmtime() : " + svo.getVsalarmtime());
		logger.info("svo.getVsmemo() : " + svo.getVsmemo());
		logger.info("svo.getVspublic() : " + svo.getVspublic());
		logger.info("svo.getVsstatus() : " + svo.getVsstatus());

		logger.info("ssvo.getShare1() : " + ssvo.getShare1());
		logger.info("ssvo.getShare2() : " + ssvo.getShare2());
		logger.info("ssvo.getShare3() : " + ssvo.getShare3());
		logger.info("ssvo.getShare4() : " + ssvo.getShare4());
		logger.info("ssvo.getShare5() : " + ssvo.getShare5());
		logger.info("ssvo.getShare6() : " + ssvo.getShare6());
		logger.info("ssvo.getShare7() : " + ssvo.getShare7());
		logger.info("ssvo.getShare8() : " + ssvo.getShare8());
		logger.info("ssvo.getShare9() : " + ssvo.getShare9());
		logger.info("ssvo.getShare10() : " + ssvo.getShare10());
		
		String vspublic = svo.getVspublic();
		List<ScheduleVO> list = scheduleService.scheduleBoardSelect(svo);
		int nCnt = scheduleService.sheduleBoardUpdate(svo);
		if(nCnt > 0 ) {
			model.addAttribute("list", list);
			return "schedule/scheduleBoardUpdate";
		}else {
			return "schedule/error";
		}
	}
	// ���� �����ϱ� =======================================================
	
	
	// �Խñ� �� ���� �����ϱ� =========================================================
	@GetMapping(value="scheduledDelete")
	public String scheduledDelete(ScheduleVO svo, Model model) {
		// vnum, vsnum�� Ȯ���ؾ� ��. 
		logger.info("ScheduleController.scheduledDelete �Խñ� ���� ��Ʈ�ѷ� >>> " );
		String vnum = svo.getVnum();
		String vsnum = svo.getVsnum();
		logger.info("vnum : " + vnum );
		logger.info("vsnum : " + vsnum );
		
		int nCnt = scheduleService.scheduledDelete(svo);
		List<ScheduleVO> list = scheduleService.scheduleBoardSelectAll(svo);
		
		if(nCnt > 0 ) {
			model.addAttribute("list", list);
			return "schedule/scheduleBoardDelete";
		}else {
			return "schedule/error";
		}
	}
	// �Խñ� �� ���� �����ϱ� =========================================================
		
	// �Խñ� ������� �����ϱ� =========================================================
	@GetMapping(value="scheduledUpdateStatus")
	public String scheduledUpdateStatus(ScheduleVO svo, Model model) {
		// vnum, vsnum�� Ȯ���ؾ� ��. 
		logger.info("ScheduleController.scheduledUpdateStatus �Խñ� �����Ȳ ���� ��Ʈ�ѷ� >>> " );
		String vnum = svo.getVnum();
		String vsnum = svo.getVsnum();
		logger.info("vnum : " + vnum );
		logger.info("vsnum : " + vsnum );
		
		int nCnt = scheduleService.scheduledUpdateStatus(svo);
		List<ScheduleVO> list = scheduleService.scheduleBoardSelectAll(svo);
		
		if(nCnt > 0 ) {
			model.addAttribute("list", list);
			return "schedule/scheduleBoardStatus";
		}else {
			return "schedule/error";
		}
	}
	

	
}
