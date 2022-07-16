package main.puvg.board_booseo.dao;

import main.puvg.board_booseo.vo.BoardVO;
import java.util.List;

public interface BoardDAO {
	
	public int BoardInsert(BoardVO vbvo);
	
	public List<BoardVO> BoardSelectAll(BoardVO vbvo);
	
	public List<BoardVO> BoardSelect(BoardVO vbvo);
	
	public int BoardUpdate(BoardVO vbvo);
	
	public int BoardDelete(BoardVO vbvo);

}
