<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<link href="<%=request.getContextPath() %>/resources/mypage/css/mypage_main.css?ver=1" rel="stylesheet"/>
<style>

</style>
<%@include file="../header.jspf"%>
</head>
<body>
<%@include file="../top.jspf"%>

<!-- middle 시작 -->
<div class="middle_mypage_div">
	<div class="mypage_div">
		<div class="member_info_div">
			<div class="mypage_title">My Page</div>
			<div class="photo_div"><i id="member_icon" class="fa-solid fa-circle-user"></i></div>
			<div class="member_id_div">${sessionScope.signIn.mem_id}님</div>
			<div class="member_modify_div">
				<input type="button" class="member_pw_btn" onclick="location.href='./member_pw_modify'" value="비밀번호변경">
				<input type="button" class="member_modify_btn" onclick="location.href='./member_info_modify'" value="회원정보수정">
				<input type="button" class="member_delete_btn" onclick="location.href='./memberDelete'" value="회원탈퇴">
			</div>
		</div>
        
        <div class="recent_order_history_div">
        	<div class="recent_order_history_title">최근 주문내역</div>
	        	<div class="recent_order_history">
		        	<table style="margin-bottom : 5px;">
						<colgroup>
							<col style="width:80px">
							<col style="width:150px">
							<col style="width:500px">
							<col style="width:200px">
							<col style="width:300px">
							<col style="width:400px">
						</colgroup>
		       			<tr>
		       				<th></th>
		       				<th>주문 번호</th>
		       				<th>주문 명</th>
		       				<th>결제 가격</th>
		        			<th>주문 날짜</th>
		        			<th>버튼</th>
		        		</tr>
		        		<c:choose>
		        			<c:when test="${not empty my_orders}">
				       			<c:forEach begin="0" end="${my_orders.size()-1}" var="i">
					       			<tr class="recent_order">
					       				<td>
					       					<i class="fa-solid fa-chevron-up"></i>
					       				</td>
					       				<td class="recent_order_num">order_${my_orders.get(i).order_num}</td>
					       				<td class="recent_order_name">
						       				<input type="checkbox" class="order_accordion" id="order${i}" style="display:none;"/>
						       				<label for="order${i}" style="cursor:pointer;">
						       					${my_orders.get(i).order_name}
						       				</label>
					       				</td>
					       				<td class="recent_order_pay_price"><fmt:formatNumber value="${my_orders.get(i).pay_price}" pattern="#,###" />원</td>
					        			<td class="recent_order_date">${my_orders.get(i).creationDateTime}</td>
					        			<td class="recent_order_btns">
					        				<input type="button" class="review_btn" value="리뷰쓰기">
							        		<input type="button" class="delivery_btn" value="배송조회">
								        	<input type="button" class="cancel_refund_btn" value="취소/환불">
					        			</td>
					        		</tr>
						        		<tr class="recent_order_detail" style="display:none;">
								        	<td colspan="6" style="margin-bottom: 20px; border-top: 0.5px dotted black; border-bottom: 1px solid black;">
								        		<div>
													<table>
														<colgroup>
															<col style="width: 100px">
															<col style="width: 200px">
															<col style="width: 700px">
															<col style="width: 100px">
															<col style="width: 100px">
															<col style="width: 150px">
														</colgroup>
														<tr>
															<th>Num</th>
															<th>상품 이름</th>
															<th>옵션</th>
															<th>가격</th>
															<th>수량</th>
															<th>버튼</th>
														</tr>
														<c:forEach begin="0"
															end="${my_order_infos.get(i).size()-1}" var="j">
															<tr>
																<td>order_${my_orders.get(i).order_num}_${j+1}</td>
																<td>${my_order_infos.get(i).get(j).product_name}</td>
																<td>${my_order_infos.get(i).get(j).order_info_option}</td>
																<td>${my_order_infos.get(i).get(j).order_info_price}</td>
																<td>${my_order_infos.get(i).get(j).order_info_qty}</td>
																<td></td>
															</tr>
														</c:forEach>
													</table>
												</div>
											</td>
						        		</tr>
				        		</c:forEach>
		        			</c:when>
		        			<c:otherwise>
		        				<tr>
					        		<td colspan="5">주문 내역이 없습니다.</td>
					        	</tr>
		        			</c:otherwise>
		        		</c:choose>
		        	</table>
		        </div>
        	</div>
        
        <div class="coupon_history_div">
        	<div class="coupon_history_title">나의 쿠폰</div>
	        <div class="coupon_content_div">나의 쿠폰 내용</div>
		</div>

		
        <div class="qna_history_div">
       		<div class="qna_history_title">나의 문의 내역 (1:1 상담)</div>
        	<div class="qna_content_div">나의 문의 내역 (1:1 상담) 내용</div>
		</div>
    </div>
</div>
<!-- middle 끝 -->

<!-- 아코디언 동작 -->
    <script>
    	const arrow = document.getElementsByTagName('i[class*="fa-solid"]');
    	const recent_order_details = document.querySelectorAll('.recent_order_detail');
    	const order_accordions = document.querySelectorAll('.order_accordion');
    	
	    	order_accordions.forEach((check, index) => {
	    		check.addEventListener('change', () => {    			
					if(order_accordions[index].checked == true) {
						arrow.className = 'fa-solid fa-chevron-down';
						recent_order_details[index].style.display = '';
					} else {
						arrow.className = 'fa-solid fa-chevron-up';
						recent_order_details[index].style.cssText = "display:none;";
					}
	    		});
	    	});
    </script>
<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js?ver=2"></script>
<%@include file="../bottom.jspf"%>