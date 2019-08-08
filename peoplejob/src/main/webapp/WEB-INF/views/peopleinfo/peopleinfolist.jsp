<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<style>
.divForm {
    width: 1500px;
    margin: 0 auto;
    background: white;
    padding: 13px;
        height: 1500px;
}
#peopleinfo {
    background: #f2f4f7;
      height: 1104px;
}
h2 {
    font-size: 18px;
    margin: 0 0 16px;
    margin-left: 286px;
    font-weight: bold;
}

.divPage {
    position: absolute;
    bottom: -300px;
    left: 949px;
}
</style>
<script type="text/javascript">

</script>
<div id="peopleinfo">
<div class="divForm">
  <c:if test="${!empty param.term||!empty param.age||!empty param.graduatetype||!empty param.sido||!empty param.gugun
  ||!empty param.btypename1||!empty param.btypename2||!empty param.btypename3||!empty param.firstname||!empty param.secondname||!empty param.thirdname}">

			<p>
				검색결과 : ${pagingInfo.totalRecord}건 검색되었습니다.
			</p>
		</c:if>

	<form name="frmSearch" method="post" style="border: 1px solid green; height: 700px;"
   		action='<c:url value="/peopleinfo/peopleinfolist.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->  
   		<input type="hidden" name='currentPage' value="1" >
   		<div id="whereall" style="margin-left: -209px;
    padding: 23px;">
         <div id="where" class="where">
         <c:import url="peopleinfowhere.jsp"/>
      </div> 
      
      </div>
        <c:if test="${empty list }" >    
        
       <table class="table table-hover"style="position: relative;
    bottom: -59px;">
       <tr>
          <td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
       </tr>
       </table>
      
      </c:if>
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

   		 <c:if test="${!empty list }">

	<div id="resumelist">			    
    <table class="table table-hover" style="    position: relative;
    bottom: -218px;">
        <colgroup>
            <col width="46">
            <col width="218">
            <col width="549">
            <col width="147">
        </colgroup>
        <thead>
       <tr>
            <th scope="col" class="scrap"><span class="blind">관심인재</span></th>
            <th scope="col" class="name">이름</th>
            <th scope="col" class="contents">이력서 요약</th>
            <th scope="col" class="update" id="date_type">업데이트일</th>
        </tr>
        <tr>
            <td id="peoplelist" >${vo1.membername}<br>(${vo1.membergender}|${vo.age})</td>
            <td id="peoplelist" >경력${vo.term}&nbsp;${vo.resumeTitle}<br>
            ${vo.schoolname}|${vo.hopepay}|${vo.sido}</td>
            <td id="peoplelist" >${vo.resumeRegdate}</td>
           </tr> 
       
        </thead>
        </table>
        </div>
      
       
        </c:if>
        </form>
      </div> 
      </div> 
<%@include file="../main/inc/bottom.jsp" %>