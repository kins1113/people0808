package com.ez.peoplejob.resumeManager.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.hopecompany.model.HopeWorkingVO;
import com.ez.peoplejob.resume.model.CareerVO;
import com.ez.peoplejob.resume.model.CertificateVO;
import com.ez.peoplejob.resume.model.EducationVO;
import com.ez.peoplejob.resume.model.LangCertificationVO;
import com.ez.peoplejob.resume.model.ResumeManagerVO;

@Repository
public class ResumeManagerMybatis implements ResumeManagerDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.resumeManager.";
	@Override
	public int insertHopeWorkingMN(HopeWorkingVO hopeVO) {
		return sqlSession.insert(namespace+"insertHopeWorkingMN",hopeVO);
	}

	@Override
	public int insertCertificateMN(CertificateVO ceritificateVo) {
		return sqlSession.insert(namespace+"insertCertificateMN",ceritificateVo);
	}

	@Override
	public int insertEducationMN(EducationVO educationVo) {
		return sqlSession.insert(namespace+"insertEducationMN",educationVo);
	}

	@Override
	public int insertLangcertificationMN(LangCertificationVO langVo) {
		return sqlSession.insert(namespace+"insertLangcertificationMN",langVo);
	}

	@Override
	public int insertCareerMN(CareerVO careerVO) {
		return sqlSession.insert(namespace+"insertCareerMN",careerVO);
	}

	@Override
	public int insertResumeMN(ResumeManagerVO resumeVo) {
		return sqlSession.insert(namespace+"insertResumeMN",resumeVo);
	}

	@Override
	public List<Map<String, Object>> selectResumeManage(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectResumeManage", map);
	}

	@Override
	public int getTotalCountManager(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getTotalCountManager",map);
	}

}
