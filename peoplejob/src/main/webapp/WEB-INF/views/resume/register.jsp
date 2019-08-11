<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../main/inc/top.jsp" %>




<style type="text/css">
.divForm {
   width: 1279px;
    height: 120%;
    margin: 0 auto;
    background: #f2f4f7;
    padding: 13px;
}
#registerdiv {
    background: #f2f4f7;
}
select#schoollocal {
    height: 35px;
}
select#graduatecheck {
    height: 35px;
}
select#workcondition {
    height: 35px;
}
select#certificationtype {
    height: 35px;
}
select#hopeworkform {
    height: 35px;
}
select#hopepay {
    height: 35px;
}
select#hopeworkdate {
    height: 35px;
}
section#registerds {
    margin: 12px;
    background: white;
    padding: 20px;
}
section#registerds1 {
    margin: 12px;
    background: white;
}
section#registerds2 {
    margin: 12px;
    background: white;
}
section#registerds3 {
    margin: 12px;
    background: white;
}
section#registerds4 {
    margin: 12px;
    background: white;
}
h3 {
    color: green;
    font-weight: bold;
}
div#companycheck {
    margin-left: 900px;
}

legend{
    font-weight: bold;
    font-size: 30px;
    margin-left: 10px;
}

button#certification {
    margin-left: 10px;
}
button#langcertbt{
    margin-left: 10px;
}
button#awardbt{
    margin-left: 10px;
}
input[type="submit"] {
    margin-left: 1014px;
}
select#major {
    height: 33px;
}
select#chargework {
    height: 33px;
}
select#jobgrade {
    height: 33px;
}
select#lName {
    height: 33px;
}
select#language {
    height: 33px;
}
select#langlicencename {
    height: 33px;
}
div#certificationtype {
    padding: 13px;
}
div#langcert {
    padding: 13px;
}
div#award {
padding: 13px;
}
div#hopework {
    padding: 13px;
}

</style>
    <script type="text/javascript">
    $(document).ready(function($){
		$('#workterm').datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월",
					"7월","8월","9월","10월","11월","12월"]
		});
		$('#workterm2').datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월",
					"7월","8월","9월","10월","11월","12월"]
		});
    });
    </script>
<script type="text/javascript">

$(document).on("click","button[name=addcareer]",function(){
    
    var addStaffText = '<tr name="careeradd">'+        
    '<td><strong>회사명</strong>'+
    '<input type="text" class="form-control" placeholder="회사명 입력" name="companyname" id="companyname" style="ime-mode:active">'+
    '</td>'+
    '  <td>재직기간'+
    '<input id="workterm" name="workterm" class="form-control" type="text" readonly/>'+
	'<label class="control-label">~</label>'+
  	'<input id="workterm2" name="workterm2" class="form-control" type="text" readonly/>'+
		'&nbsp';+
	'<select class="form-control" name="workcondition" id="workcondition" >'+
    	'<option value="재직중">재직중</option>'+
    	'<option value="퇴사">퇴사</option>'+
    '</select>'+
    '</td>'+

'<td>직종'+
'<input type="text" class="form-control"  placeholder="직종을 입력" name="chargework" >'+
	'</td>'+
	

	'<td>직급'+
'<input type="text"  class="form-control"  placeholder="직급을 입력"  name="jobgrade">'+
'       <button class="btn btn-default" name="delStaff">삭제</button>'+
'</td>'+
'</tr>';

var trHtml = $(  "tr[name=careeradd]:last" );
trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.

});
//삭제 버튼
 $(document).on("click","button[name=delStaff]",function(){
     
    var trHtml = $(this).parent().parent().parent().parent();
     
    trHtml.remove(); //tr 테그 삭제
     
}); 
</script>

