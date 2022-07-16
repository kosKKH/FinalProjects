package main.puvg.board_booseo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import main.puvg.board_booseo.dao.BoardDAO;
import main.puvg.board_booseo.vo.BoardVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	Logger logger = LogManager.getLogger(BoardServiceImpl.class);
	
	@Autowired(required=false)
	private BoardDAO boardDAO;
	
	//insert
	@Override
	public int BoardInsert(BoardVO vbvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl BoardInsert 진입 >>> : ");
		return boardDAO.BoardInsert(vbvo);
	}

	
	//SelectAll
	@Override
	public List<BoardVO> BoardSelectAll(BoardVO vbvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl BoardSelectAll 진입 >>> : ");
		return boardDAO.BoardSelectAll(vbvo);
	}

	//SELECT
	@Override
	public List<BoardVO> BoardSelect(BoardVO vbvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl BoardSelect 진입 >>> : ");
		return boardDAO.BoardSelect(vbvo);
	}

	//UPDATE
	@Override
	public int BoardUpdate(BoardVO vbvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl BoardUpdate 진입 >>> : ");
		return boardDAO.BoardUpdate(vbvo);
	}

	//DELETE
	@Override
	public int BoardDelete(BoardVO vbvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl BoardDelete 진입 >>> : ");
		return boardDAO.BoardDelete(vbvo);
	}
	

	

}
