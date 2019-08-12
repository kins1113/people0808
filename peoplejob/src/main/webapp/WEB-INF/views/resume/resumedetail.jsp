<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<style>
form {
    width: 1277px;
    margin: 0 auto;
    border:1px;
 	    margin-left: 14.2%;
 	    padding: 20px;
}

button.btn.btn-success {
    margin: 3px;
  
}
  .center {
    margin-left: 42%;
   
}
div#detail {
    background: #f2f4f7;
    
}
a {
    color: black;
    text-decoration: none;
}
.navbar-dark .navbar-nav .nav-link {
    color: black;
}
section.redetail {
    margin: 5px;
    background: white;
}
img{

    width: 100%;
    height: 100%;

}
div#imgDiv {
    width: 288px;
    height: 312px;
    float: left;
    margin-top: 20px;
}
p.lead.mb-7 {
    margin: 2px;
    
}

div#memberinfo {
   border: 1px solid lightgray;
    width: 800px;
    margin-left: 319px;
    padding: 21px;
}
.resume-content {
    border: 1px solid lightgray;
    padding: 51px;
      width: 100%;
}
div#hopeworkinfo {
    border: 1px solid lightgray;
    padding: 20px;
}
.certiinfo {
    border: 1px solid lightgray;
        padding: 17px;
}

span.glyphicon.glyphicon-star {
    padding-bottom: 18px;
}
span.glyphicon.glyphicon-globe {
    margin-left: 42px;
}
span.glyphicon.glyphicon-user {
    margin-bottom: 22px;
}
span.glyphicon.glyphicon-briefcase {
    margin-bottom: 26px;
}
h1.mb-0 {
    padding-bottom: 39px;
}
p.lead.mb-7 {
    padding-bottom: 22px;
}
.center2 {
    margin-left:  1037px;
    margin-top: -16px;
    
}
label{
font-weight: 1;
}
h2.mb-5 {
    color: green;
        font-size: 27px;
}
.text-primary {
    color: #0ac323!important;
}
span.glyphicon.glyphicon-user {
  
    font-size: 18px;

}
span {
        font-size: 18px;
}
@media (min-width: 768px)
.lead {
    font-size: 26px;
}

span.text-primary {
    font-size: 35px;
}
span#text-resume {
    font-size: 18px;
}
</style>
<script type="text/javascript">
$(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
    var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
    $( id ).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
});
</script>
  <title>Resume - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="<c:url value='resources/css/bootstrap.min.css'/>" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
  <link href="<c:url value='resources/css/all.min.css'/>" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<c:url value='resources/css/resume.min.css'/>" rel="stylesheet">


<body id="page-top">
<div id="detail">

	<form name="frm1" method="post" 
	action="<c:url value='/resume/resumedetail.do'/>" enctype="multipart/form-data">
  
