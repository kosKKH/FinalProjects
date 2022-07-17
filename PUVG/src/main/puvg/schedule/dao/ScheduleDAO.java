package main.puvg.schedule.dao;

import java.util.List;

import main.puvg.schedule.vo.ScheduleMEMVO;
import main.puvg.schedule.vo.ScheduleShareVO;
import main.puvg.schedule.vo.ScheduleVO;


public interface ScheduleDAO {
	
	public int schedulInsert(ScheduleVO svo);
	public List<ScheduleVO> scheduleBoardSelectAll(ScheduleVO svo);
	public List<ScheduleVO> scheduleMain01(ScheduleVO svo);
	public List<ScheduleVO> scheduleMain02(ScheduleVO svo);
	public List<ScheduleVO> scheduleMain03(ScheduleVO svo);
	public List<ScheduleVO> scheduleMain12(ScheduleVO svo);
	public List<ScheduleVO> scheduleMain13(ScheduleVO svo);
	public List<ScheduleVO> scheduleMain23(ScheduleVO svo);
	
	public List<ScheduleVO> sheduleBoardSelect(ScheduleVO svo);
	public List<ScheduleVO> sheduleBoardSerch(ScheduleVO svo);

	public int sheduleBoardInsert(ScheduleVO svo);
	public int sheduleShareInsert(ScheduleShareVO svo);
	public List<ScheduleShareVO> sheduleShareSelect(ScheduleShareVO ssvo);
	
	public List<ScheduleMEMVO> sheduleMemSerch(ScheduleMEMVO smvo);
	
	
	public int sheduleBoardUpdate(ScheduleVO svo);
	public int sheduleShareUpdate(ScheduleShareVO ssvo);
	
	public int scheduledDelete(ScheduleVO svo);
	
	public int scheduledUpdateStatus(ScheduleVO svo);
	
	
	
}
