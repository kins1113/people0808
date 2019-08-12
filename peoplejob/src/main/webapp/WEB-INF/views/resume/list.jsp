<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmSearch.currentPage.value=curPage;
		document.frmSearch.submit();
	}
</script>
<style type="text/css">
.divList {
    margin: 0 auto;
    background: white;
   min-height: 871px;
    width: 1164px;
    padding: 28px;

}
#divlist {
    background: #f2f4f7;
}
button.btn.btn-success {
    float: right;
}
.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 27px;
    margin-top: 67px;
}
h3, .h3 {
    font-size: 24px;
    font-family: serif;
    font-weight: bold;
}
a#registerbt{
    color: black;
    font-size: 18px;
}
button.btn.btn-success {
    width: 80px;
    height: 40px;
}
</style>    
<div class="divSearch">
	<!-- 페이징 처리에도 사용 -->
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/resume/list.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->
   		<input  type="hidden" name='currentPage' value="1">

       <div id="divlist">
<div class="divList" style="min-height: 871px;">
	  <input type="hidden" name="resumeCode" value="${param.resumeCode }"/>
	  <input type="hidden" name="memberCode" value="${memberVo.memberCode }"/>
<table class="table"
	 	summary="이력서 현황에 관한 표로써, 이력서제목, 이력서 공개 설정, 내 이력서 열람 기업에 대한 정보를 제공합니다.">
	 	<div class="form-group" id='pageSize'>
					<select class="custom-select my-1 mr-sm-2" id="recordCountPerPage" name="recordCountPerPage">
						<option value="10"
							<c:if test="${param.recordCountPerPage==10 }">
								selected="selected"
							</c:if>>10개씩
						</option>
						<option value="20"
							<c:if test="${param.recordCountPerPage==20 }">
								selected="selected"
							</c:if>>20개씩
						</option>
						<option value="30"
							<c:if test="${param.recordCountPerPage==30 }">
								selected="selected"
							</c:if>>30개씩
						</option>
						<option value="50"
							<c:if test="${param.recordCountPerPage==50 }">
								selected="selected"
							</c:if>>50개씩
						</option>
					</select>
				</div>
				
	<h3>이력서리스트</h3>
	
	<button type="button" class="btn btn-success"><a id="registerbt" href="<c:url value='/resume/register.do'/>">등록</a> 
	    <c:if test="${!empty list }">
	    <th scope="col"> 이력서제목</th>
	    <th scope="col">이력서 공개 설정</th>
	    <th scope="col">내 이력서 번호</th>
	    <th scope="col">등록일</th>
		<c:forEach var="vo" items="${list }">					
	    
	  <!-- 반복문 시작  -->	  	
			
					<tr>
					<!-- 제목이 긴 경우 30글자만 보여주기 -->
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
	    	동의
	    </c:if>
	    <c:if test="${vo.opencheck=='N'}">
	    	동의안함
	    </c:if>
	    </td>
	   	
	    <td>
	    ${vo.resumeCode}
	    </td><!--일단 멤버 네임으로  -->

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
    </form>
</div>


<%@include file="../main/inc/bottom.jsp" %>

