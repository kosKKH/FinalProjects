package main.puvg.rpboard.dao;

import java.util.List;

import main.puvg.rpboard.vo.RpBoardVO;

public interface RpBoardDAO {
	
	public int RpBoardInsert(RpBoardVO rbvo);
	
	public List<RpBoardVO> RpBoardSelectAll(RpBoardVO rbvo);
	
	public int RpBoardDelete(RpBoardVO rbvo);
}