<script>
$(document).ready(function (){
    //직접입력 인풋박스 기존에는 숨어있다가

	$("#majorinput").hide();



	$("#major").change(function() {

			

	                //직접입력을 누를 때 나타남

			if($("#major").val() == "direct") {

				$("#majorinput").show();

			}  else {

				$("#majorinput").hide();

			}

			

		}) 

		
    //직접입력 인풋박스 기존에는 숨어있다가

	$("#chargeworkinput").hide();



	$("#chargework").change(function() {

			

	                //직접입력을 누를 때 나타남

			if($("#chargework").val() == "direct") {

				$("#chargeworkinput").show();

			}  else {

				$("#chargeworkinput").hide();

			}

			

		}) 
    //직접입력 인풋박스 기존에는 숨어있다가

	$("#jobgradeinput").hide();



	$("#jobgrade").change(function() {

			

	                //직접입력을 누를 때 나타남

			if($("#jobgrade").val() == "direct") {

				$("#jobgradeinput").show();

			}  else {

				$("#jobgradeinput").hide();

			}

			

		}) 
    //직접입력 인풋박스 기존에는 숨어있다가

	$("#lNameinput").hide();



	$("#lName").change(function() {

			

	                //직접입력을 누를 때 나타남

			if($("#lName").val() == "direct") {

				$("#lNameinput").show();

			}  else {

				$("#lNameinput").hide();

			}

			

		}) 
    //직접입력 인풋박스 기존에는 숨어있다가

	$("#languageinput").hide();



	$("#language").change(function() {

			

	                //직접입력을 누를 때 나타남

			if($("#language").val() == "direct") {

				$("#languageinput").show();

			}  else {

				$("#languageinput").hide();

			}

			

		}) 
    //직접입력 인풋박스 기존에는 숨어있다가

	$("#langlicencenameinput").hide();



	$("#langlicencename").change(function() {

			

	                //직접입력을 누를 때 나타남

			if($("#langlicencename").val() == "direct") {

				$("#langlicencenameinput").show();

			}  else {

				$("#langlicencenameinput").hide();

			}

			

		}) 

		

	
	//자격증을 가져오는
	$("#certification").click(function(){
		getCertificate();
	})
	
	//1차 커리어 직종 가져오기 /resume/career/firstList.do
	selectcareer();
	  
	//1차 직종 가져오기 /manager/occupantion/firstList.do
	selectFirst();
	
	//어학을 가져오는
	$("#langcertbt").click(function(){
		getLangcertification();
	})
	
	//전공을 가져오는

	getMajor();
	
	//직급을 가져오는

	getJobgrade();

	//희망 근무 조건
	$("#hopeworkbt").click(function(){
	gethopeworkform();
	})
												
	//1차 직종 클릭하면 2차직종 가져오기 
	$("#selectFirst").change(function(){
		var firstCode=$(this).find("option:selected").val();
		if(firstCode!=0){
			selectSecond(firstCode);
		}
	});
	
	//2차 직종 클릭하면 3차직종 가져오기
	$("#selectSecond").change(function(){
		var secondCode=$(this).find("option:selected").val();
		if(secondCode!=0){
			selectThird(secondCode);
		}
	});

	

	
	//지역정보를 가져오기 - 시도
	getLocation();
	
	//지역정보를 가져오는 
	$("#locationSiDo").change(function(){
		var sidoCode=$(this).find("option:checked").val();
		//값을 가져오는 메서드
		getLocation2(sidoCode);
	});
	
	//1차 업종 가져오기
	getBtype1();
	//1차업종 change 2차 업종 가져오기
	$("#selectBtype1").change(function(){
		var bytpeCode1=$(this).find("option:checked").val();
		getBtype2(bytpeCode1);
	});
	//2차업종 change 3차 업종 가져오기
	$("#selectBtype2").change(function(){
		var bytpeCode3=$(this).find("option:checked").val();
		getBtype3(bytpeCode3);
	});
});

//1차 직종 가져오기
function selectFirst(){
	$.ajax({
		url:"<c:url value='/resume/occupation/firstList.do'/>",
		type:"post",
		success:function(res){
				settingFirst(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//1차 직종 뿌리기
//[{"firstCode":1,"firstname":"경영·사무"},{"firstCode":2,"firstname":"영업·고객상담"},{"firstCode":3,"firstname":"생산·제조"},
//{"firstCode":4,"firstname":"IT·인터넷"},{"firstCode":5,"firstname":"전문직"},{"firstCode":6,"firstname":"교육"}
function settingFirst(res){
		$.each(res,function(idx,item){
			if(idx==0){
				var chEl=$("<option value='0'>1차 직종</option>")
				var opEl=$("<option value='"+item.firstCode+"'></option>");
				opEl.append(item.firstname);
				$("#selectFirst").html(chEl);
				$("#selectFirst").append(opEl); //최종으로 여기에 넣음
			}else{
				var opEl=$("<option value='"+item.firstCode+"'></option>");
				opEl.append(item.firstname);
				$("#selectFirst").append(opEl); //최종으로 여기에 넣음
			}
		})
}

//2차 직종가져오기 
function selectSecond(firstCode){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectSecond.do'/>",
		type:"post",
		data:"firstCode="+firstCode,
		success:function(res){
			settingSecond(res);
		},
		error:function(xhr,status,error){
			alert(status+":"+error);
		}
	});
}
//[{"secondCode":101,"secondname":"기획·전략·경영","firstCode":1},
	//{"secondCode":102,"secondname":"총무·법무·사무","firstCode":1},.....	]
//2차 직종 세팅하기 함수
function settingSecond(res){
	$.each(res,function(idx,item){
		if(idx==0){
			//option태그 만들어서 
			var opEl=$("<option value='"+item.secondCode+"'></option>")
			//값을 넣고 
			opEl.html(item.secondname);
			//append
			$("#selectSecond").html("<option value='0'>2차 직종</option>");
			$("#selectSecond").append(opEl);
		}else{
			//option태그 만들어서 
			var opEl=$("<option value='"+item.secondCode+"'></option>")
			//값을 넣고 
			opEl.append(item.secondname);
			//append
			$("#selectSecond").append(opEl);
		}
	});
	var thirdEl=$("<option>3차 직종</option><option>먼저 2차 직종을 선택하세요</option>");
	$("#selectThird").html(thirdEl);
};

 //3차직종 가져오기 
function selectThird(secondCode){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectThird.do'/>",
		type:"post",
		data:"secondCode="+secondCode,
		success:function(res){
			settingThird(res);
		},
		error:function(xhr,status,error){
			alert(status+":"+error);
		}
	});
	
} 
//3차 직종 뿌려주기 
function settingThird(res){
	$.each(res,function(idx,item){
		if(idx==0){
			//option태그 만들어서 
			var opEl=$("<option value='"+item.thirdCode+"'></option>")
			//값을 넣고 
			opEl.html(item.thirdname);
			//append
			$("#selectThird").html("<option value='0'>3차 직종</option>");
			$("#selectThird").append(opEl);
		}else{
			//option태그 만들어서 
			var opEl=$("<option value='"+item.thirdCode+"'></option>")
			//값을 넣고 
			opEl.append(item.thirdname);
			//append
			$("#selectThird").append(opEl);
		}
	});
}

//지역정보를 가져오는 메서드 
function getLocation(){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectLocation.do'/>",
		type:"post",
		success:function(res){
			settingLocation(res);
		},
		error:function(xht,status,error){
			alert(status+":"+error);
		}
	});//ajax
}
//지역정보를 뿌려주는 메서드
function settingLocation(res){
	$.each(res, function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>시/도</option>");
			var opEl=$("<option value='"+item.localCode2+"'></option>")
			opEl.html(item.sido);
			$("#locationSiDo").html(chEl);
			$("#locationSiDo").append(opEl);
		}else{
			var opEl=$("<option value='"+item.localCode2+"'></option>")
			opEl.html(item.sido);
			$("#locationSiDo").append(opEl);
		}
	});
}


