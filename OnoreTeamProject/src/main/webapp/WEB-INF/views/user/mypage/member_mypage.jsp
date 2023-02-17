<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" href="/project/resources/main/images/파비콘.png">
    <title>ONÓRE</title>
<%@include file="../member/member_header.jspf" %>
    
</head>
<body>

<%@include file="../member/member_top.jspf" %>
    
<div class="join_form_div">
    <form id="join_form" action="/addMember" method="POST" name="join_form" >
	    <div class="joindiv" style="">
		    <div class="title_join"><h2>내 정보</h2></div>
		    <div class="title_id_content">아이디 <input type="text" name="mem_id"></div>
		    <div class="title_password_content">비밀번호 <input type="password1" name="mem_pw"></div>
		    <div class="title_password_content">비밀번호 확인 <input type="password2" name="mem_pw2"></div>
		    <div class="title_email_content">이메일 <input type="email" name="mem_email"></div>
		    <div class="title_name_content">이름 <input type="text" name="mem_name"></div>
		    <div class="title_birth_content">생년월일 <input type="text" name="mem_birth"></div>
		    
		    <div class="check_gender">
			    <div class="check_men_div">남성 <input type="radio" name="mem_gender"></div>
			    <div class="check_women_div">여성 <input type="radio" name="mem_gender"></div>
		    </div>
		    <div class="title_phone_content">연락처 <input type="text" name="mem_phone"></div>
			
			<div class="age_law_div"><input type="checkbox" name="age_law"><a class="age_law">[필수] 만 14세 이상입니다.</a></div>
			<div class="all_agree_div"><input type="checkbox" name="all_agree"><a class="all_agree">[필수] 모두 동의합니다.</a></div>
			
			<div class="agree1_div"><input type="checkbox" name="agree1"><a class=agree1>[필수] 이용약관 동의</a></div>
			<div class="agree1_text_div">
				It is a long established fact that a reader will be distracted by<br>
				the readable content of a page when looking at its layout. <br>
				The point of using Lorem Ipsum is that it has a more-or-less <br>
				normal distribution of letters, as opposed to using 'Content here, <br> 
				content here', making it look like readable English. Many desktop  <br>
				publishing packages and web page editors now use Lorem Ipsum as their <br>
				default model text
			</div>
			
			<div class="agree2_div"><input type="checkbox" name="agree2"><a class=agree2>[필수] 개인정보 수집 및 이용 동의</a></div>
			<div class="agree2_text_div">
				It is a long established fact that a reader will be distracted by<br>
				the readable content of a page when looking at its layout. <br>
				The point of using Lorem Ipsum is that it has a more-or-less <br>
				normal distribution of letters, as opposed to using 'Content here, <br> 
				content here', making it look like readable English. Many desktop  <br>
				publishing packages and web page editors now use Lorem Ipsum as their <br>
				default model text
			</div>
			
			<div class="agree3_div"><input type="checkbox" name="agree3"><a class=agree3>[선택] 개인정보 처리 위탁 동의</a></div>
			<div class="agree3_text_div">
				It is a long established fact that a reader will be distracted by<br>
				the readable content of a page when looking at its layout. <br>
				The point of using Lorem Ipsum is that it has a more-or-less <br>
				normal distribution of letters, as opposed to using 'Content here, <br> 
				content here', making it look like readable English. Many desktop  <br>
				publishing packages and web page editors now use Lorem Ipsum as their <br>
				default model text
			</div>
			
			<div class="agree4_div"><input type="checkbox" name="agree4"><a class=agree4>[선택] 쇼핑정보 수신 동의</a></div>
		    <div class="agree4_text_div">
				It is a long established fact that a reader will be distracted by<br>
				the readable content of a page when looking at its layout. <br>
				The point of using Lorem Ipsum is that it has a more-or-less <br>
				normal distribution of letters, as opposed to using 'Content here, <br> 
				content here', making it look like readable English. Many desktop  <br>
				publishing packages and web page editors now use Lorem Ipsum as their <br>
				default model text
			</div>
			
		    <div class="sms_check_div"><input type="checkbox" name="sms_check"><a class=sms_check>[선택] 쇼핑정보 수신 동의</a></div>
		    <div class="eamil_check_div"><input type="checkbox" name="email_check"><a class=email_check>[선택] 쇼핑정보 수신 동의</a></div>
		    
		    <article>
		    <div class="joindiv">
		    	<input class="join_success_Btn" type="submit" onclick="./main" value="가입하기"><br>
		    </div>
		    </article>
	      </div>
	</form>
</div>
       
<script src="/project/resources/menu/js/menu.js"></script>
<%@include file="../member/member_bottom.jspf" %>