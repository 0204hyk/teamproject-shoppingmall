<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결과</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="/project/resources/order/css/order_complete.css"/>
</head>
<body>
	<div class="container">
		<div id="header" class="container-sm w-auto">
			<h2 id="header_title">
				<a style="cursor:pointer;" onclick="location.href = 'http://localhost:8888/project/main/';">
					ONORE
				</a>
			</h2>
			<div class="blank bg-white"></div>
		</div>

		<div class="blank"></div>

		<div id="order_detail" class="container-sm w-auto">
			<p class="fs-3" id="order_detail_title">
				<b>${order.orderer_name}</b>님 주문이 완료되었습니다.
			</p>
			<hr>
			<div class="mb-3 row">
				<label for="order_id" class="col-sm-3 col-form-label fs-5 fw-bold">주문 번호</label>
				<div class="col-sm-9">
					<input type="text" class="form-control-plaintext fs-5"
							id="order_id" value="${order.order_id}" readonly />
				</div>
			</div>
			<hr>
			<div class="mb-3 row">
				<label for="revise_btn" class="col-sm-3 col-form-label fs-5 fw-bold">배송 정보</label>
				<div class="col-sm-9">
					<input type="button" class="btn btn-dark rounded-1" id="revise_btn" value="변경"
						data-bs-toggle="modal" data-bs-target="#exampleModal"/>
				 <form action="/project/order/updateReceiver" method="POST">
				 	<input type="hidden" id="order_num" name="order_num" value="${order.order_num}"/>
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">배송 정보 변경</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
						      <div class="modal-body">
						        <div class="mb-3">
									<label for="receiver_name" class="col-sm-2 col-form-label">수령인</label>
									<input type="text" class="form-control form-control-lg"
										placeholder="수령인" id="receiver_name" name="receiver_name" value="${order.receiver_name}">
									</div>
									<label for="receiver_postalcode" class="col-sm-2 col-form-label">우편번호</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control form-control-lg"
										placeholder="우편번호" id="receiver_zip_code" name="receiver_zip_code" value="${order.receiver_zip_code}">
									<button class="btn btn-outline-secondary" type="button" id="receiver_address_btn">검색</button>
								</div>
								<div class="mb-3">
									<label for="receiver_address" class="col-sm-2 col-form-label">주소</label>
									<input type="text" class="form-control form-control-lg"
										style="background-color: rgb(214, 214, 214);" placeholder="기본주소"
										id="receiver_address" name="receiver_address" value="${order.receiver_address}" readonly/>
									<input type="text" class="form-control form-control-lg" placeholder="상세주소"
										id="receiver_detail_address" name="receiver_detail_address" value="${order.receiver_detail_address}">
								</div>
								<div class="mb-3">
									<label for="receiver_phone" class="col-sm-2 col-form-label">연락처</label>
									<div class="col-sm">
										<input type="text" class="form-control form-control-lg"
											placeholder="연락처" id="receiver_phone" name="receiver_phone" value="${order.receiver_phone}">
									</div>
								</div>
					      	</div>
					      <div class="modal-footer">
					        <button class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="submit" id="revise_submit" class="btn btn-primary">수정</button>
					      </div>
					    </div>
					  </div>
					</div>
				</form>
				</div>
			</div>
			<div id="receiver_info" class="mb-3 row">
				<div>${order.receiver_name}</div>
				<div style="color: rgb(190,190,190);">${order.receiver_phone}</div>
				<div>${order.receiver_address}</div>
				<div>${order.receiver_detail_address}</div>
			</div>
			<div class="accordion accordion-flush" id="pay_info_accordion">
				<div class="accordion-item border-top">
					<h2 class="accordion-header" id="purchase_info_header">
						<button class="accordion-button collapsed fs-5 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#order_info"
							aria-expanded="false" aria-controls="order_info">주문 상세</button>
					</h2>
					<div id="order_info" class="accordion-collapse collapse" aria-labelledby="order_info_header"
						data-bs-parent="#pay_info_accordion">
						<div class="accordion-body">
							<table>
								<c:forEach begin="0" end="${order_infos.size()-1}" var="i">
								<tr>
									<td rowspan="3">
										<div class="img-container">
											<img src="${products.get(i).product_thumbnail_1}">
										</div>
									</td>
									<td>
										<p id="product_name" class="fs-2 fw-semibold">${order_infos.get(i).product_name}</p>
										<input type="hidden" name="product_name" value="${order_infos.get(i).product_name}"/>
									</td>
								</tr>
								<tr>
									<td>
										<p id="order_info_option" class="fs-6 text-black-50">option: ${order_infos.get(i).order_info_option}</p>
										<input type="hidden" name="order_info_option" value="${order_infos.get(i).order_info_option}"/>
									</td>
								</tr>
								<tr>
									<td>
										<p id="order_info_price" class="fs-5 fw-semibold">${order_infos.get(i).order_info_qty}개 / <fmt:formatNumber value="${order_infos.get(i).order_info_price}" pattern="#,###" />원</p>
										<input type="hidden" name="order_info_qty" value="${order_infos.get(i).order_info_qty}"/>
										<input type="hidden" name="order_info_price" value="${order_infos.get(i).order_info_price}"/>
									</td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="order_price_info_header">
						<button class="accordion-button collapsed fs-5 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#order_price_info" aria-expanded="false"
							aria-controls="order_price_info">
							주문 금액
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<p id="pay_price" class="fs-5 fw-bold m-0"><fmt:formatNumber value="${order.pay_price}" pattern="#,###" />원</p>
						</button>
					</h2>
					<div id="order_price_info" class="accordion-collapse collapse"
						aria-labelledby="order_price_info_header" data-bs-parent="#pay_info_accordion">
						<div class="accordion-body">
							<div class="px-3 row">
								<label for="total_price"
									class="col-sm-4 col-form-label fs-6 fw-bold text-black-50">┗ 상품 금액</label>
								<div class="col-sm-7">
									<input type="text" class="form-control-plaintext fs-6 fw-bold text-black-50"
										id="total_price" value="<fmt:formatNumber value="${order.total_price}" pattern="#,###" />원" readonly />
								</div>
							</div>
							<div class="px-3 row">
								<label for="discount_by_coupon"
									class="col-sm-4 col-form-label fs-6 fw-bold text-black-50">┗ 쿠폰 할인</label>
								<div class="col-sm-7">
									<c:choose>
										<c:when test="${discount_by_coupon == '' || discount_by_coupon == 0}">										
											<input type="text" class="form-control-plaintext fs-6 fw-bold text-black-50"
												id="discount_by_coupon" value="0원" readonly />
										</c:when>
										<c:otherwise>
											<input type="text" class="form-control-plaintext fs-6 fw-bold text-black-50"
												id="discount_by_coupon" value="- <fmt:formatNumber value="${discount_by_coupon}" pattern="#,###" />원" readonly />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="px-3 row">
								<label for="discount_points"
									class="col-sm-4 col-form-label fs-6 fw-bold text-black-50">┗ 적립금 할인</label>
								<div class="col-sm-7">
								<c:choose>
									<c:when test="${discount_by_points == null || discount_by_points == 0}">
										<input type="text" class="form-control-plaintext fs-6 fw-bold text-black-50"
											id="discount_points" value="0원" readonly />
									</c:when>
									<c:otherwise>
									<input type="text" class="form-control-plaintext fs-6 fw-bold text-black-50"
										id="discount_points" value="- <fmt:formatNumber value="${discount_by_points}" pattern="#,###" />원" readonly />									
									</c:otherwise>
								</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="purchase_info_header">
						<button class="accordion-button collapsed fs-5 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#purchase_info" aria-expanded="false"
							aria-controls="purchase_info">결제 상세</button>
					</h2>
					<div id="purchase_info" class="accordion-collapse collapse"
						aria-labelledby="purchase_info_header" data-bs-parent="#pay_info_accordion">
						<div class="accordion-body">
							<div class="px-3 row">
								<label for="pay_id"
									class="col-sm-4 col-form-label fs-6 fw-bold text-black-50">┗ 결제 번호</label>
								<div class="col-sm-7">
									<input type="text"
										class="form-control-plaintext fs-6 fw-bold text-black-50"
										id="pay_id" value="${purchase_info.pay_id}" readonly />
								</div>
							</div>
							<div class="px-3 row">
								<label for="pay_method"
									class="col-sm-4 col-form-label fs-6 fw-bold text-black-50">┗ 결제 방식</label>
								<div class="col-sm-7">
									<input type="text"
										class="form-control-plaintext fs-6 fw-bold text-black-50"
										id="pay_method" value="${purchase_info.pay_method}" readonly />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item border-bottom">
					<h2 class="accordion-header" id="points_info_header">
						<button class="accordion-button collapsed fs-5 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#points_info" aria-expanded="false"
							aria-controls="points_info">
							적립금 혜택
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;
							<p id="expected_points" class="fs-5 fw-bold m-0">최대 <fmt:formatNumber value="${expected_points}" pattern="#,###" />원</p>
						</button>
					</h2>
					<div id="points_info" class="accordion-collapse collapse"
						aria-labelledby="points_info_header"
						data-bs-parent="#pay_info_accordion">
						<div class="accordion-body">
							<div class="px-3 row">
								<label for="basic_points"
									class="col-sm-5 col-form-label fs-6 fw-bold text-black-50">┗ 기본 적립 (결제 금액의 1%)</label>
								<div class="col-sm-6">
									<input type="text" class="form-control-plaintext fs-6 fw-bold text-black-50"
										id="basic_points" value="<fmt:formatNumber value="${basic_points}" pattern="#,###" />원" readonly />
								</div>
							</div>
							<div class="px-3 row">
								<label for="review_points"
									class="col-sm-4 col-form-label fs-6 fw-bold text-black-50">┗ 리뷰 적립</label>
								<div class="col-sm-7">
									<input type="text" class="form-control-plaintext fs-6 fw-bold text-black-50"
										id="review_points" value="1,000원" readonly />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="blank bg-white"></div>
		<div id="btn_container" class="container-sm w-auto">
			<button type="button" id="home_btn" class="btn btn-lg btn-dark w-100 rounded-1"
					onclick="location.href='http://localhost:8888/project/main/';">
				홈으로
			</button>
		</div>
		<div class="blank"></div>
	</div>
	<script>
		const revise_btn = document.getElementById('revise_btn');
		const myInput = document.getElementById('myInput');
	
		revise_btn.addEventListener('shown.bs.modal', () => {
		  myInput.focus();
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/resources/order/js/address.js"></script>
</body>
</html>