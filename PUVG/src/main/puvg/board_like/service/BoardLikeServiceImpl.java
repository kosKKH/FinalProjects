package main.puvg.board_like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import main.puvg.board_like.dao.BoardLikeDAO;
import main.puvg.board_like.vo.BoardLikeVO;

@Service
@Transactional
public class BoardLikeServiceImpl implements BoardLikeService {
	Logger logger = LogManager.getLogger(BoardLikeServiceImpl.class);
	
	@Autowired(required=false)	
	private BoardLikeDAO boardLikeDAO;
	
	@Override
	public int BoardLikeUpdate_1(BoardLikeVO vblvo) {
		// TODO Auto-generated method stub
		logger.info("BoardLikeServiceImpl BoardLikeUpdate_1 함수 진입 >>> : ");			
		return boardLikeDAO.BoardLikeUpdate_1(vblvo);
	}

	@Override
	public int BoardLikeUpdate_2(BoardLikeVO vblvo) {
		// TODO Auto-generated method stub
		logger.info("BoardLikeServiceImpl BoardLikeUpdate_2 함수 진입 >>> : ");			
		return boardLikeDAO.BoardLikeUpdate_2(vblvo);
	}
	//-----------------------------------------
	
	//INSERT
	@Override
	public int BoardLikeInsert(BoardLikeVO vblvo) {
		// TODO Auto-generated method stub
		logger.info("BoardLikeServiceImpl BoardLikeInsert 함수 진입 >>> : ");			
		return boardLikeDAO.BoardLikeInsert(vblvo);
	}
	
	//SELECT
	@Override
	public List<BoardLikeVO> BoardLikeSelect(BoardLikeVO vblvo) {
		// TODO Auto-generated method stub
		logger.info("BoardLikeServiceImpl BoardLikeInsert 함수 진입 >>> : ");			
		return boardLikeDAO.BoardLikeSelect(vblvo);
	}

	//SELECTALL
	@Override
	public List<BoardLikeVO> BoardLikeSelectAll(BoardLikeVO vblvo) {
		// TODO Auto-generated method stub
		logger.info("BoardLikeServiceImpl BoardLikeInsert 함수 진입 >>> : ");			
		return boardLikeDAO.BoardLikeSelectAll(vblvo);
	}
	
	

}
