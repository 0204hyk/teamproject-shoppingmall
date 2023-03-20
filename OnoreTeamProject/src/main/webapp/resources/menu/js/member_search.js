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
				$('#search_id_result_a').css({"color": "red"});
				$('#input_mem_name').val('');
				$('#input_mem_email1').val('');
			} else {
				$('#search_id_result_a').html('찾으시는 아이디는 [' + data + '] 입니다.');
				$('#search_id_result_a').css({"color": "blue"});
				$('#input_mem_name').val('');
				$('#input_mem_email1').val('');	
			}
		},
		 error:function(){
                alert("에러입니다");
            }
	});
};

// 비밀번호 찾기
function findPw_click(){
	var name=$('#input_mem_id').val()
	var email=$('#input_mem_email2').val()
	
	$.ajax({
		url:"./find_pw",
		type:"POST",
		data:{"input_mem_id":name, "input_mem_email2":email},
		success:function(data){
			if(data == 0){
				$('#search_pw_result_a').html("아이디와 이메일을 확인하세요.");
				$('#search_pw_result_a').css({"color": "red"});
				$('#input_mem_id').val('');
				$('#input_mem_email2').val('');
			} else {
				alert('해당 이메일로 임시 비밀번호를 전송하였습니다.');
				window.location.href = "./login"; // 이메일을 전송하고나면 로그인 창으로 이동한다.
			}
		},
		 error:function(){
                alert("에러입니다");
            }
	});
};

//임시 비밀번호 이메일 전송
$(function(){
	$("#search_pw_btn").click(function(){
		$.ajax({
			url : "./find_pw.do",
			type : "POST",
			data : {
				id : $("#mem_id").val(),
				email : $("#mem_email").val()
			},
			success : function(result) {
				alert(result);
			},
		})
	});
})