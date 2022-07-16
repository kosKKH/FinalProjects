package main.puvg.rpboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import main.puvg.rpboard.vo.RpBoardVO;

@Repository
public class RpBoardDAOImpl implements RpBoardDAO {
	Logger logger = LogManager.getLogger(RpBoardDAOImpl.class);

	@Autowired(required=false)
	private SqlSession sqlSession;
	
	
	//INSERT
	@Override
	public int RpBoardInsert(RpBoardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("rpBoardDAOImpl rpBaordInsert 함수 진입 >>> : ");	
		return (Integer)sqlSession.insert("RpBoardInsert", rbvo);
	}

	//SELECTALL
	@Override
	public List<RpBoardVO> RpBoardSelectAll(RpBoardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("rpBoardDAOImpl RpBoardSelectAll 함수 진입 >>> : ");
		return sqlSession.selectList("RpBoardSelectAll", rbvo);
	}

	//DELETE
	@Override
	public int RpBoardDelete(RpBoardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("rpBoardDAOImpl RpBoardDelete 함수 진입 >>> : ");
		return (Integer)sqlSession.update("RpBoardDelete", rbvo);
	}

}
