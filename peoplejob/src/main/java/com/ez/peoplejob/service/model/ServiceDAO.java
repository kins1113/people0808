package com.ez.peoplejob.service.model;

import java.util.List;
import java.util.Map;

public interface ServiceDAO {
	public int insertService(ServiceVO vo);
	public List<ServiceVO> selectAll();
	public int deleteService(int serviceCode);
	public ServiceVO selectServiceByCode(int serviceCode);
	public int updateService(ServiceVO vo);
	public List<Map<String, Object>> selectServPayAll();
}
