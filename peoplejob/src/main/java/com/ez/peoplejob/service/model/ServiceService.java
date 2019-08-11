package com.ez.peoplejob.service.model;

import java.util.List;
import java.util.Map;

public interface ServiceService {
	public int insertService(ServiceVO vo);
	public List<ServiceVO> selectAll();
	public int deleteService(String[] list);
	public ServiceVO selectServiceByCode(int serviceCode);
	public int updateService(ServiceVO vo);
	public List<Map<String, Object>> selectServPayAll();
}
