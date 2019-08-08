package com.ez.peoplejob.resume.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.hopecompany.model.HopeWorkingVO;
import com.ez.peoplejob.resume.model.CareerVO;
import com.ez.peoplejob.resume.model.CertificateVO;
import com.ez.peoplejob.resume.model.EducationVO;
import com.ez.peoplejob.resume.model.LangCertificationVO;
import com.ez.peoplejob.resume.model.ResumeManagerVO;
import com.ez.peoplejob.resumeManager.model.ResumeManagerService;

@Controller
@RequestMapping("/manager/resume")
public class ResumeManagerController {

	private Logger logger=LoggerFactory.getLogger(ResumeManagerController.class);
	@Autowired
	private ResumeManagerService resumeServiceMN;
	
	@RequestMapping("/resumeList.do")
	public String resumeList_get( @RequestParam(defaultValue = "1") int currentPage,
				     @RequestParam(defaultValue = "1") int recordCountPerPage,
				     @RequestParam(required = false, defaultValue = "") String searchStartDay,
				     @RequestParam(required = false, defaultValue = "") String searchEndDay,
				     @RequestParam(required = false, defaultValue = "") String searchKeyword,
				     @RequestParam(required = false, defaultValue = "") String searchCondition,
				     @RequestParam(required = false, defaultValue = "N") String detailCk,
				     @ModelAttribute HopeWorkingVO hopworkingVo,
				     @RequestParam(required = false)int[] ages,
				     @RequestParam(required = false)String[] gender,
				     @RequestParam(required = false)String[] currer,
				     @RequestParam(required = false)String[] academic,
				Model model) {
		logger.info("이력서 관리 보여주기 ");
		logger.info("이력서 관리 파라미터 searchStartDay={}, searchEndDay={}", searchStartDay, searchEndDay);
		logger.info("이력서 관리 파라미터 detailCk={}",detailCk);
		logger.info("이력서 관리 파라미터 searchKeyword={}, searchCondition={}",searchKeyword,searchCondition);
		logger.info("이력서 관리 파라미터 hopworkingVo={}",hopworkingVo);
		logger.info("이력서 관리 파라미터 ages={}, gender={}",ages,gender);
		logger.info("이력서 관리 파라미터 currer={}, academic={}",currer,academic);
		
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(5);
		pagingInfo.setCurrentPage(currentPage);
		//밖에서 들어올때는 10개를 기본값으로 
		if(recordCountPerPage==1) {
			pagingInfo.setRecordCountPerPage(10);
		}else {
			pagingInfo.setRecordCountPerPage(recordCountPerPage);
		}
		logger.info("currentPage={}",currentPage);
		logger.info("pagingInfo.getRecordCountPerPage()={}",pagingInfo.getRecordCountPerPage());
		logger.info("pagingInfo.getFirstRecordIndex()={}",pagingInfo.getFirstRecordIndex());
		
		//맵에 저장
		Map<String, Object>map =new HashMap<String, Object>();
		map.put("recordCountPerPage",pagingInfo.getRecordCountPerPage());
		map.put("firstRecordIndex",pagingInfo.getFirstRecordIndex());
		
		map.put("searchStartDay", searchStartDay);
		map.put("searchEndDay", searchEndDay);
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition", searchCondition);
		map.put("detailCk", detailCk);
		map.put("hopworkingVo", hopworkingVo);
		map.put("ages", ages);
		map.put("gender", gender);
		map.put("currer", currer);
		map.put("academic", academic);
		
		List<Map<String, Object>>list=resumeServiceMN.selectResumeManage(map);
		
		//total count
		int totalRecord = resumeServiceMN.getTotalCountManager(map);
		logger.info("토탈 레코드 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
		return "manager/resume/resumeList";
	}
	
	@RequestMapping(value="/resumeAdd.do",method = RequestMethod.GET)
	public String resumeAdd_get() {
		logger.info("이력서 추가 화면 보여주기");
		return "manager/resume/resumeAdd";
	}
	
	@RequestMapping(value="/resumeAdd.do",method = RequestMethod.POST)
	public String resumeAdd_post(@ModelAttribute ResumeManagerVO	 resumeMaVo, 
								 @ModelAttribute HopeWorkingVO hopeVo,
								 @ModelAttribute CertificateVO certificateVO, 
							 	 @ModelAttribute EducationVO educationVo,
						  		 @ModelAttribute LangCertificationVO langVo,
								 @ModelAttribute CareerVO careerVo,
								 
								 @RequestParam(required = false) int[] localCode,
								 @RequestParam(required = false) int[] thirdCode) {
	
		String lCode="";
		for(int i=0;i<localCode.length;i++) {
			if(i<localCode.length) {
				 lCode+=localCode[i]+",";
			}else {
				lCode+=localCode[i];
			}
			//logger.info(i+", localCode[]={}"+localCode[i]);
		}
		logger.info("lCode={}",lCode);
		hopeVo.setLocalCode(lCode);
		
		String tCode="";
		for(int i=0;i<thirdCode.length;i++) {
			if(i<thirdCode.length) {
				tCode+=thirdCode[i]+",";
			}else {
				tCode+=thirdCode[i];
			}
			//logger.info(i+", thirdCode[]={}"+thirdCode[i]);
		}
		logger.info("tCode={}",tCode);
		hopeVo.setThirdCode(tCode);
		
		logger.info("이력서 추가 처리 파라미터 \n\nresumeMaVo={} \n\n hopeVo={}\n\n",resumeMaVo,hopeVo);
		logger.info("파라미터 certificateVO={} \n\neducationVo={} \n\n",certificateVO,educationVo);
		logger.info("파라미터 langVo={} \n\n careerVo={} \n\n",langVo,careerVo);
		
		
		int re=resumeServiceMN.insertResumeMN(hopeVo, certificateVO, educationVo, langVo, careerVo, resumeMaVo);
		logger.info("이력서 등록 결과 re={}",re);
		
		return "manager/resume/resumeList";
	}
}
