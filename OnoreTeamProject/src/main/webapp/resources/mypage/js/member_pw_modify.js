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
}

function check() {
	var pw = document.getElementById("mem_pw").value;
	var pw2 = document.getElementById("mem_pw2").value;
	
	const regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%^*#?&()])[A-Za-z\d$@$!%^*#?&()]{8,}$/;
	
	if (pw.trim() === "" || pw2.trim() === "") {
		event.preventDefault();
		alert("비밀번호를 입력하세요.");
		return false;
	} else if (!regPw.test(pw) || pw != pw2) {
		event.preventDefault();
		alert("올바른 비밀번호를 입력하세요.");
		return false;
	} else {
		return true;
	}
}