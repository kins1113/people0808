<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<script type="text/javascript" src=<c:url value='/resources/js/jquery-3.4.1.min.js'/>></script>
<script type="text/javascript">
	/* $(document).ready(function(){
		var a;
		$("input[name='welfare1']").click(function(idx,item){
			if($(this).is(':checked')){
				//alert(1);
				a=$("input[name='welfare']").val();
				$("input[name='welfare']").val(a+","+$(this).val()); 
			}else{
				$("input[name='welfare']").val(a); 
			}
		});
	}); */
	$(document).ready(function(){
		/* $("#subwayinfo").hide();
		$("#subwayinfo1").change(function(){
			var a=$("#subwayinfo1").val();
			$("select#subwayinfo option[value!='']").remove();
			//alert(a);
			$.ajax({
				url:"http://openapi.seoul.go.kr:8088/6b65787671736b6135324370774b64/xml/SearchSTNBySubwayLineService/1/999/"+a,
				dataType:"xml",
				type:'GET',
				success:function(data){
					//alert(data);
					//console.log(data);
					$(data).find("row").each(function(){
					
						var info = "<option value='"+$(this).find("STATION_NM").text()+"'>"+$(this).find("STATION_NM").text() +"</option>";

						$('#subwayinfo').append(info);

					});
				},error:function(xhr,error,status){
					alert("error="+error+", status="+status);
				}
			});  
			/* http://openapi.seoul.go.kr:8088/6b65787671736b6135324370774b64/xml/SearchSTNBySubwayLineService/1/999/1 */
			$("#subwayinfo").show();
		}); */
		//$("#submit2").click(function(){
		$('textarea[name="applicationhandbook"]').html('${vo.applicationhandbook}');
		$("form[name=boardForm]").submit(function(){  
			//if(confirm("등록하시겠습니까?")){              
				$("form[name=boardForm]").find("input[type=text]").each(function(){
					if ($(this).val().length < 1) { 
						var msg = $(this).attr('name'); 
						alert(msg + '칸을 입력해주세요	.');
						$(this).focus();
						event.preventDefault(); 
						return false;
					}else if (!validate_worktime($('#worktime').val())) {
						alert('근무시간을 다시 입력해주세요(입력양식 예 : 52)');
						$('#worktime').focus();
						event.preventDefault();
						return false;
					}else if (!validate_pay($('#pay').val())) {
						alert('급여를 다시 입력해주세요(입력양식 예 : 3000000)');
						$('#pay').focus();
						event.preventDefault();
						return false;
					}else if (!validate_worktime($('#recruit').val())) {
						alert('모집인원을 다시 입력해주세요(입력양식 예 : 9명이면 0명 10~99명이면 00명 100명이상이면 000명 )');
						$('#recruit').focus();
						event.preventDefault();
						return false;
					}
				});
			//}else{
			//	event.preventDefault();
			//	return false;
			//}
		});
		
	});
		
	function validate_worktime(time) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(time);
	}

	//아이디 정규식
	function validate_pay(pay) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(pay);
	}

	//비밀번호 정규식
	function validate_recruit(recruit) {
		var pattern = new RegExp(/^[a-zA-Z0-9]+$/g);
		return pattern.test(recruit);
	}
	function s_it()
	{
	  var total_str = "";
	  var obj = document.getElementsByName("welfare1");

	  for (i=0; i < obj.length; i++)
	  {
	    if (obj[i].checked == true)
	    {
	      total_str += (total_str != "") ? "," + obj[i].value : obj[i].value;
	    }
	  }
	  document.getElementById("welfare").value = total_str;
	}
</script>
<style type="text/css">
.divList {
    width: 900px;
    margin: 0 auto;
    padding: 10px;
    background: #cccccc;
}
.form-group{
	width:90%;
	padding-left: 100px;
} 
h3, .h3 {
    font-size: 24px;
    padding-left: 100px;
}
select {
    height: 30px;
}
body .se2_inputarea{
	background:white;
}
</style>
<article>
	<fieldset>
    
