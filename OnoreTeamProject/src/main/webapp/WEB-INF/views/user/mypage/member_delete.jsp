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
			document.getElementById('pw_message_p').innerHTML = "사용가능한 비밀번호입니다"
			document.getElementById('pw_message_p').style.color = "blue";
		} else {
			document.getElementById('pw_message_p').innerHTML = "올바르지 않은 비밀번호입니다"
			document.getElementById('pw_message_p').style.color = "red";
		}
	}

	// 비밀번호 확인
	function check_pw2() {
		var pw = document.getElementById("mem_pw").value;
		var pw2 = document.getElementById("mem_pw2").value;
		if (pw != pw2) {
			document.getElementById('pw2_message_p').innerHTML = "비밀번호가 일치하지 않습니다"
			document.getElementById('pw2_message_p').style.color = "red";
		} else {
			document.getElementById('pw2_message_p').innerHTML = "비밀번호가 일치합니다"
			document.getElementById('pw2_message_p').style.color = "blue";
		}
	};

	//이메일 정규식
	function check_email() {
		var email = document.getElementById("mem_email").value;
		var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-zA-Z]([-_.]?[a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (regEmail.test(email) == true) {
			document.getElementById('email_message_p').innerHTML = "사용 가능한 이메일입니다."
			document.getElementById('email_message_p').style.color = "blue";
		} else {
			document.getElementById('email_message_p').innerHTML = "올바른 이메일을 입력하세요."
			document.getElementById('email_message_p').style.color = "red";
		}
	}

	//이름 정규식
	function check_name() {
		var name = document.getElementById("mem_name").value;
		var regName = /^[가-힣]{2,6}$/; //가~힣. 한글로 이뤄진 문자 2~6자리
		if (regName.test(name) == true) {
			document.getElementById('name_message_p').innerHTML = "올바른 이름입니다."
			document.getElementById('name_message_p').style.color = "blue";
		} else {
			document.getElementById('name_message_p').innerHTML = "올바른 이름을 입력하세요."
			document.getElementById('name_message_p').style.color = "red";
		}
	}

	// 연락처(핸드폰번호) 정규식
	function check_phone() {
		var phone = document.getElementById("mem_phone").value;
		var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; // - 생략하고 01?(3글자) 방식으로 나머지 적용
		if (regPhone.test(phone) == true) {
			document.getElementById('phone_message_p').innerHTML = "올바른 연락처 입니다."
			document.getElementById('phone_message_p').style.color = "blue";
		} else {
			document.getElementById('phone_message_p').innerHTML = "올바른 연락처를 입력하세요."
			document.getElementById('phone_message_p').style.color = "red";
		}
	}

function check() {

	if (f.mem_pw.value == "") {
		alert("비밀번호를 입력해주세요");
		f.mem_pw.focus();

		return false;
	}

	if (f.mem_pw.value != f.mem_pw2.value) {
		alert("비빌번호를 다르게 입력했습니다.");
		f.mem_pw2.select();
		return false;
	}

	if (f.mem_email.value == "") {
		alert("이메일을 입력해주세요");
		f.mem_email.focus();
		return false;
	}

	if (f.mem_name.value == "") {
		alert("이름을 입력해주세요");
		f.mem_name.focus();
		return false;
	}

	if (f.mem_phone.value == "") {
		alert("전화번호를 입력해주세요");
		f.mem_phone.focus();
		return false;
	}
</script>
<%@include file="../member/member_header.jspf"%>
</head>
<body>
<%@include file="../member/member_top.jspf"%>

<!-- middle 시작 -->
<div class="middle_join_div">
	<form id="join_form" action="./member_info_update" method="POST" name="join_form" onsubmit="return check()">
		<div class="join_div">
			<div class="join_title_div">
				<a>회원가입</a>
			</div>
			<div class="join_id_div">
				<div class="a_div">
					<a>아이디*</a>
				</div>
				<div class="input_div">
					<input class="mem_id" id="mem_id" type="text" name="mem_id" value="${memberdto.useremail }" readonly onchange="id_Check()" required>
				</div>
				<div class="message_div">
					<p id="id_message_p"></p>
				</div>

				<div class="join_pw1_div">
					<div class="a_div">
						<a>비밀번호*</a>
					</div>
					<div class="input_div">
						<input id="mem_pw" type="password" name="mem_pw" placeholder="※8자 이상 영문자, 숫자, 특수문자 조합" maxlength="18" onchange="check_pw()" required>
					</div>
				</div>
				<div class="message_div">
					<p id="pw_message_p"></p>
				</div>
				<div class="join_pw2_div">
					<div class="a_div">
						<a>비밀번호 확인*</a>
					</div>
					<div class="input_div">
						<input id="mem_pw2" type="password" name="mem_pw2" placeholder="비밀번호를 확인하세요" onchange="check_pw2()" required>
					</div>
				</div>
				<div class="message_div">
					<p id="pw2_message_p"></p>
				</div>

				<div class="join_email_div">
					<div class="a_div">
						<a>이메일*</a>
					</div>
					<div class="input_div">
						<input id="mem_email" type="text" name="mem_email" value="${memberdto.mem_email }" onchange="check_email()" required>
					</div>
				</div>
				<div class="message_div">
					<p id="email_message_p"></p>
				</div>

				<div class="join_name_div">
					<div class="a_div">
						<a>이름*</a>
					</div>
					<div class="input_div">
						<input id="mem_name" type="text" name="mem_name" value="${memberdto.mem_name } " onchange="check_name()" required>
					</div>
				</div>
				<div class="message_div">
					<p id="name_message_p"></p>
				</div>

				<div class="join_birth_date_div">
					<div class="a_div">
						<a>생년월일*</a>
					</div>
					<div class="input_div">
						<input id="mem_birth_date" type="text" name="mem_birth_date" maxlength="6" onchange="check_gender()" value="${memberdto.mem_birth }" readonly> 
						<a>-</a> 
						<input id="mem_birth_date2" type="text" name="mem_birth_date2" maxlength="1" onchange="check_gender()" required>
					</div>
				</div>
				<div class="message_div">
					<p id="birth_message_p"></p>
				</div>

				<div class="join_gender_div">
					<div class="a_div">
						<a>성별*</a>
					</div>
					<div class="input_radio_div">
						<input id="mem_gender" type="radio" name="mem_gender" value="M" onchange="check_gender()" value="${memberdto.mem_gender }" readonly><a>남성</a> 
						<input id="mem_gender" type="radio" name="mem_gender" value="F" onchange="check_gender()" value="${memberdto.mem_gender }" readonly><a>여성</a>
					</div>
					<div class="message_div">
						<p id="mem_gender"></p>
					</div>
				</div>
				<div class="join_phone_div">
					<div class="a_div">
						<a>연락처*</a>
					</div>
					<div class="input_div">
						<input id="mem_phone" type="text" name="mem_phone" placeholder="'-'를 제외하고 입력하세요" oninput="check_phone()" required>
					</div>
				</div>
					<div class="join_check_sms_div">
						<div class="input_check_div">
							<input class="law_check_box" id="mem_sms_check" type="checkbox" name="mem_sms_check" value="Y">
						</div>
						<div class="a_sms_div">
							<a>[선택] SMS 수신 여부</a>
						</div>
					</div>

					<div class="join_check_email_div">
						<div class="input_check_div">
							<input class="law_check_box" id="mem_email_check" type="checkbox" name="mem_email_check" value="Y">
						</div>
						<div class="a_email_div">
							<a>[선택] 이메일 수신 여부</a>
						</div>
					</div>
					<div class="message_div">
						<p id="law_check_p"></p>
					</div>
				</div>
				<!-- 체크박스 그룹 -->
				<article>
					<div class="member_modify_Btn_div">
						<input class="member_modify_Btn" type="submit" onclick="check()" value="수정하기"><br>
					</div>
				</article>
			</div>
	</form>
</div>
<!-- middle 끝 -->

<script src="/project/resources/menu/js/menubar.js?ver=2"></script>
<%@include file="../member/member_bottom.jspf"%>