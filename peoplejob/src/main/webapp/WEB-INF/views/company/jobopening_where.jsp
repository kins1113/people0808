<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>

.a:nth-of-type(1) {  height: 90px;     border-bottom: 1px solid lightgray;    border-right: 1px solid lightgray;    border-top: 1px solid lightgray;
}
.b:nth-of-type(1) { width: 14%;   height: 100%;   float: left;   text-align: center;    padding-top: 41px;      font-size: 1.2em;  border-right: 1px solid lightgray;    border-left: 1px solid lightgray;}
.c:nth-of-type(1){   float: left;    width: 80%;    padding: 6px;}
.a:nth-of-type(2) {  height: 50px;     border-bottom: 1px solid lightgray;    border-right: 1px solid lightgray;
}
.b:nth-of-type(2) { width: 14%;   height: 100%;   float: left;   text-align: center;    padding-top: 41px;    border-right: 1px solid lightgray;    border-left: 1px solid lightgray;}
.c:nth-of-type(2){   float: left;    width: 80%;    padding: 15px;}
.a:nth-of-type(3) {  height: 50px;     border-bottom: 1px solid lightgray;    border-right: 1px solid lightgray;
}
.b:nth-of-type(3) { width: 14%;   height: 100%;   float: left;   text-align: center;    padding-top: 41px;    border-right: 1px solid lightgray;    border-left: 1px solid lightgray;}
.c:nth-of-type(3){   float: left;    width: 80%;    padding: 6px;}
.a:nth-of-type(4) {  height: 70px;     border-bottom: 1px solid lightgray;    border-right: 1px solid lightgray;
}
.b:nth-of-type(4) { width: 14%;   height: 100%;   float: left;   text-align: center;    padding-top: 41px;    border-right: 1px solid lightgray;    border-left: 1px solid lightgray;}
.c:nth-of-type(4){   float: left;    width: 80%;    padding: 6px;}
.a:nth-of-type(5) {  height: 50px;     border-bottom: 1px solid lightgray;    border-right: 1px solid lightgray;
}
.b:nth-of-type(5) { width: 14%;   height: 100%;   float: left;   text-align: center;    padding-top: 41px;    border-right: 1px solid lightgray;    border-left: 1px solid lightgray;}
.c:nth-of-type(5){   float: left;    width: 80%;    padding: 6px;}

</style>

    <!-- <script type="text/javascript" src=<c:url value='/resources/js/jquery-3.4.1.min.js'/>></script>
    <script type="text/javascript">
    $(document).ready(function(){
		var a;
		var b;
		var c; 
		var d;
		$("input[name='localcheck1']").click(function(idx,item){
			if($(this).is(':checked')){
				//alert(1);
				a=$("input[name='localcheck']").val();
				$("input[name='localcheck']").val(a+","+$(this).val()); 
			}else{
				$("input[name='localcheck']").val(a);  
			}
		});
		$("input[name='workway1']").click(function(idx,item){
			if($(this).is(':checked')){
				//alert(1);
				b=$("input[name='workway']").val();
				$("input[name='workway']").val(b+","+$(this).val()); 
			}else{
				$("input[name='workway']").val(b); 
			}
		});
		$("input[name='payway1']").click(function(idx,item){
			if($(this).is(':checked')){
				//alert(1);
				c=$("input[name='payway']").val();
				$("input[name='payway']").val(c+","+$(this).val()); 
			}else{
				$("input[name='payway']").val(c); 
			}
		});
		$("input[name='academicCondition1']").click(function(idx,item){
			if($(this).is(':checked')){
				//alert(1);
				d=$("input[name='academicCondition']").val();
				$("input[name='academicCondition']").val(d+","+$(this).val()); 
			}else{
				$("input[name='academicCondition']").val(d); 
			}
		});
	}); 
    </script> -->
<div  class="a">
<div  class="b">
<label>지역구분</label></div>
<div  class="c">
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="서울특별시">서울</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="부산광역시">부산</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="인천광역시">인천</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="대전">대전</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="광주">광주</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="대구">대구</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="울산">울산</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="세종">세종<br></label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="경기도">경기</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="강원도">강원</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="충청북도">충북</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="충청남도">충남</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="전라북도">전북</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="전라남도">전남</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="경상북도">경북</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1"value="경상남도">경남</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="제주">제주</label>
</div>
</div>
<div  class="a">
<div  class="b" style="padding-top: 15px;"> 
<label>근무방식</label></div>
<div  class="c">
<label><input type="checkbox" id="workway1" name="workway1" value="정규직(경력)">정규직(경력)</label>
<label><input type="checkbox" id="workway1" name="workway1" value="정규직(신입)">정규직(신입)</label>
<label><input type="checkbox" id="workway1" name="workway1" value="계약직">계약직</label>
<label><input type="checkbox" id="workway1" name="workway1" value="인턴">인턴</label>
</div>
</div>
<div  class="a">
<div  class="b" style="padding-top:15px;">
<label>급여방식</label></div>
<div  class="c">
<label><input type="checkbox" id="payway1" name="payway1" value="월급">월급</label>
<label><input type="checkbox" id="payway1" name="payway1" value="연봉">연봉</label>
<label><input type="checkbox" id="payway1" name="payway1" value="주급">주급</label>
</div></div>
<div  class="a">
<div  class="b" style="padding-top: 21px;">
<label>학력</label></div>
<div  class="c">
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="고졸">고졸</label>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="대졸(2,3년)">대졸(2,3년)</label>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="대졸(4년)">대졸(4년)</label>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="석사졸업">석사졸업</label>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="박사졸업">박사졸업</label>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="학력무관">학력무관</label>
</div></div>
<div  class="a">
<div  class="b" style="padding-top:15px;">
<label>경력</label>
</div>
<div  class="c">
<label><input type="checkbox" id="career1" name="career1" value="경력무관">경력무관</label>
<label><input type="checkbox" id="career1" name="career1" value="1~3년">1~3년</label>
<label><input type="checkbox" id="career1" name="career1" value="4~6년">4~6년</label>
<label><input type="checkbox" id="career1" name="career1" value="7~9년">7~9년</label>
</div></div>
<input type="button" id="wheresubmit" name="wheresubmit"value="확인" class="btn btn-primary" style="margin-top:10px;">
