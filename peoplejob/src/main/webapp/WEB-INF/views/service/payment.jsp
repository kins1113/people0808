<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/inc/top.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/payment.css'/>" />

<style type="text/css">
table.table.table-bordered {
    font-size: 1.5em;
    text-align: center;
    border:1px solid black;
}
input[type="submit"] {
float: right;
font-size: 2em;
width: 100px;
padding: 5px;  
  background-color: coral;
  color:white;
  }
</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>

<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  <script type="text/javascript">
  $(function(){
	  
	 
	  //div service에 색 추가
	  var $addClass;
	  $("div[name=divcolor]").addClass(function(index, currentClass){
		  console.log(index);
		  console.log(currentClass);
		 
		  if(index==0){
			  $addClass="p-red";
			  
		  }else if(index==1){
			  $addClass="p-green";
		  }else if(index==2){
			  $addClass="p-blue";
		  }else if(index==3){
			  $addClass="p-violet";
		  }
		  
		  return $addClass;
	  });
	  
	  
			
		
	  $('#cardBoduPostList').hide();
	

	 $("select[name=selectPrice]").change(function(){
			var str="";
		 $("#selectPeriod option:selected").each(function(){
			str=$(this).text();			
		 });
			
			 
			 //$("#servicePrice").html("${serviceVo1.servicePrice}");
		 
	 	});
	 
	 
	  $('#hideList').click(function(){
			$('#cardBoduPostList').hide();
			/* $("#selectPeriod").val("2일").prop("selected", true);
			 $("#serviceTerm").html("0일");
			 $("#servicePrice").html("0원"); */
	  });
	  
	  
	  $('.check').click(function(){
			 var selectval= $(this).parents('tr').find('#selectPeriod option:selected').val();
			// $('#totalPrice').text(eachprice*(length+1)*selectval+"원");
			
				  
				 if($(this).is(':checked')){
				  	$(this).parents('tr').find('input[title=price]').val(eachprice*selectval);
				  	//$(this).parents('tr').find('.priceclass').attr('value',(eachprice*selectval));
				  	// alert(sum);
					sum += Number($(this).parents("tr").find("input[title=price]").val());
					  /* checkbox 개수 * 날짜* 1일당 가격  */
					 // alert(sum);
				 }else{
					 var p=0;
					sum -= Number($(this).parents("tr").find("input[title=price]").val());
					 $(this).parents('tr').find('input[title=price]').val(p);
				 }
					$('#totalPrice').val(sum);
				 
		  });
	  
	 
	  	var sum=0;
		var eachprice=0;	  
	  $('button[name=pay]').click(function(){
		  
		  sum=0;
		  
		  //location.reload();
		  $('#cardBoduPostList').show();
		  
		  $('#Info').hide();
		  $("#selectPeriod").val("2").prop("selected", true);
		  $('.selectclass').find("option:eq(0)").prop("selected", true);
		  $('input[title=price]').val('0');
		  $('input[name=totalPrice]').val(sum);
		  $('.workdate1').val('');
		  
		  
		  var scode=$(this).parents("div[name=divcolor]").find("input[name=serviceCode1]").val();
		  
		  eachprice=$(this).parents("div[name=divcolor]").find("input[name=sprice]").val();
		  $('#serviceName').text($(this).parents("div[name=divcolor]").find("input[name=name]").val());
		  $('input[name=serviceCode]').val(scode);
		 // $('#servicePrice').text(eachprice+"원");
		 
		  
		  /* checkbox 체크될때마다 체크개수, 가격 변동 */
		  function check(){
				var length=  $('.check:checked').length;
				$('#chklength').text(length+"개");
				//$('#totalPrice').attr('value',eachprice*(length+1)+"원");
		}
		  
			  check();
			  $('.check').click(check);
			  
			  /*   $('.check').click(function(){ */
			
			  
			  var length=  $('.check:checked').length;
			  
			  /* select 값 변경 시 check된 것만 각각의금액 보여주기 */
			  $('.selectclass').change(function(){
					sum-=Number($(this).parents('tr').find('input[title=price]').val());
					var selectval= $(this).parents('tr').find('#selectPeriod option:selected').val();
					  
					  if($(this).parents('tr').find('.check').is(':checked')){
						 // $(this).parents('tr').find('input[title=price]').attr('value',(eachprice*selectval));
						  $(this).parents('tr').find('input[title=price]').val(eachprice*selectval);
						  sum+=Number($(this).parents('tr').find('input[title=price]').val());
						  
						  $('#totalPrice').val(sum);
					  }else{
						  sum-=Number($(this).parents('tr').find('input[title=price]').val());
						  $('#totalPrice').val(sum);
						  
					  }
				  });
			
			
			  
			//전부 체크
			  $("#chkAll").click(function(){

					if($(this).is(":checked")){
						$(".check").prop("checked","checked");
						$('#chklength').text(${fn:length(list)}+"개");
						//sum=모든 price들의 합
						
						$('.check').each(function(){
						var selectval= $(this).parents('table').find('#selectPeriod option:selected').val();
						$(this).parents('tr').find('input[title=price]').val(eachprice*selectval);
							
						});
						
						
						$(this).parents('table').find('input[title=price]').each(function(){
							sum += Number($(this).val());
						});
						
						$('#totalPrice').val(sum);
						
						/* select 값 변경 시 check된 것만 각각의금액 보여주기 */
						  $('.selectclass').change(function(){
								sum-=Number($(this).parents('tr').find('input[title=price]').val());
								var selectval= $(this).parents('tr').find('#selectPeriod option:selected').val();
								  
								  if($(this).parents('tr').find('.check').is(':checked')){
									  $(this).parents('tr').find('input[title=price]').val(eachprice*selectval);
									  //$(this).parents('tr').find('input[title=price]').attr('value',(eachprice*selectval));
									  sum+=Number($(this).parents('tr').find('input[title=price]').val());
									  
									  $('#totalPrice').val(sum);
								  }else{
									  
									  sum-=Number($(this).parents('tr').find('input[title=price]').val());
									  $('#totalPrice').val(sum);
									  
								  }
							  });
						
						
						
					}else{
						sum=0;
						$(".check").prop("checked",false);  
						$(this).parents('table').find('input[title=price]').val('0');
						$('#chklength').text("0개");
						$('#totalPrice').val(sum);
						$(".selectclass").val("2").prop("selected", true);
						//$('input[title=price]').attr('value','0');
					}
			});
			 
			  
		  $('input[type=checkbox]:checked').each(function(){
				  $(this).prop("checked",false);
		  });
			  
		  $('#cardBoduPostList').hide();
		  $("#selectPeriod").val("2").prop("selected", true);
		  $("#serviceTerm").html("0일");
		  $('#totalPrice').val('0');
		  
		  if(${sessionScope.memberid==null}){     
			  alert('로그인을 해주세요');
			  location.href="<c:url value='/login/login.do'/>";
		  }else{ //로그인을 했을 때  
			  if(${sessionScope.author_code!=3}){
				  if(${sessionScope.author_code==2}){ 
				 	 alert('기업회원 승인을 받은 후 서비스 이용가능합니다.');
					   
				  }else if(${sessionScope.author_code==1}){
				 	 alert('기업회원만 이용가능한 상품입니다.');
				  }      
			  }else if(${sessionScope.author_code==3 && fn:length(list)>=1}){ //승인받은 기업회원 일 때 
				$('#cardBoduPostList').hide();
			  	$('#cardBoduPostList').show();
			  	$("#selectPeriod").val("2").prop("selected", true);
			  	$("#chklength").html("0개");
			  	//$('#servicePrice').text(eachprice+"원");
			  	$('#totalPrice').val('0');
			  	
			  }else if(${sessionScope.author_code==3 && fn:length(list)<1}){   
				  alert('등록된 채용공고가 없습니다. 채용공고를 먼저 등록해주세요');
				  location.href="<c:url value='/company/jobopening_register.do'/>";  
			  }
		  }//로그인해서 아이디 있을 때
		  
		  
	  });//pay 클릭시
  
 
	  
	  
	  $("#frmList").submit(function(){ 
		  if($('.check:checked').length<1){
				alert('결제할 채용공고를 먼저 선택하세요');
				event.preventDefault();
				return;
			}else if($('#agree:checked').length<1){
				alert('개인정보 수집 및 이용에 동의해 주십시오.');
				$('#agree').focus();
				event.preventDefault();
				return false;
				
			} else{ 
				 var count =0;
				 $('.check:checked').each(function(idx,item){
					// alert(idx+", "+$(this).attr("name"))
					//alert("if전 "+$(this).parents('tr').find('.form-control').val());
					
					if($(this).parents('tr').find('.form-control').val()==''){
						//alert("count가 증가 된다..."+count);
						count=count+1;
						 //alert(count);
						
					} //체크한 상품의 파라미터 다 입력되었을때
				 });
				 
				 //alert("if밖"+count);
				 if(count >0){
					 alert('선택한 상품의 이용기간 시작날짜를 선택해주세요.');
							event.preventDefault();
							return false;
					 
				 }else{
						/*
						$('form[name=frmList]').prop('action','<c:url value="/service/payList.do"/>');
						$('form[name=frmList]').submit();
						
					        var jobno = new Array(); // 배열 선언
					 
					        $('.check:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
					            jobno.push(this.value);
					        });
						*/
						
						var param=$("#frmList").serialize();
						var length=  $('.check:checked').length;
						var totalprice=$('#totalPrice').val();
						//var merchantId=$('#merchantId').val();
						
						$.ajax({
							url : "<c:url value='/service/ajaxpayList.do'/>",
							type : "POST",
							//cache: false,
							traditional : true,
							data : param,
							dataType:"json",
							//async: false,
							success : function(res) {
								 if(res){
									if(confirm(length+'개 채용광고를 결제하시겠습니까?')){
									
										var IMP = window.IMP; // 생략가능
										  IMP.init("imp49241177"); 
										  
										  IMP.request_pay({
											  	pg : 'inicis', // version 1.1.0부터 지원.
											    pay_method : 'card',
											    merchant_uid : 'peoplejob_' + new Date().getTime(),
											    name : 'PEOPLEJOB 채용공고 vvip관',
											    amount : totalprice,
											    buyer_email : '${memberVo.email}',
											    buyer_name : '${sessionScope.memberName}',
											    buyer_tel : '${memberVo.tel}',
											    buyer_addr : '${companyVo.companyAddress}',
											    buyer_postcode : '${companyVo.companyZipcode}',
											    m_redirect_url : '<c:url value="/service/pay.do"/>' //모바일 결제 후 이동될 주소
											}, function(rsp) {
											    if ( rsp.success ) {
											        var msg = '결제가 완료되었습니다.\n';
											        msg += '고유ID : ' + rsp.imp_uid+"\n";
											        msg += '상점 거래ID : ' + rsp.merchant_uid+"\n";
											        msg += '결제 금액 : ' + rsp.paid_amount+'원\n';
											        msg += '카드 승인번호 : ' + rsp.apply_num;
											        
											        
											        $('#frmList').prop('action','<c:url value="/service/paysuccess.do" />');
													$('#frmList').submit();
											        //location.href="<c:url value='/service/success.do?jobno="+jobno+"'/>";
											    } else {
											        var msg = '결제에 실패하였습니다.';
											        msg += ' : ' + rsp.error_msg;
											    }
											    alert(msg);
											    
											}); 
									}
								 }else{
									alert('이미 결제완료한 채용공고 상품입니다.');
									event.preventDefault();
								} 

							},
							error : function(xhr, status, error) {
								alert(status + ":" + error);
							}
						});//ajax
				 }
						
					
			} //바깥 else
		  event.preventDefault();
	});//submit

	  
	 
	  
	  /* 체크한 것들 이름 다 보여주기 */
	  var str = "";  // 여러개가 눌렸을 때 전부 출력이 될 수 있게 하나의 객체에 담는다.
		$(".check").each(function(){  
			if($(this).is(":checked"))  
				str += $(this).val() + " ";  // 체크된 객체를 str에 저장한다.
		$("#multiPrint").text(str);  // #multiPrint에 체크된 원소를 출력한다.
		});

  });

  
