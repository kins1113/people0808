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
#modalTable th{width: 54px; text-align: left; margin: auto 0;padding: 0.2rem;
    vertical-align: middle;border-top: 1px solid #dee2e6;}/*border-right: 1px solid #dee2e6;*/
#modalTable th{vertical-align: middle;}
input.form-control.size {width: 67px; float: left;height: 20px;}
.spanSize1{width: 30px; float: left;}
.spanSize2{width: 50px; float: left;}
.infoSpan{font-size: 0.7em;}
#workdate2, #workdate1 { width: 110px; float: left;height: 20px;}
input[name=startDay], input[name=endDay]{width: 77px;}
td{vertical-align: middle;}
.infoP{margin:10px; padding: 20px 0 20px 30px;background: #f2f4f7;}
.divTitle{width: 41px;   float: left;     text-align: right;    margin-right: 5px;}
.popupSizeChenge input[type="text"] {    width: 60px;    margin-bottom: 1px;}
button.mb-1.btn.btn-sm.btn-outline-secondary {    width: 65%;    margin-top: 6px;}
button.mb-1.btn.btn-sm.btn-outline-secondary.btDateChenge {    width: 57%;    margin-top: 6px;}
tr.boardBt td {    vertical-align: middle;}
.table-bordered thead th{border-bottom: 2px solid #dee2e6; border-right: 0; border-left: 0;}
.boardBt th, .boardBt td {border-bottom: 1px solid #dee2e6; border-right: 0; border-left: 0;}/*이것 이 가로줄 없에기  */
</style>
<script type="text/javascript">
	$(function(){
		$(".btSizeChenge").click(function(){
			var width=$(this).prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().val();
			var height=$(this).prev().prev().prev().prev().prev().prev().prev().prev().val();
			var left=$(this).prev().prev().prev().prev().prev().val();
			var top=$(this).prev().prev().val();
			var popupCode=$(this).next().val();
			$.ajax({
				url:"<c:url value='/manager/popup/popupSizeCheng.do'/>",
				type:"post",
				data:{"width":width,"height":height,"left":left,"top":top,"popupCode":popupCode},
				success:function(res){
					if(res>0){
						//'<div class="divTitle">가로 : </div>'+width+'<br>
						//<div class="divTitle">세로 : </div>'+height+'<br>
						//<div class="divTitle">왼쪽 : </div>'+left+'<br>
						//<div class="divTitle">위 : </div>'+top
						var divEl1=$('<div class="divTitle">가로 : </div>'+width+'<br>');
						var divEl2=$('<div class="divTitle">세로 : </div>'+height+'<br>')
						var divEl3=$('<div class="divTitle">왼쪽 : </div>'+left+'<br>')
						var divEl4=$('<div class="divTitle">위 : </div>'+top+'<span></span>')
						var sizeEl=$("#popupSizeInfo"+popupCode)
						
						sizeEl.html(divEl1).append(divEl2).append(divEl3).append(divEl4)
						sizeEl.show();
						$("#popupSizeChenge"+popupCode).hide();
						
						
						var pc=$("#popupClick"+popupCode);
						pc.find("input[name=width]").val(width);
						pc.find("input[name=height]").val(height);
						pc.find("input[name=top]").val(top);
						pc.find("input[name=left]").val(left);
					}
				},
				error:function(xht,status,error){
					alert(status+" : "+error);
				}
			});
			
		})
		
		$(".popupSizeChenge").hide();
		$(".popupSize").dblclick(function(){
			$(this).find(".popupSizeChenge").show();
			$(this).find(".popupSizeInfo").hide();
		})
		
		$(".popupOpen").click(function(){
			var popupImg=$(this).next().val();
			var popupName=$(this).next().next().val();
			var width=$(this).next().next().next().val();
			var height=$(this).next().next().next().next().val();
			var top=$(this).next().next().next().next().next().val();
			var left=$(this).next().next().next().next().next().next().val();
			open("<c:url value='/manager/popup/popupOpen.do?popupImg="+popupImg+"'/>",popupName,
		   "width="+width+",height="+height+",left="+left+",top="+top);
		});
		
		$("#popUpAdd").click(function(){
			location.href="<c:url value='/manager/popup/popupAdd.do'/>";
		});
		
		//사용중 누르면 미사용 , 미사용 누르면 사용 ajax이용하기
		//url = <c:url value='/manager/popup/updateUsage.do?usage=N'/>
		$(".updateUsage").click(function(){
			var usageCk=$(this).html();
			var popupCode=$(this).parent().next().html();
			var thisObj=$(this);
			
			$.ajax({
				url:"<c:url value='/manager/popup/updateUsage.do'/>",
				type:"POST",
				data:{"usageCk":usageCk,"popupCode":popupCode},
				success:function(res){
					if(res>0){
						if(usageCk=="미사용"){
							thisObj.html("사용중");
						}else{
							thisObj.html("미사용");
						}
					}
				},
				error:function(xhr, status, error){
					alert(status+" : "+error)
				}
			})
		});
		
		//날짜 변경 
		$(".btTermChenge").click(function(){
				var startDay=$(this).prev().prev().val();
				var endDay =$(this).prev().val();
				var popupCode =$(this).parent().parent().parent().find("input[name=popupCode]").val();
				
				$.ajax({
					url:"<c:url value='/manager/popup/updateTerm.do'/>",
					type:"post",
					data:{"popupCode":popupCode,
							"startDay":startDay,
							"endDay":endDay},
					dataType:"json",
					success:function(res){
						if(res>0){
							$("#divTermChenge"+popupCode).hide();
							$("#divTerm"+popupCode).html(startDay+" - "+endDay);
							$("#divTerm"+popupCode).show();
						}else{
							alert("수정 실패했습니다...");
						}
					},
					error:function(xhr, status, error){
						alert(status+" : "+error);
					}
				});//ajax
			});
		
		
		//출력 미출력 버튼 누르면 체크된것들 변경
		$("input[name=usageMultChenge]").click(function(){
			//체크 안되면 안되도록 유효성 검사 
			var check=false;
			var usageCkArr= new Array();
			var popupCodeArr= new Array();
			var count=0;
			
			$("input[name=popupCk]").each(function(){
				if($(this).is(":checked")==true){
					check=true;
					usageCkArr[count]=$(this).parent().next().val();
					popupCodeArr[count]=$(this).parent().next().next().val();
					count = count +1;
					//alert("$(this).parent().next().val()= "+$(this).parent().next().val()+", $(this).parent().next().next().val() = "+$(this).parent().next().next().val()+", count = "+count );
				}
			});
			var NYck=$(this).attr("id");
			if(!check){
				alert("하나라도 체크 해야합니다...");
				event.preventDefault();
				return;
			}else{
				var msg;
				if(NYck=="btUsageY"){
					msg="체크된 것을 활성화 하시겠습니까?";
				}else{
					msg="체크된 것을 비활성화 하시겠습니까?";
				}
				
				if(confirm(msg)){
					$.ajax({
						url:"<c:url value='/manager/popup/multUpdateUsage.do?NYck="+NYck+"'/>",
						traditional : true,
						dataType: "json",
						data:{usageCk:usageCkArr,popupCode:popupCodeArr},
						//data:$("form[name=popupList]").serializeArray(),
						success:function(res){
							var resCount=0;
							if(NYck=="btUsageY"){
								for(i in res){
									$("#tdPopupUsage"+res[i]).find("a").html("사용중");
									resCount = resCount+1;
								}
								alert(resCount+"개가 활성화 되었습니다.");
							}else if(NYck=="btUsageN"){
								for(i in res){
									$("#tdPopupUsage"+res[i]).find("a").html("미사용");
									resCount = resCount+1;
								}
								alert(resCount+"개가 비활성화 되었습니다.");
							}
						},
						error:function(xhr, status, error){
							alert(status +" : "+error);
						}
					});//ajax
				}
			}//else
		});//click
	
		//체크된것 삭제 처리
		$("#checkDelete").click(function(){
			//체크 안되면 안되도록 유효성 검사 
			var check=false;
			var popupCodeArr= new Array();
			var count=0;
			$("input[name=popupCk]").each(function(){
				if($(this).is(":checked")==true){
					check=true;
					popupCodeArr[count]=$(this).parent().next().next().val();
					count = count +1;
				}
			});
			if(!check){
				alert("하나라도 체크 해야합니다...");
				event.preventDefault();
				return;
			}else{
				$.ajax({
					url:"<c:url value='/manager/popup/popupDeleteMulti.do'/>",
					type:"post",
					traditional:true,
					data:{popupCodeArr:popupCodeArr},
					success:function(re){
						for(var i=0;i<count;i++){
							$("#popupTr"+popupCodeArr[i]).remove();
						}
					},
					error(xhr, status, error){
						alert(status+" : "+error);
					}
				});
			}
		});
		
		//하나씩 삭제
		$(".popupOneDelete").click(function(){
			//tr의 popupCode값
			var popupCode=$(this).parent().parent().find("input[name=popupCode]").val();
			if(confirm(popupCode+"번 popup을 삭제 하시겠습니까>>>?")){
				$.ajax({
					url:"<c:url value='/manager/popup/popupDelete.do'/>",
					type:"post",
					data:"popupCode="+popupCode,
					success:function(re){
						$("#popupTr"+popupCode).remove();
					},
					error:function(xhr, status, error){
						alert(status+" : "+error);
					}
				});
			}
				
		});
	
		//수정 처리
		$(".popupOneEdit").click(function(){
			//몇번인지 체크
			var popupCode=$(this).parent().parent().find("input[name=popupCode]").val();
			location.href="<c:url value='/manager/popup/popupEdit.do?popupCode="+popupCode+"'/>";
		});
			 
		//체크박스 전체 선택 처리
		$("#popupCkAll").click(function(){
			$("input[name=popupCk]").prop("checked",this.checked);
		});
	
	
		//날짜 수정
		$(".popupTerm").each(function(){
			$(this).find(".divTermChenge").hide();
				$(this).dblclick(function(){
					$(this).find(".divTermChenge").show();
					$(this).find(".divTerm").hide();
			})
		})
	});


</script>

  
<form name="popupList" method="post" >
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
				<h2>
					팝업 관리
				</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 시작  -->
			<div>
			<p class="infoP">
								날짜 더블클릭시 날짜 수정 가능 <br>
								사이즈 더블클릭시 수정 가능
				</p>
				<div align="right" class="form-group serDiv" id="btGroup">
					<input type="button"class="btn btn-secondary btn-default" name="usageMultChenge" id="btUsageY" value="사용"> 
					<input type="button"class="btn btn-secondary btn-default" name="usageMultChenge" id="btUsageN" value="미사용"> 
					<input type="button" class="btn btn-secondary btn-default" id="checkDelete"value="선택삭제">
					<input type="button" class="btn btn-secondary btn-default" id="popUpAdd" value="등록"> 
				</div>
			</div>
			<!-- 해더 부분 버튼 그룹 끝 -->
			<div class="card-body" id="cardBoduPostList">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th><label class="control control-checkbox checkbox-primary">
									<input type="checkbox" name="popupCkAll" id="popupCkAll" />
									<div class="control-indicator"></div>
							</label></th>
							<th scope="col">사용여부</th>
							<th scope="col">코드</th>
							<th scope="col">이미지/이름</th>
							<th scope="col">출력 사이즈</th>
							<th scope="col">출력날짜/등록일</th>
							<th scope="col">관리자 아이디</th>
							<th scope="col">기타</th>
						</tr>
					</thead>
					<tbody>
					<!--  반복 시작  -->
						<c:forEach var="vo" items="${list }">
							<tr id="popupTr${vo.popupCode}" class="boardBt">
								<td>
									<label class="control control-checkbox checkbox-primary">
										<input type="checkbox" name="popupCk" id="popupCk"  />
										<div class="control-indicator"></div>
									</label>
									<input type="hidden" name="usageCk" value="${vo.usage }">
									<input type="hidden" name="popupCode" value="${vo.popupCode }">
								</td>
								<td id="tdPopupUsage${vo.popupCode }">
									<c:if test='${vo.usage=="N" }'>
										<a href="#" class="updateUsage">미사용</a>
									</c:if>
									<c:if test='${vo.usage=="Y" }'>
										<a href="#" class="updateUsage">사용중</a>
									</c:if>
								</td>
								<td>${vo.popupCode}</td>
								<td>
									<img width="150" alt="${vo.popupName }이미지" src="<c:url value='/popup_upload/${vo.popupImg }'/>">
									<b>${vo.popupName }</b>
								</td>
								<td class="popupSize">
									<div class="popupSizeInfo" id="popupSizeInfo${vo.popupCode}">
										<div class="divTitle">가로 : </div>${vo.width }<br> 
										<div class="divTitle">세로 : </div>${vo.height }<br>
										<div class="divTitle">왼쪽 : </div>${vo.left } <br> 
										<div class="divTitle">위 : </div>${vo.top }
									</div>
									<div class='popupSizeChenge' id="popupSizeChenge${vo.popupCode}">
										<div class="divTitle">가로 : </div><input type="text" value="${vo.width }"><br> 
										<div class="divTitle">세로 : </div><input type="text" value="${vo.height }"><br>
										<div class="divTitle">왼쪽 : </div><input type="text" value="${vo.left }"> <br> 
										<div class="divTitle">위 : </div><input type="text" value="${vo.top }"><br>
										<button type="button"  class="mb-1 btn btn-sm btn-outline-secondary btSizeChenge">변경</button>
										<input type="hidden" value="${vo.popupCode}">
									</div>
									
								</td>
								<td class="popupTerm">
									<div class="divTerm" id="divTerm${vo.popupCode}">${vo.startDay } - ${vo.endDay }</div>
									<div class="divTermChenge" id="divTermChenge${vo.popupCode}">
										<input type="text" name="startDay" value="${vo.startDay }"> - 
										<input type="text" name="endDay" value="${vo.endDay }">
										<button type="button" name="btTermChenge"  class="mb-1 btn btn-sm btn-outline-secondary btDateChenge btTermChenge">변경</button>
									</div>
									등록일 : <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/> 
								</td>
								<td>${sessionScope.adminid }</td>
								<td id="popupClick${vo.popupCode}">
									<a href="#" class="popupOneEdit">수정</a><br>
									<a href="#" class="popupOneDelete">삭제</a><br>
									<a href="#" class="popupOpen">열기</a>
									<input type="hidden" name="popupImg" value="${vo.popupImg }">
									<input type="hidden" name="popupName" value="${vo.popupName }">
									<input type="hidden" name="width" value="${vo.width }">
									<input type="hidden" name="height" value="${vo.height }">
									<input type="hidden" name="top" value="${vo.top }">
									<input type="hidden" name="left" value="${vo.left }">
								</td>
							</tr>
						</c:forEach>
					<!-- 반복 끝 -->
					</tbody>
				</table>
				<div class="divSearch"></div>
			</div>
		</div>
</form>



		
		



<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>