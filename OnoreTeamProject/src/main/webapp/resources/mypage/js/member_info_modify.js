//이메일 정규식
function check_email() {
	var email = $("#mem_email").val();
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-zA-Z]([-_.]?[a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (regEmail.test(email) == true) {
		$('#info_modify_email_message_p').text("사용 가능한 이메일입니다.").css("color", "blue");
	} else {
		$('#info_modify_email_message_p').text("올바른 이메일을 입력하세요.").css("color", "red");
	}
}

// 연락처(핸드폰번호) 정규식
function check_phone() {
	var phone = $("#mem_phone").val();
	var regPhone = /^010([0-9]{8})$/; // 010 다음 8자리 숫자만 허용
	if (regPhone.test(phone) == true) {
		$('#info_modify_phone_message_p').text("올바른 연락처 입니다.").css("color", "blue");
	} else {
		$('#info_modify_phone_message_p').text("올바른 연락처를 입력하세요.").css("color", "red");
	}
}

function check() {
	const email = $("#mem_email").val();
	const phone = $("#mem_phone").val();
	const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-zA-Z]([-_.]?[a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	const regPhone = /^010([0-9]{8})$/

	if (email.trim() === "" || phone.trim() === "") {
		alert("이메일과 핸드폰번호를 입력해주세요.");
		return false;
	} else if (!regEmail.test(email)) {
		alert("올바른 이메일을 입력하세요.");
		return false;
	} else if (!regPhone.test(phone)) {
		alert("올바른 핸드폰번호를 입력하세요.");
		return false;
	} else {
		return true;
	}
}

$(document).ready(function() {
	$('#mem_email').on('input', check_email);
	$('#mem_phone').on('input', check_phone);
	$('#info_modify_form').submit(function() {
		return check();
	});
});