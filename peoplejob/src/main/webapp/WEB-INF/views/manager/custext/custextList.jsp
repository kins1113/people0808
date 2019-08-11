<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>

<style type="text/css">
a{color: black;}
#pageDiv {width: 30%;}
.serDiv {float: right;margin-top: 9px;}
input.form-control {	margin-top: 4px;}
input.btn.btn-secondary.btn-default {margin-top: 4px;}
#boardTable {font-size: 1.0em;}
#cardBoduPostList {margin: 0 5px 5px 5px;padding: 0 5px 5px 5px;}
#btGroup {margin-right: 20px;}
#pageSize {	float: left;margin-left: 20px;margin-top: 9px;}
#startDay, #endDay{width: 120px;}
#btGroup button{margin-top: 4px;}
div#searchDiv {overflow: hidden;margin: 10px auto 10px auto;border: 1.6px solid;    height: 71px;
				width: 97.5%;background: #f5f6fa;}
div#searchDtDiv{background: white;width: 95.5%;    margin: 0 auto;}
div#searchGrDiv{margin-right: 26%;}
input[name=searchKeyword]{width: 400px;margin-right: 3px;}
#searchDtDiv table th{width: 70px;padding: 5px;border: 1px solid silver;}
#searchDtDiv table tr{border-bottom: 0.1px solid #dbdce0eb;}
#searchDtDiv table {border: 2px solid #4c84ff9e;width:100%;}
#dateSearchShow input, input[name=endDate]{height: 33px;padding: 0 9px 0 5px;font-size: 13px;}
.dateSearchShow{float: left;margin-left: 5px;}
.FST{height: 33px;padding: 0 9px 0 5px;font-size: 13px;}
.float{float: left;}
.genderShow{width: 95px;margin: 10px 0 10px 5px;float: left;}
.labelFont{width: 160px;}
#cardBoduPostList table thead tr th:nth-of-type(1) {width: 6%; padding-left: 16px; padding-right: 0px;}
#cardBoduPostList table thead tr th:nth-of-type(2) {width: 11.5%;}
#cardBoduPostList table thead tr th:nth-of-type(3) {width: 60%;}
#cardBoduPostList table thead tr th:nth-of-type(4) {width: 7%;}
#cardBoduPostList table thead tr th:nth-of-type(5) {width: 7%;}
td.tdContent {   height: 170px;    background: #f5f6fa;}
input#endDate {    margin-bottom: 4px;}
hr {MARGIN: 0;}

#dialog-background { display: none;  position: fixed;   top: 0; left: 0;    
width: 100%; height: 100%;    background: rgba(0,0,0,.3);    z-index: 10;}
#my-dialog {    display: none;    position: fixed;    left: calc( 50% - 160px ); top: calc( 50% - 70px );
        width: 596px;   height: 299px;    background: #fff;    z-index: 11;    padding: 10px;}
#my-dialog table {    width: 577px;    border: 1px solid #5f7be5;}
#my-dialog tr:nth-of-type(1) {    height: 44px; border: 1px solid #3136d6;text-align: center;background: aliceblue;}
#my-dialog a {  float: right;  padding-right: 49px;}
#my-dialog tr:nth-of-type(2) {  height:235px;  background: #f0f5ff40;}
#answercontent {    height: 220px;    width: 541px;    margin-left: 4px;}
.divCus {    width: 46%;    float: left;    border: 1px solid #97c3ea; overflow:scroll;
    padding: 10px;    height: 100%;    background: white;}
.divAns  {   width: 46%;   float: right;   border: 1px solid #97c3ea;   padding: 10px; overflow:scroll;
    height: 100%;    background: white;}    
.divAns::-webkit-scrollbar ,.divCus::-webkit-scrollbar{display:none;}
div#sliedDiv { float: left;    font-size: 14px;    padding-top: 3px; 
	margin-right:8px;   padding-left: 9px;    font-weight: bold;}
	input[name=readd] {    font-size: 0.9em;    height: 21px;    padding: 0 20px;    margin-top: 0;    margin-bottom: 8px;}
