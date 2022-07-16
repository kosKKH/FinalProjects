package main.puvg.board_booseo.dao;

import main.puvg.board_booseo.vo.BoardVO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	Logger logger = LogManager.getLogger(BoardDAOImpl.class);

	@Autowired(required=false)
	private SqlSession sqlSession;
	
	
	//insert
	@Override
	public int BoardInsert(BoardVO vbvo) {
		// TODO Auto-generated method stub
		logger.info("BoardDAOImpl BoardInsert 진입 >>> : ");	
		return (Integer)sqlSession.insert("BoardInsert", vbvo);
	}

	//SelectAll
	@Override
	public List<BoardVO> BoardSelectAll(BoardVO vbvo) {
		// TODO Auto-generated method stub
		logger.info("BoardDAOImpl BoardSelectAll 진입 >>> : ");
		return sqlSession.selectList("BoardSelectAll", vbvo);
	}
	
	//Select
	@Override
	public List<BoardVO> BoardSelect(BoardVO vbvo) {
		// TODO Auto-generated method stub
		logger.info("BoardDAOImpl BoardSelect 진입 >>> : ");
		return sqlSession.selectList("BoardSelect", vbvo);
	}

	//UPDATE
	@Override
	public int BoardUpdate(BoardVO vbvo) {
		// TODO Auto-generated method stub
		logger.info("BoardDAOImpl BoardUpdate 진입 >>> : ");
		return sqlSession.update("BoardUpdate", vbvo);
	}

	//DELETE
	@Override
	public int BoardDelete(BoardVO vbvo) {
		// TODO Auto-generated method stub
		logger.info("BoardDAOImpl BoardDelete 진입 >>> : ");
		return sqlSession.update("BoardDelete", vbvo);
	}

}