<div class="center2" >
		<button type="button" class="btn btn-success"><a href="<c:url value='/resume/edit.do?resumeCode=${param.resumeCode}'/>">수정</a></button> 
		<button type="button" class="btn btn-success"><a href="<c:url value='/resume/delete.do?resumeCode=${param.resumeCode}'/>">삭제</a></button> 
		<button type="button" class="btn btn-success"><a href="<c:url value='/resume/list.do'/>">목록</a></button>
		</div>
  <div class="container-fluid p-0" id="section1">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center redetail" id="about">
      <div class="w-100">
        <h1 class="mb-0">이력서
          <span class="text-primary">상세보기</span>
        </h1><p class="lead mb-7">이력서 제목:${vo.resumeTitle}</p>
        
        <div id="imgDiv">
	        <img src="<c:url value='/peoplejob_upload/${vo.picture }'/>" 
							alt="${vo1.membername }" width="50">
        </div>
						&nbsp;&nbsp;
		<div id="memberinfo">				
        	<br><br><span class="glyphicon glyphicon-user" aria-hidden="true">이름:${vo1.membername}</span>&nbsp;&nbsp;
        	&nbsp;&nbsp;<br>
 				
        <div class="subheading mb-5">
        <span class="glyphicon glyphicon-gift" aria-hidden="true">생년월일:<span>${vo1.birth}</span></span>
        &nbsp;&nbsp;
        	<span class="glyphicon glyphicon-star-empty" aria-hidden="true">성별:<span>${vo1.membergender}</span></span>
        <span class="glyphicon glyphicon-globe" aria-hidden="true"><span>(${vo1.zipcode})</span></span>&nbsp;<span>${vo1.address}</span>&nbsp;<span>${vo1.addressdetail}</span><br><br>
        <span class="glyphicon glyphicon-phone" aria-hidden="true"><span>${vo1.tel}</span></span><br><br>
          <span class="glyphicon glyphicon-envelope" aria-hidden="true"><a href="mailto:${vo1.email}">${vo1.email}</a></span>
        </div>
        
        <span class="glyphicon glyphicon-user" aria-hidden="true">자기소개:<span>${vo.introduce}</span></span>
        
      </div>
      </div>
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex justify-content-center redetail" id="experience">
      <div class="w-100"><div class="subheading mb-3">
        <h2 class="mb-5">경력사항</h2>

        <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
          <div class="resume-content">
            <span>경력구분: ${vo4.workcheck}</span><br><br>
            <span>회사명 ${vo4.companyname}</span><br>
            		<span>근무기간:${vo4.workterm}~${vo4.workterm2}</span>
            		&nbsp;&nbsp;<br>
            		<span>${vo4.workcondition}</span>&nbsp;&nbsp;
            		<span>직종:${vo4.chargework}</span>&nbsp;&nbsp;
            		<span>직급:${vo4.jobgrade}</span></div>
          </div>
        </div>
          <div class="resume-date text-md-right">
            <span class="text-primary" id="text-resume">이력서 등록일:${vo.resumeRegdate}</span>
          </div>

       <!--  <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
          <div class="resume-content">
            <h3 class="mb-0">Web Developer</h3>
            <div class="subheading mb-3">Intelitec Solutions</div>
            <p>Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.</p>
          </div>
          <div class="resume-date text-md-right">
            <span class="text-primary">December 2011 - March 2013</span>
          </div>
        </div>

        <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
          <div class="resume-content">
            <h3 class="mb-0">Junior Web Designer</h3>
            <div class="subheading mb-3">Shout! Media Productions</div>
            <p>Podcasting operational change management inside of workflows to establish a framework. Taking seamless key performance indicators offline to maximise the long tail. Keeping your eye on the ball while performing a deep dive on the start-up mentality to derive convergence on cross-platform integration.</p>
          </div>
          <div class="resume-date text-md-right">
            <span class="text-primary">July 2010 - December 2011</span>
          </div>
        </div>

        <div class="resume-item d-flex flex-column flex-md-row justify-content-between">
          <div class="resume-content">
            <h3 class="mb-0">Web Design Intern</h3>
            <div class="subheading mb-3">Shout! Media Productions</div>
            <p>Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.</p>
          </div>
          <div class="resume-date text-md-right">
            <span class="text-primary">September 2008 - June 2010</span>
          </div>
        </div> -->

      </div>

    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center redetail" id="education">
      <div class="w-100"> 
        <h2 class="mb-5">학력</h2>

        <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
          <div class="resume-content">
            <h3 class="mb-0"><span>학교명: ${vo3.schoolname}</span></h3><br>
            <div class="subheading mb-3"><span>전공: ${vo3.major}</span></div>
            <div><span>지역:${vo3.schoollocal}</span></div><br>
            <!-- <p>GPA: 3.23</p> -->
            <span >졸업년도:<span>${vo3.graduate}</span></span>
            ~<span>${vo3.graduate2}</span>
          </div>
          <div class="resume-date text-md-right">
          </div>
        </div>

        <!-- <div class="resume-item d-flex flex-column flex-md-row justify-content-between">
          <div class="resume-content">
            <h3 class="mb-0">James Buchanan High School</h3>
            <div class="subheading mb-3">Technology Magnet Program</div>
            <p>GPA: 3.56</p>
          </div>
          <div class="resume-date text-md-right">
            <span class="text-primary">August 2002 - May 2006</span>
          </div>
        </div> -->

      </div>
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center redetail" id="skills">
      <div class="w-100">
        <h2 class="mb-5">자격증/어학</h2>

        <div class="certiinfo">
         <span>${vo5.certificationtype}</span>
				
 		 <ul >
			<c:if test="${vo5.certificationtype=='자격증/면허증,어학시험'}"> 
				<span class="fa-li fa fa-check">${fn:substring(vo5.certificationtype, 0,6)}</span>
          <li class="list-inline-item">
          
            <i > </i><span >자격증명:</span>
 				 <span>${vo6.lName}</span>
          </li>
          <li class="list-inline-item">
            <i ></i><span >발행처/기관:</span>
 				 <span>${vo6.lInstitution}</span>
          </li>
          <li >
            <i ></i><span>취득일:</span>
 				 <span>${vo6.lGetdate}</span>
          </li>
           
          </c:if>
        </ul>
			
   
        <ul class="fa-ul mb-0">
        <c:if test="${vo5.certificationtype=='자격증/면허증,어학시험'}"> 
				<span class="fa-li fa fa-check">${fn:substring(vo5.certificationtype, 8,12)}</span><br><br> 
          <li>
             <i></i>
            <span >언어:</span>
 				 <span>${vo5.language}</span></li>
          <li>
            <i ></i>
            <span>발행처/기관:</span>
 				 <span>${vo5.institute}</span></li>
          <li>
            <i ></i>
            <span>시험종류:</span>
 				 <span>${vo5.langlicencename}</span></li>
          <li>
            <i ></i>
            <span>시험점수:</span>
 				 <span>${vo5.langpoint}</span></li>
          <li>
            <i ></i>
            <span>시험급수:</span>
 				 <span>${vo5.langGrade}</span></li>
          <li>
            <i ></i>
            <span>취득일:</span>
 				 <span>${vo5.langGetdate}</span>
            	
				</li>
            </c:if>
        </ul>
      </div>
      </div>
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center redetail" id="interests">
      <div class="w-100">
        <h2 class="mb-5">희망근무</h2>
        <div id="hopeworkinfo">
       	<span> 근무형태:${vo2.hopeworkform}</span><br><br>
       	<span> 희망연봉: ${vo2.hopepay}</span><br><br>
       	<span>(희망근무지역)시도: ${vo7.sido}</span><br><br>
       	 <span>(희망근무지역)구군: ${vo8.gugun}</span><br><br>
 		 <span>(희망근무지역)업종1차:${vo9.btypename1}</span><br><br>
 		<span>(희망근무지역)업종2차: ${vo10.btypename2}</span><br><br>
 		 <span>(희망근무지역)업종3차:${vo11.btypename3}</span><br><br>
 		<span>직종1차: ${vo12.firstname}</span><br><br>
 		<span>직종2차: ${vo13.secondname}</span><br><br>
 		<span>직종3차: ${vo14.thirdname}</span><br><br>
 		<span>근무일시:${vo2.hopeworkdate}</span><br>
      
      </div>
      </div>
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center redetail" id="awards">
      <div class="w-100">
        <h2 class="mb-5">수상내역</h2>
        <ul class="fa-ul mb-0">
          <li>
            <i class="fa-li fa fa-trophy text-warning"></i>
            <span class="glyphicon glyphicon-tower" aria-hidden="true"></span> <span>${vo.award}</span></li>
          <!-- <li>
            <i class="fa-li fa fa-trophy text-warning"></i>
            Mobile Web Specialist - Google Certification</li>
          <li>
            <i class="fa-li fa fa-trophy text-warning"></i>
            1<sup>st</sup>
            Place - University of Colorado Boulder - Emerging Tech Competition 2009</li>
          <li>
            <i class="fa-li fa fa-trophy text-warning"></i>
            1<sup>st</sup>
            Place - University of Colorado Boulder - Adobe Creative Jam 2008 (UI Design Category)</li>
          <li>
            <i class="fa-li fa fa-trophy text-warning"></i>
            2<sup>nd</sup>
            Place - University of Colorado Boulder - Emerging Tech Competition 2008</li>
          <li>
            <i class="fa-li fa fa-trophy text-warning"></i>
            1<sup>st</sup>
            Place - James Buchanan High School - Hackathon 2006</li>
          <li>
            <i class="fa-li fa fa-trophy text-warning"></i>
            3<sup>rd</sup>
            Place - James Buchanan High School - Hackathon 2005</li> -->
        </ul>
      </div>
    </section>
    
      <div>
			<span>기업 인사담당자의 입사제의 및 면접제의를 받으시겠어요?</span>
			 <c:if test="${vo.opencheck=='Y'}">
			<span class="glyphicon glyphicon-info-sign" aria-hidden="true">공개설정: <span>공개</span></span>
			</c:if>
			 <c:if test="${vo.opencheck=='N'}">
			<span class="glyphicon glyphicon-info-sign" aria-hidden="true">공개설정" <span>공개안함</span></span>
			</c:if>
		</div>
		
		</div>
      </form>
		
	<div class="center">
		<button type="button" class="btn btn-success"><a href="<c:url value='/resume/edit.do?resumeCode=${param.resumeCode}'/>">수정</a></button> 
		<button type="button" class="btn btn-success"><a href="<c:url value='/resume/delete.do?resumeCode=${param.resumeCode}'/>">삭제</a></button> 
		<button type="button" class="btn btn-success"><a href="<c:url value='/resume/list.do'/>">목록</a></button>
		</div>
  </div>
  
	

  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value='resources/js/bootstrap.bundle.min.js'/>"></script>

  <!-- Plugin JavaScript -->
<script src="<c:url value='resources/js/resume.min.js'/>"></script>
  <!-- Custom scripts for this template -->
  <script src="<c:url value='resources/js/resume.min.js'/>"></script>
	
</body>

<%@include file="../main/inc/bottom.jsp" %>
