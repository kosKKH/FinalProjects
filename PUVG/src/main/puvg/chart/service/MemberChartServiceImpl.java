package main.puvg.chart.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.puvg.chart.dao.MemberChartDAO;
import main.puvg.chart.vo.MemberChartVO;

@Service
@Transactional
public class MemberChartServiceImpl implements MemberChartService {
	Logger logger = LogManager.getLogger(MemberChartServiceImpl.class);
	
	@Autowired(required=false)
	private MemberChartDAO memberChartDAO;
	
	public List<MemberChartVO> ChartData() {
	logger.info("MemberServiceImpl.MemberSelect() 진입");
	return memberChartDAO.ChartData();
	}
}
