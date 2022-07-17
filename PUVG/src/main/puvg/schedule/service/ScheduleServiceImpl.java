package main.puvg.schedule.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.puvg.schedule.controller.ScheduleController;
import main.puvg.schedule.dao.ScheduleDAO;
import main.puvg.schedule.vo.ScheduleMEMVO;
import main.puvg.schedule.vo.ScheduleShareVO;
import main.puvg.schedule.vo.ScheduleVO;

@Service
@Transactional
public class ScheduleServiceImpl implements ScheduleService {
	
	Logger logger = LogManager.getLogger(ScheduleController.class);
	
	@Autowired(required=false)
	private ScheduleDAO scheduleDAO;


	@Override
	public int schedulInsert(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.schedulInsert >>>");
		return scheduleDAO.schedulInsert(svo);
	}
	
	@Override
	public List<ScheduleVO> scheduleBoardSelectAll(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.scheduleBoardSelectAll >>>");
		return scheduleDAO.scheduleBoardSelectAll(svo);
	}

	@Override
	public List<ScheduleVO> scheduleBoardSelect(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.scheduleBoardSelect >>>");
		return scheduleDAO.sheduleBoardSelect(svo);
	}

	@Override
	public List<ScheduleVO> sheduleBoardSerch(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.sheduleBoardSerch >>>");
		return scheduleDAO.sheduleBoardSerch(svo);
	}

	@Override
	public int sheduleBoardInsert(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.sheduleBoardInsert >>>");
		return scheduleDAO.sheduleBoardInsert(svo);
	}

	@Override
	public List<ScheduleMEMVO> sheduleMemSerch(ScheduleMEMVO smvo) {
		logger.info("ScheduleServiceImpl.sheduleBoardInsert >>>");
		return scheduleDAO.sheduleMemSerch(smvo);
	}

	@Override
	public int sheduleShareInsert(ScheduleShareVO svo) {
		logger.info("ScheduleServiceImpl.sheduleBoardInsert >>>");
		return scheduleDAO.sheduleShareInsert(svo);
	}

	@Override
	public List<ScheduleVO> scheduleMain01(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.scheduleMain01 >>>");
		return scheduleDAO.scheduleMain01(svo);
	}

	@Override
	public List<ScheduleVO> scheduleMain02(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.scheduleMain02 >>>");
		return scheduleDAO.scheduleMain02(svo);
	}

	@Override
	public List<ScheduleVO> scheduleMain03(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.scheduleMain03 >>>");
		return scheduleDAO.scheduleMain03(svo);
	}

	@Override
	public List<ScheduleVO> scheduleMain12(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.scheduleMain12 >>>");
		return scheduleDAO.scheduleMain12(svo);
	}

	@Override
	public List<ScheduleVO> scheduleMain13(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.scheduleMain13 >>>");
		return scheduleDAO.scheduleMain13(svo);
	}

	@Override
	public List<ScheduleVO> scheduleMain23(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.scheduleMain23 >>>");
		return scheduleDAO.scheduleMain23(svo);
	}

	@Override
	public int sheduleBoardUpdate(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.sheduleBoardUpdate >>>");
		return scheduleDAO.sheduleBoardUpdate(svo);
	}

	@Override
	public int scheduledDelete(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.scheduledDelete >>>");
		return scheduleDAO.scheduledDelete(svo);
	}

	@Override
	public int scheduledUpdateStatus(ScheduleVO svo) {
		logger.info("ScheduleServiceImpl.scheduledUpdateStatus >>>");
		return scheduleDAO.scheduledUpdateStatus(svo);
	}


}
