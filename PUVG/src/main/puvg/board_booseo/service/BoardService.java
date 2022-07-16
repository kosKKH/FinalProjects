package main.puvg.board_booseo.service;

import java.util.List;
import main.puvg.board_booseo.vo.BoardVO;

public interface BoardService {
	
	public int BoardInsert(BoardVO vbvo);
	
	public List<BoardVO> BoardSelectAll(BoardVO vbvo);
	
	public List<BoardVO> BoardSelect(BoardVO vbvo);

	public int BoardUpdate(BoardVO vbvo);
	
	public int BoardDelete(BoardVO vbvo);
}
