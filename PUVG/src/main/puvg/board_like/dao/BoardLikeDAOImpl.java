package main.puvg.board_like.dao;

import main.puvg.board_like.vo.BoardLikeVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardLikeDAOImpl implements BoardLikeDAO {
	Logger logger = LogManager.getLogger(BoardLikeDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public int BoardLikeUpdate_1(BoardLikeVO vblvo) {
		// TODO Auto-generated method stub
		logger.info("BoardLikeDAOImpl BoardLikeUpdate_1  함수 진입 >>> : ");			
		return (Integer)sqlSession.update("BoardLikeUpdate_1", vblvo);
	}

	@Override
	public int BoardLikeUpdate_2(BoardLikeVO vblvo) {
		// TODO Auto-generated method stub
		logger.info("BoardLikeDAOImpl BoardLikeUpdate_2  함수 진입 >>> : ");	
		return (Integer)sqlSession.update("BoardLikeUpdate_2", vblvo);
	}
	
	//--------------------------------------------------
	
	//INSERT
	@Override
	public int BoardLikeInsert(BoardLikeVO vblvo) {
		// TODO Auto-generated method stub
		logger.info("BoardLikeDAOImpl BoardLikeInsert  함수 진입 >>> : ");	
		return (Integer)sqlSession.insert("BoardLikeInsert", vblvo);
	}

	
	//SELECT
	@Override
	public List<BoardLikeVO> BoardLikeSelect(BoardLikeVO vblvo) {
		// TODO Auto-generated method stub
		logger.info("BoardLikeDAOImpl BoardLikeSelect  함수 진입 >>> : ");	
		return sqlSession.selectList("BoardLikeSelect", vblvo);
	}

	@Override
	public List<BoardLikeVO> BoardLikeSelectAll(BoardLikeVO vblvo) {
		// TODO Auto-generated method stub
		logger.info("BoardLikeDAOImpl BoardLikeSelectAll  함수 진입 >>> : ");	
		return sqlSession.selectList("BoardLikeSelectAll", vblvo);
	}
}

