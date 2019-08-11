package com.ez.peoplejob.post.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.board.model.BoardVO;
import com.ez.peoplejob.post_cmt.model.PostCmtVO;

public interface PostService {
	List<Map<String, Object>> selectPostAll(PostVO postVO);
	int gettotalRecord(PostVO postVo);
	int updateDelete(Map<String, int[]> map);
	int changeDelete(Map<String, Object> map);
	int insertPosToManager(PostVO postVo);
	
	List<Map<String, Object>> selectByboardCode(int boardCode);
	List<Map<String, Object>> selectByboardCode2(int boardCode2);
	int postcountUpdate(int boardCode2);
	int insertPost(PostVO postVo);
	
	int selectTotalCount(PostVO postVO);
	List<Map<String, Object>> selectAll(PostVO postVO);
	
	int updatereport(PostVO postVo);
	PostVO selectOneByBoardCode2(int boardCode2);
	int updatePost(PostVO postVo);
	BoardVO selectBoardByboardCode2(int boardCode2);
	int deletePost(int boardCode2);
	PostVO selectByPostByadmin(int boardCode2);
	List<Map<String, Object>> selectPostBymemId(PostVO postVo);
	int selectTotalCountBymemId(PostVO postVo);
	int selectmypostcount(int memberCode);
	PostVO selectPostbyCommentCode(int commentCode);
	
	//댓글
	int insertcmt(PostCmtVO postcmtVo);
	List<Map<String, Object>> selectCmt(int boardCode2);
	int updatecmt(PostCmtVO postcmtVo);
	int deletecmt(int commentCode);
}