//지역정보를 가져오는 메서드 - 구군
function getLocation2(sidoCode){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectLocation2.do'/>",
		type:"post",
	    dataType: "json",
		data:"sidoCode="+sidoCode,
		success:function(res){
			settingLocation2(res);
		},
		error:function(xht,status,error){
			alert(status+":"+error);
		}
	});//ajax
}
//지역정보를 뿌려주는 메서드 - 구군
function settingLocation2(res){
	$.each(res, function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>구/군</option>");
			var opEl=$("<option value='"+item["LOCAL_CODE2"]+"'></option>")
			opEl.html(item["GUGUN"]);
			$("#locationGugun").html(chEl);
			$("#locationGugun").append(opEl);
		}else{
			//alert("세팅 item[LOCAL_CODE2]="+item["LOCAL_CODE2"]+", item[GUGUN]"+item["GUGUN"])
			var opEl=$("<option value='"+item["LOCAL_CODE2"]+"'></option>")
			opEl.html(item["GUGUN"]);
			$("#locationGugun").append(opEl);
		}
		
	});
}

//1차 업종가져오기
function getBtype1(){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectBtype1.do'/>",
		type:"post",
		success:function(res){
				settingBtype1(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//1차 업종 뿌리기
function settingBtype1(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>1차 업종</option>")
			var opEl=$("<option value='"+item["BTYPE_CODE1"]+"'></option>");
			opEl.append(item['BTYPENAME1']);
			$("#selectBtype1").html(chEl);
			$("#selectBtype1").append(opEl);
		}else{
			var opEl=$("<option value='"+item["BTYPE_CODE1"]+"'></option>");
			opEl.append(item['BTYPENAME1']);
			$("#selectBtype1").append(opEl); //최종으로 여기에 넣음
		}
	})
}
//2차 업종 가져오기
function getBtype2(btypeCode1){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectBtype2.do'/>",
		type:"post",
		data:"btypeCode1="+btypeCode1,
		success:function(res){
				settingBtype2(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}
//2차 업종 뿌리기
function settingBtype2(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>2차 업종</option>")
			var opEl=$("<option value='"+item["BTYPE_CODE2"]+"'></option>");
			opEl.append(item['BTYPENAME2']);
			$("#selectBtype2").html(chEl);
			$("#selectBtype2").append(opEl); 
		}else{
			var opEl=$("<option value='"+item["BTYPE_CODE2"]+"'></option>");
			opEl.append(item['BTYPENAME2']);
			$("#selectBtype2").append(opEl); 
		}
	})
	var chEl=$("<option value='0'>3차 업종</option><option>먼저 2차 업종을 선택하세요</option>")
	$("#selectBtype3").html(chEl);
}
//2차 업종 가져오기
function getBtype3(btypeCode2){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectBtype3.do'/>",
		type:"post",
		data:"btypeCode2="+btypeCode2,
		success:function(res){
				settingBtype3(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}
//3차 업종 뿌리기
function settingBtype3(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>3차 업종</option>")
			var opEl=$("<option value='"+item["BTYPE_CODE3"]+"'></option>");
			opEl.append(item['BTYPENAME3']);
			$("#selectBtype3").html(chEl);
			$("#selectBtype3").append(opEl); 
		}else{
			var opEl=$("<option value='"+item["BTYPE_CODE3"]+"'></option>");
			opEl.append(item['BTYPENAME3']);
			$("#selectBtype3").append(opEl); 
		}
	})
}

