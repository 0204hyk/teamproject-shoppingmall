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
            url: './idCheck',
            data : {mem_id : $('#mem_id').val() },
            success: function (data) {
                console.log('아이디 존재여부', data)
                if (data == 0) {
                	$('#id_message_p').html('사용가능한 아이디입니다').css('color', 'blue');
				 } else {
                	$('#id_message_p').html('이미 사용중인 아이디입니다').css('color', 'red');
        			alert("회원정보를 확인해주세요"); // 경고창
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
		document.getElementById('email_message_p').innerHTML = "사용 가능한 이메일입니다.<br>"
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
		document.getElementById('name_message_p').innerHTML = "올바른 이름입니다.<br>"
		document.getElementById('name_message_p').style.color = "blue";
	} else {
		document.getElementById('name_message_p').innerHTML = "올바른 이름을 입력하세요."
		document.getElementById('name_message_p').style.color = "red";
	}
}
// 생년월일 + 성별 정규식 : 생년월일 입력 시 주민번호 뒷자리 첫번째 숫자로 성별을 자동으로 체크함
function check_gender() {
	var birth1 = document.getElementById('mem_birth_date').value;
	var birth2 = document.getElementById('mem_birth_date2').value;
	var gender = birth2.substr(0, 1); // 주민번호 뒷자리 앞 첫번째 숫자를 대입
	var regBirth1 = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;
	var regBirth2 = /([1-4]{1})/;
	
	if (regBirth1.test(birth1) == true && regBirth2.test(birth2) == true) {
		document.getElementById('birth_message_p').innerHTML = "사용 가능한 생년월일입니다.<br>"
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
	 var regPhone = /^010([0-9]{8})$/; // 010 다음 8자리 숫자만 허용
	if (regPhone.test(phone) == true) {
		document.getElementById('phone_message_p').innerHTML = "올바른 연락처입니다."
		document.getElementById('phone_message_p').style.color = "blue";
	} else {
		document.getElementById('phone_message_p').innerHTML = "올바른 연락처를 입력하세요."
		document.getElementById('phone_message_p').style.color = "red";
		document.getElementById('mem_phone').focus();
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


function check() {
	var id = document.getElementById("mem_id").value;
	var pw = document.getElementById("mem_pw").value;
	var pw2 = document.getElementById("mem_pw2").value;
	var email = document.getElementById("mem_email").value;
	var name = document.getElementById("mem_name").value;
	var birth1 = document.getElementById("mem_birth_date").value;
	var birth2 = document.getElementById("mem_birth_date2").value;
	var phone = document.getElementById("mem_phone").value;
	
	const regId = /^[a-z]+[a-z0-9]{4,19}$/g; 
	const regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%^*#?&()])[A-Za-z\d$@$!%^*#?&()]{8,}$/;
	const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-zA-Z]([-_.]?[a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	const regName = /^[가-힣]{2,6}$/; //가~힣. 한글로 이뤄진 문자 2~6자리
	const regBirth1 = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;
	const regBirth2 = /([1-4]{1})/;
	const regPhone = /^010([0-9]{8})$/
	
	if (id.trim() === "" || pw.trim() === "" || pw2.trim() === "" || email.trim() === "" || name.trim() === "" || birth1.trim() === "" || birth2.trim() === "" || phone.trim() === "") {
		alert("회원정보를 입력하세요.");
		return false;
	} else if (!regId.test(id) || !regPw.test(pw) || !regPw.test(pw2) || !regEmail.test(email) || !regName.test(name) || !regBirth1.test(birth1) || !regBirth2.test(birth2) || !regPhone.test(phone)) {
		alert("올바른 회원정보를 입력하세요.");
		return false;
	} else {
		return true;
	}
}