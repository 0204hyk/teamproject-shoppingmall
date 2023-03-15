<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/menu/css/join_success.css?ver=1" rel="stylesheet"/>
<script>	
// 아이디 정규표현식 + 중복체크
$(document).ready(function () {
    $('#mem_id').on('change', function () {
    	
        var id = $('#mem_id').val();
        var regId = /^[a-z]+[a-z0-9]{4,19}$/g; // 영소문자로 시작하는 5~20자리 아이디

        if (regId.test(id) == false) {
            $('#id_message_p').html("영소문자 및 숫자를 포함한 5~20자리 아이디로 입력하세요").css('color', 'red');
            return;
        }
        
        $.ajax({
            type: 'POST',
            url: './idCheck?mem_id=' + $('#mem_id').val(),
            success: function (data) {
                console.log('아이디 존재여부', data)
                if (data == 0) {
                	$('#id_message_p').html('사용가능한 아이디입니다').css('color', 'blue');
				 } else {
                	$('#id_message_p').html('이미 사용중인 아이디입니다').css('color', 'red');
                }
            }
        });
    });
});
	 
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

	/*
	 생년월일 정규식 - 내가 넣고싶은 기능
	 ① 올해 나이 14세 미만이면 가입이 불가하다는 메세지가 뜨고, 가입버튼 눌러도 동작이 안되도록 해야 함
	 ② 오늘 기준으로 오늘 초과인 날짜는 입력되지 않도록 해야 함
	 오늘 날짜 구해서 오늘 날짜 이후의 날짜는 올바르지 않은 생년월일이라고 문구 뜨게 하기 (실패..)
	 var today = new Date(); // 현재 날짜 구하기
	 var year = today.getFullYear(); // 년도
	 var month = today.getMonth() + 1; // 월
	 var date = today.getDate(); // 날짜
	 var nowdate = parseInt((year.substr(2,4)) + month + date); 
	 */

	// 생년월일 + 성별 정규식 : 생년월일 입력 시 주민번호 뒷자리 첫번째 숫자로 성별을 자동으로 체크함
	function check_gender() {
		var birth1 = document.getElementById('mem_birth_date').value;
		var birth2 = document.getElementById('mem_birth_date2').value;
		var gender = birth2.substr(0, 1); // 주민번호 뒷자리 앞 첫번째 숫자를 대입
		var regBirth1 = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;
		var regBirth2 = /([1-4]{1})/;

		if (regBirth1.test(birth1) == true && regBirth2.test(birth2) == true) {
			document.getElementById('birth_message_p').innerHTML = "사용 가능한 생년월일입니다."
			document.getElementById('birth_message_p').style.color = "blue";
			if ((gender == '1') || (gender == '3')) {
				join_form.mem_gender[0].click();
			} else if ((gender == '2') || (gender == '4')) {
				join_form.mem_gender[1].click();
			}
		} else {
			document.getElementById('birth_message_p').innerHTML = "올바른 생년월일을 입력하세요."
			document.getElementById('birth_message_p').style.color = "red";
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
		var f = document.join_form;
		if (f.mem_id.value == "") {
			alert("아이디를 입력해주세요");
			f.mem_id.focus();
			return false;
		}

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

		if (f.mem_birth_date.value == "") {
			alert("생년월일을 입력해주세요");
			f.mem_birth_date.focus();
			return false;
		}

		if (f.mem_phone.value == "") {
			alert("전화번호를 입력해주세요");
			f.mem_phone.focus();
			return false;
		}

		if (f.mem_law1_check.value != checked) {
			alert("필수항목을 체크해주세요");
			f.mem_law1_check.focus();
			return false;
		}

		if (f.mem_law2_check.value != checked) {
			alert("필수항목을 체크해주세요");
			f.mem_law2_check.focus();
			return false;
		}

		if (f.mem_law3_check.value != checked) {
			alert("필수항목을 체크해주세요");
			f.mem_law3_check.focus();
			return false;
		}
	}
	
// 동의 체크 박스
function checkAll() { // 모두 동의합니다를 체크하면 전체 선택이 됨
	  var checkBoxes = document.querySelectorAll('.law_check_box');
	  var checkAllBox = document.getElementById('mem_law_check_all');	  
	  for (var i = 0; i < checkBoxes.length; i++) {
	    checkBoxes[i].checked = checkAllBox.checked;
	  }
	}

$(document).ready(function() { // 체크를 하나 해제하면 모두 동의합니다의 체크도 해제 됨
    $('.law_check_box').on('change', function() {
        var allChecked = true;
        $('.law_check_box').each(function() {
            if (!this.checked) {
                allChecked = false;
            }
        });
        $('#mem_law_check_all').prop('checked', allChecked);
    });
});

</script>
<%@include file="../header.jspf"%>
</head>
<body>
<%@include file="../top.jspf"%>

<!-- middle 시작 -->
<div class="middle_join_div">
	<form id="join_form" action="./join_success" method="POST" name="join_form" onsubmit="return check()">
		<div class="join_div">
			<div class="join_title_div">
				<a>회원가입</a>
			</div>
			<div class="join_id_div">
				<div class="a_div">
					<a>아이디*</a>
				</div>
				<div class="input_div">
					<input class="mem_id" id="mem_id" type="text" name="mem_id" placeholder="※6-20자의 영문 소문자와 숫자로만 입력" onchange="id_Check()" required>
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
						<input id="mem_email" type="text" name="mem_email" placeholder="ex)onore123@naver.com" onchange="check_email()" required>
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
						<input id="mem_name" type="text" name="mem_name" placeholder="이름을 입력하세요" onchange="check_name()" required>
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
						<input id="mem_birth_date" type="text" name="mem_birth_date" maxlength="6" onchange="check_gender()" required> 
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
						<input id="mem_gender" type="radio" name="mem_gender" value="M" onchange="check_gender()"><a>남성</a> 
						<input id="mem_gender" type="radio" name="mem_gender" value="F" onchange="check_gender()"><a>여성</a>
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
				<div class="message_div">
					<p id="phone_message_p"></p>
				</div>
				<div class="join_check_law1_div">
					<div class="input_check_div">
						<input id="mem_law1_check" type="checkbox" name="mem_law1_check" value="Y" required>
					</div>
					<div class="a_law_div">
						<a>[필수] 만 14세 이상입니다.</a>
					</div>
				</div>

				<div class="checkbox_group">
					<!-- 체크박스 그룹 -->
					<div class="join_check_all_div">
						<div class="input_check_div">
							<input class="mem_law_check_all" id="mem_law_check_all" type="checkbox" name="mem_law_check_all" onclick="checkAll()" value="Y">
						</div>
						<div class="a_law_div">
							<a>[필수] 모두 동의합니다.</a>
						</div>
					</div>

					<div class="join_check_law2_div">
						<div class="input_check_div">
							<input class="law_check_box" id="mem_law2_check" type="checkbox" name="mem_law2_check" value="Y" required>
						</div>
						<div class="a_law_div">
							<a>[필수] 이용약관 동의</a>
						</div>
					</div>
					<div class="join_check_law_content_div">
						It is a long established fact that a reader will be distracted by<br>
						the readable content of a page when looking at its layout. <br>
						The point of using Lorem Ipsum is that it has a more-or-less <br>
						normal distribution of letters, as opposed to using 'Content
						here, <br> content here', making it look like readable
						English. Many desktop <br> publishing packages and web page
						editors now use Lorem Ipsum as their <br> default model text
						It is a long established fact that a reader will be distracted by<br>
						the readable content of a page when looking at its layout. <br>
						The point of using Lorem Ipsum is that it has a more-or-less <br>
						normal distribution of letters, as opposed to using 'Content
						here, <br> content here', making it look like readable
						English. Many desktop <br> publishing packages and web page
						editors now use Lorem Ipsum as their <br> default model text
					</div>

					<div class="join_check_law3_div">
						<div class="input_check_div">
							<input class="law_check_box" id="mem_law3_check" type="checkbox" name="mem_law3_check" value="Y" required>
						</div>
						<div class="a_law_div">
							<a>[필수] 개인정보 수집 및 이용 동의</a>
						</div>
					</div>
					<div class="join_check_law_content_div">
						It is a long established fact that a reader will be distracted by<br>
						the readable content of a page when looking at its layout. <br>
						The point of using Lorem Ipsum is that it has a more-or-less <br>
						normal distribution of letters, as opposed to using 'Content
						here, <br> content here', making it look like readable
						English. Many desktop <br> publishing packages and web page
						editors now use Lorem Ipsum as their <br> default model text
						It is a long established fact that a reader will be distracted by<br>
						the readable content of a page when looking at its layout. <br>
						The point of using Lorem Ipsum is that it has a more-or-less <br>
						normal distribution of letters, as opposed to using 'Content
						here, <br> content here', making it look like readable
						English. Many desktop <br> publishing packages and web page
						editors now use Lorem Ipsum as their <br> default model text
					</div>

					<div class="join_check_law4_div">
						<div class="input_check_div">
							<input class="law_check_box" id="mem_law4_check" type="checkbox" name="mem_law4_check" value="Y">
						</div>
						<div class="a_law_div">
							<a>[선택] 개인정보 처리 위탁 동의</a>
						</div>
					</div>
					<div class="join_check_law_content_div">
						It is a long established fact that a reader will be distracted by<br>
						the readable content of a page when looking at its layout. <br>
						The point of using Lorem Ipsum is that it has a more-or-less <br>
						normal distribution of letters, as opposed to using 'Content
						here, <br> content here', making it look like readable
						English. Many desktop <br> publishing packages and web page
						editors now use Lorem Ipsum as their <br> default model text
						It is a long established fact that a reader will be distracted by<br>
						the readable content of a page when looking at its layout. <br>
						The point of using Lorem Ipsum is that it has a more-or-less <br>
						normal distribution of letters, as opposed to using 'Content
						here, <br> content here', making it look like readable
						English. Many desktop <br> publishing packages and web page
						editors now use Lorem Ipsum as their <br> default model text
					</div>

					<div class="join_check_law5_div">
						<div class="input_check_div">
							<input class="law_check_box" id="mem_law5_check" type="checkbox" name="mem_law5_check" value="Y">
						</div>
						<div class="a_law_div">
							<a>[선택] 쇼핑정보 수신 동의</a>
						</div>
					</div>
					<div class="join_check_law_content_div">
						It is a long established fact that a reader will be distracted by<br>
						the readable content of a page when looking at its layout. <br>
						The point of using Lorem Ipsum is that it has a more-or-less <br>
						normal distribution of letters, as opposed to using 'Content
						here, <br> content here', making it look like readable
						English. Many desktop <br> publishing packages and web page
						editors now use Lorem Ipsum as their <br> default model text
						It is a long established fact that a reader will be distracted by<br>
						the readable content of a page when looking at its layout. <br>
						The point of using Lorem Ipsum is that it has a more-or-less <br>
						normal distribution of letters, as opposed to using 'Content
						here, <br> content here', making it look like readable
						English. Many desktop <br> publishing packages and web page
						editors now use Lorem Ipsum as their <br> default model text
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
					<div class="join_success_Btn_div">
						<input class="join_success_Btn" type="submit" onclick="check()" value="가입하기"><br>
					</div>
				</article>
			</div>
		</div>
	</form>
</div>
<!-- middle 끝 -->

<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js?ver=2"></script>
<%@include file="../bottom.jspf"%>