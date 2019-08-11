<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-ui.min.js'/>">
</script>
    <script type="text/javascript">
    $(document).ready(function($){
		$('.workdate1').datepicker({
			 minDate: 0,
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월",
					"7월","8월","9월","10월","11월","12월"]
		});
		
    });
    </script>
</head>
<body>

        <input id="${param.id }" name="${param.name}" class="form-control workdate1" type="text" readonly    title="${param.title }"
        
        style="font-size: 1.1em; width: 60%;"/>

       

</body>
</html>
    
