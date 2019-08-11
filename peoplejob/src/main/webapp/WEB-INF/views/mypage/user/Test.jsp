<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
$(function(){
    
    /*
    출력을 하는 경우
    1. 리플 작성페이지 이동시(차이를 못느낀다)
        1-1 동기식 방법 페이지 이동 전에 DB에서 조회
        1-2 페이지 이동 직후 비동기식 방법으로 DB에서 조회
    2. 리플 저장버튼 클릭 후 저장완료시()
        2-1 동기식 -> 새로고침이 되서 화면이 번쩍인다.
        2-2 비동기식 -> 새로고침이 안된다. 번쩍임이 없다.
    */

    //1-2위치 
    init();
    
    
    $('#formButton').on('click', function(){
        
        
        var name = $('#name').val();
        var text = $('#text').val();
        
        if(name.length == 0 || text.length == 0){
            
            alert("이름과 내용을 입력해보아요~");
            return;
            
        }
        
        $.ajax({
            
            url : "commentInsert",
            type : "POST",
            contentType : "application/json; charset=utf-8",
                          //application/json , JSON.stringify , 컨트롤러에 매개변수 앞에 @RequestBody 3가지가 하나의 세트             
             data : JSON.stringify({
                
                
                name : name,
                text : text
                
            }),
            success : function(){
                alert("저장되었습니다.");
                //폼 초기화
                $('#name').val('');
                $('#text').val('');
                
                //2-2위치
                init();
                
            },
            error : function(err){
                console.log(err)
            }
            
            
        });
        
        
    });
    
}); //레디함수 종료

function init(){
//비동기식으로 DB접속 후 comment 리스트 조회 결과 가져오기 

$.ajax({
    
    url : "selectAllComment",
    type : "GET",
    dataType : "json",
    success :function(obj){
        console.log(obj);
        var str = '<table>';
        
         $.each(obj ,function(index, item){
             //자바스크립트객체(반복문에 대상), function(인덱스, 아이템(객체하나))
str += '<tr>';
str += '<td>'+item.num+'</td>';
str += '<td>'+item.name+'</td>';
str += '<td>'+item.text+'</td>';
str += '<td><input type="button" value="삭제" class="deleteComment" data_num="'+item.num+'"></td>'; 
//클래스를 사용 
str += '<td><input type="button" value="수정" class= "updateCommentForm" data_num="'+item.num+'" data_text="'+item.text+'" data_index="'+index+'"></td>';
//커스텀 속성 
str += '<td><div class="updateCommentFormDiv'+index+'"></div></td>';
//*index를 넘기는 이유 : each문안에서 특정글 수정폼을 불러오기위해
//div가 내가 수정 버튼 누른에 옆에만 생성되게~
str += '</tr>';
             
         })
         
         
        str += '</table>';
        $('#listDiv').html(str);
        

        //Div가 화면에 다 보여지고 이벤트를 걸어야한다.
        $('.deleteComment').on('click', function(){
//this -> 지금 클릭된 문서 객체(태그) 여기서 <input type="button" value="삭제" class="deleteComment"> 중에 클릭된 아이
//$(this) -> 그 태그를 선택 (자바스크립트 객체) 여기서 $('.deleteComment') 중에 선택된 아이
//**중요  문서객체(태그)와 자바스크립트 객체를 나타내는 this, $(this)           
            var num = $(this).attr('data_num'); 
//속성을 꺼내는 attr함수, 클릭할 때마다 기본키를 받을 수 있도록 
            console.log(num);
            
            //비동기식으로 pk값을 DB로 전달한 후 
            //삭제후 성공시 목록 재출력 
            $.ajax({
                
                url : "deleteComment",
                type : "POST",
                    
                data :{
                    num : num
                },
                success : function(){
                    alert("삭제했습니다.");
                    init();
                },
                error : function(error){
                    console.log(error);
                }
                
            });
        
        });
        
//기존에 수정할때는 번호를  컨트롤러에 넘겨서 특정글을 불러오고 수정을 시작했는데
//여기서는 each문안에서 해당 글 번호,내용을 가져와서 updateForm을 만들고
//업데이트 완료를 누르는 시점에서 번호와 수정된 글 내용을 보낸다.(Ajax 함수를 통해)
//자바스크립트 객체이기 때문에 제이슨 방식으로 서버로 보낸다.
        $('.updateCommentForm').on('click', function(){
            
            var num = $(this).attr('data_num');
            var text = $(this).attr('data_text');
            var index = $(this).attr('data_index');
            
            var str = '';
            console.log(num);
            console.log(text);
            console.log(index);
            
            str = '<input type="hidden" id ="num"  value="'+num+'">';
            str += '<input type="text" id ="text2"  value="'+text+'" >';
            str += '<input type="button" value="수정완료" id="updateComment" > ';
            
            $('.updateCommentFormDiv'+index).html(str);
            console.log(str);    
            
            $('#updateComment').on('click', function(){
                
                var num = $('#num').val();
                var text = $('#text2').val();
                    console.log(num);
                    console.log(text);
                    
                    $.ajax({
                    
                    url : "updateComment",
                    type : "POST",
                    contentType : "application/json; charset=utf-8",
                    data : JSON.stringify({
                        num : num,
                        text : text
                        
                    
                    }),
                    success : function(){
                        alert("수정 완료");
                        init();
                    },
                    error : function(error){
                        console.log(error);
                    }
                    
                });
                    
            });
            
        });        

         
    },
    error : function(err){
        
        console.log(err);
    }
    
});
}
</script>
	<body>
    <div id="formDiv">
    
        <form id="writeForm">
        
            이름<input type="text" id ="name" style="width:100px;">
            내용<input type="text" id="text" style="width:300px;">
            <input type="button" id="formButton" value="저장">
        
        </form>
    
    </div>
    
    
        
    
    <div id="listDiv">
    </div>
    
    
</body>
