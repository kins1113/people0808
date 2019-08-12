<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/inc/top.jsp"%>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<style type="text/css">
.body{
	border: 1px solid lightgray;
	width: 700px;
	height: 500px;
	margin: 0 auto;
	margin-top:100px;
}

.title{
	height:45px;
	border: 1px solid lightgray;
	margin-left: 20px;
}

.tbrow{
	display: block;
	margin-top:15px;
}

span{
	margin-left: 20px;
}

.form-group{
	font-size:1.1em;
}

#divBoardName{width: 200px; float: left;}
	#divBoardInfo{width: 300px; float: left;}
	#divTitle{clear: left;}
	#divBoardInfo span{width: 70px;}
	#divBoardInfo{background: #f2f4f7;padding: 5px;}
	div#cardBoduPostList { padding-top: 0;}
	div#comboPost {background: #f2f4f7; height: 60px;margin-top: 3px;}
</style>
<script type="text/javascript">

function report(no){
	if(${sessionScope.memberid==null}){
		alert('로그인 후 신고 하실 수 있습니다.');
	}else{
	 window.open('<c:url value="/board/report.do?no='+no+'"/>',
			 'reportView',
			 "'status=no, height=380, width=450, left='300px', top='300px'");
		
	}
	
}

function del(){
	if(confirm('해당 글을 삭제하시겠습니까?')){
		location.href='<c:url value="/board/postDel.do?no=${param.no}"/>';
	}
}

$(function(){
	$('input[type=submit]').click(function(){
		if(${sessionScope.memberid==null}){
			alert('로그인 후 글을 작성하실 수 있습니다.');
			event.preventDefault();
			return false;
		}else if($("#content").val()==""){
			
			alert('댓글 내용을 입력해주세요');
			$('#content').focus();
			event.preventDefault();
			return false;
		}
	});
	
	$('.delete').click(function(){
		var code=$(this).parents('.media-body').find('input[name=commentCode]').val();
		if(confirm('해당 댓글을 삭제하시겠습니까?')){
			location.href="<c:url value='/deletecmt.do?commentCode="+code+"'/>";
		}
	});
	
	
	//댓글 수정 ajax
	$('.edit').click(function() {
		
		//수정 클릭시 form 만들기
            var num = $(this).parents('.media-body').find('input[name=commentCode]').val();
			var text=$(this).parents('div').find('#editcontent').text();
            var str = '';
          
           // str += '<form name="updatecmt" action="<c:url value='/updatecmt.do'/>" method="post">'
            str = '<input type="hidden" id ="commentCode" name="commentCode"  value="'+num+'">';
            str +='<textarea row="3" class="form-control" name="content" style="border:1px solid lightgray; height: 80px;">'+text+'</textarea>';
            str += '<br><input type="submit" value="수정완료" id="updateComment" style="width: 80px; padding: 5px; background: #17b978; color: white; display: inline-block; margin-right: 10px; float: left;"> ';
            str += '<input type="button" value="취소" id="back" style="width: 80px; padding: 5px; background: lightgray; color: white; margin-left:10px;">';
           // str +='</form>';
            
            $(this).parents('.media-body').find('#change').html(str);
            console.log(str);    
            
            
		
		
	});
	
	$('#back').click(function(){
		location.href="<c:url value='/board/detail.do?no=${param.no}'/>";
	});
});
</script>
<div class="container" style="min-height: 629px;">
	
	
<div class="row" style=" margin: 45px;">
	<div class="col-lg-12">
		<div class="card card-default">
		<c:if test="${!empty postList }">
	<c:forEach var="map" items="${ postList}">
			<div class="card-header card-header-border-bottom">
				<h2>${map['BOARDTITLE'] }</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 끝 -->
			<!-- 게시판 정보를 넘기기위한 hidden -->
			<div class="card-body" id="cardBoduPostList">
				
				<div class="form-group" id="divTitle" style="    margin-top: 10px;">
					조회수 : ${map['BOARDHITS'] }					
				</div>
					<div class="form-group" >
					등록일 :   <fmt:formatDate value="${map['BOARDREGDATE2'] }" pattern="yyyy년  MM월 dd일 HH:mm:ss"/>
					  </div>
					  <div class="form-group" >
					  작성자 : ${map['MEMBERNAME'] }
					  </div>
					<div id="postInfo" style="    min-height: 300px;">
					  <c:if test="${fn:length(uploadList)!=0 }">
        <p>
	        <c:forEach var="uploadVo" items="${ uploadList}">
	             첨부파일 : <a href="<c:url value='/board/filedownload.do?no=${uploadVo.uploadCode }&fileName=${uploadVo.fileName }'/>">${uploadVo.originalFileName }  (${uploadVo.fileSize/1000 }KB)</a>
	       	다운로드 수 : ${uploadVo.downcount } <br>
	        </c:forEach>
        </p>
        </c:if>
        ${postVo.boardcontent}
					</div>
		</c:forEach>
		</c:if>
					
	
   <c:if test="${empty postList }">
   	<div class="card-header card-header-border-bottom">
				<h2>${adpostVo.boardtitle }</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 끝 -->
			<!-- 게시판 정보를 넘기기위한 hidden -->
			<div class="card-body" id="cardBoduPostList">
				
				<div class="form-group" id="divTitle" style="    margin-top: 10px;">
					조회수 : ${adpostVo.boardhits }					
				</div>
					<div class="form-group" >
					등록일 :   <fmt:formatDate value="${adpostVo.boardregdate2 }" pattern="yyyy년  MM월 dd일 HH:mm:ss"/>
					  </div>
					  <div class="form-group" >
					  작성자 : 관리자
					  </div>
					  <c:if test="${fn:length(uploadList)!=0 }">
        <p>
	        <c:forEach var="uploadVo" items="${ uploadList}">
	             첨부파일 : <a href="<c:url value='/board/filedownload.do?no=${uploadVo.uploadCode }&fileName=${uploadVo.fileName }'/>">${uploadVo.originalFileName }  (${uploadVo.fileSize/1000 }KB)</a>
	       	다운로드 수 : ${uploadVo.downcount } <br>
	        
        </p>
        <img alt="첨부파일" src="<c:url value='/post_upload/${uploadVo.fileName }'/>">
        
        </c:forEach>
        </c:if>
        ${adpostVo.boardcontent}
		</c:if>
		
   <c:forEach var="map" items="${postList }">
   <c:if test="${sessionScope.memberName!=map['MEMBERNAME'] }">
 
