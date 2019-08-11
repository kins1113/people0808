<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<style type="text/css">
.body{
	min-height: 629px;
}

table{
    margin: 0 auto;
    width: 70%;
    margin-top: 100px;
    margin-bottom: 100px;
}

table tr td{
	text-align: center;
    padding: 15px;
}

.resumeimg{
	width: 260px;  
	border: 1px solid lightgray;
	margin-bottom: 10px;
}

.title{
	text-align: left;
    display: block;
    padding-left: 42px;
    font-size: 1.7em;
}

span.write{
	font-size: 1.1em;
    margin-right: 39px;
}
</style>
<div class="body">

	<table>
	<tr>
		<td colspan="3"><span class="title">이력서 양식</span></td>
	</tr>
		<tr>
			<td> 
				<img alt="이력서양식이미지" src="http://file1.jobkorea.co.kr/GoodJob/Utils/2241-2250/2250/Image.jpg"
				class="resumeimg"><br>
				<span class="write">2019 최신 이력서 기본형  </span>
				<img src="<c:url value='/resources/main/images/icons/word_icon.png'/>" style="    width: 30px; cursor:pointer;" 
				onclick="location.href='<c:url value="/resumedown.do"/>'"> 
	    	</td>
	    	<td> 
				<img alt="이력서양식이미지" src="http://file1.jobkorea.co.kr/GoodJob/Utils/2241-2250/2249/Image.jpg"
				class="resumeimg"><br>
				<span class="write">2019 최신 이력서 라인형 </span>
				<img src="<c:url value='/resources/main/images/icons/word_icon.png'/>" style="    width: 30px; cursor:pointer;" 
				onclick="location.href='<c:url value="/resumedown.do"/>'"> 
	    	</td>
	    	<td> 
				<img alt="이력서양식이미지" src="http://file1.jobkorea.co.kr/GoodJob/Utils/2241-2250/2248/Image.jpg"
				class="resumeimg"><br>
				<span class="write">2019 최신 이력서 배경형 </span>
				<img src="<c:url value='/resources/main/images/icons/word_icon.png'/>" style="    width: 30px; cursor:pointer;" 
				onclick="location.href='<c:url value="/resumedown.do"/>'"> 
	    	</td>
 	</tr>
 	<tr>
			<td> 
				<img alt="이력서양식이미지" src="http://file1.jobkorea.co.kr/GoodJob/Utils/2251-2260/2253/Image.jpg"
				class="resumeimg"><br>
				<span class="write">2019 경력 기술서 기본형  </span>
				<img src="<c:url value='/resources/main/images/icons/word_icon.png'/>" style="    width: 30px; cursor:pointer;" 
				onclick="location.href='<c:url value="/resumedown.do"/>'"> 
	    	</td>
	    	<td> 
				<img alt="이력서양식이미지" src="http://file1.jobkorea.co.kr/GoodJob/Utils/2241-2250/2246/Image.png"
				class="resumeimg" style="    height: 38%;"><br>
				<span class="write">표준 경력이력서  </span>
				<img src="<c:url value='/resources/main/images/icons/word_icon.png'/>" style="    width: 30px; cursor:pointer;" 
				onclick="location.href='<c:url value="/resumedown.do"/>'"> 
	    	</td>
	    	<td> 
				<img alt="이력서양식이미지" src="http://file1.jobkorea.co.kr/GoodJob/Utils/2241-2250/2250/Image.jpg"
				class="resumeimg"><br>
				<span class="write">2019 최신 이력서 기본형  </span>
				<img src="<c:url value='/resources/main/images/icons/word_icon.png'/>" style="    width: 30px; cursor:pointer;" 
				onclick="location.href='<c:url value="/resumedown.do"/>'"> 
	    	</td>
 	</tr>
 	<tr>
			<td> 
				<img alt="이력서양식이미지" src="http://file1.jobkorea.co.kr/GoodJob/Utils/2241-2250/2250/Image.jpg"
				class="resumeimg"><br>
				<span class="write">2019 최신 이력서 기본형  </span>
				<img src="<c:url value='/resources/main/images/icons/word_icon.png'/>" style="    width: 30px; cursor:pointer;" 
				onclick="location.href='<c:url value="/resumedown.do"/>'"> 
	    	</td>
	    	<td> 
				<img alt="이력서양식이미지" src="http://file1.jobkorea.co.kr/GoodJob/Utils/2241-2250/2249/Image.jpg"
				class="resumeimg"><br>
				<span class="write">2019 최신 이력서 라인형 </span>
				<img src="<c:url value='/resources/main/images/icons/word_icon.png'/>" style="    width: 30px; cursor:pointer;" 
				onclick="location.href='<c:url value="/resumedown.do"/>'"> 
	    	</td>
	    	<td> 
				<img alt="이력서양식이미지" src="http://file1.jobkorea.co.kr/GoodJob/Utils/2241-2250/2248/Image.jpg"
				class="resumeimg"><br>
				<span class="write">2019 최신 이력서 배경형 </span>
				<img src="<c:url value='/resources/main/images/icons/word_icon.png'/>" style="    width: 30px; cursor:pointer;" 
				onclick="location.href='<c:url value="/resumedown.do"/>'"> 
	    	</td>
 	</tr>
	</table>
</div>

<%@include file="../main/inc/bottom.jsp" %>