<div class="divList" style="min-height: 630px">
        <div class="page-header">
            <h3>구인
            </h3>
        </div>
        <form id="boardForm" class="form-horizontal" role="form" method="post" action="<c:url value='/company/jobopening_edit.do'/>"
        enctype="multipart/form-data">
        <!-- ${company_code} -->
        <input type="hidden" name="companyCode" value="${vo.companyCode}">
		<input type="hidden" name="jobopening" value="${vo.jobopening}">
            <div class="form-group">
                <div> 
                <label for="title" >공고제목</label>
                   <input id="jobtitle" name="jobtitle" class="form-control" type="text" value="${vo.jobtitle }"/>
                </div>
            </div>
             
            <div class="form-group">
            <div>
                <label for="title" >지역구분</label>
                    <select name="localcheck">
                		<option value="서울특별시"
                		<c:if test="${vo.localcheck=='서울특별시' }">
                		selected
                		</c:if>
                		>서울</option>
                		<option value="부산광역시"
                		<c:if test="${vo.localcheck=='부산광역시' }">
                		selected
                		</c:if>
                		>부산</option>
                		<option value="인천광역시"
                		<c:if test="${vo.localcheck=='인천광역시' }">
                		selected
                		</c:if>
                		>인천</option>
                		<option value="대전"
                		<c:if test="${vo.localcheck=='대전' }">
                		selected
                		</c:if>
                		>대전</option>
                		<option value="광주"
                		<c:if test="${vo.localcheck=='광주' }">
                		selected
                		</c:if>
                		>광주</option>
                		<option value="대구"
                		<c:if test="${vo.localcheck=='대구' }">
                		selected
                		</c:if>
                		>대구</option>
                		<option value="울산"
                		<c:if test="${vo.localcheck=='울산' }">
                		selected
                		</c:if>
                		>울산</option>
                		<option value="세종"
                		<c:if test="${vo.localcheck=='세종' }">
                		selected
                		</c:if>
                		>세종</option>
                		<option value="경기도"
                		<c:if test="${vo.localcheck=='경기도' }">
                		selected
                		</c:if>
                		>경기</option>
                		<option value="강원도"
                		<c:if test="${vo.localcheck=='강원도' }">
                		selected
                		</c:if>
                		>강원</option>
                		<option value="충청북도"
                		<c:if test="${vo.localcheck=='충청북도' }">
                		selected
                		</c:if>
                		>충북</option>
                		<option value="충청남도"
                		<c:if test="${vo.localcheck=='충청남도' }">
                		selected
                		</c:if>
                		>충남</option>
                		<option value="전라북도"
                		<c:if test="${vo.localcheck=='전라북도' }">
                		selected
                		</c:if>
                		>전북</option>
                		<option value="전라남도"
                		<c:if test="${vo.localcheck=='전라남도' }">
                		selected
                		</c:if>
                		>전남</option>
                		<option value="경상북도"
                		<c:if test="${vo.localcheck=='경상북도' }">
                		selected
                		</c:if>
                		>경북</option>
                		<option value="경상남도"
                		<c:if test="${vo.localcheck=='경상남도' }">
                		selected
                		</c:if>
                		>경남</option>
                		<option value="제주"
                		<c:if test="${vo.localcheck=='제주' }">
                		selected
                		</c:if>
                		>제주</option>
                	</select>
                </div>
            </div>
            
            <div class="form-group">
                <div>
                <label for="title">역정보</label>
                    <input id="subwayinfo" name="subwayinfo" class="form-control" type="text" value="${vo.subwayinfo }"/>
                </div>
            </div>
            <div class="form-group">
                <div>
                <label for="title">근무형태</label>
                    <input id="workform" name="workform" class="form-control" type="text" value="${vo.workway }"/>
                </div>
            </div>
             <c:import url="jobopening_date2.jsp"/>
            <!-- 
             <div class="form-group">
                <label class="col-sm-2 control-label">근무기간</label>
                <div class="col-sm-6">
                    <div class="input-group">
                        <input id="start" name="start" class="form-control" placeholder="YYYYMMDD" type="text" />
                        <span class="input-group-addon">~</span>
                        <input id="end" name="start" class="form-control" placeholder="YYYYMMDD" type="text" />
                    </div>
                </div>
            </div>
             -->
            <div class="form-group">
				<div>	
                <label for="title">근무요일</label>
                    <input id="dayofweek" name="dayofweek" class="form-control" type="text" value="${vo.dayofweek }"/>
                </div>
            </div>
            
            <div class="form-group">
                <div>
                <label for="title" >근무시간</label>
                    <input id="worktime" name="worktime" class="form-control" type="text" value="${vo.worktime }"/>
                </div>
            </div>
          
            <div class="form-group">
                <div >
                <label for="title">급여방식</label>
                	<select name="payway">
                	<option value="월급">월급</option>
                	<option value="연봉">연봉</option>
                	<option value="주급">주급</option>
                	</select>
                </div>
            </div>
            <div class="form-group">
                <div>
                <label for="title" >급여</label>
                    <input id="pay" name="pay" class="form-control" type="text" value="${vo.pay }"/>
                </div>
            </div>
            
            <div class="form-group">
                <div>
                <label >근무방식</label>
                    <select name="workway" >
                        <option value="정규직(신입)"
                        <c:if test="${vo.workform=='정규직(신입)'}">
                        selected
                        </c:if>
                        >정규직(신입)</option>
                        <option value="정규직(경력)"
                        <c:if test="${vo.workform=='정규직(경력)'}">
                        selected
                        </c:if>
                        >정규직(경력)</option>
                        <option value="프리랜서(계약직)"
                        <c:if test="${vo.workform=='프리랜서(계약직)'}">
                        selected
                        </c:if>
                        >프리랜서(계약직)</option>
                        <option value="인턴"
                        <c:if test="${vo.workform=='인턴'}">
                        selected
                        </c:if>
                        >인턴</option>
                    </select>
                </div>
            </div>
              <!-- name="welfare" -->
             <div class="form-group">
                <label>복리후생</label>
                <div >  
                <c:set var="welfare" value="${vo.welfare }"/>
                    <label><input type="checkbox" name="welfare1" value="국민연금" onclick="javascript_:s_it()"
                    <c:if test="${fn:substring(welfare,fn:indexOf(welfare,'국민연금'),fn:indexOf(welfare,'국민연금')+fn:length('국민연금'))=='국민연금'}">
                    checked
                    </c:if>
                    /> 국민연금</label>
                    <label><input type="checkbox" name="welfare1" value="건강보험" onclick="javascript_:s_it()"
                     <c:if test="${fn:substring(welfare,fn:indexOf(welfare,'건강보험'),fn:indexOf(welfare,'건강보험')+fn:length('건강보험'))=='건강보험'}">
                    checked
                    </c:if>
                    /> 건강보험</label>
                    <label><input type="checkbox" name="welfare1" value="고용보험" onclick="javascript_:s_it()"
                     <c:if test="${fn:substring(welfare,fn:indexOf(welfare,'고용보험'),fn:indexOf(welfare,'고용보험')+fn:length('고용보험'))=='고용보험'}">
                    checked
                    </c:if>
                    /> 고용보험</label><br>
                    <label><input type="checkbox" name="welfare1" value="산재보험" onclick="javascript_:s_it()"
                     <c:if test="${fn:substring(welfare,fn:indexOf(welfare,'산재보험'),fn:indexOf(welfare,'산재보험')+fn:length('산재보험'))=='산재보험'}">
                    checked
                    </c:if>
                    /> 산재보험</label>
                    <label><input type="checkbox" name="welfare1" value="야근수당"onclick="javascript_:s_it()"
                     <c:if test="${fn:substring(welfare,fn:indexOf(welfare,'야근수당'),fn:indexOf(welfare,'야근수당')+fn:length('야근수당'))=='야근수당'}">
                    checked
                    </c:if>
                    /> 야근수당</label>
                    <label><input type="checkbox" name="welfare1" value="식대(점심)"onclick="javascript_:s_it()"
                     <c:if test="${fn:substring(welfare,fn:indexOf(welfare,'식대(점심)'),fn:indexOf(welfare,'식대(점심)')+fn:length('식대(점심)'))=='식대(점심)'}">
                    checked
                    </c:if>
                    /> 식대(점심)</label><br>
                    <label><input type="checkbox" name="welfare1" value="식대(저녁)"onclick="javascript_:s_it()"
                     <c:if test="${fn:substring(welfare,fn:indexOf(welfare,'식대(저녁)'),fn:indexOf(welfare,'식대(저녁)')+fn:length('식대(저녁)'))=='식대(저녁)'}">
                    checked
                    </c:if>
                    /> 식대(저녁)</label>
                    <label><input type="checkbox" name="welfare1" value="교통비"onclick="javascript_:s_it()"
                     <c:if test="${fn:substring(welfare,fn:indexOf(welfare,'교통비'),fn:indexOf(welfare,'교통비')+fn:length('교통비'))=='교통비'}">
                    checked
                    </c:if>
                    /> 교통비</label>
                    <label><input type="checkbox" name="welfare1" value="통신비" onclick="javascript_:s_it()"
                     <c:if test="${fn:substring(welfare,fn:indexOf(welfare,'통신비'),fn:indexOf(welfare,'통신비')+fn:length('통신비'))=='통신비'}">
                    checked
                    </c:if>
                    /> 통신비</label><br>
                    <label><input type="checkbox" name="welfare1" value="퇴직금"onclick="javascript_:s_it()"
                     <c:if test="${fn:substring(welfare,fn:indexOf(welfare,'퇴직금'),fn:indexOf(welfare,'퇴직금')+fn:length('퇴직금'))=='퇴직금'}">
                    checked
                    </c:if>
                    /> 퇴직금</label>
                </div>
            </div>
                    <input type="hidden" id="welfare" name="welfare" value="${vo.welfare }">
            <div class="form-group">
                <div >
                <label for="title">성별</label>
                	<select id="gender" name="gender">
                        <option value="남자"
                        <c:if test="${vo.gender=='남자'}">
                        selected
                        </c:if>
                        >남자</option>
                        <option value="여자"
                        <c:if test="${vo.gender=='여자'}">
                        selected
                        </c:if>
                        >여자</option>
                        <option value="무관"
                        <c:if test="${vo.gender=='무관'}">
                        selected
                        </c:if>
                        >무관</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div>
                <label >제한연령</label>
                    <select id="agelimit" name="agelimit">
                        <option value="나이제한없음"
                        <c:if test="${vo.agelimit=='나이제한없음' }">
                        selected
                        </c:if>
                        >나이제한없음</option>
                        <option value="30이하"
                         <c:if test="${vo.agelimit=='30이하' }">
                        selected
                        </c:if>
                        >30이하</option>
                        <option value="30이상40미만"
                         <c:if test="${vo.agelimit=='30이상40미만' }">
                        selected
                        </c:if>
                        >30이상40미만</option>
                        <option value="40이상50미만"
                         <c:if test="${vo.agelimit=='40이상50미만' }">
                        selected
                        </c:if>
                        >40이상50미만</option>
                        <option value="50이상60미만"
                         <c:if test="${vo.agelimit=='50이상60미만' }">
                        selected
                        </c:if>
                        >50이상60미만</option>
                    </select>
             </div>
                </div>
             
			
            <div class="form-group">
                <div >
                <label >학력조건</label>
                    <select id="academicCondition" name="academicCondition">
                        <option value="고졸"
                        <c:if test="${vo.academicCondition=='고졸'}">
                        selected
                        </c:if>
                        >고졸</option>
                        <option value="대졸(2,3년)"
                        <c:if test="${vo.academicCondition=='대졸(2,3년)'}">
                        selected
                        </c:if>
                        >대졸(2,3년)</option>
                        <option value="대졸(4년)"
                        <c:if test="${vo.academicCondition=='대졸(4년)'}">
                        selected
                        </c:if>
                        >대졸(4년)</option>
                        <option value="석사졸업"
                        <c:if test="${vo.academicCondition=='석사졸업'}">
                        selected
                        </c:if>
                        >석사졸업</option>
                        <option value="박사졸업"
                        <c:if test="${vo.academicCondition=='박사졸업'}">
                        selected
                        </c:if>
                        >박사졸업</option>
                        <option value="학력무관"
                        <c:if test="${vo.academicCondition=='학력무관'}">
                        selected
                        </c:if>
                        >학력무관</option>
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <div >
                    <label >경력사항 :</label>
                    <div >
                    <select id="career" name="career">
                        <option value="경력무관"
                        <c:if test="${vo.career =='1~3년'}">selected</c:if>
                        >경력무관</option>
                        <option value="1~3년"
                        <c:if test="${vo.career =='1~3년'}">selected</c:if>
                        >1~3년</option>
                        <option value="4~6년"
                        <c:if test="${vo.career =='4~6년'}">selected</c:if>
                        >4~6년</option>
                        <option value="7~9년"
                        <c:if test="${vo.career =='7~9년'}">selected</c:if>
                        >7~9년</option>
                    </select>
            </div>  
                </div>
            </div>
            <div class="form-group">
                <div >
                    <label >우대조건 :</label> 
                    <input id="sweetener" name="sweetener" class="form-control" type="text" value="${vo.sweetener }"/>
                </div>
            </div>
            <div class="form-group">
                <div >
                    <label >모집인원 :</label> 
                    <input id="recruit" name="recruit" class="form-control" type="text" value="${vo.recruit }"/>
                </div>
            </div>
            <div class="form-group">
                <div>
                    <label >모집대상 :</label> 
                    <input id="recruitment_target" name="recruitmentTarget" class="form-control" type="text" value="${vo.recruitmentTarget }"/>
                </div>
            </div>
            
            <div class="form-group">
                <div >
                    <label >접수방법 :</label> 
                    <select id="receiveway" name="receiveway">
                        <option value="즉시지원"
                        <c:if test="${vo.receiveway=='즉시지원'}">
                        selected
                        </c:if>
                        >즉시지원</option>
                        <option value="이메일지원"
                        <c:if test="${vo.receiveway=='이메일지원'}">
                        selected
                        </c:if>
                        >이메일</option>
                        <option value="홈페이지지원"
                        <c:if test="${vo.receiveway=='홈페이지지원'}">
                        selected
                        </c:if>
                        >홈페이지지원</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div >
                    <label >제출서류 :</label> 
                    <input id="submit" name="submit" class="form-control" type="text" value="${vo.submit }"/>
                </div>
            </div>
            <div class="form-group">
                <div >
                    <label >상세모집요강 :</label> 
                    <c:import url="/main/smarteditorTestjsp.do">
						<c:param name="name" value="applicationhandbook"></c:param>
					</c:import>
                    <%-- <input id="applicationhandbook" name="applicationhandbook" class="form-control" type="text" value="${vo.applicationhandbook }"/> --%>
                </div>
            </div>
            <%-- <div class="form-group">
                <div >
                    <label>카테고리 :</label> 
                    <input id="category" name="category" class="form-control" type="text" value="${vo.category }"/>
                </div>
            </div> --%>
            <div class="form-group">
                <div >
                    <label >공고 이미지 :</label> 
                    <input id="companyimageurl" name="companyimageurl" class="form-control" type="file" value="${vo.companyimage}"/>
                </div>
                <c:if test="${!empty vo.companyimage }">
	            <br>
	            <span class="sp1"></span>
	            <span style="color:green;font-weight: bold">
	            	※ 첨부파일을 새로 지정할 경우 기존 파일 ${fileInfo }은 삭제됩니다.
	            </span>
            </c:if>
	            <input type="text" name="oldFileName" value="${vo.companyimage}" />
            </div>
            <div class="form-group">
                <div >
                     <label  >활성화여부(회원들에게 보여줄지 말지를 결정)</label> 
                    <input id="adminagree" name="adminagree"  type="radio" value="Y"
                    
                    <c:if test="${vo.adminagree=='Y' }">checked</c:if>
                    />활성화
                    <input id="adminagree" name="adminagree"  type="radio" value="N"
                     <c:if test="${vo.adminagree=='N' }">checked</c:if>
                    />비활성화
                </div>
            </div>
            <div class="form-group">
                <div class="text-center">
                    <input type="submit" class="btn btn-success btn-mg" value="저장" role="button" />
                    <a href="<c:url value='/company/jobopening_view.do?jobopening=${vo.jobopening }'/>" id="cancelBtn" class="btn btn-default btn-mg" role="button">취소</a>
                </div>
            </div>
		</div> 
        </form> 
    </div>
    </fieldset>
    </article>
<%@include file="../main/inc/bottom.jsp" %>