</style>
<script type="text/javascript">
	$(document).ready(function (){
		
		
		//검색 버튼 클릭했을때~!
		$("#jobopeningSearch").click(function(){
			$("form[name=custextList]").attr("action","<c:url value='/manager/custext/custextList.do'/>");
			$("form[name=custextList]").submit();
		})
		
		//제목눌렀을때 내용 보여주기
		$(".trContent").hide();
		$(".custitle").click(function(){
			$(".trContent").hide();
			$(this).parents("tr").next().show();
		});
		/* $(".btRe").click(function(){
			var code=$(this).parents("tr").find("#tdCode").val();		
			alert(code);
			$("#custextCode").val(code);
		}) */
		//답글다는 모달창 띄우기 
		 $("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
			var code=$(this).next().val();
			var ck=$(this).next().next().val();
			$("input[name=custextCode]").val(code);
			//alert("code="+code+", ck="+ck);
			if(ck!=""){
				$("#thBt").html("문의사항 답변 <input name='readd' class='btn btn-secondary btn-default' type='submit' value='수정하기' >")
			}else{
				$("#thBt").html("문의사항 답변 <input name='readd' class='btn btn-secondary btn-default' type='submit' value='답변하기' >")
			}
			$("#my-dialog,#dialog-background").toggle();
		}); 
		//답글 처리 
		/* $("#recontentAdd").click(function(){
			alert("가랏~~  ");
			$("input[name=recontentForm]").attr("action","<c:url value='/manager/custext/custextRepl.do'/>");
			//$("input[name=recontentForm]").submit();
		}); */
		if(${!empty param.custextCode}){
			var code=${param.custextCode}
			code="cusTitle"+code
			trigger(code);
		}
	});
	
	function trigger(id){
		if(id!=null){
			$("#"+id).trigger("click",function(){});
		}
	} 
	//페이지 처리 함수
	function pageFunc(curPage){
		$("input[name=currentPage]").val(curPage);
		$("form[name=custextList]").attr("action","<c:url value='/manager/custext/custextList.do?authorityCk=member'/>");
		$("form[name=custextList]").submit();
	}
	
	</script>
<form name="custextList" method="post" >
<!-- 페이지 처리를 위한 hidden  -->
<input type="hidden" name="currentPage"
	<c:if test="${param.currentPage!=null }">
	 	value="${param.currentPage }"
	</c:if>
	<c:if test="${param.currentPage==null }">
		value='1';
	</c:if>
 >
 
 
<!-- 필터링을 위한 hidden -->
<input type="hidden" name="filterCode" value="${param.filterCode }">
<input type="hidden" name="filterKey" value="${param.filterKey}">

<!-- 상세검색인지 일반검색인제 체크하기 위한 hidden -->
<input type="hidden" name="detailCk" value="${param.detailCk}">

