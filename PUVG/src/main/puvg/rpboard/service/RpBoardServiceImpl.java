package main.puvg.rpboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import main.puvg.rpboard.dao.RpBoardDAO;
import main.puvg.rpboard.vo.RpBoardVO;

@Service
@Transactional
public class RpBoardServiceImpl implements RpBoardService {
	Logger logger = LogManager.getLogger(RpBoardServiceImpl.class);
	
	@Autowired(required=false)
	private RpBoardDAO rpBoardDAO;
	
	//INSERT
	@Override
	public int RpBoardInsert(RpBoardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("rpBoardServiceImpl rpBaordInsert 함수 진입 >>> : ");
		return rpBoardDAO.RpBoardInsert(rbvo);
	}

	@Override
	public List<RpBoardVO> RpBoardSelectAll(RpBoardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("rpBoardServiceImpl RpBoardSelectAll 함수 진입 >>> : ");
		return rpBoardDAO.RpBoardSelectAll(rbvo);
	}

	@Override
	public int RpBoardDelete(RpBoardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("rpBoardServiceImpl RpBoardDelete 함수 진입 >>> : ");
		return rpBoardDAO.RpBoardDelete(rbvo);
	}

}
