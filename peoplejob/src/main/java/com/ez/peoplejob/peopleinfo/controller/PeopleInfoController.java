package com.ez.peoplejob.peopleinfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.xmlbeans.impl.xb.xsdschema.LengthDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.hopecompany.model.HopeWorkingVO;
import com.ez.peoplejob.peopleinfo.model.PeopleInfoService;
import com.ez.peoplejob.resume.model.ResumeService;
import com.ez.peoplejob.resume.model.ResumeVO;
import com.ez.peoplejob.resumeManager.model.ResumeManagerService;

@Controller
@RequestMapping("/peopleinfo")
public class PeopleInfoController {

   private Logger logger=LoggerFactory.getLogger(PeopleInfoController.class);
   @Autowired
   private ResumeService resumeService;
   @Autowired
   private PeopleInfoService peopleinfoService;


   
  
	
	@RequestMapping("/peopleinfolist.do")
	public String peopleinfolist( @RequestParam(defaultValue = "1") int currentPage,
				     @RequestParam(defaultValue = "1") int recordCountPerPage,
				     @RequestParam(required = false, defaultValue = "") String searchStartDay,
				     @RequestParam(required = false, defaultValue = "") String searchEndDay,
				     @RequestParam(required = false, defaultValue = "") String searchKeyword,
				     @RequestParam(required = false, defaultValue = "") String searchCondition,
				     @RequestParam(required = false, defaultValue = "N") String detailCk,
				     @ModelAttribute HopeWorkingVO hopeworkingVo,
				     @RequestParam(required = false)int[] ages,
				     @RequestParam(required = false)String[] gender,
				     @RequestParam(required = false)String[] currer,
				     @RequestParam(required = false)String[] academic,
				Model model) {
		logger.info("이력서 관리 보여주기 ");
		logger.info("이력서 관리 파라미터 searchStartDay={}, searchEndDay={}", searchStartDay, searchEndDay);
		logger.info("이력서 관리 파라미터 searchKeyword={}, searchCondition={}",searchKeyword,searchCondition);
		
		logger.info("이력서 관리 파라미터 detailCk={}",detailCk);
		logger.info("이력서 관리 파라미터 hopeworkingVo={}",hopeworkingVo);
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
		
		map.put("hopeworkingVo", hopeworkingVo);
		map.put("ages", ages);
		map.put("gender", gender);
		map.put("currer", currer);
		map.put("academic", academic);
		
		List<Map<String, Object>>list=peopleinfoService.selectPeoplew(map);
		
		//total count
		int totalRecord = peopleinfoService.selectTotalCountPeople(map);
		logger.info("토탈 레코드 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
		return "peopleinfo/peopleinfolist";
	}
	/*
	 * @RequestMapping("/peopleinfolist.do") public String peopleinfolist(
	 * HttpSession session,@RequestParam(required = false,defaultValue = "")
	 * String[] membergender,
	 * 
	 * @ModelAttribute SearchVO searchVo,Model model,@RequestParam(required =
	 * false,defaultValue = "") String[] term,
	 * 
	 * @RequestParam(required = false,defaultValue = "") String[]
	 * workcheck,@RequestParam(required = false,defaultValue = "") String[] age,
	 * 
	 * @RequestParam(required = false,defaultValue = "") String[]
	 * graduatetype,@RequestParam(required = false,defaultValue = "0") int[]
	 * localCode,
	 * 
	 * @RequestParam(required = false,defaultValue = "0") int[]
	 * localCode2,@RequestParam(required = false,defaultValue = "0") int[]
	 * btypeCode1 ,
	 * 
	 * @RequestParam(required = false,defaultValue = "0") int[]
	 * btypeCode2,@RequestParam(required = false,defaultValue = "0") int[]
	 * btypeCode3,
	 * 
	 * @RequestParam(required = false,defaultValue = "0") int[] firstCode,
	 * 
	 * @RequestParam(required = false,defaultValue = "0") int[]
	 * secondCode,@RequestParam(required = false,defaultValue = "0") int[]
	 * thirdCode) {
	 * 
	 * logger.info("workcheck={}",workcheck);
	 * logger.info("membergender={}",membergender); logger.info("term={}",term);
	 * logger.info("age={}",age); logger.info("graduatetype={}",graduatetype);
	 * logger.info("localCode={}",localCode);
	 * logger.info("localCode2={}",localCode2);
	 * logger.info("btypeCode1={}",btypeCode1);
	 * logger.info("btypeCode2={}",btypeCode2);
	 * logger.info("btypeCode3={}",btypeCode3);
	 * logger.info("firstCode={}",firstCode);
	 * logger.info("secondCode={}",secondCode);
	 * logger.info("thirdCode={}",thirdCode);
	 * 
	 * String id=(String)session.getAttribute("memberid"); if(id==null) { id="비회원";
	 * } ResumeVO vo1=resumeService.selectByMemverid(id);
	 * logger.info("로그인 vo={}",vo1); logger.info("인재정보 리스트"); //1]PaginationInfo 객체
	 * 생성 PaginationInfo pagingInfo=new PaginationInfo();
	 * pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
	 * pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
	 * pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	 * 
	 * //2]SearchVo에 페이징 관련 변수 세팅
	 * searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
	 * searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	 * logger.info("셋팅 후 serchVo={}",searchVo);
	 * 
	 * List<ResumeVO> list=new ArrayList<ResumeVO>(); Map<String, Object> map= new
	 * HashMap<String, Object>();
	 * 
	 * map.put("workcheck",workcheck); map.put("membergender",membergender);
	 * map.put("term",term); map.put("age",age);
	 * map.put("graduatetype",graduatetype); map.put("localCode",localCode);
	 * map.put("localCode2",localCode2); map.put("btypeCode1",btypeCode1);
	 * map.put("btypeCode2",btypeCode2); map.put("btypeCode3",btypeCode3);
	 * map.put("firstCode",firstCode); map.put("secondCode",secondCode);
	 * map.put("thirdCode",thirdCode); map.put("firstRecordIndex",
	 * searchVo.getFirstRecordIndex()); map.put("recordCountPerPage",
	 * searchVo.getRecordCountPerPage()); logger.info("map={}",map);
	 * list=peopleinfoService.selectPeoplew(map);
	 * 
	 * logger.debug("조회결과 list.size()={}",list.size());
	 * 
	 * int totalRecord=0;
	 * 
	 * totalRecord=peopleinfoService.selectTotalCountPeople(map);
	 * 
	 * logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
	 * 
	 * 
	 * //5]PaginationInfo에 totalRecord값셋팅 pagingInfo.setTotalRecord(totalRecord);
	 * //3 model.addAttribute("pagingInfo", pagingInfo);
	 * model.addAttribute("list",list); model.addAttribute("vo1", vo1); return
	 * "peopleinfo/peopleinfolist";
	 * 
	 * 
	 * 
	 * }
	 */

	@RequestMapping("/peopleinfodetail.do")
	public String peopleinfodetail(@RequestParam(defaultValue = "0") int resumeCode,@ModelAttribute ResumeVO resumeVo,HttpSession session,Model model) {
		logger.info("resumeCode={}",resumeCode);
		logger.info("이력서 상세보기, 파라미터 resumeCode={}", resumeCode);
		String id=(String)session.getAttribute("memberid");
		if(resumeCode==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/resume/list.do");
			
			return "common/message";
		}
		ResumeVO vo=resumeService.selectResumeByNo(resumeCode);
		ResumeVO vo1=resumeService.selectByMemverid(id);
		logger.info("이력서 조회 vo ={}\nvo.getHopeworkCode()={}" ,vo,vo.getHopeworkCode());
		ResumeVO vo2=resumeService.selectBydesiredWorkCode(vo.getHopeworkCode());
		ResumeVO vo3=resumeService.selectByacademicCode(vo.getAcademicCode());
		ResumeVO vo4=resumeService.selectBydvCode(vo.getDvCode());
		ResumeVO vo5=resumeService.selectBylanglicenceCode(vo.getLanglicenceCode());
		ResumeVO vo6=resumeService.selectBylicenceCode(vo.getlNo());
		ResumeVO vo7=resumeService.selectBylocation(vo2.getLocalCode());
		ResumeVO vo8=resumeService.selectBylocation2(vo7.getLocalCode2());
		ResumeVO vo11=resumeService.selectBybtype3(vo2.getBtypeCode3());
		ResumeVO vo10=resumeService.selectBybtype2(vo11.getBtypeCode2());
		ResumeVO vo9=resumeService.selectBybtype1(vo10.getBtypeCode1());
		ResumeVO vo14=resumeService.selectBythird(vo2.getThirdCode());
		ResumeVO vo13=resumeService.selectBysecond(vo14.getSecondCode());
		ResumeVO vo12=resumeService.selectByfirst(vo13.getFirstCode());
		logger.info("상세보기 결과 vo={}", vo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("vo1", vo1);
		model.addAttribute("vo2", vo2);
		model.addAttribute("vo3", vo3);
		model.addAttribute("vo4", vo4);
		model.addAttribute("vo5", vo5);
		model.addAttribute("vo6", vo6);
		model.addAttribute("vo7", vo7);
		model.addAttribute("vo8", vo8);
		model.addAttribute("vo9", vo9);
		model.addAttribute("vo10", vo10);
		model.addAttribute("vo11", vo11);
		model.addAttribute("vo12", vo12);
		model.addAttribute("vo13", vo13);
		model.addAttribute("vo14", vo14);
		return "peopleinfo/peopleinfodetail";
	}
	
}