<div class="row">
	<div class="col-lg-12">
		<div class="card card-default">
			<div class="card-header card-header-border-bottom">
				<h2>문의사항 관리</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 시작  -->
			<div>
				<div id="searchDiv" align="absmiddle">
				
				
					<div id="searchDtDiv">
				<div id="searchGrDiv">
						<div class="form-group serDiv">
							<input type="button" class="btn btn-secondary btn-default" id="jobopeningSearch"value="검색">&nbsp;
						</div>
						<div class="form-group serDiv">
							<input type="text" class="form-control" placeholder="WWW.검색어를 입력하세요"
								name="searchKeyword" value="${param.searchKeyword }">&nbsp;
						</div>
						<div class="form-group serDiv">
							<select class="custom-select my-1 mr-sm-2" name="searchCondition">
								<option value="all">통합검색</option>
								<option value="id"
									<c:if test="${param.searchCondition=='memberid' }">
									selected="selected"
									</c:if>>아이디
								</option>
								<option value="type"
									<c:if test="${param.searchCondition=='membername' }">
									selected="selected"
									</c:if>>유형
								</option>
								<option value="content"
									<c:if test="${param.searchCondition=='companyname' }">
									selected="selected"
								</c:if>>제목+내용
								</option>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group" id='pageSize'>
					<select class="custom-select my-1 mr-sm-2" name="recordCountPerPage">
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
			</div>
			<!-- 해더 부분 버튼 그룹 끝 -->
			<div class="card-body" id="cardBoduPostList">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col"><a href="#" class="fileterCode" id="member_Code">코드</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="member_Code">유형</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="birth">문의사항</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="birth">답변유무</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="membergender">답변하기</a></th>
						</tr>
					</thead>
					<tbody>
					<!--  반복 시작  -->
					<c:if test="${empty list }">
						<td colspan="11" align="center">만족하는 문의사항이 없습니다....</td>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo['CUSTEXT_CODE']}</td>	
								<td>${vo['CUSTEXTCATEGORY']}</td>	
								<td><a href="#" class="custitle" id="cusTitle${vo['CUSTEXT_CODE']}">${vo['CUSTITLE']}</a><hr>
									등록인 : ${vo['MEMBERID']} / 등록일 : <fmt:formatDate value="${vo['CUS_REGDATE']}" pattern="yyyy-MM-dd"/></td>	
								<td>
									<c:if test="${empty vo['ANSWERCONTENT']}">미완료</c:if>
									<c:if test="${!empty vo['ANSWERCONTENT']}">완료</c:if>
								</td>	
								<td>
									<c:if test="${empty vo['ANSWERCONTENT']}">
										<button type="button" id="btn-open-dialog" class="btRe">답변하기</button>
										<input type="hidden" name='asd' value="${vo['CUSTEXT_CODE']}">
										<input type="hidden" name='reEditCk' value="${vo['ANSWERCONTENT']}">
									</c:if>
									<c:if test="${!empty vo['ANSWERCONTENT']}">
										<button type="button" id="btn-open-dialog" class="btRe">수정하기</button>
										<input type="hidden" name='asd' value="${vo['CUSTEXT_CODE']}">
										<input type="hidden" name='reEditCk' value="${vo['ANSWERCONTENT']}">
									</c:if>
								</td>	
							</tr>
							<tr class="trContent">
								<td class="tdContent"	colspan="5">
									<div id="sliedDiv">
												질문
										</div>
									<div class="divCus" 
									
									<c:if test="${empty vo['ANSWERCONTENT']}">
										style="width: 96%"
									</c:if>
									>${vo['CUSCONTENT']}</div> 
									<c:if test="${!empty vo['ANSWERCONTENT']}">
										<div id="sliedDiv">
												답변
										</div>
										<div class="divAns">${vo['ANSWERCONTENT']}</div>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 반복 끝 -->
					</tbody>
				</table>
				<div class="divPage" align="center">
					<!-- 이전블럭으로 이동하기 -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
							src="<c:url value='/resources/images/first.JPG'/>"
							alt="이전블럭으로 이동">
						</a>
					</c:if>
					<!-- 페이지 번호 추가 -->
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color: blue; font-size: 1em">${i }</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageFunc(${i})">[${i}]</a>
						</c:if>
					</c:forEach>
					<!--  페이지 번호 끝 -->

					<!-- 다음 블럭으로 이동하기 -->
					<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
						<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
							src="<c:url value='/resources/images/last.JPG'/>"
							alt="다음블럭으로 이동">
						</a>
					</c:if>
				</div>
				<div class="divSearch"></div>
			</div>
		</div>
		</div></div></div>
</form>
	<form name="recontentForm" method="post" action="<c:url value='/manager/custext/custextRepl.do'/>">
<div id="my-dialog">
	<input type="hidden" name="custextCode">
   <table>
   		<tr>
   			<th colspan="2" id="thBt"> </th>
   		</tr>
   		<tr>
   			<th align="center">내용</th>
   			<td id="recontent"><textarea rows="5" cols="15" placeholder="답변 내용을 입력하세요" id="answercontent" name="answercontent"></textarea></td>
   		</tr>
   </table>
</div>
   </form>
<div id="dialog-background"></div>

<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>