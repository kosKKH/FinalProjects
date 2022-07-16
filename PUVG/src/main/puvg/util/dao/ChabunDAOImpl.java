package main.puvg.util.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.puvg.approval.vo.Appr1DocVO;
import main.puvg.approval.vo.ApprovalTempVO;
import main.puvg.board_booseo.vo.BoardVO;
import main.puvg.member.vo.MemberVO;
import main.puvg.rpboard.vo.RpBoardVO;
import main.puvg.schedule.vo.ScheduleVO;

@Repository
public class ChabunDAOImpl implements ChabunDAO {
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	public MemberVO getMemberChabun() {
		return sqlSession.selectOne("getMemberChabun");
	}

	@Override
	public Appr1DocVO getApprovalChabun() {
		return sqlSession.selectOne("getApprovalChabun");
	}

	@Override
	public ApprovalTempVO getApprovalTempChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getApprovalTempChabun");
	}
	
	@Override
	public ScheduleVO getScheduleChabun() {
		return sqlSession.selectOne("getScheduleChabun");
	}
	
	@Override
	public BoardVO BoardChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BoardChabun");
	}
	
	@Override
	public RpBoardVO RpBoardChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RpBoardChabun");
	}
}