/* $(function(){
    $( "#jobgrade" ).autocomplete({
        source : function( request, response ) {
             $.ajax({
                    type: 'post',
                    url: "<c:url value='register.jsp'/>",
                    dataType: "json",
                    //request.term = $("#autocomplete").val()
                    data: { value : request.term },
                    success: function(data) {
                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                        response(
                            $.map(data, function(item) {
                                return {
                                    label: item.data,
                                    value: item.data
                                }
                            })
                        );
                    }
               });
            },
        //조회를 위한 최소글자수
        minLength: 2,
        select: function( event, ui ) {
            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
        }
    });
}) */


//전공 가져오기
function getMajor(){
	$.ajax({
		url:"<c:url value='/resume/education/selectMajor.do'/>",
		type:"post",
		success:function(res){
				settingMajor(res);

		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}


//전공 뿌리기
function settingMajor(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>전공</option>")
			var opEl=$("<option value='"+item.academicCode+"'></option>");
			opEl.append(item.major);
			test2.append(item.major);
			$("#selectMajor").html(chEl);
			$("#selectMajor").append(opEl); 
			
		}else{
			var opEl=$("<option value='"+item.academicCode+"'></option>");
			opEl.append(item.major);
			
			$("#selectMajor").append(opEl); 
			
		}
	})
	
}





