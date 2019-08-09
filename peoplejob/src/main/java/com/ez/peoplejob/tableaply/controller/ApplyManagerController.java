package com.ez.peoplejob.tableaply.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.tableaply.model.TableaplyService;
@Controller
public class ApplyManagerController {
	private Logger logger=LoggerFactory.getLogger(ApplyController.class);
	@Autowired TableaplyService tableaplyService;
	@Autowired JobopeningService jobopeningService;
	@Autowired MemberService memberService;
	
	@RequestMapping("/manager/apply/applyList.do")
	public String list(@ModelAttribute SearchVO searchVo, 
			@RequestParam(required = false) String startDay,
			@RequestParam(required = false) String endDay,
			@RequestParam(required = false) String type,
			Model model
			) {
		//1
		
		logger.info(" 목록 파라미터 searchVo={}" ,searchVo);
		logger.info(" 목록 파라미터 startDay={}, endDay={}" ,startDay,endDay);
		
		//2
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo에 페이징 관련 변수 셋팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setBlockSize(WebUtility.BLOCK_SIZE);
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		//map에 담아야한다
		map.put("searchVo", searchVo);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		
		//[3] 조회처리
		List<Map<String, Object>> list=tableaplyService.selectAll(map);
	
		
		logger.info("지원 목록 결과, list.size={}",list.size());
		
		//[4] 전체 레코드 개수 조회
		int totalRecord=0;
		totalRecord=tableaplyService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
		
		//[5] PaginationInfo에 totalRecord 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "manager/apply/applyList";
	}
}
