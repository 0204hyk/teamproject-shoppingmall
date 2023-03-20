<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<link href="<%=request.getContextPath() %>/resources/mypage/css/mypage_main.css" rel="stylesheet"/>
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
		        	<table>
						<colgroup>
							<col style="width:80px">
							<col style="width:150px">
							<col style="width:500px">
							<col style="width:200px">
							<col style="width:300px">
							<col style="width:200px">
							<col style="width:400px">
						</colgroup>
		       			<tr>
		       				<th></th>
		       				<th>주문 번호</th>
		       				<th>주문 명</th>
		       				<th>결제 가격</th>
		        			<th>주문 날짜</th>
		        			<th>상태</th>
		        			<th>버튼</th>
		        		</tr>
		        		<c:choose>
		        			<c:when test="${not empty my_orders || my_orders.size() > 0}">
				       			<c:forEach begin="0" end="${my_orders.size()-1}" var="i">
					       			<tr class="recent_order">
					       				<td>
					       					<input type="checkbox" id="arrow${i}" class="order_accordion_arrow" style="display:none;"/>
						       				<label for="arrow${i}" style="cursor:pointer;">
					       						<i title="arrow" class="fa-solid fa-chevron-down"></i>
					       					</label>
					       				</td>
					       				<td class="recent_order_num">order_${my_orders.get(i).order_num}</td>
					       				<td class="recent_order_name">
						       				<input type="checkbox" id="order${i}" class="order_accordion" style="display:none;"/>
						       				<label for="order${i}" style="cursor:pointer;">
						       					${my_orders.get(i).order_name}
						       				</label>
					       				</td>
					       				<td class="recent_order_pay_price"><fmt:formatNumber value="${my_orders.get(i).pay_price}" pattern="#,###" />원</td>
					        			<td class="recent_order_date">${my_orders.get(i).creationDateTime}</td>
					        			<td class="recent_order_status">
					        				<c:choose>
					        					<c:when test="${my_orders.get(i).order_status eq 0}">
					        						주문 완료
					        					</c:when>
					        					<c:when test="${my_orders.get(i).order_status eq 1}">
					        						환불 요청
					        					</c:when>
					        					<c:when test="${my_orders.get(i).order_status eq 2}">
					        						환불 완료
					        					</c:when>
					        					<c:otherwise>
					        						ERROR
					        					</c:otherwise>
					        				</c:choose>
					        			</td>
					        			<td class="recent_order_btns">
						        			<!-- action="./order/delete" method="POST" -->
						        			<form class="order_form">
						        				<input type="hidden" name="order_num" value="${my_orders.get(i).order_num}"/>
								        		<input type="button" class="delivery_btn" value="배송조회" disabled>
									        	<input type="submit" class="cancel_refund_btn" value="취소/환불">
									        </form>
					        			</td>
					        		</tr>
						        		<tr class="recent_order_detail" style="display:none;">
								        	<td class="recent_order_detail_td" colspan="7">
								        		<div>
													<table>
														<colgroup>
															<col style="width: 100px">
															<col style="width: 200px">
															<col style="width: 700px">
															<col style="width: 250px">
															<col style="width: 250px">
															<col style="width: 200px">
														</colgroup>
														<tr>
															<th>Num</th>
															<th>상품 이름</th>
															<th>옵션</th>
															<th>가격</th>
															<th>수량</th>
															<th>버튼</th>
														</tr>
														<c:forEach begin="0" end="${my_order_infos.get(i).size()-1}" var="j">
															<tr>
																<td>order_${my_orders.get(i).order_num}_${j+1}</td>
																<td>${my_order_infos.get(i).get(j).product_name}</td>
																<td>${my_order_infos.get(i).get(j).order_info_option}</td>
																<td>${my_order_infos.get(i).get(j).order_info_price}</td>
																<td>${my_order_infos.get(i).get(j).order_info_qty}</td>
																<td>
																<form action="./review/write" method="GET">
																	<input type="hidden" name="product_num" value="${my_order_infos.get(i).get(j).product_num}"/>
																	<input type="submit" class="review_btn" value="리뷰쓰기">
																</form>
																</td>
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
					        		<td colspan="7">주문 내역이 없습니다.</td>
					        	</tr>
		        			</c:otherwise>
		        		</c:choose>
		        	</table>
		        </div>
        	</div>
        
        <div class="coupon_history_div">
        	<div class="coupon_history_title">나의 쿠폰</div>
	        <div class="coupon_content_div">
	        	<table>
						<colgroup>
							<col style="width:100px">
							<col style="width:1000px">
							<col style="width:200px">
						</colgroup>
		       			<tr>
		       				<th>NUM</th>
		       				<th>쿠폰 이름</th>
		       				<th>할인률</th>
		       			</tr>
		       			<c:forEach items="${my_coupons}" var="coupon" varStatus="status">
			       			<tr>
			       				<td>${status.index+1}</td>
			       				<td>${coupon.coupon_name}</td>
			       				<td>${coupon.coupon_discount * 100}%</td>
			       			</tr>
			       		</c:forEach>
		        </table>
	        </div>
		</div>

		
        <div class="qna_history_div">
       		<div class="qna_history_title">나의 문의 내역 (1:1 상담)</div>
        	<div class="qna_content_div">나의 문의 내역 (1:1 상담) 내용</div>
		</div>
    </div>
</div>
<!-- middle 끝 -->

<script src="<%=request.getContextPath() %>/resources/mypage/js/order_list.js"></script>
<script src="<%=request.getContextPath() %>/resources/mypage/js/update_order.js"></script>
<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js"></script>
<%@include file="../bottom.jspf"%>