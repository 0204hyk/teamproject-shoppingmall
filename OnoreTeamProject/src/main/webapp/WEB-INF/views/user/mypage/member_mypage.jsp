<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<link
	href="<%=request.getContextPath()%>/resources/mypage/css/mypage_main.css?ver=1"
	rel="stylesheet" />
<style>
.recent_order_detail_td {
	margin-bottom: 20px;
	border-top: 0.5px dotted black;
	border-bottom: 1px solid black;
}
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
				<div class="photo_div">
					<i id="member_icon" class="fa-solid fa-circle-user"></i>
				</div>
				<div class="member_id_div">${sessionScope.signIn.mem_id}님</div>
				<div class="member_modify_div">
					<input type="button" class="member_pw_btn"
						onclick="location.href='./member_pw_modify'" value="비밀번호변경">
					<input type="button" class="member_modify_btn"
						onclick="location.href='./member_info_modify'" value="회원정보수정">
					<input type="button" class="member_delete_btn"
						onclick="location.href='./memberDelete'" value="회원탈퇴">
				</div>
			</div>

			<div class="recent_order_history_div">
				<div class="recent_order_history_title">최근 주문내역</div>
				<div class="recent_order_history">
					<table>
						<colgroup>
							<col style="width: 80px">
							<col style="width: 150px">
							<col style="width: 500px">
							<col style="width: 200px">
							<col style="width: 300px">
							<col style="width: 400px">
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
										<td><i title="arrow" class="fa-solid fa-chevron-down"></i>
										</td>
										<td class="recent_order_num">order_${my_orders.get(i).order_num}</td>
										<td class="recent_order_name"><input type="checkbox"
											id="order${i}" class="order_accordion" style="display: none;" />
											<label for="order${i}" style="cursor: pointer;">
												${my_orders.get(i).order_name} </label></td>
										<td class="recent_order_pay_price"><fmt:formatNumber
												value="${my_orders.get(i).pay_price}" pattern="#,###" />원</td>
										<td class="recent_order_date">${my_orders.get(i).creationDateTime}</td>
										<td class="recent_order_btns">
											<!-- action="./order/delete" method="POST" -->
											<form class="order_form">
												<input type="hidden" name="order_num"
													value="${my_orders.get(i).order_num}" /> <input
													type="button" class="delivery_btn" value="배송조회" disabled>
												<input type="submit" class="cancel_refund_btn" value="취소/환불">
											</form>
										</td>
									</tr>
									<tr class="recent_order_detail" style="display: none;">
										<td class="recent_order_detail_td" colspan="6">
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
														<th>상품 번호</th>
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
															<td>
																<form action="./review/write" method="GET">
																	<input type="hidden" name="product_num"
																		value="${my_order_infos.get(i).get(j).product_num}" />
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
									<td colspan="5">주문 내역이 없습니다.</td>
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
							<col style="width: 100px">
							<col style="width: 1000px">
							<col style="width: 200px">
						</colgroup>
						<tr>
							<th>쿠폰 번호</th>
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
				<div class="qna_history_title" style="display: flex;">
					<div>나의 문의 내역</div>
					<div style="margin-left: auto;">
						<button id="qna_more">더보기</button>
					</div>
				</div>
				<div class="qna_histoy_content">
					<table id="qna_table">
						<tr>
							<th id="category">분류</th>
							<th id="title">제목</th>
							<th id="date">등록일</th>
							<th id="reply">답변</th>
						</tr>
						<c:forEach items="${qnas }" var="qna">
							<tr>
								<td>${qna.qna_category }</td>
								<td id="qna_content"><a
									href="<%=request.getContextPath() %>/qna/view?qna_num=${qna.qna_num}">
										${qna.qna_title }</a></td>
								<td>${qna.creationQnaDate }</td>
								<c:choose>
									<c:when test="${qna.qna_status eq 0 }">
										<td style="color: gray;">답변 대기중</td>
									</c:when>
									<c:when test="${qna.qna_status eq 1 }">
										<td style="font-weight: bold;">답변 완료</td>
									</c:when>
									<c:otherwise>
										<td>${qna.qna_status }</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="review_history_div">
				<div class="review_history_title" style="display: flex;">
					<div>나의 리뷰 내역</div>
					<div style="margin-left: auto;">
						<button id="review_more">더보기</button>
					</div>
				</div>
				<div class="review_histoy_content">
					<table id="review_table">
						<tr>
							<th id="product">상품이름</th>
							<th id="title">제목</th>
							<th id="date">등록일</th>
							<th id="rating">평점</th>
						</tr>
						<c:forEach items="${reviews }" var="review">
							<tr>
								<td>${review.product_name }</td>
								<td id="review_content"><a
									href="<%=request.getContextPath() %>/review/detail?review_num=${review.review_num}">
										${review.review_content }</a></td>
								<td>${review.creationReviewDate }</td>
								<c:if test="${review.review_rating eq 5 }">
									<td class="star"><i class="fa-solid fa-star"></i> <i
										class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
									</td>
								</c:if>
								<c:if test="${review.review_rating eq 4 }">
									<td class="star"><i class="fa-solid fa-star"></i> <i
										class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i> <i class="fa-regular fa-star"></i></td>
								</c:if>
								<c:if test="${review.review_rating eq 3 }">
									<td class="star"><i class="fa-solid fa-star"></i> <i
										class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
										<i class="fa-regular fa-star"></i> <i
										class="fa-regular fa-star"></i></td>
								</c:if>
								<c:if test="${review.review_rating eq 2 }">
									<td class="star"><i class="fa-solid fa-star"></i> <i
										class="fa-solid fa-star"></i> <i class="fa-regular fa-star"></i>
										<i class="fa-regular fa-star"></i> <i
										class="fa-regular fa-star"></i></td>
								</c:if>
								<c:if test="${review.review_rating eq 1 }">
									<td class="star"><i class="fa-solid fa-star"></i> <i
										class="fa-regular fa-star"></i> <i class="fa-regular fa-star"></i>
										<i class="fa-regular fa-star"></i> <i
										class="fa-regular fa-star"></i></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- middle 끝 -->
	<script
		src="<%=request.getContextPath() %>/resources/mypage/js/order_list.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/mypage/js/mypage.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/menu/js/menubar.js?ver=2">
	</script>

	<%@include file="../bottom.jspf"%>