</script> 
<div class="container" style="margin-top: 30px; margin-bottom: 30px;min-height: 629px; ">

<div class="" style="font-size: 1.7em;
    margin-top: 10px;
    margin-bottom: -25px;">
	PEOPLEJOB 첫 페이지 메인 상단에 노출되는 로고/배너 광고 상품입니다.<br>
	업계 최대 로고사이즈 및 다양한 옵션으로 최상의 주목도 및 노출 효과를 보장합니다.<br>
	<span style="color:red;">* 결제취소는 결제일로부터 24시간 이내에만 가능합니다.</span>
	
</div>
    <div class="row" style="margin-top: 50px;">
    
    <c:forEach var="serviceVo" items="${serviceList}">
        <div class="col-12 col-md-6 col-lg-3">
            <div class="card text-center p-table" id="divcolor" name="divcolor">
            <input type="hidden" id="serviceCode1" name="serviceCode1" value="${serviceVo.serviceCode }">
            <input type="hidden" name="content" value="${serviceVo.serviceContent }">
                <div class="card-header">
                    <h3 class="p-name p-name">${serviceVo.serviceName }</h3>
                    <h4 class="p-price">${serviceVo.servicePrice }원</h4>
                    <small class="text-muted">1일당 가격</small>
                </div>
                <div class="card-body">

                    <ul class="list-unstyled"> 
                        <li>${serviceVo.serviceContent }</li>
                        <li>노출위치 :  ${serviceVo.serviceName }</li>
                        <li>부가서비스 : 채용관 상단고정</li>
                        <li>PC웹:  ${serviceVo.serviceContent }</li>
                        <li>모바일 :  ${serviceVo.serviceName }</li>
                        <li>매월1일</li>
                    </ul>
                    <input type="hidden" name="name" value="${serviceVo.serviceName }">
                     <input type="hidden" name="sprice" value="${serviceVo.servicePrice }">
                    <button type="button" class="btn btn-lg btn-primary"
                     id="pay" title="${serviceVo.serviceCode }" name="pay">신청하기</button>
                </div>
            </div>
        </div>
	</c:forEach>
	
        <!-- 신청하기 버튼 누르면  -->
        
        <div class="card-body" id="cardBoduPostList" style="min-height: 300px; display: none; background-color: #ffffff; "> 
        <span id="hideList" style="cursor: pointer;font-size:1.5em;" >채용공고 리스트 목록 닫기 ▲</span>
	<table class="table table-bordered" style="margin-top: 15px;" name="jobopeninglist">
		<thead>
			<tr> 
				<th scope="col"><input type="checkbox" id="chkAll" style="margin: 0 auto;"></th>
				<th scope="col">번호</th>
				<th scope="col">채용공고 제목</th>
				<th scope="col">채용기간</th>
				<th scope="col">시작날짜</th>
				<th scope="col">사용기간</th>
				<th scope="col">금액</th>
			</tr>
		</thead>
		<tbody>
			<!--  반복 시작  --> 
			<c:if test="${empty list }">
				<td colspan="10" align="center">결제하신 상품이 없습니다.</td>
			</c:if>
			
			<c:if test="${!empty list }">
			<c:set var="idx" value="0"/>
			<c:set var="no" value="1"/>
				
				<br>
			
		 <c:forEach var="serviceVo" items="${serviceList }">
        	<span style="font-size:1.5em;margin-top: 10px;" id="Info">
					 <span name="${serviceVo.serviceName }" style="display: none;">**${serviceVo.serviceName }은 1일당</span>
					<span name="${serviceVo.serviceName }" style="display: none;" id="paymentPrice">${serviceVo.servicePrice }원입니다.</span>  <br>
			</span> 
        </c:forEach>
				
				<c:forEach var="jobopeningVo" items="${list }">
				<form id="frmList" method="post" name="frmList"> 
				
						<input type="hidden" name="merchantId" id="merchantId">
						<%-- <input type="hidden" name="payItems[${idx }].paymentway">
						<input type="hidden" name="payItems[${idx }].progress"> --%>
						<input type="hidden" value="${memberVo.memberCode }" name="payItems[${idx }].memberCode">
						<input type="hidden" value="1" name="payItems[${idx }].serviceCode">
						<%-- <input type="hidden" value="${jobopeningVo.jobopening }" name="jobno" id="jobnoparam"> --%>
					<tr> 
						<td align="center">
						<input type="checkbox" name="payItems[${idx }].jobopening" value="${jobopeningVo.jobopening }" class="check" >
						</td>
						<td align="center">${no }</td>
						<td align="center">${jobopeningVo.jobtitle }</td>
						<td align="center">
						${fn:substring(jobopeningVo.workdate,0,10) }
						 ~ 	${fn:substring(jobopeningVo.endDate,0,10) } </td>  
						<td align="center">
						 <c:import url="../inc/date.jsp">
							<c:param name="name" value="payItems[${idx }].paystartDate"></c:param> 
							<c:param name="id" value="payItems[${idx }].paystartDate"></c:param> 
						 </c:import> 
						 	<!-- <input type="text" name="paystartDate" id="paystartDate"> -->
						</td>
						<td align="center">
							<select name="payItems[${idx }].period" id="selectPeriod" class="selectclass">
								<c:forEach var="i" begin="2" end="30">
									<option value="${i }">${i}일 </option> 
								</c:forEach>
							</select>
						</td>
						<td align="center">
							<input type="text" name="payItems[${idx }].price" id="price" title="price" readonly 
							style="    cursor: default;
    text-align: right;
    display: inline;
    width: 43px;" value="0" class="priceclass">원
						</td>
 					</tr> 
				  <c:set var="idx" value="${idx+1 }"/> 
				  <c:set var="no" value="${no+1 }"/> 
				  </c:forEach> 
			</c:if>
			<!-- 반복 끝 -->
		</tbody>
	</table>
	<br>
	
	<span style="font-size: 2em; font-weight: bold;">견적서</span>
		<table class="table table-bordered" style="margin-top: 15px; " id="priceList">
		<thead>
			<tr> 
				<th scope="col">서비스명</th>
				<th scope="col">선택한 상품 개수</th>
				<th scope="col">세부내용</th>
				<th scope="col">총 합계금액</th>
			</tr>
		</thead>
		<tbody>
		
			<tr>
				<td id="serviceName"></td>
				<td id="chklength">0개
				</td>
				<td id="serviceContent"></td>
				<td id="servicePrice" name="servicePrice" style="color: orangered;">
				<input type="text" name="totalPrice" id="totalPrice" style="    color: orangered;
    cursor: default;
    text-align: right;
    width: 45px; display: inline;" readonly value="0">원 
				</td>
			</tr>
		</tbody> 
		</table>
		
	<!-- checkbox 확인 : <span id="multiPrint"></span><br> -->
	<!-- <span>checkbox 개수: <span id="chklength"></span></span> <br> -->
	
	<div class="agreement" style="font-size: 1.5em;margin-top: 10px;margin-bottom: 10px;">
	< 개인정보 수집 및 이용동의  > <span><input type="checkbox" id="agree" style="display: inline-block;"></span><br>
수집 항목 기업회원 ID, 기업명, 담당자 이름, 이메일 주소, 연락처 <br>
수집 목적 기업의 광고상품 문의에 따른 원활한 상담 제공 <br>
보유 기간 문의처리 후 1년간 보관 <br>
</div>

	<input type="submit" value="결제하기">
	</form>

</div>

    </div>
</div>
<%@include file="../main/inc/bottom.jsp" %>