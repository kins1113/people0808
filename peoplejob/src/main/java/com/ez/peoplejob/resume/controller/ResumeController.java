package com.ez.peoplejob.resume.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.common.FileUploadUtility;
import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.peopleinfo.model.PeopleInfoService;
import com.ez.peoplejob.resume.model.ResumeService;
import com.ez.peoplejob.resume.model.ResumeVO;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private PeopleInfoService peopleinfoService;
	@Autowired
	private MemberService memberService;
	@Autowired private FileUploadUtility fileUploadUtil;
	private Logger logger = LoggerFactory.getLogger(ResumeController.class);
	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String register_get(ResumeVO vo,HttpSession session, Model model) {
		String memberid=(String) session.getAttribute("memberid");
		logger.info("이력서등록 화면 보여주기");
		vo=resumeService.selectByMemverid(memberid);
		logger.info("회원정보 조회vo={}",vo);
		model.addAttribute("vo", vo);
		return "resume/register";
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute ResumeVO resumeVo,HttpServletRequest request,Model model) {
		
		
		//이미지 파일 업로드
		List<Map<String, Object>> list
		=fileUploadUtil.fileUpload(request,FileUploadUtility.PEOPLEJOB_UPLOAD);
				
				String picture="";
				for(Map<String, Object> map : list) {
					picture=(String) map.get("fileName");
				}
				resumeVo.setPicture(picture);
				
			
		logger.info("이력서 등록화면 보여주기 매개변수 vo={}",resumeVo);
		
		int cnt=resumeService.insertResume(resumeVo);
		
		logger.info("이력서 등록 결과 cnt ={}",cnt);
		String msg="",url="/resume/register.do";
		if(cnt>0) {
			msg="이력서 등록 성공";
			url="/resume/list.do";
		}else {
			msg="이력서 등록 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/list.do")
	public String list(@ModelAttribute SearchVO searchVo,HttpSession session, Model model,@RequestParam(required=false,defaultValue = "10") int recordCountPerPage) {
		String memberid=(String)session.getAttribute("memberid");
		MemberVO memberVo=memberService.selectByUserid(memberid);
			//1
			logger.info("이력서목록 파라미터 searchVo={}", searchVo);

			Map<String, Object> map = new HashMap<String, Object>();
			//2
			//1]PaginationInfo 객체 생성
			PaginationInfo pagingInfo=new PaginationInfo();
			pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
			pagingInfo.setRecordCountPerPage(recordCountPerPage);
			//pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
			//pagingInfo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());
			
			//2]SearchVo에 페이징 관련 변수 세팅
			searchVo.setRecordCountPerPage(recordCountPerPage);
			//searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			
			logger.info("셋팅 후 serchVo={}",searchVo);
			logger.info("searchVo.getFirstRecordIndex()={},getRecordCountPerPage={}",searchVo.getFirstRecordIndex(),searchVo.getRecordCountPerPage());
			map.put("memberCode", memberVo.getMemberCode());
			map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
			map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
			//[3] 조회처리
			List<ResumeVO> list=resumeService.selectSearch(map);
			logger.info("이력서목록 결과, list.size={}",list.size());
				
			//3
			
			model.addAttribute("memberVo",memberVo);
			model.addAttribute("list", list);
			model.addAttribute("pagingInfo", pagingInfo);
			
			return "resume/list";
		}
	
	
	@RequestMapping("/resumedetail.do")
	public String detail(@RequestParam(defaultValue = "0") int resumeCode, 
			HttpSession session,Model model) {
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
		return "resume/resumedetail";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue = "0") int resumeCode,HttpSession session,
			HttpServletRequest request,ModelMap model) {
		logger.info("수정화면, 파라미터 resumeCode={}", resumeCode);
		String id=(String)session.getAttribute("memberid");
		if(resumeCode==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/resume/list.do");
			return "common/message";
		}
		
		ResumeVO vo=resumeService.selectResumeByNo(resumeCode);
		ResumeVO vo1=resumeService.selectByMemverid(id);
		ResumeVO vo2=resumeService.selectBydesiredWorkCode(vo.getHopeworkCode());
		ResumeVO vo3=resumeService.selectByacademicCode(vo.getAcademicCode());
		ResumeVO vo4=resumeService.selectBydvCode(vo.getDvCode());
		ResumeVO vo5=resumeService.selectBylanglicenceCode(vo.getLanglicenceCode());
		ResumeVO vo6=resumeService.selectBylicenceCode(vo.getlNo());
		ResumeVO vo7=resumeService.selectBylocation(vo.getLocalCode());
		ResumeVO vo8=resumeService.selectBylocation2(vo.getLocalCode2());
		ResumeVO vo11=resumeService.selectBybtype3(vo2.getBtypeCode3());
		ResumeVO vo10=resumeService.selectBybtype2(vo11.getBtypeCode2());
		ResumeVO vo9=resumeService.selectBybtype1(vo10.getBtypeCode1());
		ResumeVO vo14=resumeService.selectBythird(vo2.getThirdCode());
		ResumeVO vo13=resumeService.selectBysecond(vo14.getSecondCode());
		ResumeVO vo12=resumeService.selectByfirst(vo13.getFirstCode());
		logger.info("수정화면 조회 결과, vo={}", vo);
		String fileInfo
		=fileUploadUtil.getFileInfo(vo.getPicture(), 1, request);
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
		model.addAttribute("fileInfo", fileInfo);
		
		return "resume/edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute ResumeVO resumeVo,@RequestParam String oldFileName,HttpServletRequest request, Model model) {
		logger.info("이력서 수정 처리, 파라미터 resumeVo={}", resumeVo);
		List<Map<String,Object>>list=fileUploadUtil.fileUpload(request,FileUploadUtility.PEOPLEJOB_UPLOAD);
		 
		String picture="";
		for(Map<String,Object>map:list) {
			picture=(String)map.get("fileName");
		}
		resumeVo.setPicture(picture);
		String msg="", url="/resume/edit.do="+resumeVo.getResumeCode();
			int cnt=resumeService.updateResume(resumeVo);
			if(cnt>0) {
				msg="이력서 수정되었습니다.";
				url="/resume/resumedetail.do?resumeCode="+resumeVo.getResumeCode();
				if(picture!=null && !picture.isEmpty()) {
					if(oldFileName!=null && !oldFileName.isEmpty()) {
						String path=fileUploadUtil.getUploadPath(request,FileUploadUtility.PEOPLEJOB_UPLOAD);
						File oldFile=new File(path, oldFileName);
						if(oldFile.exists()) {
							boolean bool=oldFile.delete();
							logger.info("기존 파일 삭제 여부={}", bool);
						}
					}
				}
			}else {
				msg="이력서 수정 실패.";
			}
		model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
	
	@RequestMapping(value="/delete.do",method = RequestMethod.GET)
	public String delete_get(@RequestParam(defaultValue = "0") int resumeCode, Model model) {
		logger.info("삭제 화면 파라미터 resumeCode={}" , resumeCode);
		
		if(resumeCode==0) {
			model.addAttribute("msg","잘못된 url입니다.");
			model.addAttribute("url","/resume/list.do");
			return "common/message";
			
		}
		
		return "resume/delete";
	}
	@RequestMapping(value="/delete.do",method = RequestMethod.POST)
	public String delete_post(@ModelAttribute ResumeVO resumeVo, Model model) {
		logger.info("이력서 삭제 처리, 파라미터 resumeVo={}",resumeVo);
		
		String msg="",url="/resume/delete.do?resumeCode="+resumeVo.getResumeCode();
			int cnt=resumeService.deleteResumeByNo(resumeVo.getResumeCode());
			logger.info("이력서 삭제 처리 결과, cnt={}",cnt);
			
			if(cnt>0) {
				msg="이력서 삭제되었습니다.";
				url="/resume/list.do";
			}else {
				msg="이력서 삭제 실패!";
			}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
	
/*
 * @RequestMapping("/ajaxJobtype.do")
 * 
 * @ResponseBody public List<ResumeVO> select(@RequestParam(defaultValue = "0")
 * int resumeNo){ logger.info("ajax-select.do 요청");
 * 
 * List<ResumeVO> list = resumeService.selectAll(searscVo);
 * 
 * return list; }
 */

