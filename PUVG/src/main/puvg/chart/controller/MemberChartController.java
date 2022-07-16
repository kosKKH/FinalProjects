package main.puvg.chart.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import main.puvg.chart.service.MemberChartService;
import main.puvg.chart.vo.MemberChartVO;


@RestController
public class MemberChartController {
	Logger logger = LogManager.getLogger(MemberChartController.class);
	ModelAndView mav = new ModelAndView();
	
	@Autowired(required=false)
	private MemberChartService memberChartService;
	
	
	@GetMapping(value="memberChart")
	public ModelAndView memberChart() {
		logger.info("MemberController.memberChart() 진입");
		
		List<MemberChartVO> chartdata = memberChartService.ChartData();
		mav.setViewName("main/MainPage");
		mav.addObject("chartdata", chartdata);
		
		return mav;
	}
}
