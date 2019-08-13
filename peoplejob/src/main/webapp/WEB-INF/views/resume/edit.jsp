<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/inc/top.jsp" %>
    <style type="text/css">
.divForm {
    width: 900px;
    margin: 0 auto;
    background: white;
    padding: 13px;
}
#editdiv {
    background: #f2f4f7;
}
</style>

<style type="text/css">
.divForm {
    width: 1153px;
    height: 110%;
    margin: 0 auto;
    background: #f2f4f7;
    padding: 13px;
}
#editdiv {
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
input[type="submit"] {
    margin-left: 1653px;
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
input.btn.btn-register {
    margin-left: 10px;
}
select#infobox {
    height: 33px;
}
select#locationSiDo {
    height: 30px;
}
select#locationGugun {
    height: 30px;
}
.image {
    background: white;
    margin: 12px;
    padding: 20px;
}
input.btn.btn-success {
   
    margin-left: 1022px;
}
p.lead.mb-7 {
    font-weight: bold;
}
h2.mb-5 {
    color: green;
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
select.ui-datepicker-year {
    color: black;
}
</style>
<script type="text/javascript">
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

		
	
	
	
	$('textarea[name="introduce"]').html('${vo.introduce}');
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
		if(idx==0){
			var chEl=$("<option value='0'>희망근무조건</option>")
			var opEl=$("<option value='"+item.hopeworkCode+"'></option>");
			opEl.append(item.hopeworkform);
			$("#hopeworkform").html(chEl);
			$("#hopeworkform").append(opEl); 
		}else{
			var opEl=$("<option value='"+item.hopeworkCode+"'></option>");
			opEl.append(item.hopeworkform);
			$("#hopeworkform").append(opEl); 
		}
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address').value = fullRoadAddr;
			}
		}).open();
	}
</script>
<article>
<div id="editdiv">
<div class="divForm">
<form name="frm2" method="post" 
	action="<c:url value='/resume/edit.do'/>" enctype="multipart/form-data">
