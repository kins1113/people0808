package com.ez.peoplejob.board.model;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
	public int insetBoard(BoardVO vo);
	List<BoardVO> selectBoardSerch(Map<String , String> map);
	int boardUpdate(Map<String, Object> map);
	int deleteMultDelete(Map<String, int[]> map);
	public List<BoardVO> selectByCodeVariable(Map<String, int[]> map);
	int boardEdit(BoardVO boardVo);
	public List<BoardVO> getBoardList();
	public BoardVO selectByBoardCode(int boardCode);
	
	List<BoardVO> selectByUsage();
	
}
