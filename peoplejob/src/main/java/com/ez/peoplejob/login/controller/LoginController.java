package com.ez.peoplejob.login.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.payment.model.PaymentService;
import com.ez.peoplejob.post.model.PostService;
import com.ez.peoplejob.resume.model.ResumeService;
import com.ez.peoplejob.scrap.model.ScrapService;
import com.ez.peoplejob.scrap.model.ScrapVO;
import com.ez.peoplejob.tableaply.model.TableaplyService;
import com.ez.peoplejob.tableaply.model.TableaplyVO;

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
		
		
		model.addAttribute("postcount",postcount);
		
		model.addAttribute("applycount",applycount);
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("resumelist",resumelist);
		model.addAttribute("paylist",paylist);
		model.addAttribute("scraplist",scraplist);
		model.addAttribute("joblist",joblist);
		
		
		
		//기업입장 지원현황
		String id=(String)session.getAttribute("memberid");
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원정보 mvo={}",mvo);
		logger.info("회사에 지원한 회원들 리스트");
		//1]PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//2]SearchVo에 페이징 관련 변수 세팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 serchVo={}",searchVo);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		logger.info("searchVo.getFirstRecordIndex()={},getRecordCountPerPage={}",searchVo.getFirstRecordIndex(),searchVo.getRecordCountPerPage());
		map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
		map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
		List<JobopeningVO> list2=jobService.selectJobopeningBycomcode(memberVo.getCompanyCode());
		logger.info("로그인한 회원의 작성한 채용공고 사이즈list2.size={}",list2.size());
		int []jobopening=new int[list2.size()];
		for(int i=0;i<list2.size();i++) {
			jobopening[i]=list2.get(i).getJobopening();
		}
		map.put("jobopening",jobopening);
		logger.info("map={}",map);
		List<TableaplyVO> list=applyService.selectapplyComp(map);
		logger.info("지원현황 조회결과{}",list.size());
		int totalRecord=0;
		totalRecord=applyService.selectapplyCompcount(map);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
		List<MemberVO> list3=new ArrayList<MemberVO>() ;
		int []memberCode=new int[list.size()];
		List<JobopeningVO> list4=new ArrayList<JobopeningVO>() ;
		
		for(int i=0;i<list.size();i++) {
			memberCode[i]=list.get(i).getMemberCode();
			list3.add(memberService.selectBymemberCode(memberCode[i]));
			jobopening[i]=list.get(i).getJobopening();
			list4.add(jobService.selectJobOpenByNo(jobopening[i]));
		}
		logger.info("지원한 회원들에 대한 정보={}",list3.size());
		//5]PaginationInfo에 totalRecord값셋팅
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		
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
