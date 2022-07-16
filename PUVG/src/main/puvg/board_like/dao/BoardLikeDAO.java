package main.puvg.board_like.dao;

import java.util.List;

import main.puvg.board_like.vo.BoardLikeVO;

public interface BoardLikeDAO {

	public int BoardLikeUpdate_1(BoardLikeVO vblvo);
	public int BoardLikeUpdate_2(BoardLikeVO vblvo);
	
	public int BoardLikeInsert(BoardLikeVO vblvo);
	public List<BoardLikeVO> BoardLikeSelect(BoardLikeVO vblvo);
	public List<BoardLikeVO> BoardLikeSelectAll(BoardLikeVO vblvo);
}
