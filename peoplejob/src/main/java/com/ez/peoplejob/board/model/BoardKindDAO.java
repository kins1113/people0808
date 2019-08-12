package com.ez.peoplejob.board.model;

import java.util.List;

public interface BoardKindDAO {
	public int insertBKind(BoardKindVO boardKindVO);
	public List<BoardKindVO> selectBKind();
	int deleteBKind(int code);
	int changUsage (BoardKindVO vo);
	String selectByTypeCode(int typeCode );
}
