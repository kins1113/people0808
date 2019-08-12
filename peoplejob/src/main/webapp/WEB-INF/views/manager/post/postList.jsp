<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<style type="text/css">
	.content {padding: 0;}
a{color: black;}
#pageDiv {width: 30%;}
.serDiv {float: right;margin-top: 9px;}
input.form-control {	margin-top: 4px;}
input.btn.btn-secondary.btn-default {margin-top: 4px;}
#boardTable {font-size: 1.0em;}
#cardBoduPostList {margin: 0 5px 5px 5px;padding: 0 5px 5px 5px;}
#btGroup {margin-right: 20px;}
#pageSize {	float: left;margin-left: 20px;margin-top: 9px;}
.spanInfo{color: #90b1e2; font-size: 0.8em;}
.titleDiv{width: 70px;font-size: 1em;float: left; text-align: right;}   
.clear{clear: both;}
</style>
<script type="text/javascript">
	$(document).ready(function (){
		
		//등록 버튼 넘어가기
		$("#postWrite").click(function(){
			location.href="<c:url value='/manager/post/postWrite.do'/>";			
		});
		//맨위에 체크박스 누르면 전체 선택
		$("#postCkAll").click(function(){
			$("input[name=postCheck]").prop("checked",this.checked)
		});
		$("#pageSize select[name=recordCountPerPage]").change(function(){
			$("form[name=postList]").submit();
		});
		//선택한것 삭제 처리
		$("#checkDelete").click(function(){
			$("form[name=postList]").attr("action","<c:url value='/manager/post/postCheckDelete.do'/>");
			$("form[name=postList]").submit();
		});
		//필터링
		$(".fileterCode").click(function(){
			$("input[name=filterCode]").val($(this).attr("id"));

			if($("form[name=postList] input[name=filterKey]").val()=="N"){
				$("form[name=postList] input[name=filterKey]").val("Y");
			}else if($("form[name=postList] input[name=filterKey]").val()=="Y"){
				$("form[name=postList] input[name=filterKey]").val("N");
			}else{
				$("form[name=postList] input[name=filterKey]").val("Y");
			}
			
			$("form[name=postList]").submit();
		});
		
		//파일 다운로드 이벤트
		$(".fileDown").click(function(){
			var fileName=$(this).attr("id");
			var ogFileName=$(this).html();
			location.href="<c:url value='/manager/post/postFileDown.do?fileName="
										+fileName+"&ogFileName="+ogFileName+"' />"
		});
		
		//게시판 이름 누르면 
		
		
		//신고 내용 보기
		  var modalLayer = $("#modalLayer");
		  var modalLink = $(".modalLink");
		  var modalCont = $(".modalContent");
		  var marginLeft = modalCont.outerWidth()/2;
		  var marginTop = modalCont.outerHeight()/2; 

		  modalLink.click(function(){
			  
			 var postCode=$(this).parent().parent().find("input[name=postCheck]").val();
			 var reportUser= $(this).parent().find("input[name=reportUser]").val();
			 var reportComent= $(this).parent().find("input[name=reportComent]").val();
			 var reportDay= $(this).parent().find("input[name=reportDay]").val();
			  
			
			  
		    modalLayer.fadeIn("slow");
		    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		    $(this).blur();
		    $(".modalContent > a").focus(); 
			  $("#tdReid").html(reportUser);
			  $("#tdReDay").html(reportDay);
			  $("#tdReCo").html(reportComent);
			  
		    return false;
		  });

		  $(".modalContent button").click(function(){
		    modalLayer.fadeOut("slow");
		    modalLink.focus();
		  });		
	});
	function pageFunc(curPage){
		$("input[name=currentPage]").val(curPage);
		$("form[name=postList]").submit();
	}
	//삭제 버튼 누르면 삭제=> 미삭제  미삭제 => 삭제로 변경 
	function changeDelete(delCheck, boardCode){
		$("input[name=deletecheck]").val(delCheck);
		$("input[name=boardCode2]").val(boardCode);
		$("form[name=postList]").attr("action","<c:url value='/manager/post/postList.do?deleteChange=Y'/>")
		$("form[name=postList]").submit();
	}
	 //게시글 상세보기
	function showPostDT(code){
		 alert("들어옴???")
		open("<c:url value='/board/detail.do?no="+code+"'/>","체용공고",
				"width=800px,height=600px,top=40px,left=100px,location=yes,resizable=yes"
				)
	};
</script>
<form action="<c:url value='/manager/post/postList.do'/>" name="postList" method="post" >
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

<!-- 삭제 수정 처리를 위한 hidden -->
<input type="hidden" name="deletecheck" value="N">
<input type="hidden" name="boardCode2" value="0">
<div class="row">
	<div class="col-lg-12">
		<div class="card card-default">
			<div class="card-header card-header-border-bottom">
				<h2>게시글 조회</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 시작  -->
			<div>
				<div align="right" class="form-group serDiv" id="btGroup">
					<input type="button" class="btn btn-secondary btn-default" id="postWrite" value="등록"> 
					<input type="button" class="btn btn-secondary btn-default" id="checkDelete"value="선택한 것 삭제">
				</div>
				<div class="form-group serDiv">
					<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="검색">&nbsp;
				</div>
				<div class="form-group serDiv">
					<input type="text" class="form-control" placeholder="검색어"
						name="searchKeyword" value="${param.searchKeyword }">
				</div>
				<div class="form-group serDiv">
					<select class="custom-select my-1 mr-sm-2" name="searchCondition">
						<option value="">선택</option>
						<option value="boardTitle,boardcontent"
							<c:if test="${param.searchCondition=='boardTitle,boardcontent' }">
							selected="selected"
							</c:if>>제목+내용
						</option>
						<option value="memberid"
							<c:if test="${param.searchCondition=='memberid' }">
							selected="selected"
							</c:if>>회원 아이디
						</option>
						<option value="type"
							<c:if test="${param.searchCondition=='type' }">
							selected="selected"
						</c:if>>카테고리
						</option>
	<!-- 날짜가 선택되면 달력이 나오도록 처리-->
						<option value="boardname"
							<c:if test="${param.key=='boardname' }">
							selected="selected"
				</c:if>>날짜</option>
					</select>
				</div>
				<div class="form-group serDiv">
					<c:import url="/inc/searchDate.do"></c:import>					
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
							<th><label class="control control-checkbox checkbox-primary">
									<input type="checkbox" name="postCheckAll" id="postCkAll" />
									<div class="control-indicator"></div>
							</label></th>
							<th scope="col">
								<a href="#" class="fileterCode" id="TYPE">카테고리</a> /
								<a href="#" class="fileterCode" id="boardtitle">게시판 이름</a>
							</th>
							<th scope="col">
								<a href="#" class="fileterCode" id="boardtitle">제목</a>	/
								<a href="#" class="fileterCode" id="memberid">아이디</a>	/
								<a href="#" class="fileterCode" id="boardregdate2">등록일</a>
							</th>
							<th scope="col"><a href="#" class="fileterCode" id="boardhits">조회수</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="deletecheck">삭제 여부</a></th>
							<th>신고여부</th>
							<th scope="col">파일
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="map" items="${postList}">
							<tr>
								<td>
									<label class="control control-checkbox checkbox-primary"> 
										<input type="checkbox" name="postCheck"  value="${map['BOARD_CODE2']}"/>
											<div class="control-indicator"></div>
									</label>
								</td>
								<td>
										<div><div class="titleDiv">카테고리 : </div>${map['TYPE'] }</div>
										<div><div class="titleDiv">이름 : </div><a href="#" class="postWrite">${map['BOARDNAME'] }</a></div>
								</td>
								<td>
								
									<div><div class="titleDiv">제목 : </div><a href="#" onclick="showPostDT(${map['BOARD_CODE2']})">${map['BOARDTITLE']}</a></div>
									<div><div class="titleDiv">아이디 : </div>
										<c:if test="${!empty map['MEMBERID'] }">
											<span class="spanInfo">user : </span>${map['MEMBERID'] }								
										</c:if>
										<c:if test="${!empty map['ADMINID'] }">
											<span class="spanInfo">manager : </span>${map['ADMINID'] }								
										</c:if>
										
									</div>
									<div class="clear"><div class="titleDiv clear">등록일 : </div><fmt:formatDate value="${map['BOARDREGDATE2']}" pattern="yyyy-MM-dd"/></div>
								</td>
								<td>${map['BOARDHITS']}</td>
								<td>
									<c:set var="delCheck" value="${map['DELETECHECK']}"/>
									<c:if test='${map["DELETECHECK"] eq "Y"}'>
										<a href="#" onclick="changeDelete('${map['DELETECHECK']}','${map['BOARD_CODE2']}')">삭제</a>
									</c:if>
									<c:if test="${map['DELETECHECK'] eq 'N'}">
										<a href="#" onclick="changeDelete('${map['DELETECHECK']}','${map['BOARD_CODE2']}')">미삭제</a>
									</c:if>
								</td>
								<td>
									<c:if test='${map["REPORT_CK"] eq "Y"}'>
										<a href="#modalLayer" class="modalLink">신고</a>
										<input type="hidden" name="reportUser" value="${map['REPORT_USER'] }">
										<input type="hidden" name="reportComent" value="${map['REPORT_COMENT'] }">
										<input type="hidden" name="reportDay" value="${map['REPORT_DAY'] }">
									</c:if>
									<c:if test='${map["REPORT_CK"] eq "N"}'>
										미신고
									</c:if>
								</td>
								<td>
									<!-- 파일이 있을 수 도 있고 없을 수 도 있다.? -->
									<c:if test="${map['UPAGE'] eq 'Y' }">
									<c:forEach var="uploadInfoVo" items="${uploadInfoList}">
										<c:if test="${uploadInfoVo.boardCode2 == map['BOARD_CODE2']}">
											<a href="#" class="fileDown" id="${uploadInfoVo.fileName }">${uploadInfoVo.originalFileName }</a><br>
										</c:if>
									</c:forEach>
									</c:if>
									<c:if test="${map['UPAGE'] eq 'N' }">
										등록 불가
									</c:if>
								</td>
							</tr>
						</c:forEach>
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
</form>


<!-- 모달 -->
<style>
a{color:#000;}
.mask{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}
#modalLayer{display:none; position:relative;}
#modalLayer .modalContent{
    width: 521px;max-width:530px;
    height: 315px;max-height:315px;
    padding: 18px;
    border: 1px solid #ccc;
    position: fixed;
    left: 53%;
    top: 49%;
    z-index: 11;
    background: #7dbcff;;}
#modalLayer button{position:absolute; right:0; top:0; cursor:pointer;}
#modalLayer th{color: black;font-weight: bold;}
#modalLayer table{width: 100%;height: 100%;border-bottom: 1px solid silver;}
#modalLayer tr:nth-of-type(1),#modalLayer tr:nth-of-type(2){height: 40px;}
#modalLayer tr:nth-of-type(3){height: 200px;}
#modalLayer tbody {    background: #fefffa;    border: 1px solid;}
#modalLayer p {    border: 1px solid silver;    height: 39px;    padding: 9px;}
#modalLayer td {    border-bottom: 1px solid;}

</style>

<div id="modalLayer">
  <div class="modalContent">
    <table >
    	<tr>
    		<th colspan="4"><p>신고 내역</p> <button type="button">Esc</button></th>
    	</tr>
    	<tr>
    		<td>아이디 : </td><td id="tdReId"></td>
    		<th>언제 : </th><td id="tdReDay"></td>
    	</tr>
    	<tr >
			<td>내용</td>
			<td colspan="3" id="tdReCo"></td>    	
    	</tr>
    </table>
   
  </div>
</div>
	<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>