//직급 가져오기
function getJobgrade(){
	$.ajax({
		url:"<c:url value='/resume/career/selectCareer.do'/>",
		type:"post",
		success:function(res){
				settingJobgrade(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}


//직급 뿌리기
function settingJobgrade(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>직급</option>")
			var opEl=$("<option value='"+item.dvCode+"'></option>");
			opEl.append(item.jobgrade);
			$("#selectBydvCode").html(chEl);
			$("#selectBydvCode").append(opEl); 
		}else{
			var opEl=$("<option value='"+item.dvCode+"'></option>");
			opEl.append(item.jobgrade);
			$("#selectBydvCode").append(opEl); 
		}
	})
	
}



//1차 커리어 직종 가져오기
function selectcareer(){
	$.ajax({
		url:"<c:url value='/resume/career/firstCareer.do'/>",
		type:"post",
		success:function(res){
			settingcareer(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//1차 커리어 직종 뿌리기
//[{"firstCode":1,"firstname":"경영·사무"},{"firstCode":2,"firstname":"영업·고객상담"},{"firstCode":3,"firstname":"생산·제조"},
//{"firstCode":4,"firstname":"IT·인터넷"},{"firstCode":5,"firstname":"전문직"},{"firstCode":6,"firstname":"교육"}
function settingcareer(res){
		$.each(res,function(idx,item){
			if(idx==0){
				var chEl=$("<option value='0'>직종</option>")
				var opEl=$("<option value='"+item.dvCode+"'></option>");
				opEl.append(item.chargework);
				$("#selectcareer").html(chEl);
				$("#selectcareer").append(opEl); //최종으로 여기에 넣음
			}else{
				var opEl=$("<option value='"+item.dvCode+"'></option>");
				opEl.append(item.chargework);
				$("#selectcareer").append(opEl); //최종으로 여기에 넣음
			}
		})
}


//자격증 가져오기
function getCertificate(){
	$.ajax({
		url:"<c:url value='/resume/certificate/selectLname.do'/>",
		type:"post",
		success:function(res){
			settingCertificate(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}


//자격증 뿌리기
function settingCertificate(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>자격증명</option>")
			var opEl=$("<option value='"+item.lNo+"'></option>");
			opEl.append(item.lName);
			$("#selectLname").html(chEl);
			$("#selectLname").append(opEl); 
		}else{
			var opEl=$("<option value='"+item.lNo+"'></option>");
			opEl.append(item.lName);
			$("#selectLname").append(opEl); 
		}
	})
	
}


//어학 가져오기
function getLangcertification(){
	$.ajax({
		url:"<c:url value='/resume/langcertification/selectlangcertification.do'/>",
		type:"post",
		success:function(res){
			settingLangcertification(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//어학 뿌리기
function settingLangcertification(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>어학</option>")
			var opEl=$("<option value='"+item.langlicenceCode+"'></option>");
			opEl.append(item.langlicencename);
			$("#selectlanglicencename").html(chEl);
			$("#selectlanglicencename").append(opEl); 
		}else{
			var opEl=$("<option value='"+item.langlicenceCode+"'></option>");
			opEl.append(item.langlicencename);
			$("#selectlanglicencename").append(opEl); 
		}
	})
	
}
//희망 근무조건 가져오기
function gethopeworkform(){
	$.ajax({
		url:"<c:url value='/resume/hopeWorking/selecthopework.do'/>",
		type:"post",
		success:function(res){
			settinghopeworkform(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//희망 근무조건 뿌리기
function settinghopeworkform(res){
	$.each(res,function(idx,item){
	
			var opEl=$("<option value='"+item.hopeworkCode+"'></option>");
			opEl.append(item.hopeworkform);
			$("#hopeworkform").append(opEl); 
		
	})
	
}
 

</script>
<script type="text/javascript">

$(document).ready(function (){
	$("#certificationtype").hide();
	$("#certification").click(function () {
		$("#certificationtype").toggle(500);
	});
	$("#award").hide();
	$("#awardbt").click(function () {
		$("#award").toggle(500);
	});
	$("#hopework").hide();

	$("#hopeworkbt").click(function () {
	$("#hopework").toggle(500);
	
	});
	
	$("#langcert").hide();
	$("#langcertbt").click(function () {
		$("#langcert").toggle(500);
	});
});

</script>


<article>
<div id="registerdiv">
<div class="divForm">
<form name="frm1" method="post" 
	action="<c:url value='/resume/register.do'/>" enctype="multipart/form-data">
<fieldset>

	<legend style="font-weight: bold">이력서등록</legend>
	<section id="registerds">
	<div>        
        <h3 >이력서 제목</h3>
        <input type="text" class="form-control" placeholder="이력서 제목을 입력하세요(최대 100자 입력)" name="resumeTitle" id="infobox"  style="ime-mode:active">
    </div>
    </section>
    <hr>
    <section id="registerds">
    <h3>기본정보</h3>
    <!-- hidden필드에 no 넣기 -->
    
    <input type="hidden" name="memberCode" value="${vo.memberCode }">
    
        
		
    <div>
    <!--이력서 사진  https://kuzuro.blogspot.com/2018/10/11.html-->
    <div class="inputArea">
 <label for="picture">이력서 사진</label>
 <input type="file" id="gdsImg" name="file" />
 <div class="select_img"><img src="" /></div>
 
 <script>
  $("#picture").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(200);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
</div>

    </div>
    <div>        
        <label for="membername">이름</label>
        <input type="text" class="form-control"  name="membername" id="membername" value="${vo.membername }" style="ime-mode:active" readonly>
    </div>
   <input type="hidden" id="picture" name="picture" />
    <div>        
        <label for="birth">생년월일</label>
        <input type="text" class="form-control"  name="birth" id="birth" value="${vo.birth}" style="ime-mode:active" readonly>
    	
    </div>
  
   
    <div>
        <label for="email">이메일 주소</label>
        <input type="text" class="form-control"  name="email"  id="email" value="${vo.email }" title="이메일주소 앞자리" readonly>
    </div>
    
    <div>
        <label for="address">주소</label>
        <input type="text" class="form-control"  name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80" value="${vo.zipcode}">
  
        <span class="sp1">&nbsp;</span>
        <input type="text"  class="form-control" id="address" name="address" value="${vo.address }" ReadOnly title="주소"  class="width_350" readonly><br />
        <span class="sp1">&nbsp;</span>
        <input type="text"  class="form-control" id="addressdetail" name="addressdetail" value="${vo.addressdetail }" title="상세주소"  class="width_350" readonly>
    </div>
    <div>
        <label for="tel">핸드폰</label>&nbsp;
       
        <input type="text"  class="form-control"   name="tel" id="tel" value="${vo.tel}" maxlength="11" title="휴대폰 번호"
        	class="width_80" readonly>
    </div>
    </section>
    <section id="registerds">
    <h3>학력사항</h3>
    <div class="divStaff">
    <div >
        <label for="education">학력사항</label>&nbsp;
       
      
		
       <label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="초등학교졸업"> 초등학교 졸업
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="중학교졸업"> 중학교 졸업
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="고등학교졸업"> 고등학교 졸업
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="대학졸업 (2,3년)"> 대학졸업 (2,3년)
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="대학교졸업 (4년)"> 대학교졸업 (4년)
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="석사졸업이상"> 석사졸업이상
		</label>
		<hr>
	</div>
		<!-- <button class="btn btn-success" name="addedu">학력 추가</button> -->
   
		<div>
		 <label for="schoolname">학교명</label>&nbsp;
			    
        <input type="text"  class="form-control" placeholder="학교명을 입력"  name="schoolname" id="schoolname">
        </div>
        <div>
		 <label for="schoollocal">지역</label>&nbsp;
			<select class="form-control" name="schoollocal" id="schoollocal" >
        	<option data-value="101000" value="서울">서울</option>
        	<option data-value="102000" value="경기">경기</option>
        	<option data-value="103000" value="광주">광주</option>
        	<option data-value="104000" value="대구">대구</option>
        	<option data-value="105000" value="대전">대전</option>
        	<option data-value="106000" value="부산">부산</option>
        	<option data-value="107000" value="울산">울산</option>
        	<option data-value="108000" value="인천">인천</option>
        	<option data-value="109000" value="강원">강원</option>
        	<option data-value="110000" value="경남">경남</option>
        	<option data-value="111000" value="경북">경북</option>
        	<option data-value="112000" value="전남">전남</option>
        	<option data-value="113000" value="전북">전북</option>
        	<option data-value="114000" value="충북">충북</option>
        	<option data-value="115000" value="충남">충남</option>
        	<option data-value="116000" value="제주">제주</option>
        	<option data-value="118000" value="세종">세종</option>
        	
        </select>   
       </div>
       <div>
       <label>전공</label>

       		<select class="form-control" name="major" id="major" >
        	<option value="가공">가공</option>

        	<option value="가구디자인">가구디자인</option>
        	<option value="가스냉동">가스냉동</option>
        	<option value="가정">가정</option>
        	<option value="가정경제">가정경제</option>
        	<option value="가정과교육">가정과교육</option>
        	<option value="가정관리학">가정관리학</option>
        	<option value="가정복지">가정복지</option>
        	<option value="가정의학">가정의학</option>
        	<option value="가정학">가정학</option>
        	<option value="가족관계">가족관계</option>
        	<option value="가축질병학">가축질병학</option>
        	<option value="가축학">가축학</option>
        	<option value="간호">간호</option>
        	<option value="간호교육">간호교육</option>
        	<option value="간호교육학">간호교육학</option>
        	<option value="건설경영학">건설경영학</option>
        	<option value="개발행정학">개발행정학</option>
        	<option value="경영">경영</option>
        	<option value="경제">경제</option>
        	<option value="고고미술학">고고미술학</option>
        	<option value="낙농학">낙농학</option>
        	<option value="내과">내과</option>
        	<option value="도시계획">도시계획</option>
        	<option value="도시공학">도시공학</option>
        	<option value="direct">직접입력</option>
        </select>
        	<input type="text" class="form-control" id="majorinput" name="major"/>
       
       </div>
       
       <div>
       <label>학위</label>
  		<input type="text"  class="form-control" placeholder="학위를 입력하세요" name="degree" id="degree" >
       
       </div>
       <div>
		 <c:import url="resume_date2.jsp"/>
         <select class="form-control" name="graduatecheck" id="graduatecheck" >
        	<option value="졸업여부">졸업여부</option>
        	<option value="졸업">졸업</option>
        	<option value="중퇴">중퇴</option>
        </select>
       </div>
       </div>
    </section>
    <section id="registerds">
    <h3>경력사항</h3>
    <div>
    <label for="workcheck">경력구분</label>&nbsp;
       <!-- <button class="btn btn-success" name="addcareer">경력 추가</button> -->
       <label class="radio-inline">
  		<input type="radio" name="workcheck" id="workcheck" value="신입">신입
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="workcheck" id="workcheck" value="경력">경력
		</label>
    </div>
    <hr>
    <div id="careeradd">        
        <label for="companyname">회사명</label>
        <input type="text" class="form-control" placeholder="회사명 입력" name="companyname" id="companyname" style="ime-mode:active">
    </div>
    <div>
         <label class="control-label">재직기간</label>
                    <input id="workterm" name="workterm" class="form-control" type="text" readonly/>

                <label class="control-label">~</label>
                    <input id="workterm2" name="workterm2" class="form-control" type="text" readonly/>
  		&nbsp;
		<select class="form-control" name="workcondition" id="workcondition" >
        	<option value="재직중">재직중</option>
        	<option value="퇴사">퇴사</option>
        </select>
	</div>
	<div>
	<label for="chargework">직종</label>
		<select class="form-control" name="chargework" id="chargework" >
        	<option value="급여관리">급여관리</option>
        	<option value="기획">기획</option>
        	<option value="전략기획">전략기획</option>
        	<option value="사업기획">사업기획</option>
        	<option value="사업제휴">사업제휴</option>
        	<option value="타당성분석">타당성분석</option>
        	<option value="MBA출신">MBA출신</option>
        	<option value="경영기획">경영기획</option>
        	<option value="조직관리">조직관리</option>
        	<option value="변화관리">변화관리</option>
        	<option value="경영혁신·PI">경영혁신·PI</option>
        	<option value="출판기획">출판기획</option>
        	<option value="인수·합병">인수·합병</option>
        	<option value="COO">COO</option>
        	<option value="CEO">CEO</option>
        	<option value="기획조사">기획조사</option>
        	<option value="자산관리">자산관리</option>
        	<option value="특허업무">특허업무</option>
        	<option value="법무">법무</option>
        	<option value="총무">총무</option>
        	<option value="사무">사무</option>
        	<option value="인허가업무">인허가업무</option>
        	<option value="저작권관리">저작권관리</option>
        	<option value="수행비서">수행비서</option>
        	<option value="PR">PR</option>
        	<option value="direct">직접입력</option>
        </select>
        	<input type="text" class="form-control" id="chargeworkinput" name="chargework"/>
        
    </div>
    	
    <div>
    <label for="jobgrade">직급</label>
    <select class="form-control" name="jobgrade" id="jobgrade" >
        	<option value="관리관">관리관</option>

        	<option value="교정관">교정관</option>
        	<option value="인쇄담당(5급상당)">인쇄담당(5급상당)</option>
        	<option value="대리">대리</option>
        	<option value="사원">사원</option>
        	<option value="과장">과장</option>
        	<option value="사장">사장</option>
        	<option value="부장">부장</option>
        	<option value="이사">이사</option>
        	<option value="전무">전무</option>
        	<option value="계약직">계약직</option>
        	<option value="의료기사(6급상당)">의료기사(6급상당)</option>
        	<option value="위원(3급상당)">위원(3급상당)</option>
        	<option value="COO">COO</option>
        	<option value="CEO">CEO</option>
        	
        	<option value="direct">직접입력</option>
        </select>
        	<input type="text" class="form-control" id="jobgradeinput" name="jobgrade"/>
        
   </div>
   </section>

   <button type="button" id="certification" class="btn btn-success" value="자격증">자격증</button>
   <section id="registerds1">
   <div id="certificationtype" >
   
   <h3>자격증</h3>

      
   <input type="hidden" class="form-control" name="certificationtype" id="certificationtype" value="자격증/면허증">
         <label for="lName">자격증명</label>

         <select class="form-control" name="lName" id="lName" >
        	<option value="기계기술사">기계기술사</option>
        	<option value="모터그레이더운전기능사">모터그레이더운전기능사</option>
        	<option value="롤러운전기능사">롤러운전기능사</option>
        	<option value="로더운전기능사">로더운전기능사</option>
        	<option value="불도저운전기능사">불도저운전기능사</option>
        	<option value="굴삭기운전기능사">굴삭기운전기능사</option>
        	<option value="기중기운전기능사">기중기운전기능사</option>
        	<option value="건설기계정비산업기사">건설기계정비산업기사</option>
        	<option value="기중기운전기능사">기중기운전기능사</option>
        	<option value="건설기계정비산업기사">건설기계정비산업기사</option>
        	<option value="자동차차체수리기능사">자동차차체수리기능사</option>
        	<option value="철도차량기사">철도차량기사</option>
        	<option value="보일러기능사">보일러기능사</option>
        	<option value="전자부품장착(SMT)기능사">전자부품장착(SMT)기능사</option>
        	<option value="기계조립기능사">기계조립기능사</option>
        	<option value="컴퓨터응용밀링기능사">컴퓨터응용밀링기능사</option>
        	<option value="차량기술사">차량기술사</option>
        	<option value="공조냉동기계산업기사">공조냉동기계산업기사</option>
        	<option value="일반기계기사">일반기계기사</option>
        	
        	<option value="direct">직접입력</option>
        </select>
        	<input type="text" class="form-control" id="lNameinput" name="lName"/>
        
    <div>    
        <label for="lInstitution">발행처/기관</label>
        <input type="text" class="form-control"  name="lInstitution" placeholder="발행처/기관을 입력하세요" id="lInstitution" style="ime-mode:active">
    </div>
    <div>
    	<c:import url="resume_date3.jsp"/>
    </div>
    </div>
   </section>
    
    &nbsp;
   <button type="button" id="langcertbt" class="btn btn-success" value="어학">어학</button>
    <section id="registerds2">
    <div id="langcert">
    <h3>어학시험</h3> 
    <input type="hidden"class="form-control" name="certificationtype" id="certificationtype" value="어학시험">
    <div> 
     
        <label for="language">언어</label>
         <select class="form-control" name="language" id="language" >
        	<option value="한국어">한국어</option>
        	<option value="중국어">중국어</option>
        	<option value="일본어">일본어</option>
        	<option value="네팔어">네팔어</option>
        	<option value="포르투갈어">포르투갈어</option>
        	<option value="라오스어">라오스어</option>
        	<option value="말레이어">말레이어</option>
        	<option value="몽골어">몽골어</option>
        	<option value="영어">영어</option>
        	<option value="독일어">독일어</option>
        	<option value="아랍어">아랍어</option>
        	<option value="스페인어">스페인어</option>
        	<option value="프랑스어">프랑스어</option>
        	
        	
        	<option value="direct">직접입력</option>
        </select>
        <input type="text" class="form-control" id="languageinput" name="language"/>
        
    </div>
     <div>
        <label for="institute">발행처/기관</label>
        <input type="text" class="form-control" placeholder="발행처/기관을 입력하세요" name="institute" id="institute" style="ime-mode:active">
     </div>
     <div>
     <label for="institute">시험종류</label>
     	<select class="form-control" name="langlicencename" id="langlicencename" >
        	<option value="OPIc">OPIc</option>
        	<option value="TEPS">TEPS</option>
        	<option value="TOEFL">TOEFL</option>
        	<option value="TOEIC">TOEIC</option>
        	<option value="SAT">SAT</option>
        	<option value="ACT">ACT</option>
        	<option value="GRE">GRE</option>
        	<option value="IELTS">IELTS</option>
        	<option value="NEAT">NEAT</option>
        	<option value="G-TELP">G-TELP</option>
        	<option value="TOSEL">TOSEL</option>
        	
        	
        	
        	<option value="direct">직접입력</option>
        </select>
        <input type="text" class="form-control" id="langlicencenameinput" name="langlicencename"/>
        
     </div> 
     <div>
        <label for="langpoint">점수</label>
        <input type="text" class="form-control" placeholder="점수를 입력하세요" name="langpoint" id="langpoint" style="ime-mode:active">
     </div>
     
     <div>
        <label for="langGrade">급수</label>
        <input type="text" class="form-control" placeholder="급수를 입력하세요" name="langGrade" id="langGrade" style="ime-mode:active">
     </div>
     <div>
     	<c:import url="resume_date4.jsp"/>             
	</div>
	</div>
	</section>
   <button type="button" id="awardbt" class="btn btn-success" value="수상내역">수상내역</button>
  
   <section id="registerds3">
    <div class="well" id="award">
     <h3>수상내역</h3>
      <label for="award">수상명</label>
        <input type="text" class="form-control"  name="award" id="award" style="ime-mode:active">
  </div>
  </section>
     &nbsp;
     <section id="registerds">
     <h3>자기소개서</h3>
      <div>	
    	<!-- <label for="introduce">자기소개서</label>
        <textarea class="form-control" rows="3"></textarea> -->
        
        <c:import url="/main/smarteditorTestjsp.do">
			<c:param name="name" value="introduce"></c:param>
		</c:import>
        
        
   </div>
   </section>
      &nbsp;
      <button type="button" id="hopeworkbt" class="btn btn-success" value="희망근무">희망근무</button>
      <section id="registerds4">
	 <div  id="hopework">
      <h3>희망근무 선택</h3>
      <div>
       
    	<label for="hopeworkform">근무형태</label>
    	<select class="form-control" name="hopeworkform" id="hopeworkform" >
        	<option value="근무형태 선택">근무형태 선택</option>
        	<option value="정규직">정규직</option>
        	<option value="교육생 (정규직 전환가능)">교육생</option>
        	<option value="별정직">별정직</option>
        	<option value="파트">파트</option>
        	<option value="전임">전임</option>
        	<option value="계약직 (정규직 전환가능)">계약직</option>
        	<option value="병역특례">병역특례</option>
        	<option value="인턴직 (정규직 전환가능)">인턴직</option>
        	<option value="아르바이트">아르바이트</option>
        	<option value="파견직">파견직</option>
        	<option value="해외취업">해외취업</option>
        	<option value="위촉직">위촉직</option>
        	<option value="프리랜서">프리랜서</option>
        </select>
       </div> 
       <div>
    	<label for="hopepay">희망연봉</label>
    	<select class="form-control" name="hopepay" id="hopepay" >
        	<option value="회사내규에 따름">회사내규에 따름</option>
        	<option value="1400만원이하">1400만원이하</option>
        	<option value="1400~1600만원">1400~1600만원</option>
        	<option value="1600~1800만원">1600~1800만원</option>
        	<option value="1800~2000만원">1800~2000만원</option>
        	<option value="2000~2200만원">2000~2200만원</option>
        	<option value="2200~2400만원">2200~2400만원</option>
        	<option value="2400~2600만원">2400~2600만원</option>
        	<option value="2600~2800만원">2600~2800만원</option>
        	<option value="2800~3000만원">2800~3000만원</option>
        	<option value="3000~4000만원">3000~4000만원</option>
        	<option value="4000~5000만원">4000~5000만원</option>
        	<option value="5000~6000만원">5000~6000만원</option>
        	<option value="6000~7000만원">6000~7000만원</option>
        	<option value="7000~8000만원">7000~8000만원</option>
        	<option value="8000~9000만원">8000~9000만원</option>
        	<option value="9000~1억원">9000~1억원</option>
        	<option value="면접 후 결정">면접 후 결정</option>
        	
        </select>
       </div>
       
       <h3>희망근무지역</h3>
       <div>
       <table>
      <tr>
				<th>지역</th>
								<td>
									<select class="custom-select my-1 mr-sm-2 FST" name="localCode" id="locationSiDo">
										<option>시/도</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="localCode2" id="locationGugun">
										<option>구/군</option>
										<option>먼저 시/도를 선택하세요</option>
									</select>
								</td>
								</tr>
					</table>
        </div>
        
        <div>
        <table>
       <tr>
								<th>직종</th>
								<td colspan="1">
									<select class="custom-select my-1 FST" name="firstCode" id="selectFirst">
										<option>1차 직종</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="secondCode" id="selectSecond">
										<option>2차 직종</option>
										<option>먼저 1차 직종을 선택하세요</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="thirdCode" id="selectThird">
										<option>3차 직종</option>
										<option>먼저 2차 직종을 선택하세요</option>
									</select>
								</td>
								<th>업종</th>
								<td colspan="2">
									<select class="custom-select my-1 FST" name="btypeCode1" id="selectBtype1">
										<option>1차 업종</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="btypeCode2" id="selectBtype2">
										<option>2차 업종</option>
										<option>먼저 1차 업종을 선택하세요</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="btypeCode3" id="selectBtype3">
										<option>3차 업종</option>
										<option>먼저 2차 업종을 선택하세요</option>
									</select>
								</td>
							</tr>
							</table>
							
        </div>
        <div>
        <label for="hopeworkdate">근무일시</label>
        <select class="form-control" name="hopeworkdate" id="hopeworkdate" >
        	<option value="09시~06시">09시~06시</option>
        	<option value="10시~06시">10시~06시</option>
        	<option value="자율근무제">자율근무제</option>
        </select>
        </div>
        </div>
        </section>
        
        
   &nbsp;
    <div id="companycheck">
    <label>기업 인사담당자의 입사제의 및 면접제의를 받으시겠어요?</label>
    <label class="radio-inline">
    	
  		<input type="radio" name="opencheck" id="opencheck" value="Y">공개
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="opencheck" id="opencheck" value="N">비공개
	</label>
    </div>
    <br>
   
    
    </fieldset>
     <input class="btn btn-success" type="submit" value="이력서 저장">
    </form>
    
</div>  
</div> 
  
</article>

<%@include file="../main/inc/bottom.jsp" %>
      