<fieldset>
	<legend style="font-weight: bold">이력서수정</legend>
	<!-- hidden필드에 no 넣기 -->
		<input type="hidden" name="resumeCode" value="${param.resumeCode}" />
		<input type="hidden" name="memberCode" value="${vo1.memberCode}" />
		<input type="hidden" name="langlicenceCode" value="${vo5.langlicenceCode}">
		<input type="hidden" name="lNo" value="${vo6.lNo}">
		<input type="hidden" name="dvCode" value="${vo4.dvCode}">
		<input type="hidden" name="academicCode" value="${vo3.academicCode}">
		<input type="hidden" name="hopeworkCode" value="${vo2.hopeworkCode}">
		<div class="image">
		<!--이력서 사진 https://kuzuro.blogspot.com/2018/10/11.html  -->
		 <div id="imgDiv">
		  <label for="picture">이력서 사진</label>
 		 <input type="file" id="gdsImg" name="file" />    
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
		 <c:if test="${!empty vo.picture }">
	            <br>
	           <span class="sp1"></span>
	            <span style="color:green;font-weight: bold">
	            	※ 첨부파일을 새로 지정할 경우 기존 파일 ${fileInfo }은 삭제됩니다.
	            	</span>
	       </c:if>
		  <div class="select_img"><img src="" /></div>
	            
            
	            <input type="hidden" name="oldFileName" value="${vo.picture}" />
            </div>
	       
        </div>
       
 
		
		<section id="registerds" >
	<div>        
        <h3>이력서 제목</h3>
        <input type="text" class="form-control" placeholder="이력서 제목을 입력하세요" name="resumeTitle" id="infobox" value="${vo.resumeTitle }"  style="ime-mode:active">
    </div>
    <hr>
    <h3>기본정보</h3>
    <div>        
        <label for="membername">이름</label>
        <input type="text" class="form-control"  name="membername" id="infobox" value="${vo1.membername }" style="ime-mode:active">
    </div>
    <input type="hidden" id="picture" name="picture" />
    <div>        
        <label for="birth">생년월일</label>
        <input type="text" class="form-control"  name="birth" id="infobox" value="${vo1.birth}" style="ime-mode:active">
    	
    </div>
    
   
    <div>
        <label for="email">이메일 주소</label>
        <input type="text" class="form-control"  name="email"  id="infobox" value="${vo1.email }" title="이메일주소 앞자리">
    </div>
    
    <div>
        <label for="address">주소</label>
        <input type="text" class="form-control"  name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80" value="${vo1.zipcode}">
        
       <div class="row">
		&nbsp;<input type="button" value="우편번호 찾기" class="btn btn-register"
	onclick="execDaumPostcode()">
									</div>
        <br />
        <span class="sp1">&nbsp;</span>
        <input type="text"  class="form-control" id="address" name="address" value="${vo1.address }" ReadOnly title="주소"  class="width_350"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text"  class="form-control" id="infobox" name="addressdetail" value="${vo1.addressdetail }" title="상세주소"  class="width_350">
    </div>
    <div>
        <label for="tel">핸드폰</label>&nbsp;
       
        <input type="text"  class="form-control"   name="tel" id="infobox" value="${vo1.tel}" maxlength="12" title="휴대폰 번호"
        	class="width_80">
    </div>
    </section>
    <section id="registerds">
    <h3>학력사항</h3>
    <div>
        <label for="education">학력사항</label>&nbsp;
       
       
       <label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="초등학교졸업" <c:if test="${vo3.graduatetype=='초등학교졸업'}">            	
            		checked="checked"
            	</c:if>> 초등학교졸업
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="중학교졸업" <c:if test="${vo3.graduatetype=='중학교졸업'}">            	
            		checked="checked"
            	</c:if>> 중학교졸업
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="고등학교졸업" <c:if test="${vo3.graduatetype=='고등학교졸업'}">            	
            		checked="checked"
            	</c:if>> 고등학교졸업
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="대학졸업 (2,3년)" <c:if test="${vo3.graduatetype=='대학졸업 (2,3년)'}">            	
            		checked="checked"
            	</c:if>> 대학졸업 (2,3년)
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="대학교졸업 (4년)" <c:if test="${vo3.graduatetype=='대학교졸업 (4년)'}">            	
            		checked="checked"
            	</c:if>> 대학교졸업 (4년)
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="석사졸업이상" <c:if test="${vo3.graduatetype=='석사졸업이상'}">            	
            		checked="checked"
            	</c:if>> 석사졸업이상
		</label>
		<hr>
	</div>
		
		<div>
		 <label for="element">학교명</label>&nbsp;
			    
        <input type="text"  class="form-control" placeholder="학교명을 입력"  name="schoolname" id="infobox" 
        	class="width_80" value=${vo3.schoolname }>
        </div>
        <div>
		 <label for="schoollocal">지역</label>&nbsp;
			<select class="form-control" name="schoollocal" id="infobox" >
        	<option value="서울" <c:if test="${vo3.schoollocal=='서울'}">            	
            		selected="selected"
            	</c:if>>서울</option>
        	<option value="경기" <c:if test="${vo3.schoollocal=='경기'}">            	
            		selected="selected"
            	</c:if>>경기</option>
        	<option value="광주" <c:if test="${vo3.schoollocal=='광주'}">            	
            		selected="selected"
            	</c:if>>광주</option>
        	<option value="대구" <c:if test="${vo3.schoollocal=='대구'}">            	
            		selected="selected"
            	</c:if>>대구</option>
        	<option value="대전" <c:if test="${vo3.schoollocal=='대전'}">            	
            		selected="selected"
            	</c:if>>대전</option>
        	<option value="부산" <c:if test="${vo3.schoollocal=='부산'}">            	
            		selected="selected"
            	</c:if>>부산</option>
        	<option value="울산" <c:if test="${vo3.schoollocal=='울산'}">            	
            		selected="selected"
            	</c:if>>울산</option>
        	<option value="인천" <c:if test="${vo3.schoollocal=='인천'}">            	
            		selected="selected"
            	</c:if>>인천</option>
        	<option value="강원" <c:if test="${vo3.schoollocal=='강원'}">            	
            		selected="selected"
            	</c:if>>강원</option>
        	<option value="경남" <c:if test="${vo3.schoollocal=='경남'}">            	
            		selected="selected"
            	</c:if>>경남</option>
        	<option value="경북" <c:if test="${vo3.schoollocal=='경북'}">            	
            		selected="selected"
            	</c:if>>경북</option>
        	<option value="전남" <c:if test="${vo3.schoollocal=='전남'}">            	
            		selected="selected"
            	</c:if>>전남</option>
        	<option value="전북" <c:if test="${vo3.schoollocal=='전북'}">            	
            		selected="selected"
            	</c:if>>전북</option>
        	<option value="충북" <c:if test="${vo3.schoollocal=='충북'}">            	
            		selected="selected"
            	</c:if>>충북</option>
        	<option value="충남" <c:if test="${vo3.schoollocal=='충남'}">            	
            		selected="selected"
            	</c:if>>충남</option>
        	<option value="제주" <c:if test="${vo3.schoollocal=='제주'}">            	
            		selected="selected"
            	</c:if>>제주</option>
        	<option value="세종" <c:if test="${vo3.schoollocal=='세종'}">            	
            		selected="selected"
            	</c:if>>세종</option>
        	
        </select>   
       </div>
       <div>
     <label>전공</label>

       		<select class="form-control" name="major" id="major" >
        	<option value="전공" <c:if test="${vo3.major=='전공'}">            	
            		selected="selected"
            	</c:if>>전공</option>
        	<option value="가공" <c:if test="${vo3.major=='가공'}">            	
            		selected="selected"
            	</c:if>>가공</option>

        	<option value="가구디자인" <c:if test="${vo3.major=='가구디자인'}">            	
            		selected="selected"
            	</c:if>>가구디자인</option>
        	<option value="가스냉동" <c:if test="${vo3.major=='가스냉동'}">            	
            		selected="selected"
            	</c:if>>가스냉동</option>
        	<option value="가정" <c:if test="${vo3.major=='가정'}">            	
            		selected="selected"
            	</c:if>>가정</option>
        	<option value="가정경제" <c:if test="${vo3.major=='가정경제'}">            	
            		selected="selected"
            	</c:if>>가정경제</option>
        	<option value="가정과교육" <c:if test="${vo3.major=='가정과교육'}">            	
            		selected="selected"
            	</c:if>>가정과교육</option>
        	<option value="가정관리학" <c:if test="${vo3.major=='가정관리학'}">            	
            		selected="selected"
            	</c:if>>가정관리학</option>
        	<option value="가정복지" <c:if test="${vo3.major=='가정복지'}">            	
            		selected="selected"
            	</c:if>>가정복지</option>
        	<option value="가정의학" <c:if test="${vo3.major=='가정의학'}">            	
            		selected="selected"
            	</c:if>>가정의학</option>
        	<option value="가정학" <c:if test="${vo3.major=='가정학'}">            	
            		selected="selected"
            	</c:if>>가정학</option>
        	<option value="가족관계" <c:if test="${vo3.major=='가족관계'}">            	
            		selected="selected"
            	</c:if>>가족관계</option>
        	<option value="가축질병학" <c:if test="${vo3.major=='가축질병학'}">            	
            		selected="selected"
            	</c:if>>가축질병학</option>
        	<option value="가축학" <c:if test="${vo3.major=='가축학'}">            	
            		selected="selected"
            	</c:if>>가축학</option>
        	<option value="간호" <c:if test="${vo3.major=='간호'}">            	
            		selected="selected"
            	</c:if>>간호</option>
        	<option value="간호교육" <c:if test="${vo3.major=='간호교육'}">            	
            		selected="selected"
            	</c:if>>간호교육</option>
        	<option value="간호교육학" <c:if test="${vo3.major=='간호교육학'}">            	
            		selected="selected"
            	</c:if>>간호교육학</option>
        	<option value="건설경영학" <c:if test="${vo3.major=='건설경영학'}">            	
            		selected="selected"
            	</c:if>>건설경영학</option>
        	<option value="개발행정학" <c:if test="${vo3.major=='개발행정학'}">            	
            		selected="selected"
            	</c:if>>개발행정학</option>
        	<option value="경영" <c:if test="${vo3.major=='경영'}">            	
            		selected="selected"
            	</c:if>>경영</option>
        	<option value="경제" <c:if test="${vo3.major=='경제'}">            	
            		selected="selected"
            	</c:if>>경제</option>
        	<option value="고고미술학" <c:if test="${vo3.major=='고고미술학'}">            	
            		selected="selected"
            	</c:if>>고고미술학</option>
        	<option value="낙농학" <c:if test="${vo3.major=='낙농학'}">            	
            		selected="selected"
            	</c:if>>낙농학</option>
        	<option value="내과" <c:if test="${vo3.major=='내과'}">            	
            		selected="selected"
            	</c:if>>내과</option>
        	<option value="도시계획" <c:if test="${vo3.major=='도시계획'}">            	
            		selected="selected"
            	</c:if>>도시계획</option>
        	<option value="도시공학" <c:if test="${vo3.major=='도시공학'}">            	
            		selected="selected"
            	</c:if>>도시공학</option>
        	<option value="direct" <c:if test="${vo3.major=='direct'}">            	
            		selected="selected"
            	</c:if>>직접입력</option>
        </select>
        	<input type="text" class="form-control" id="majorinput" name="major" value="${vo3.major }"/>
       
       </div>
       <div>
       <label>학위</label>
  		<input type="text"  class="form-control"  name="degree" id="degree"value="${vo3.degree }" >
       
       </div>
       <div>
		 <label for="graduate">졸업년도</label>&nbsp;
		 <c:import url="resume_date2.jsp"/>
         <select class="form-control" name="graduatecheck" id="infobox" >
        	<option value="졸업여부" <c:if test="${vo3.graduatecheck=='졸업여부'}">            	
            		selected="selected"
            	</c:if>>졸업여부</option>
        	<option value="졸업" <c:if test="${vo3.graduatecheck=='졸업'}">            	
            		selected="selected"
            	</c:if>>졸업</option>
        	<option value="중퇴" <c:if test="${vo3.graduatecheck=='중퇴'}">            	
            		selected="selected"
            	</c:if>>중퇴</option>
        </select>
       </div>
       </section>	
    <section id="registerds">
    <h3>경력사항</h3>
    <div>
    <label for="workcheck">경력구분</label>&nbsp;
       
       <label class="radio-inline">
  		<input type="radio" name="workcheck" id="infobox" value="신입" <c:if test="${vo4.workcheck=='신입'}">            	
            		checked="checked"
            	</c:if>>신입
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="workcheck" id="infobox" value="경력" <c:if test="${vo4.workcheck=='경력'}">            	
            		checked="checked"
            	</c:if>>경력
		</label>
    </div>
    <hr>
    <div>        
        <label for="companyname">회사명</label>
        <input type="text" class="form-control" placeholder="회사명 입력" name="companyname" value="${vo4.companyname }" id="infobox" style="ime-mode:active">
    </div>
    <div>
        <label for="workterm">근무기간</label>
		<input type="text" class="form-control" name="workterm" value="${vo4.workterm }" id="infobox">~ 
  		<input type="text" class="form-control" name="workterm2" value="${vo4.workterm2 }" id="infobox">
  		&nbsp;
		<select class="form-control" name="workcondition" id="infobox" >
        	<option value="재직중" <c:if test="${vo4.workcondition=='재직중'}">            	
            		selected="selected"
            	</c:if>>재직중</option>
        	<option value="퇴사" <c:if test="${vo4.workcondition=='퇴사'}">            	
            		selected="selected"
            	</c:if>>퇴사</option>
        </select>
	</div>
	<div>
    <label for="chargework">직종</label>
		<select class="form-control" name="chargework" id="chargework" >
        	<option value="직종" <c:if test="${vo4.chargework=='직종'}">            	
            		selected="selected"
            	</c:if>>직종</option>
        	<option value="급여관리" <c:if test="${vo4.chargework=='급여관리'}">            	
            		selected="selected"
            	</c:if>>급여관리</option>
        	<option value="기획" <c:if test="${vo4.chargework=='기획'}">            	
            		selected="selected"
            	</c:if>>기획</option>
        	<option value="전략기획" <c:if test="${vo4.chargework=='전략기획'}">            	
            		selected="selected"
            	</c:if>>전략기획</option>
        	<option value="사업기획" <c:if test="${vo4.chargework=='사업기획'}">            	
            		selected="selected"
            	</c:if>>사업기획</option>
        	<option value="사업제휴" <c:if test="${vo4.chargework=='사업제휴'}">            	
            		selected="selected"
            	</c:if>>사업제휴</option>
        	<option value="타당성분석" <c:if test="${vo4.chargework=='타당성분석'}">            	
            		selected="selected"
            	</c:if>>타당성분석</option>
        	<option value="MBA출신" <c:if test="${vo4.chargework=='MBA출신'}">            	
            		selected="selected"
            	</c:if>>MBA출신</option>
        	<option value="경영기획" <c:if test="${vo4.chargework=='경영기획'}">            	
            		selected="selected"
            	</c:if>>경영기획</option>
        	<option value="조직관리" <c:if test="${vo4.chargework=='조직관리'}">            	
            		selected="selected"
            	</c:if>>조직관리</option>
        	<option value="변화관리" <c:if test="${vo4.chargework=='변화관리'}">            	
            		selected="selected"
            	</c:if>>변화관리</option>
        	<option value="경영혁신·PI" <c:if test="${vo4.chargework=='경영혁신·PI'}">            	
            		selected="selected"
            	</c:if>>경영혁신·PI</option>
        	<option value="출판기획" <c:if test="${vo4.chargework=='출판기획'}">            	
            		selected="selected"
            	</c:if>>출판기획</option>
        	<option value="인수·합병" <c:if test="${vo4.chargework=='인수·합병'}">            	
            		selected="selected"
            	</c:if>>인수·합병</option>
        	<option value="COO" <c:if test="${vo4.chargework=='COO'}">            	
            		selected="selected"
            	</c:if>>COO</option>
        	<option value="CEO" <c:if test="${vo4.chargework=='CEO'}">            	
            		selected="selected"
            	</c:if>>CEO</option>
        	<option value="기획조사" <c:if test="${vo4.chargework=='기획조사'}">            	
            		selected="selected"
            	</c:if>>기획조사</option>
        	<option value="자산관리" <c:if test="${vo4.chargework=='자산관리'}">            	
            		selected="selected"
            	</c:if>>자산관리</option>
        	<option value="특허업무" <c:if test="${vo4.chargework=='특허업무'}">            	
            		selected="selected"
            	</c:if>>특허업무</option>
        	<option value="법무" <c:if test="${vo4.chargework=='법무'}">            	
            		selected="selected"
            	</c:if>>법무</option>
        	<option value="총무" <c:if test="${vo4.chargework=='총무'}">            	
            		selected="selected"
            	</c:if>>총무</option>
        	<option value="사무" <c:if test="${vo4.chargework=='사무'}">            	
            		selected="selected"
            	</c:if>>사무</option>
        	<option value="인허가업무" <c:if test="${vo4.chargework=='인허가업무'}">            	
            		selected="selected"
            	</c:if>>인허가업무</option>
        	<option value="저작권관리" <c:if test="${vo4.chargework=='저작권관리'}">            	
            		selected="selected"
            	</c:if>>저작권관리</option>
        	<option value="수행비서" <c:if test="${vo4.chargework=='수행비서'}">            	
            		selected="selected"
            	</c:if>>수행비서</option>
        	<option value="PR" <c:if test="${vo4.chargework=='PR'}">            	
            		selected="selected"
            	</c:if>>PR</option>
        	<option value="direct" <c:if test="${vo4.chargework=='direct'}">            	
            		selected="selected"
            	</c:if>>직접입력</option>
        </select>
        	<input type="text" class="form-control" id="chargeworkinput" name="chargework" value="${vo4.chargework }"/>
        
    </div>	
    <div>
      <label for="jobgrade">직급</label>
    <select class="form-control" name="jobgrade" id="jobgrade" >
        	<option value="직급" <c:if test="${vo4.chargework=='직급'}">            	
            		selected="selected"
            	</c:if>>직급</option>
        	<option value="관리관" <c:if test="${vo4.chargework=='관리관'}">            	
            		selected="selected"
            	</c:if>>관리관</option>

        	<option value="교정관" <c:if test="${vo4.chargework=='교정관'}">            	
            		selected="selected"
            	</c:if>>교정관</option>
        	<option value="인쇄담당(5급상당)" <c:if test="${vo4.chargework=='인쇄담당(5급상당)'}">            	
            		selected="selected"
            	</c:if>>인쇄담당(5급상당)</option>
        	<option value="대리" <c:if test="${vo4.chargework=='대리'}">            	
            		selected="selected"
            	</c:if>>대리</option>
        	<option value="사원" <c:if test="${vo4.chargework=='사원'}">            	
            		selected="selected"
            	</c:if>>사원</option>
        	<option value="과장" <c:if test="${vo4.chargework=='과장'}">            	
            		selected="selected"
            	</c:if>>과장</option>
        	<option value="사장" <c:if test="${vo4.chargework=='사장'}">            	
            		selected="selected"
            	</c:if>>사장</option>
        	<option value="부장" <c:if test="${vo4.chargework=='부장'}">            	
            		selected="selected"
            	</c:if>>부장</option>
        	<option value="이사" <c:if test="${vo4.chargework=='이사'}">            	
            		selected="selected"
            	</c:if>>이사</option>
        	<option value="전무" <c:if test="${vo4.chargework=='전무'}">            	
            		selected="selected"
            	</c:if>>전무</option>
        	<option value="계약직" <c:if test="${vo4.chargework=='계약직'}">            	
            		selected="selected"
            	</c:if>>계약직</option>
        	<option value="의료기사(6급상당)" <c:if test="${vo4.chargework=='의료기사(6급상당)'}">            	
            		selected="selected"
            	</c:if>>의료기사(6급상당)</option>
        	<option value="위원(3급상당)" <c:if test="${vo4.chargework=='위원(3급상당)'}">            	
            		selected="selected"
            	</c:if>>위원(3급상당)</option>
        	<option value="COO" <c:if test="${vo4.chargework=='COO'}">            	
            		selected="selected"
            	</c:if>>COO</option>
        	<option value="CEO" <c:if test="${vo4.chargework=='CEO'}">            	
            		selected="selected"
            	</c:if>>CEO</option>
        	
        	<option value="direct" <c:if test="${vo4.chargework=='direct'}">            	
            		selected="selected"
            	</c:if>>직접입력</option>
        </select>
        	<input type="text" class="form-control" id="jobgradeinput" name="jobgrade" value="${vo4.jobgrade }"/>
        
   </div>
  </section>
   

