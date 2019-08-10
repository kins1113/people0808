<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">
div#checkDiv {
    position: absolute;    top: 95%;    height: 4%;    text-align: right;    left: 40%;    font-size: 0.8em;}
input#showCk {    width: 10px;}
img{    width: 100%;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/carhartl-jquery-cookie/jquery.cookie.js'/>"></script>

<script type="text/javascript">
$(function(){
	$("#todayClose").change(function(){
       	var name="popupOpen"+${param.popupCode };
       	var value=${param.popupCode };
        if($("#todayClose").is(":checked")){
        	//alert("name="+name+", value="+value);
        	/*  var todayDate = new Date();
        	    todayDate.setDate( todayDate.getDate() + expiredays );
        	    document.cookie = name + "=" + escape( val ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        	     */
        	     $.cookie(name, value, { expires: 1, path: '/' });// 세션 쿠키 생성 - 브라우저를 닫으면 없으집니다. $.cookie('name', 'value');
        }else{
           //alert("체크박스 체크 해제!");
            $.removeCookie(name, { path: '/' });

        }
    });
})



function closeWin(i){
	if(i==1){
		window.close();
	}
}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="imgDiv">
	<img alt="popup이미지" src="<c:url value='/popup_upload/${param.popupImg}'/>">
</div>
<div id="checkDiv">
<form name="notice_form">
	<div id="divpop1" class="divpop">	
 		<div class="button_area">
			<input type="checkbox" id="todayClose" name="chkbox" value='Y'><label for="todayClose">24시간동안 보지 않기.</label>
 			<a href='#' onclick="closeWin(1);"><B>[닫기]</B></a>
 		</div>
</form>
</div>
</body>
</html>