<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

$(document).ready(function() {                                                                                            
                                                                                            
});   
	
</script>
<%@include file="../member/member_header.jspf" %>    
</head>
<body>
<%@include file="../member/member_top.jspf" %>

<!-- middle 시작 -->
<div class="middle_idpw_search_div">
	<form id="idpw_search_form" action="/member_search" method="POST" name="idpw_search_form" class="idpw_search_form">
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
					<input name="input_mem_name" id="input_mem_name" type="text">
				</div>
				<div class="search_email_div">
					<a>이메일</a>
				</div>
				<div class="search_input_email_div">
					<input name="input_mem_email" id="input_mem_email" type="email">
				</div>
				
				<!-- 
				  <c:if test="${empty input_mem_name or empty input_mem_email}">
				    <div class="message_div">이름과 이메일을 입력하세요.</div>
				  </c:if>
				  <c:if test="${empty memberdto}">
				  	<div class="message_div">입력하신 정보에 대한 아이디가 없습니다.</div>
				  </c:if>
				  <c:if test = "${not empty memberdto}">
				    <div class="message_div">찾으시는 아이디는 '${memberdto.mem_id }'입니다.</div>
					</c:if>
				-->
					
				<c:choose>
				<c:when test="${empty memberdto}">                                                 
	                <p class="message_div">조회결과가 없습니다.</p>                                        
	            </c:when>                                                                         
	            <c:otherwise>                                                                     
	                <p class="message_div">${memberdto.mem_id}</p>                                              
	            </c:otherwise>                                                                    
	       		</c:choose>  
				 
				<article class="search_id_article">
					<div class="search_id_btn_div">
						<input name="search_id_btn" class="search_id_btn" type="submit" value="아이디 찾기">
					</div>
				</article>
			</div>
			
			<div id="search_pw_div" style="display: none;">
				<div class="search_id_div">
					<a>아이디</a>
				</div>
				<div class="search_input_id_div">
					<input name="input_mem_id" id="input_mem_id" type="text">
				</div>
				<div class="search_email_div">
					<a>이메일</a>
				</div>
				<div class="search_input_email_div">
					<input name="input_mem_email" id="input_mem_email" type="email">
				</div>
				
				<c:choose>
				<c:when test="${empty memberdto}">                                                 
	                <p class="message_div">조회결과가 없습니다.</p>                                        
	            </c:when>                                                                         
	            <c:otherwise>                                                                     
	                <p class="message_div">${memberdto.mem_pw}</p>                                              
	            </c:otherwise>                                                                    
	       		</c:choose>  
				
				<article class="search_pw_article">
					<div class="search_pw_btn_div">
						<input name="search_pw_btn" class="search_pw_btn" type="submit" value="비밀번호 찾기">
					</div>
				</article>
			</div>
			
		</div>
	</form>

	<div class="go_login_Btn_div">
		<input class="go_login_Btn" type="submit" onclick="location.href='./login'" value="로그인 하기">
	</div>
</div>
<!-- middle 끝 -->

<script src="/project/resources/menu/js/menubar.js"></script>
<%@include file="../member/member_bottom.jspf"%>