<button type="button" id="certification" class="btn btn-success" value="자격증">자격증</button>
   
   &nbsp;&nbsp;
   <section id="registerds1">
   <div id="certificationtype">
     
   <h3>자격증/면허증</h3>
     <div>
     <input class="form-control" name="certificationtype" id="certificationtype" value="자격증/면허증">
      <label for="lName">자격증명</label>

         <select class="form-control" name="lName" id="lName" >
        	<option value="자격증명" <c:if test="${vo6.lName=='자격증명'}">            	
            		selected="selected"
            	</c:if>>자격증명</option>
        	<option value="기계기술사" <c:if test="${vo6.lName=='기계기술사'}">            	
            		selected="selected"
            	</c:if>>기계기술사</option>
        	<option value="모터그레이더운전기능사" <c:if test="${vo6.lName=='모터그레이더운전기능사'}">            	
            		selected="selected"
            	</c:if>>모터그레이더운전기능사</option>
        	<option value="롤러운전기능사" <c:if test="${vo6.lName=='롤러운전기능사'}">            	
            		selected="selected"
            	</c:if>>롤러운전기능사</option>
        	<option value="로더운전기능사" <c:if test="${vo6.lName=='로더운전기능사'}">            	
            		selected="selected"
            	</c:if>>로더운전기능사</option>
        	<option value="불도저운전기능사" <c:if test="${vo6.lName=='불도저운전기능사'}">            	
            		selected="selected"
            	</c:if>>불도저운전기능사</option>
        	<option value="굴삭기운전기능사" <c:if test="${vo6.lName=='굴삭기운전기능사'}">            	
            		selected="selected"
            	</c:if>>굴삭기운전기능사</option>
        	<option value="기중기운전기능사" <c:if test="${vo6.lName=='기중기운전기능사'}">            	
            		selected="selected"
            	</c:if>>기중기운전기능사</option>
        	<option value="건설기계정비산업기사" <c:if test="${vo6.lName=='건설기계정비산업기사'}">            	
            		selected="selected"
            	</c:if>>건설기계정비산업기사</option>
        	<option value="기중기운전기능사" <c:if test="${vo6.lName=='기중기운전기능사'}">            	
            		selected="selected"
            	</c:if>>기중기운전기능사</option>
        	<option value="건설기계정비산업기사" <c:if test="${vo6.lName=='건설기계정비산업기사'}">            	
            		selected="selected"
            	</c:if>>건설기계정비산업기사</option>
        	<option value="자동차차체수리기능사" <c:if test="${vo6.lName=='자동차차체수리기능사'}">            	
            		selected="selected"
            	</c:if>>자동차차체수리기능사</option>
        	<option value="철도차량기사" <c:if test="${vo6.lName=='철도차량기사'}">            	
            		selected="selected"
            	</c:if>>철도차량기사</option>
        	<option value="보일러기능사" <c:if test="${vo6.lName=='보일러기능사'}">            	
            		selected="selected"
            	</c:if>>보일러기능사</option>
        	<option value="전자부품장착(SMT)기능사" <c:if test="${vo6.lName=='전자부품장착(SMT)기능사'}">            	
            		selected="selected"
            	</c:if>>전자부품장착(SMT)기능사</option>
        	<option value="기계조립기능사" <c:if test="${vo6.lName=='기계조립기능사'}">            	
            		selected="selected"
            	</c:if>>기계조립기능사</option>
        	<option value="컴퓨터응용밀링기능사" <c:if test="${vo6.lName=='컴퓨터응용밀링기능사'}">            	
            		selected="selected"
            	</c:if>>컴퓨터응용밀링기능사</option>
        	<option value="차량기술사" <c:if test="${vo6.lName=='차량기술사'}">            	
            		selected="selected"
            	</c:if>>차량기술사</option>
        	<option value="공조냉동기계산업기사" <c:if test="${vo6.lName=='공조냉동기계산업기사'}">            	
            		selected="selected"
            	</c:if>>공조냉동기계산업기사</option>
        	<option value="일반기계기사" <c:if test="${vo6.lName=='일반기계기사'}">            	
            		selected="selected"
            	</c:if>>일반기계기사</option>
        	
        	<option value="direct" <c:if test="${vo6.lName=='direct'}">            	
            		selected="selected"
            	</c:if>>직접입력</option>
        </select>
        	<input type="text" class="form-control" id="lNameinput" name="lName" value="${vo6.lName}"/>
        
    </div>
    <div>    
        <label for="lInstitution">발행처/기관</label>
        <input type="text" class="form-control"  name="lInstitution" id="lInstitution" value="${vo6.lInstitution }" style="ime-mode:active">
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
    <div>	
    <input class="form-control" name="certificationtype" id="certificationtype" value="어학시험">
        <label for="language">언어</label>
         <select class="form-control" name="language" id="language" >
        	<option value="언어" <c:if test="${vo5.language=='언어'}">            	
            		selected="selected"
            	</c:if>>언어</option>
        	<option value="한국어" <c:if test="${vo5.language=='한국어'}">            	
            		selected="selected"
            	</c:if>>한국어</option>
        	<option value="중국어" <c:if test="${vo5.language=='중국어'}">            	
            		selected="selected"
            	</c:if>>중국어</option>
        	<option value="일본어" <c:if test="${vo5.language=='일본어'}">            	
            		selected="selected"
            	</c:if>>일본어</option>
        	<option value="네팔어" <c:if test="${vo5.language=='네팔어'}">            	
            		selected="selected"
            	</c:if>>네팔어</option>
        	<option value="포르투갈어" <c:if test="${vo5.language=='포르투갈어'}">            	
            		selected="selected"
            	</c:if>>포르투갈어</option>
        	<option value="라오스어" <c:if test="${vo5.language=='라오스어'}">            	
            		selected="selected"
            	</c:if>>라오스어</option>
        	<option value="말레이어" <c:if test="${vo5.language=='말레이어'}">            	
            		selected="selected"
            	</c:if>>말레이어</option>
        	<option value="몽골어" <c:if test="${vo5.language=='몽골어'}">            	
            		selected="selected"
            	</c:if>>몽골어</option>
        	<option value="영어" <c:if test="${vo5.language=='영어'}">            	
            		selected="selected"
            	</c:if>>영어</option>
        	<option value="독일어" <c:if test="${vo5.language=='독일어'}">            	
            		selected="selected"
            	</c:if>>독일어</option>
        	<option value="아랍어" <c:if test="${vo5.language=='아랍어'}">            	
            		selected="selected"
            	</c:if>>아랍어</option>
        	<option value="스페인어" <c:if test="${vo5.language=='스페인어'}">            	
            		selected="selected"
            	</c:if>>스페인어</option>
        	<option value="프랑스어" <c:if test="${vo5.language=='프랑스어'}">            	
            		selected="selected"
            	</c:if>>프랑스어</option>
        	
        	
        	<option value="direct" <c:if test="${vo5.language=='direct'}">            	
            		selected="selected"
            	</c:if>>직접입력</option>
        </select>
        <input type="text" class="form-control" id="languageinput" name="language" value="${vo5.language }"/>
        
    </div>
     <div>
        <label for="institute">발행처/기관</label>
        <input type="text" class="form-control"  name="institute" id="institute" value="${vo5.institute }" style="ime-mode:active">
     </div>
     <div>
       <label for="institute">시험종류</label>
     	<select class="form-control" name="langlicencename" id="langlicencename" >
        	<option value="시험종류" <c:if test="${vo5.langlicencename=='시험종류'}">            	
            		selected="selected"
            	</c:if>>OPIc</option>
        	<option value="OPIc" <c:if test="${vo5.langlicencename=='OPIc'}">            	
            		selected="selected"
            	</c:if>>OPIc</option>
        	<option value="TEPS" <c:if test="${vo5.langlicencename=='TEPS'}">            	
            		selected="selected"
            	</c:if>>TEPS</option>
        	<option value="TOEFL" <c:if test="${vo5.langlicencename=='TOEFL'}">            	
            		selected="selected"
            	</c:if>>TOEFL</option>
        	<option value="TOEIC" <c:if test="${vo5.langlicencename=='TOEIC'}">            	
            		selected="selected"
            	</c:if>>TOEIC</option>
        	<option value="SAT" <c:if test="${vo5.langlicencename=='SAT'}">            	
            		selected="selected"
            	</c:if>>SAT</option>
        	<option value="ACT" <c:if test="${vo5.langlicencename=='ACT'}">            	
            		selected="selected"
            	</c:if>>ACT</option>
        	<option value="GRE" <c:if test="${vo5.langlicencename=='GRE'}">            	
            		selected="selected"
            	</c:if>>GRE</option>
        	<option value="IELTS" <c:if test="${vo5.langlicencename=='IELTS'}">            	
            		selected="selected"
            	</c:if>>IELTS</option>
        	<option value="NEAT" <c:if test="${vo5.langlicencename=='NEAT'}">            	
            		selected="selected"
            	</c:if>>NEAT</option>
        	<option value="G-TELP" <c:if test="${vo5.langlicencename=='G-TELP'}">            	
            		selected="selected"
            	</c:if>>G-TELP</option>
        	<option value="TOSEL" <c:if test="${vo5.langlicencename=='TOSEL'}">            	
            		selected="selected"
            	</c:if>>TOSEL</option>
        	
        	
        	
        	<option value="direct" <c:if test="${vo5.langlicencename=='direct'}">            	
            		selected="selected"
            	</c:if>>직접입력</option>
        </select>
        <input type="text" class="form-control" id="langlicencenameinput" name="langlicencename" value="${vo5.langlicencename }"/>
     </div> 
     <div>
        <label for="langpoint">점수</label>
        <input type="text" class="form-control"  name="langpoint" id="langpoint" value="${vo5.langpoint }" style="ime-mode:active">
     </div>
     
     <div>
        <label for="langGrade">급수</label>
        <input type="text" class="form-control"  name="langGrade" id="langGrade" value="${vo5.langGrade }" style="ime-mode:active">
     </div>
     <div>
     	<c:import url="resume_date4.jsp"/>             
	</div>
    
     </div>
	</section>

     &nbsp;
     <button type="button" id="awardbt" class="btn btn-success" value="수상내역">수상내역</button>
  	 <section id="registerds3">
    <div class="well" id="award">
     <h3>수상내역</h3>
      <label for="award">수상명</label>
        <input type="text" class="form-control"  name="award" id="award" value="${vo.award }" style="ime-mode:active">
        </div>
        </section>
     &nbsp;
 <section id="registerds">
     <h3>자기소개서</h3>
      <div>	
    	<!-- <label for="introduce">자기소개서</label>
        <textarea class="form-control" rows="3"></textarea> -->
        
        <c:import url="/main/smarteditorTestjsp.do">
			<c:param name="name" value="introduce" ></c:param>
		</c:import>
        
        
   </div>
   <script>
   var article = document.getElementById('intro');
   
   article.dataset.value // ${vo.introduce }

   </script>
   </section>
      &nbsp;
	 <button type="button" id="hopeworkbt" class="btn btn-success" value="희망근무">희망근무</button>
       <section id="registerds4">
	 <div  id="hopework">
      <h3>희망근무 선택</h3>
      <div>	
    	<table>
       <tr>
			<th>근무형태</th>
		<td colspan="1">
		<select class="custom-select my-1 FST" name="hopeworkCode" data-name="hopeworkform" id="hopeworkform">
		<option <c:if test="${vo2.hopeworkform}">            	
            		selected="selected"
            	</c:if>>근무형태</option>
		</select> 
		</td>
		</tr>
		</table>
       </div>
       <div>
    	<label for="hopepay">희망연봉</label>
    	<select class="form-control" name="hopepay" id="hopepay" >
        	<option value="회사내규에 따름" <c:if test="${vo2.hopepay=='회사내규에 따름'}">            	
            		selected="selected"
            	</c:if>>회사내규에 따름</option>
        	<option value="1400만원이하" <c:if test="${vo2.hopepay=='1400만원이하'}">            	
            		selected="selected"
            	</c:if>>1400만원이하</option>
        	<option value="1400~1600만원" <c:if test="${vo2.hopepay=='1400~1600만원'}">            	
            		selected="selected"
            	</c:if>>1400~1600만원</option>
        	<option value="1600~1800만원"  <c:if test="${vo2.hopepay=='1600~1800만원'}">            	
            		selected="selected"
            	</c:if>>1600~1800만원</option>
        	<option value="1800~2000만원"  <c:if test="${vo2.hopepay=='1800~2000만원'}">            	
            		selected="selected"
            	</c:if>>1800~2000만원</option>
        	<option value="2000~2200만원"  <c:if test="${vo2.hopepay=='2000~2200만원'}">            	
            		selected="selected"
            	</c:if>>2000~2200만원</option>
        	<option value="2200~2400만원" <c:if test="${vo2.hopepay=='2200~2400만원'}">            	
            		selected="selected"
            	</c:if>>2200~2400만원</option>
        	<option value="2400~2600만원" <c:if test="${vo2.hopepay=='2400~2600만원'}">            	
            		selected="selected"
            	</c:if>>2400~2600만원</option>
        	<option value="2600~2800만원" <c:if test="${vo2.hopepay=='2600~2800만원'}">            	
            		selected="selected"
            	</c:if>>2600~2800만원</option>
        	<option value="2800~3000만원" <c:if test="${vo2.hopepay=='2800~3000만원'}">            	
            		selected="selected"
            	</c:if>>2800~3000만원</option>
        	<option value="3000~4000만원" <c:if test="${vo2.hopepay=='3000~4000만원'}">            	
            		selected="selected"
            	</c:if>>3000~4000만원</option>
        	<option value="4000~5000만원" <c:if test="${vo2.hopepay=='4000~5000만원'}">            	
            		selected="selected"
            	</c:if>>4000~5000만원</option>
        	<option value="5000~6000만원" <c:if test="${vo2.hopepay=='5000~6000만원'}">            	
            		selected="selected"
            	</c:if>>5000~6000만원</option>
        	<option value="6000~7000만원" <c:if test="${vo2.hopepay=='6000~7000만원'}">            	
            		selected="selected"
            	</c:if>>6000~7000만원</option>
        	<option value="7000~8000만원" <c:if test="${vo2.hopepay=='7000~8000만원'}">            	
            		selected="selected"
            	</c:if>>7000~8000만원</option>
        	<option value="8000~9000만원" <c:if test="${vo2.hopepay=='8000~9000만원'}">            	
            		selected="selected"
            	</c:if>>8000~9000만원</option>
        	<option value="9000~1억원" <c:if test="${vo2.hopepay=='9000~1억원'}">            	
            		selected="selected"
            	</c:if>>9000~1억원</option>
        	<option value="면접 후 결정" <c:if test="${vo2.hopepay=='면접 후 결정'}">            	
            		selected="selected"
            	</c:if>>면접 후 결정</option>
        	
        </select>
       </div>
       
       
       <h3>희망근무지역</h3>
        <div>
       <table>
      <tr>
				<th>지역</th>
								<td>
									<select class="custom-select my-1 mr-sm-2 FST" name="localCode" id="locationSiDo">
										<option <c:if test="${vo7.sido=='vo7.sido'}">            	
            		selected="selected"
            	</c:if>>시/도</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="localCode2" id="locationGugun">
										<option <c:if test="${vo8.gugun=='vo8.gugun'}">            	
            		selected="selected"
            	</c:if>>구/군</option>
										<option>먼저 시/도를 선택하세요</option>
									</select>
								</td>
								</tr>
					</table>
        </div>
        
       
        <div>
        <%-- <c:import url="btype.jsp"/> --%>
        <table>
       <tr>
								<th>직종</th>
								<td colspan="1">
									<select class="custom-select my-1 FST" name="firstCode" id="selectFirst">
										<option <c:if test="${vo12.firstname=='vo12.firstname'}">            	
            		selected="selected"
            	</c:if>>1차 직종</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="secondCode" id="selectSecond">
										<option <c:if test="${vo13.secondname=='vo13.secondname'}">            	
            		selected="selected"
            	</c:if>>2차 직종</option>
										<option>먼저 1차 직종을 선택하세요</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="thirdCode" id="selectThird">
										<option <c:if test="${vo14.thirdname=='vo14.thirdname'}">            	
            		selected="selected"
            	</c:if>>3차 직종</option>
										<option>먼저 2차 직종을 선택하세요</option>
									</select>
									<input type="hidden" name="thirdname"/>
									<input type="hidden" name="secondname"/>
									<input type="hidden" name="firstname"/>
								</td>
								<th>업종</th>
								<td colspan="2">
									<select class="custom-select my-1 FST" name="btypeCode1" id="selectBtype1">
										<option <c:if test="${vo9.btypename1=='vo9.btypename1'}">            	
            		selected="selected"
            	</c:if>>1차 업종</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="btypeCode2" id="selectBtype2">
										<option <c:if test="${vo10.btypename2=='vo10.btypename2'}">            	
            		selected="selected"
            	</c:if>>2차 업종</option>
										<option>먼저 1차 업종을 선택하세요</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="btypeCode3" id="selectBtype3">
										<option <c:if test="${vo11.btypename3=='vo11.btypename3'}">            	
            		selected="selected"
            	</c:if>>3차 업종</option>
										<option>먼저 2차 업종을 선택하세요</option>
									</select>
									
									<input type="hidden" name="btypename3"/>
									<input type="hidden" name="btypename2"/>
									<input type="hidden" name="btypename1"/>
									
								</td>
							</tr>
							</table>
        </div>
        
        <div>
        <label for="hopeworkdate">근무일시</label>
        <select class="form-control" name="hopeworkdate" id="hopeworkdate" >
        	<option value="09시~06시"  <c:if test="${vo2.hopeworkdate=='09시~06시'}">            	
            		selected="selected"
            	</c:if>>09시~06시</option>
        	<option value="10시~06시"  <c:if test="${vo2.hopeworkdate=='10시~06시'}">            	
            		selected="selected"
            	</c:if>>10시~06시</option>
        	<option value="자율근무제"  <c:if test="${vo2.hopeworkdate=='자율근무제'}">            	
            		selected="selected"
            	</c:if>>자율근무제</option>
        </select>
        </div>
        </div>
        </section>
   &nbsp;
    <div id="companycheck">
    <label>기업 인사담당자의 입사제의 및 면접제의를 받으시겠어요?</label>
    <label class="radio-inline">
  		<input type="radio" name="opencheck" id="opencheck" value="${vo.opencheck}" <c:if test="${vo.opencheck=='Y'}">            	
            		checked="checked"
            	</c:if>>공개
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="opencheck" id="opencheck" value="${vo.opencheck}" <c:if test="${vo.opencheck=='N'}">            	
            		checked="checked"
            	</c:if>>비공개
	</label>
    </div>
    </fieldset>
    <input class="btn btn-success" type="submit" value="이력서 수정">
	
	</form>
        </div>
       </div>

</article>
<%@include file="../main/inc/bottom.jsp" %>
 

 
  

