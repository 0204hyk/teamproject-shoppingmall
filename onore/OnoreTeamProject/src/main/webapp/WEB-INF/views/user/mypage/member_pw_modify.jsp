<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//비밀번호 정규식
function check_pw() {
	var pw = document.getElementById("mem_pw").value;
	var regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%^*#?&()])[A-Za-z\d$@$!%^*#?&()]{8,}$/; // 8자 이상 영문자, 숫자, 특수문자 조합 비밀번호
	if (regPw.test(pw) == true) {
		document.getElementById('pw_modify_pw_message_p').innerHTML = "사용가능한 비밀번호입니다"
		document.getElementById('pw_modify_pw_message_p').style.color = "blue";
	} else {
		document.getElementById('pw_modify_pw_message_p').innerHTML = "올바르지 않은 비밀번호입니다"
		document.getElementById('pw_modify_pw_message_p').style.color = "red";
	}
}

// 비밀번호 확인
function check_pw2() {
	var pw = document.getElementById("mem_pw").value;
	var pw2 = document.getElementById("mem_pw2").value;
	if (pw != pw2) {
		document.getElementById('pw_modify_pw2_message_p').innerHTML = "비밀번호가 일치하지 않습니다"
		document.getElementById('pw_modify_pw2_message_p').style.color = "red";
	} else {
		document.getElementById('pw_modify_pw2_message_p').innerHTML = "비밀번호가 일치합니다"
		document.getElementById('pw_modify_pw2_message_p').style.color = "blue";
	}
};
//비밀번호 변경 완료 alert창
$(document).ready(function() {
	$("#pw_modify_form").submit(function(event) {
		event.preventDefault();
		$.ajax({
			type : "POST",
			url : "memberPwModify",
			data : $("#pw_modify_form").serialize(),
			success : function(data) {
				alert("비밀번호 변경이 완료되었습니다.");
				window.location.href = "./mypage";
			},
			error : function() {
				alert("Error");
			}
		});
	});
});

</script>
<%@include file="../member/member_header.jspf"%>
</head>
<body>
<%@include file="../member/member_top.jspf"%>

<!-- middle 시작 -->
<div class="middle_pw_modify_div">
	<form id="pw_modify_form" action="memberPwModify" method="POST" name="pw_modify_form">
		<div class="pw_modify_div">
			<div class="pw_modify_title_div">
				<a>비밀번호 변경</a>
			</div>
			
				<div class="pw_modify_id_div">
					<div class="pw_modify_a_div">
						<a>아이디</a>
					</div>
					<div class="pw_modify_input_div">
						<input class="mem_id" id="mem_id" type="text" name="mem_id" value="${sessionScope.signIn.mem_id}" readonly>
					</div>
				</div>
				
				<div class="pw_modify_pw1_div">
					<div class="pw_modify_a_div">
						<a>신규 비밀번호</a>
					</div>
					<div class="pw_modify_input_div">
						<input id="mem_pw" type="password" name="mem_pw" maxlength="18" onchange="check_pw()" required>
					</div>
				</div>
				<div class="pw_modify_message_div">
					<p id="pw_modify_pw_message_p"></p>
				</div>
				<div class="pw_modify_pw2_div">
					<div class="pw_modify_a_div">
						<a>신규 비밀번호 확인</a>
					</div>
					<div class="pw_modify_input_div">
						<input id="mem_pw2" type="password" onchange="check_pw2()" required>
					</div>
				</div>
				<div class="pw_modify_message_div">
					<p id="pw_modify_pw2_message_p"></p>
				</div>
			<article>
				<div class="pw_modify_Btn_div">
					<input class="pw_modify_Btn" type="submit" value="비밀번호변경">
					<button type="button" class="mypage_go_btn" onclick="location.href='./mypage'">취소</button>
				</div>
			</article>
		</div>
	</form>
</div>
<!-- middle 끝 -->

<script src="/project/resources/menu/js/menubar.js?ver=2"></script>
<%@include file="../member/member_bottom.jspf"%>