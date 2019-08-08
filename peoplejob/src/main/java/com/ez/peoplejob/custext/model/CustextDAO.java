package com.ez.peoplejob.custext.model;

import java.util.List;
import java.util.Map;

public interface CustextDAO {
	int insertCustext(CustextVO vo);
	int ReinsertCustext(CustextVO vo);
	List<CustextVO> mycustext(Map<String,Object> map);
	CustextVO CustextView(int custextCode);
	int Editcustext(CustextVO vo);
	int Delcustext(int custextCode);
	
	List<Map<String, Object>> selectCustextManager(Map<String, Object>map);
	int updateCustextManager(CustextVO vo);
	int getTotalrecordManager(Map<String, Object>map);
}
