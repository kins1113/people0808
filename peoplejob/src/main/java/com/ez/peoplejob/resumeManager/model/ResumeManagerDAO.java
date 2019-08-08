package com.ez.peoplejob.resumeManager.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.hopecompany.model.HopeWorkingVO;
import com.ez.peoplejob.resume.model.CareerVO;
import com.ez.peoplejob.resume.model.CertificateVO;
import com.ez.peoplejob.resume.model.EducationVO;
import com.ez.peoplejob.resume.model.LangCertificationVO;
import com.ez.peoplejob.resume.model.ResumeManagerVO;

public interface ResumeManagerDAO {

	public int insertHopeWorkingMN (HopeWorkingVO hopeVO);		//희망 근무 -이것만 필수
	public int insertCertificateMN (CertificateVO ceritificateVo);			//자격증
	public int insertEducationMN (EducationVO educationVo);					//학력
	public int insertLangcertificationMN (LangCertificationVO langVo);	//언어자격증
	public int insertCareerMN (CareerVO careerVO);							//경력
	public int insertResumeMN (ResumeManagerVO resumeVo);					//이력서
	List<Map<String, Object>>selectResumeManage(Map<String, Object>map);
	int getTotalCountManager(Map<String, Object>map);
}
