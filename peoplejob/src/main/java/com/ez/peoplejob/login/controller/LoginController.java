package com.ez.peoplejob.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.payment.model.PaymentService;
import com.ez.peoplejob.post.model.PostService;
import com.ez.peoplejob.post.model.PostVO;
import com.ez.peoplejob.resume.model.ResumeService;
import com.ez.peoplejob.scrap.model.ScrapService;
import com.ez.peoplejob.scrap.model.ScrapVO;
import com.ez.peoplejob.tableaply.model.TableaplyService;
import com.fasterxml.jackson.databind.JsonNode;

@Controller
public class LoginController {
private Logger logger=LoggerFactory.getLogger(LoginController.class);

	@Autowired private MemberService memberService;
	@Autowired private PaymentService paymentService;
	@Autowired private ScrapService scrapService;
	@Autowired private JobopeningService jobService;
	@Autowired private TableaplyService applyService;

	@Autowired private ResumeService resumeService;
	@Autowired private PostService postService;
	
	
	@RequestMapping(value="/mypage/user/userpage.do")
	public String mypage(HttpSession session, Model model, @ModelAttribute SearchVO searchVo) {
		String memberid=(String)session.getAttribute("memberid");
		MemberVO memberVo=memberService.selectByUserid(memberid);
		logger.info("마이페이지 화면 보여주기! memberVo={}",memberVo);
		
			CompanyVO companyVo=jobService.selectcompany(memberVo.getCompanyCode());
			logger.info("companyVo={}",companyVo);
			model.addAttribute("companVo",companyVo);
		
		//
		List<Map<String , Object>> paylist=paymentService.selectPaymentById(memberid);
		logger.info("결제 내역 paylist.size={}",paylist.size());
		List<ScrapVO> scraplist=scrapService.selectScrap(memberVo.getMemberCode());
		logger.info("스크랩 리스트 scraplist.size={}",scraplist.size());
		List<JobopeningVO> joblist=jobService.selectJobopeningBycomcode(memberVo.getCompanyCode());
		logger.info("채용공고 리스트 joblist.size={}",joblist.size());

		List<Map<String , Object>> resumelist=resumeService.selectResumeByid(memberid);
		logger.info("이력서 리스트 resumelist.size={}",resumelist.size());
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("memberCode", memberVo.getMemberCode());
		int applycount=applyService.selectapplyCount(map);
		logger.info("개인회원입장 지원현황 applycount={}",applycount);
		int postcount=postService.selectmypostcount(memberVo.getMemberCode());
		/*
		List<PostVO> postlist=postService.selectPostBymemId(po);
		logger.info("내가 쓴 글 postlist.size={}",postlist.size());
		*/
		
		model.addAttribute("postcount",postcount);
		
		model.addAttribute("applycount",applycount);
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("resumelist",resumelist);
		//model.addAttribute("postlist",postlist);
		model.addAttribute("paylist",paylist);
		model.addAttribute("scraplist",scraplist);
		model.addAttribute("joblist",joblist);
		
		return "mypage/user/userpage";
		
	}
	

	@RequestMapping("/user/copyresume.do")
	public String copyresume(HttpSession session, Model model,@RequestParam(defaultValue = "0") int resumeCode) {
		logger.info("이력서 복사 파라미터, resumeCode={}",resumeCode);
		String memberid=(String)session.getAttribute("memberid");
		MemberVO memberVo=memberService.selectByUserid(memberid);
		
		int cnt=resumeService.insertCopy(resumeCode);
		logger.info("이력서 복사 결과 cnt={}",cnt);
		
		String msg="", url="/mypage/user/userpage.do";
		if(cnt>0) {
			msg="이력서 복사가 완료되었습니다";
		}else {
			msg="이력서 복사 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/mypage/corp/paymentDetail.do")
	public String paymentDetail(HttpSession session, Model model) {
		String memberid=(String)session.getAttribute("memberid");
		List<Map<String , Object>> list=paymentService.selectPaymentById(memberid);
		logger.info("결제 내역 list.size={}",list.size());
		
		List<Map<String , Object>> Timelist=paymentService.selectPayByTime(memberid);
		logger.info("결제 내역 Timelist.size={}",Timelist.size());
		
		model.addAttribute("list",list);
		model.addAttribute("Timelist",Timelist);
		
		return "mypage/corp/paymentDetail";
	}
	
	
}
