package com.ez.peoplejob.service.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceServiceImpl implements ServiceService  {
	@Autowired
	private ServiceDAO serviceDao;
	@Override
	public int insertService(ServiceVO vo) {
		return serviceDao.insertService(vo);
	}
	@Override
	public List<ServiceVO> selectAll() {
		return serviceDao.selectAll();
	}
	@Override
	public int deleteService(String[] list) {
		int count=0;
		try {
			for(String s:list) {
				int cnt=0;
				cnt=serviceDao.deleteService(Integer.parseInt(s));
				count+=cnt;
			}
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public ServiceVO selectServiceByCode(int serviceCode) {
		return serviceDao.selectServiceByCode(serviceCode);
	}
	@Override
	public int updateService(ServiceVO vo) {
		return serviceDao.updateService(vo);
	}
	@Override
	public List<Map<String, Object>> selectServPayAll() {
		return serviceDao.selectServPayAll();
	}

	
}
