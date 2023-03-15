<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/menu/css/login_search.css?ver=1" rel="stylesheet"/>
<script>
function search_check(num) {
	if (num == '1'){
		document.getElementById("search_id_div").style.display = "";
		document.getElementById("search_pw_div").style.display = "none";
	} else {
		document.getElementById("search_pw_div").style.display = "";
		document.getElementById("search_id_div").style.display = "none";
	}
}      

/* 아이디 찾기 */ 
//아이디 & 스토어 값 저장하기 위한 변수
// 아이디 값 받고 출력하는 ajax
function findId_click(){
	var name=$('#input_mem_name').val()
	var email=$('#input_mem_email1').val()
	
	$.ajax({
		url:"./find_id",
		type:"POST",
		data:{"mem_name":name, "mem_email":email},
		success:function(data){
			if(data == 0){
				$('#search_id_result_a').html("이름과 이메일을 확인하세요.");
				$('#search_id_result_a').css({
						                    "color": "red",
						                    "font-size": "15px"});
				$('#input_mem_name').val('');
				$('#input_mem_email1').val('');
			} else {
				$('#search_id_result_a').html('찾으시는 아이디는 [' + data + '] 입니다.');
				$('#search_id_result_a').css({
						                    "color": "black",
						                    "font-size": "15px"});
				$('#input_mem_name').val('');
				$('#input_mem_email1').val('');
				
			}
		},
		 error:function(){
                alert("에러입니다");
            }
	});
};
	
/*	
// 비밀번호 찾기
function findPw_click(){
	var id=$('#input_mem_id').val()
	var email=$('#input_mem_email2').val()
	
	$.ajax({
		url:"./find_pw",
		type:"POST",
		data:{"mem_id":id, "mem_email":email},
		success:function(data){
			if(data == 0){
				$('#search_pw_result_a').html("아이디와 이메일을 확인하세요.");
				$('#search_pw_result_a').css({
						                    "color": "red",
						                    "font-size": "15px"});
				$('#input_mem_id').val('');
				$('#input_mem_email2').val('');
			} else {
				$('#search_pw_result_a').html('찾으시는 비밀번호는 [' + data + '] 입니다.');
				$('#search_pw_result_a').css({
						                    "color": "black",
						                    "font-size": "15px"});
			}
		},
		 error:function(){
                alert("에러입니다");
            }
	});
};
*/

//임시 비밀번호 이메일 전송
$(function(){
	$("#search_pw_btn").click(function(){
		let mem_id=$("input[name='mem_id']").val();
		let mem_email=$("input[name='mem_email']").val();
		$.ajax({
			url:"/project/finduserpwd",
			dataType:'json',
			data:{"mem_id":mem_id,"mem_email":mem_email},
			success:function(data){
				if(data==true){
					alert("임시 비밀번호가 발급되었습니다.메일함을 확인해 주세요");
					console.log(data);
				}else{
					alert("아이디 또는 이메일을 정확하게 입력해 주세요");
					console.log(data);
			}
	   	}
	});
});
});


</script>
<%@include file="../header.jspf" %>    
</head>
<body>
<%@include file="../top.jspf" %>

<!-- middle 시작 -->
<div class="middle_idpw_search_div">
	<div class="search_idpw_div">
		<div class="search_idpw_title_div">
			<a>아이디/비밀번호 찾기</a>
		</div>
		
		<div class="check_idpw_div">
			<div class="search_id_div"><input id="id_search" name="idpw_search" type="radio" onclick="search_check(1)" checked="checked"><a>아이디 찾기</a></div>
		<div class="search_pw_div"><input id="pw_search" name="idpw_search" type="radio" onclick="search_check(2)"><a>비밀번호 찾기</a></div>
		</div>

		<div id="search_id_div">
			<div class="search_name_div">
				<a>이름</a>
			</div>
			<div class="search_input_name_div">
				<input name="input_mem_name" id="input_mem_name" class="input_mem_name" type="text">
			</div>
			<div class="search_email_div">
				<a>이메일</a>
			</div>
			<div class="search_input_email_div">
				<input name="input_mem_email1" id="input_mem_email1" class="input_mem_email1" type="email">
			</div>
			
		    <div class="search_id_result"><a id="search_id_result_a"></a></div>
			 
			<article class="search_id_article">
				<div class="search_id_btn_div">
					<input name="search_id_btn" class="search_id_btn" type="submit" onclick="findId_click()" value="아이디 찾기">
				</div>
			</article>
		</div>


	<form action="finduserpwd" method="POST">
		<div id="search_pw_div" style="display: none;">
			<div class="search_id_div">
				<a>아이디</a>
			</div>
			<div class="search_input_id_div">
				<input name="mem_id" id="input_mem_id" class="input_mem_name" type="text">
			</div>
			<div class="search_email_div">
				<a>이메일</a>
			</div>
			<div class="search_input_email_div">
				<input name="mem_email" id="input_mem_email2" class="input_mem_email2" type="email">
			</div>
	
  			<div class="search_pw_result"><a id="search_pw_result_a"></a></div>

			<article class="search_pw_article">
				<div class="search_pw_btn_div">
					<input name="search_pw_btn" class="search_pw_btn" type="submit" onclick="findPw_click()"value="비밀번호 찾기">
				</div>
			</article>
		</div>	
	</form>
	</div>
	<div class="go_login_Btn_div">
		<input class="go_login_Btn" type="submit" onclick="location.href='./login'" value="로그인 하기">
	</div>
</div>
<!-- middle 끝 -->

<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js"></script>
<%@include file="../bottom.jspf"%>