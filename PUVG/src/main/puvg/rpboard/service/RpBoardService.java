package main.puvg.rpboard.service;

import java.util.List;

import main.puvg.rpboard.vo.RpBoardVO;

public interface RpBoardService {

	public int RpBoardInsert(RpBoardVO rbvo);
	
	public List<RpBoardVO> RpBoardSelectAll(RpBoardVO rbvo);
	
	public int RpBoardDelete(RpBoardVO rbvo);
}
