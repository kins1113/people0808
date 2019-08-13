<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<c:url value='/resources/main/images/icons/icon.PNG'/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/bootstrap/css/bootstrap.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/fonts/fontawesome-5.0.8/css/fontawesome-all.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/fonts/iconic/css/material-design-iconic-font.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/animate/animate.css'/>">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/css-hamburgers/hamburgers.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/animsition/css/animsition.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/util.min.css'/>">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/main.css'/>">
<!--===============================================================================================-->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
.pos-relative.size-a-2.bo-1-rad-22.of-hidden.bocl11.m-tb-6 {
    margin-left: 140px;
}

.banner-header {
    margin-top: -10px;
}

h2 {
        font-size: 18px;
        margin: 0 0 15px;
    }
    
    .loginWrap {
    margin-left: 20px;
    height: 110px;
    border: 1px solid #e3e4e8;
    background-color: #f3f4f6;
    box-sizing: border-box;
}

.blind {
    position: absolute;
    overflow: hidden;
    width: 1px;
    height: 1px;
    clip: rect(0 0 0 0);
    margin: -1px;
}

.memberType {
    width: 262px;
    margin: -1px 0 0 -1px;
    border: 1px solid #e3e4e8;
    background-color: #fff;
    box-sizing: border-box;
}

#point .pointWrap button {
    font-family: inherit;
    outline: none;
}

.memberType > li .tab {
    position: relative;
    display: block;
    vertical-align: top;
    line-height: 70px;
}
.memberType > li {
    float: left;
    width: 50%;
    height: 50px;
    text-align: center;
}
li {
    list-style: none;
}
button {
    overflow: visible;
    background: transparent;
    cursor: pointer;
}

.lyLoginForm {
    display: none;
    position: absolute;
    left: 0;
    top: 0;
    width: 260px;
    height: 364px;
    padding: 40px 13px 13px 13px;
    border: 1px solid #565d79;
    background-color: #fff;
    text-align: left;
    box-sizing: border-box;
    letter-spacing: -1px;
    z-index: 10;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

button {
    overflow: visible;
    background: transparent;
    cursor: pointer;
}
    
 /* ul.main-menu {
    border-bottom: 5px solid #379d37ed;
} */
 
 ul.main-menu {
    /* border-bottom: 4px solid darkseagreen; */
}
</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmSearch.currentPage.value=curPage;
		document.frmSearch.submit();
	} 
	function cancel(){
		self.close();
	}
	$(document).ready(function(){ 
		$("#choice").click(function(){
			if($("input[name=resumeCode]").is(':checked')){   
				/* var test1=$("input[name=resumeCode]").prop(':checked').val(); */
				/* var test1=$("input[name=resumeCode]").attr('checked',true).val();  */ 
				var test1 = $(":input:radio[name=resumeCode]:checked").val();

				if(confirm("해당이력서로 지원하시겠습니까?")){  
					opener.location.href="<c:url value='/apply/insertapply.do?jobopening="+${param.jobopening}+
							"&resumeCode="+test1+"'/>";
					self.close();
				}else{
					event.preventDefault();
				}
			}else{ 
				alert("이력서를 선택해주세요");
			}
		});
	}); 
	
</script>
<style type="text/css">
.divList {
    width: 900px;
    margin: 0 auto;
    padding: 10px;
    background: white;
}
#divlist {
    background: #f2f4f7;
}
button.btn.btn-success {
    float: right;
}
</style>
<div id="divlist">
<div class="divList" style="min-height: 630px"> 
	  <input type="hidden" name="resumeCode" value="${param.resumeCode }"/>
	  <input type="hidden" name="jobopening" value="${param.jobopening }"/>
	  <input type="hidden" name="resumeCode" value="${param.jobopening }"/>
<table class="table"
	 	summary="이력서 현황에 관한 표로써, 이력서제목, 이력서 공개 설정, 내 이력서 열람 기업에 대한 정보를 제공합니다.">
	<h3>이력서리스트</h3>
	
	<input type="button" class="btn btn-success" id="choice" name="choice" value="선택">
	<input type="button" class="btn btn-success" id="cancel" value="취소" onclick="cancel();">
	    <c:if test="${!empty list }">
	    <th scope="col"> 체크</th>
	    <th scope="col"> 이력서제목</th>
	    <th scope="col">이력서 공개 설정</th>
	    <th scope="col">등록일</th>
		<c:forEach var="vo" items="${list }">					
	    
	  <!-- 반복문 시작  -->	  	
			
					<tr>
					<!-- 제목이 긴 경우 30글자만 보여주기 -->
					<td><input type="radio" name="resumeCode" id="resumeCode" value="${vo.resumeCode }"></td>
					<td>
					<a href="<c:url value='/resume/resumedetail.do?resumeCode=${vo.resumeCode}'/>">
					<c:if test="${fn:length(vo.resumeTitle) >=30 }">
						${fn:substring(vo.resumeTitle, 0,30)}...
					</c:if>
					<c:if test="${fn:length(vo.resumeTitle) <30 }">					
						${vo.resumeTitle}
					</c:if>
					</a></td>
		
	    <td>
		 <c:if test="${vo.opencheck=='Y'}">
          공개
       </c:if>
       <c:if test="${vo.opencheck=='N'}">
          비공개
       </c:if>
		</td>
	   	
	    
	    
	    <td><fmt:formatDate value="${vo.resumeRegdate}" pattern="yyyy-MM-dd"/>
				</td>
				</tr>
	    	</c:forEach>
	</c:if>
	   

  <!--반복처리 끝  -->	
	<tbody> 
	<c:if test="${empty list }">	 
	 	<tr>
	 		<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
	 	</tr>
	</c:if> 	
	  </tbody>
</table>	   
</div>
</div>
<div class="divPage">
	<!-- 이전블럭으로 이동하기 -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전블럭으로 이동">
		</a>	
	</c:if>
	<!-- 페이지 번호 추가 -->
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-size: 1em">${i }</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">[${i}]</a>
		</c:if>
	</c:forEach>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동하기 -->
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">	
		<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음블럭으로 이동">
		</a>
	</c:if>
</div>
<div class="divSearch">
	<!-- 페이징 처리에도 사용 -->
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/resume/list.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->
   		<input  type="hidden" name='currentPage' value="1">
        
    </form>
</div>



