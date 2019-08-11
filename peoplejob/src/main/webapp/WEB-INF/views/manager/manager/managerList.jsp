<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<script type="text/javascript">
	function managerAdd(){
		window.open('<c:url value="/manager/manager/managerAdd.do?adminid=${sessionScope.adminid}"/>',
				'managerAdd',"'status=no, height=500, width=500, left='300', top='30");
	}
	function managerDel(adminCode){
		if(confirm(adminCode+"번 관리자를 삭제 하시겠습니까?")){
				$("input[name=adminCode]").val(adminCode);
				$("form[name=DelForm]").submit();
		}
	}
	function managerEdit(adminCode){
		window.open('<c:url value="/manager/manager/managerEdit.do?adminCode='+adminCode+'"/>',
				'managerEdit',"'status=no, height=500, width=500, left='300', top='30");
	}
	
</script>
<style>
#divBody{
    padding: 1.125rem;
}
button.mb-1.btn.btn-sm.btn-outline-info {
    margin-left: 28px;
    padding: 9px 3.8%;
}
</style>
<form action="<c:url value='/manager/manager/managerDel.do'/>" method="post" name="DelForm">
	<input type="hidden" name="adminCode">
</form>
<div class="row">
<div class="col-lg-12">
	<div class="card card-default">
		<div class="card-header card-header-border-bottom">
			<h2>Manager List</h2>
			
		</div>
		<div class="card-body" id='divBody'>
		<button type="button" class="mb-1 btn btn-sm btn-outline-info" onclick="managerAdd()">등록</button>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">코드</th>
						<th scope="col">아이디</th>
						<th scope="col">권한</th>
						<th scope="col">등록일</th>
						<th scope="col">삭제일</th>
						<th scope="col">기능</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mgList}" var="managerVo">
						<tr>
							<td>${managerVo.adminCode }</td>
							<td>${managerVo.adminid }</td>
							<td>${managerVo.authority }</td>
							<td><fmt:formatDate value="${managerVo.autRegdate }"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${managerVo.autDeldate }"
									pattern="yyyy-MM-dd" /></td>
							<td>
								<button type="button" onclick="managerDel(${managerVo.adminCode })" class="mb-1 btn btn-sm btn-secondary">삭제</button>
								<button type="button" onclick="managerEdit(${managerVo.adminCode })" class="mb-1 btn btn-sm btn-secondary">수정</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>