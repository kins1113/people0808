package com.ez.peoplejob.service.model;

import java.util.List;

public interface ServiceService {
	public int insertService(ServiceVO vo);
	public List<ServiceVO> selectAll();
	public int deleteService(String[] list);
	public ServiceVO selectServiceByCode(int serviceCode);
	public int updateService(ServiceVO vo);
}
