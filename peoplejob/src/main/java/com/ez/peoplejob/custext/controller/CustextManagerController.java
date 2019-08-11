package com.ez.peoplejob.custext.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.custext.model.CustextService;
import com.ez.peoplejob.custext.model.CustextVO;
import com.ez.peoplejob.member.model.MemberService;

@Controller
@RequestMapping("/manager/custext")
public class CustextManagerController {
	
	private Logger logger=LoggerFactory.getLogger(CustextController.class);
	@Autowired CustextService custextService;
	@Autowired MemberService memberService;
	
	@RequestMapping("/custextList.do")
	public String CustextLIst_manager(@RequestParam(required = false, defaultValue = "1")int currentPage,
			@RequestParam(required = false, defaultValue = "10")int recordCountPerPage,
			@RequestParam(required = false, defaultValue = "") String searchKeyword,
		     @RequestParam(required = false, defaultValue = "") String searchCondition,
							
			Model model) {
		logger.info("문의사항 보여주는 곳  searchKeyword={}, searchCondition={}",searchKeyword,searchCondition);
		
		
		
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
		
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("recordCountPerPage",pagingInfo.getRecordCountPerPage());
		map.put("firstRecordIndex",pagingInfo.getFirstRecordIndex());
		map.put("searchKeyword",searchKeyword );
		map.put("searchCondition",searchCondition );
		
		List<Map<String, Object>> list=custextService.selectCustextManager(map);
		logger.info("문의사항 조회 결과 list.size={}",list.size());
		
		//totalrecord
		int totalRecord=custextService.getTotalrecordManager(map);
		logger.info("totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list", list);
		return "manager/custext/custextList";
		
	}
	///manager/custext/custextRepl.do\
	@RequestMapping("/custextRepl.do")
	public String custextRepl(@RequestParam String answercontent,
							@RequestParam(defaultValue = "0")int custextCode,
							HttpSession session) {
		int adminCode=(Integer) session.getAttribute("adminCode");
		logger.info("문의사항 답변 처리 파라미터 adminCode={}",adminCode);
		logger.info("문의사항 답변 처리 파라미터 custextCode={} , answercontent={} ",custextCode, answercontent);
		
		
		CustextVO cusVo=new CustextVO();
		cusVo.setCustextCode(custextCode);
		cusVo.setAdminCode(adminCode);
		cusVo.setAnswercontent(answercontent);
		int cnt=custextService.updateCustextManager(cusVo);
		logger.info("문의사항 처리 결과 cnt={}",cnt);
		
		return "redirect:/manager/custext/custextList.do?showKey=community";
		
	}
}
