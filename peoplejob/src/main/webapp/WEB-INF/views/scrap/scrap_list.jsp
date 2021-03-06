<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<script>
	function pageFunc(curPage){
		document.frmSearch.currentPage.value=curPage;
		document.frmSearch.submit();
	}
	function go(jobopening){ 
		window.open("<c:url value='/apply/resumelist.do?jobopening="+jobopening+"'/>","이력서 선택","height=400,width=600,resizable=yes");
	}
	$(document).ready(function(){
		$("#where").hide();
		$("#search").click(function(){
			$("#where").toggle();
		}); 
		$("#wheresubmit").click(function(){
			$("#where").hide();
			/* $("#hi").val($("#localcheck").val());
			$("#hi2").val($("#workway").val());
			$("#hi3").val($("#payway").val());
			$("#hi4").val($("#academicCondition").val()); */
		}); 
		$("#del").click(function(){
			var cnt=0;
			if(confirm("해당 스크랩을 삭제하시겠습니까?")){
				$("input[name=jobopening1]").each(function(){
					if($(this).is(':checked')==true){
						cnt=1;
					}
				})
				if(cnt==0){
					alert("삭제할 스크랩을 체크해주세요.");
					event.preventDefault();
					return false;
				}else{
					location.href="<c:url value='/scrap/deletescrap.do?jobopening='/>"+$('#jobopening').val()+"&member_code=${mvo.memberCode}";
				}
			}
		});
		$("#del2").click(function(){
			var cnt=0;
			if(confirm("삭제하시겠습니까?")){
			}else{
				event.preventDefault();
			}
		});
	});
	function s_it()
	{
	  var total_str = "";
	  var obj = document.getElementsByName("jobopening1");

	  for (i=0; i < obj.length; i++)
	  {
	    if (obj[i].checked == true)
	    {
	      total_str += (total_str != "") ? "," + obj[i].value : obj[i].value;
	    }
	  }
	  document.getElementById("jobopening").value = total_str;
	}
</script>
<style type="text/css">
.where{
	min-height: 600px; 
}
.where div input[type="checkbox"]{  
	width:50px;
	margin:0 auto;
	float: right;
}
.where div label{ 
	width:130px; 
	margin:0 auto;  
	height:30px;
}
.where fieldset{
	min-width: 0;
 	 padding: 0;
  	margin: 0;
  	border: 1px solid black !important;
}
.divList {
    width: 900px;
    margin: 0 auto;
    padding: 10px;
    background: #cccccc;
}
</style>
<article>
	<fieldset>
    
<div class="divList" style="min-height: 630px">
        <div class="page-header">
            <h3>스크랩한 공고</h3>
       
       <!--  지역<input type="text" name="hi" id="hi">
        근무방식<input type="text" name="hi2" id="hi2">
       	급여방식<input type="text" name="hi3" id="hi3">
       	 학력<input type="text" name="hi4" id="hi4"> -->
	 </div> 
<div class="divSearch"> 
	<!-- 페이징 처리에도 사용 -->
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/scrap/scrap_list.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->  
   		<input type="hidden" name='currentPage' value="1" >
		<div id="where">
		<%-- <%@include file="jobopening_where.jsp" %> --%>
			<c:import url="../company/jobopening_where.jsp"/>
		</div> 
        </div>
    </form>

        <div>
        <c:if test="${empty list }">	 
	 	<tr>
	 		<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
	 	</tr>
		</c:if>
		<c:if test="${!empty list }">
		<c:forEach var="vo" items="${list }"> 
			<c:set var="loop_flag" value="false" /> 
	        <div class="list-group"> 
	            <div class="list-group-item">
	            	<input type="checkbox" name="jobopening1" id="jobopening1" value="${vo.jobopening }" onclick="javascript_:s_it()"> 
	                  <c:forEach var="cvo" items="${clist }">
	                 <c:if test="${not loop_flag }">
				        <c:if test="${vo.companyCode==cvo.companyCode}">   
				         <img src="<c:url value='/logo_upload/${cvo.image }'/>"   
							alt="로고이미지" width="60px" height="100px" style="float:right;">   	
							<div style="width=100px;float:left;">
			                <div class="cname"style="height:100px; width:120px;text-align: center;"><h2>${cvo.companyname}</h2></div>
				            <c:set var="loop_flag" value="true" />
			                </div>
				        </c:if>
				    </c:if>
	                </c:forEach>
							<h4 class="list-group-item-heading"><a href="<c:url value='/company/jobopening_upHit.do?jobopening=${vo.jobopening }'/>">공고제목:${vo.jobtitle }</a></h4>
	                <p class="list-group-item-text">
	                
	                  지역:${vo.localcheck} | 기간 : ${fn:substring(vo.workdate,0,10) }~${fn:substring(vo.endDate,0,10)} 
	                | <small>등록일 : ${fn:substring(vo.jobregdate,0,10)}</small> 
	                | <small>근무방식 : ${vo.workway }</small>
	                | <small>급여방식 : ${vo.payway }</small><br>
	                 <small>경력사항 : ${vo.career }</small>
	                | <small>학력사항 : ${vo.academicCondition }</small>
	                | <small>조회수 : ${vo.hits }</small>
	                <br>
	                 <span class="label label-info">복리후생 : ${vo.welfare }</span>
	                 <br>
					<input type="button" id="apply" name="apply"class="btn btn-primary" value="즉시지원" onclick="go(${vo.jobopening});">
					<a id="del2" href="<c:url value='/scrap/deletescrap2.do?jobopening=${vo.jobopening}&member_code=${mvo.memberCode }'/>"><img alt="스크랩" src="<c:url value='/peoplejob_upload/scrapstar.PNG'/>"></a>
	            </div>
	        </div>
			</c:forEach>
		</c:if>
		</div>
        <div class="pull-left">
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
			<a href="#" onclick="pageFunc(${i})">
				[${i}]</a>
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

        </div>
       <!-- 기업회원(3)이면 글쓰기 나옴  -->
       <input type="hidden" name="jobopening" id="jobopening">
         <c:if test="${mvo.authorityCode==1}"> 
        <div class="pull-right">
        	<input type="button" id="del" name="del" class="btn btn-primary" role="button" value="스크랩 삭제하기">
            <a href="<c:url value='/company/jobopening_list.do'/>" class="btn btn-primary" role="button">채용정보보러가기</a>
        </div>
        </c:if>
    </div>
    </fieldset>
    </article>
<%@include file="../main/inc/bottom.jsp" %>