<button style="float:left; background: #ff5722d1; border-color:#ff5722d1; color:white;" onclick="report(${param.no})" class="btn btn-primary" style="background: #17b978; border-color:#17b978;">신고하기</button>
  </c:if>    
  
  <c:if test="${sessionScope.memberName==map['MEMBERNAME'] }">
<button value="수정하기" onclick="location.href='<c:url value="/board/boardEdit.do?no=${map['BOARD_CODE2'] }"/>'" class="btn btn-primary" style="background: #17b978; border-color:#17b978;">수정하기</button>
<button value="삭제하기" onclick="del()" class="btn btn-primary" style="background: lightgray; color: black; border-color:lightgray;">삭제하기</button>
   </c:if>
  </c:forEach> 
<button style="float:right; background: lightgray; color: black; border-color:lightgray;" onclick="location.href='<c:url value="/board/boardByCategory.do?boardCode=${adpostVo.boardCode}" />' " class="btn btn-primary">목록으로</button>
 
		</div>
		
		
		
	</div>
	        <!-- Comments Form -->
        <c:if test="${boardVo.commentage=='Y' }">
        <div class="card my-4">
          <h5 class="card-header">댓글을 남겨주세요:</h5>
          <div class="card-body">
            <form name="frmCmt" action="<c:url value='/post/postCmt.do'/>" method="post">
            	<input type="hidden" name="boardCode2" value="${param.no}">
              <div class="form-group">
                <textarea class="form-control" rows="3" name="content" id="content"></textarea>
              </div>
              <input type="submit" class="btn btn-primary" style="float:right;background: #17b978; border-color:#17b978;" value="등록">
            </form>
          </div>
        </div>
</c:if>
        <!-- Single Comment -->
        <c:if test="${!empty list }">
        <c:forEach var="map" items="${list}">
        <div class="media mb-4">
          <div class="media-body">
            <h5 class="mt-0" style="display:inline-block; float:left;">${map['MEMBERNAME'] } | <fmt:formatDate value="${map['BOARD_DATE'] }" pattern="yyyy-MM-dd HH:mm:ss"/> </h5> 
            <input type="hidden" name="commentCode" value="${map['COMMENT_CODE'] }">
            <form name="updatecmt" action="<c:url value='/updatecmt.do'/>" method="post">
	            <div name="change" id="change">
   <c:if test="${sessionScope.memberName==map['MEMBERNAME'] }">
	            <span class="edit" style="cursor:pointer; ">수정</span> | <span class="delete" style="cursor:pointer; margin-left: 0;">삭제</span>
	            </c:if>
	            <br>
	            
	            <% pageContext.setAttribute("newLineChar", "\n"); %>
				
				<textarea rows="4" cols="120" id="editcontent" class="editcontent" style="clear:both;">${map['CONTENT']}</textarea>
				</form>
				</div>
          </div>
        </div>
	<hr>
	</c:forEach>
	</c:if>
</div>
</div>
</div>
<%@include file="../main/inc/bottom.jsp"%>