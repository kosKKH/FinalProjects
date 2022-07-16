package main.puvg.schedule.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.puvg.schedule.controller.ScheduleController;
import main.puvg.schedule.vo.ScheduleMEMVO;
import main.puvg.schedule.vo.ScheduleShareVO;
import main.puvg.schedule.vo.ScheduleVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {
	
	Logger logger = LogManager.getLogger(ScheduleController.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession; 

	@Override
	public int schedulInsert(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.schedulInsert >>>");
		return sqlSession.insert("schedulInsert", svo);
	}
	
	@Override
	public List<ScheduleVO> scheduleBoardSelectAll(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.scheduleBoardSelectAll >>>");
		return sqlSession.selectList("scheduleBoardSelectAll");
	}

	@Override
	public List<ScheduleVO> sheduleBoardSelect(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.sheduleBoardSelect >>>");
		return sqlSession.selectList("sheduleBoardSelect");
	}

	@Override
	public List<ScheduleVO> sheduleBoardSerch(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.sheduleBoardSerch >>>");
		return sqlSession.selectList("sheduleBoardSerch");
	}

	@Override
	public int sheduleBoardInsert(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.sheduleBoardInsert >>>");
		return sqlSession.insert("sheduleBoardInsert", svo);
	}

	@Override
	public List<ScheduleMEMVO> sheduleMemSerch(ScheduleMEMVO smvo) {
		logger.info("ScheduleDAOImpl.sheduleMemSerch >>>");
		return sqlSession.selectList("sheduleMemSerch");
	}

	@Override
	public int sheduleShareInsert(ScheduleShareVO svo) {
		logger.info("ScheduleDAOImpl.sheduleShareInsert >>>");
		return sqlSession.insert("sheduleShareInsert");
	}

	@Override
	public List<ScheduleVO> scheduleMain01(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.scheduleMain01 >>>");
		return sqlSession.selectList("scheduleMain01");
	}

	@Override
	public List<ScheduleVO> scheduleMain02(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.scheduleMain02 >>>");
		return sqlSession.selectList("scheduleMain02");
	}

	@Override
	public List<ScheduleVO> scheduleMain03(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.scheduleMain03 >>>");
		return sqlSession.selectList("scheduleMain03");
	}

	@Override
	public List<ScheduleVO> scheduleMain12(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.scheduleMain12 >>>");
		return sqlSession.selectList("scheduleMain12");
	}

	@Override
	public List<ScheduleVO> scheduleMain13(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.scheduleMain13 >>>");
		return sqlSession.selectList("scheduleMain13");
	}

	@Override
	public List<ScheduleVO> scheduleMain23(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.scheduleMain23 >>>");
		return sqlSession.selectList("scheduleMain23");
	}

	@Override
	public int sheduleBoardUpdate(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.sheduleBoardUpdate >>>");
		return sqlSession.update("sheduleBoardUpdate", svo);
	}

	@Override
	public int sheduleShareUpdate(ScheduleShareVO ssvo) {
		logger.info("ScheduleDAOImpl.sheduleShareUpdate >>>");
		return sqlSession.update("sheduleShareUpdate", ssvo);
	}

	@Override
	public List<ScheduleShareVO> sheduleShareSelect(ScheduleShareVO ssvo) {
		logger.info("ScheduleDAOImpl.sheduleShareSelect >>>");
		return sqlSession.selectList("sheduleShareSelect");
	}

	@Override
	public int scheduledDelete(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.scheduledDelete >>>");
		return sqlSession.update("scheduledDelete", svo);
	}

	@Override
	public int scheduledUpdateStatus(ScheduleVO svo) {
		logger.info("ScheduleDAOImpl.scheduledUpdateStatus >>>");
		return sqlSession.update("scheduledUpdateStatus", svo);
	}
	

}
