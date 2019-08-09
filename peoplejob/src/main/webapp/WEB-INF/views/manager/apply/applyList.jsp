<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>

<style type="text/css">
a{color: black;}
#pageDiv {width: 30%;}
.serDiv {float: right;margin-top: 9px;font-size: 9px;}
input.form-control {	margin-top: 4px;}
input.btn.btn-secondary.btn-default {margin-top: 4px;}
#boardTable {font-size: 1.0em;}
#cardBoduPostList {margin: 0 5px 5px 5px;padding: 0 5px 5px 5px;}
#btGroup {margin-right: 20px;}
#pageSize {	float: left;margin-left: 20px;margin-top: 9px;}
#startDay, #endDay{width: 120px;}
#btGroup button{margin-top: 4px;}
</style>
<script type="text/javascript">
	$(document).ready(function (){
		//맨위에 체크박스 누르면 전체 선택
		$("#memberCkAll").click(function(){
			$("input[name=memberCk]").prop("checked",this.checked)
		});
		$("#pageSize select[name=recordCountPerPage]").change(function(){
			$("form[name=postList]").submit();
		});
		//필터링
		$(".fileterCode").each(function(){
			$(this).click(function(){
				var filterCode=$(this).attr("id");
				$("input[name=filterCode]").val(filterCode);
				var filterKey=$("input[name=filterKey]").val();
		
				if(filterKey!=''){
					if(filterKey=='Y'){
						$("input[name=filterKey]").val("N");
					}else if(filterKey=='N'){
						$("input[name=filterKey]").val("Y");
					}
				}else{
						$("input[name=filterKey]").val("Y");
				}
			$("form[name=memberList]").attr("action","<c:url value='/manager/member/memberList.do?authorityCk=member'/>");
	    	$("form[name=memberList]").submit();	    	
			})
		});
		
		//체크된것 메일 보내기
	    $("#btMultMail").click(function(){
	    	$("form[name=memberList]").attr("action","<c:url value='/manager/email_sms/emailMultWrite.do'/>")
	    		.attr("method",'get');
	    	$("form[name=memberList]").submit();	    	
	    });
		
		$("#postSearch").click(function(){
			$("form[name=memberList]").attr("action","<c:url value='/manager/member/memberList.do?authorityCk=member&showKey=member'/>");
			$("form[name=memberList]").submit();
		})
		
	});
	//페이지 처리 함수
	function pageFunc(curPage){
		$("input[name=currentPage]").val(curPage);
		$("form[name=memberList]").attr("action","<c:url value='/manager/member/memberList.do?authorityCk=member'/>");
		$("form[name=memberList]").submit();
	}
	//엑셀 다운로드 함수
	function doExcelDownloadProcess(ckAll){
		if(ckAll=="all"){
		//전체 회원 엑셀다운 처리
			$("form[name=memberList]").attr("action","<c:url value='/downloadExcelFileMember.do?all=all'/>");
	        $("form[name=memberList]").submit();
		}else{
		//지금 화면에 있는 회원만 엑셀 다운
			if($("input[name=searchKeyword]")==''){
				$("input[name=searchCondition]").val('');
			}
	        $("form[name=memberList]").attr("action","<c:url value='/downloadExcelFileMember.do'/>");
	        $("form[name=memberList]").submit();
		}
		
    }
</script>
<form name="memberList" method="post"  action="<c:url value='/manager/member/memberList.do?authorityCk=member&showKey=member'/>"
		 enctype="multipart/form-data" >
<!-- 페이지 처리를 위한 hidden  -->
<input type="hidden" name="currentPage"
	<c:if test="${param.currentPage!=null }">
	 	value="${param.currentPage }"
	</c:if>
	<c:if test="${param.currentPage==null }">
		value='1';
	</c:if>
 >
 
<!-- 회사인지 일반인지 구분하기 위한 hidden -->
<input type="hidden" name="authorityCk" value="${param.authorityCk }">
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
				<h2>입사지원관리</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 시작  -->
			<div>
				<div align="right" class="form-group serDiv" id="btGroup">
					<input type="button" class="btn btn-secondary btn-default" id="btMultMail"value="선택한 메일">
					<input type="button"class="btn btn-secondary btn-default" onclick="doExcelDownloadProcess('all')" id="" value="전체회원 엑셀"> 
					<button type="button"class="btn btn-secondary btn-default" onclick="doExcelDownloadProcess('')" id="btExceil">엑셀 다운</button> 
				</div>
				<div class="form-group serDiv">
					<input type="button" class="btn btn-secondary btn-default" id="postSearch"value="검색">&nbsp;
				</div>
				<div class="form-group serDiv">
					<input type="text" class="form-control" placeholder="검색어"
						name="searchKeyword" value="${param.searchKeyword }">
				</div>
				<div class="form-group serDiv">
					<select class="custom-select my-1 mr-sm-2" name="searchCondition">
						<option value="all">통합검색</option>
						<option value="memberid"
							<c:if test="${param.searchCondition=='memberid' }">
							selected="selected"
							</c:if>>아이디
						</option>
						<option value="membername"
							<c:if test="${param.searchCondition=='membername' }">
							selected="selected"
							</c:if>>이름
						</option>

						<option value="jobtitle"
							<c:if test="${param.key=='jobtitle' }">
							selected="selected"
						</c:if>>채공공고</option>
					</select>
				</div>
				<div class="form-group serDiv incDate" id="endDay">
					 <c:import url="../../inc/date.jsp">
						<c:param name="name" value="endDay"></c:param>
						<c:param name="id" value="workdate2"></c:param>
					</c:import> 				
				</div>
				<div class="form-group serDiv">
					<br><b> ~ </b>
				</div>
				<div class="form-group serDiv incDate" id="startDay">
					 <c:import url="../../inc/date.jsp">
						<c:param name="name" value="startDay"></c:param>
						<c:param name="id" value="workdate1"></c:param>
					</c:import>				
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
									<input type="checkbox" name="memberCkAll" id="memberCkAll" />
									<div class="control-indicator"></div>
							</label></th>
							<th scope="col"><a href="#" class="fileterCode" id="member_Code">지원 코드</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="memberid">아이디</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="membername">이름</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="address">채용공고</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="birth">열람여부</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="membergender">지원날짜</a></th>

						</tr>
					</thead>
					<tbody>
					<!--  반복 시작  -->
					<c:if test="${empty list }">
						<td colspan="11" align="center">만족하는 사용자가 없습니다....</td>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="memberVo" items="${list}">
							<tr>
								<td>
									<label class="control control-checkbox checkbox-primary">
											<input type="checkbox" name="memberCk" id="memberCk" value="${memberVo.email}" />
											<div class="control-indicator"></div>
									</label>
								</td>
								<td>${memberVo.memberCode}</td>
								<td>${memberVo.memberid}</td>
								<td>${memberVo.membername}</td>
								<td>${memberVo.address} ${memberVo.addressdetail }</td>
								<td>${memberVo.birth}</td>
								<td>${memberVo.membergender}</td>
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
		</div>
		</div>
		
</form>

<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>