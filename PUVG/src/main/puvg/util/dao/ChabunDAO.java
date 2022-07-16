package main.puvg.util.dao;

import main.puvg.approval.vo.Appr1DocVO;
import main.puvg.approval.vo.ApprovalTempVO;
import main.puvg.board_booseo.vo.BoardVO;
import main.puvg.member.vo.MemberVO;
import main.puvg.rpboard.vo.RpBoardVO;
import main.puvg.schedule.vo.ScheduleVO;

public interface ChabunDAO {
	public MemberVO getMemberChabun();
	public Appr1DocVO getApprovalChabun();
	public ApprovalTempVO getApprovalTempChabun();
	public ScheduleVO getScheduleChabun();
	public BoardVO BoardChabun();
	public RpBoardVO RpBoardChabun();
}
