package com.ez.peoplejob.payment.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.common.SearchVO;

public interface PaymentService {
	
	int insertPayment(PaymentVO paymentVO);
	
	List<Map<String, Object>> selectPaymentById(String memberid);
	int cancelPay(String paydate);
	PaymentVO selectPaymentByCode(int paymentCode);
	List<Map<String , Object>> selectMainAdvertiseByServiceCode(int serviceCode);
	int getpaymentJobCount(PaymentVO paymentVo);
	int getCountByJobopening(int jobno);
	List<Map<String, Object>> selectPayByTime(String memberid);
	/*public List<PaymentVO> selectAll();*/
	
	  public List<Map<String, Object>> selectAll(Map<String, Object> map); 
	  int selectTotalCount(SearchVO searchVo);
	  List<Map<String, Object>> selectBySameTime(String paydate, int memberCode);
	  
	  public int updateProgress(Map<String, Object> map );
	  public List<Map<String, Object>> selectProgress(Map<String, Object> map);

}
