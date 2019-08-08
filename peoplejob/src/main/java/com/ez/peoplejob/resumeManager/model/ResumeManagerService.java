package com.ez.peoplejob.resumeManager.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.hopecompany.model.HopeWorkingVO;
import com.ez.peoplejob.resume.model.CareerVO;
import com.ez.peoplejob.resume.model.CertificateVO;
import com.ez.peoplejob.resume.model.EducationVO;
import com.ez.peoplejob.resume.model.LangCertificationVO;
import com.ez.peoplejob.resume.model.ResumeManagerVO;

public interface ResumeManagerService {

	public int insertResumeMN (HopeWorkingVO hopeVo, CertificateVO ceritificateVo, EducationVO educationVo,
			LangCertificationVO langVo, CareerVO careerVo ,ResumeManagerVO resumeVo);					//이력서
	
	List<Map<String, Object>>selectResumeManage(Map<String, Object>map);
	int getTotalCountManager(Map<String, Object>map);
}
