<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="/project/resources/order/css/order_main.css"/>
<title>결제 페이지</title>
</head>
</head>

<body>

	<div class="container">
		<form action="<%=request.getContextPath()%>/order/result" id="order_form" method="POST">
			<div id="header" class="container-sm w-auto">
		    	<h2><a style="cursor:pointer;" onclick="toHomePage();">ONORE</a></h2>
		    	<div class="blank bg-white"></div>
			</div>
			<div class="blank"></div>
			
			<div id="order_infos" class="container-sm w-auto">
		    <h5>주문 상품 (<span id="order_name">${order_name}</span>)</h5>
		    <input type="hidden" value="${order_name}" name="order_name"/>
			
			<table>
				<c:choose>
					<c:when test="${products != null}">
						<c:forEach begin="0" end="${products.size() - 1}" var="i">
							<tr>
							<td rowspan="3">
								<div class="img-container">
									<img src="${products.get(i).product_thumbnail_1}">
								</div>
							</td>
								<td>
									<p id="product_name" class="fs-2 fw-semibold">${products.get(i).product_name}</p>
									<input type="hidden" name="product_name" value="${products.get(i).product_name}"/>
								</td>
							</tr>
							<tr>
								<td>
									<p id="order_info_option" class="fs-6 text-black-50">${cart.get(i).cart_product_option}</p>
									<input type="hidden" name="order_info_option" value="${cart.get(i).cart_product_option}"/>
								</td>
							</tr>
							<tr>
								<td>
									<p class="fs-5 fw-semibold">${cart.get(i).cart_product_qty}개 / <fmt:formatNumber value="${cart.get(i).cart_product_price}" pattern="#,###" />원</p>
									<input type="hidden" name="order_info_qty" value="${cart.get(i).cart_product_qty}"/>
									<input type="hidden" name="order_info_price" value="${cart.get(i).cart_product_price}"/>
									<input type="hidden" name="cart_num" value="${cart.get(i).cart_num}" />
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${product != null}">
						<tr>
							<td rowspan="3">
								<div class="img-container">
									<img src="${product.product_thumbnail_1}">
								</div>
							</td>
								<td>
									<p id="product_name" class="fs-2 fw-semibold">${product.product_name}</p>
									<input type="hidden" name="product_name" value="${product.product_name}"/>
									<input type="hidden" name="product_num" value="${product.product_num}" />
								</td>
							</tr>
							<tr>
								<td>
									<p id="order_info_option" class="fs-6 text-black-50">${cart.cart_product_option}</p>
									<input type="hidden" name="order_info_option" value="${cart.cart_product_option}"/>
								</td>
							</tr>
							<tr>
								<td>
									<p class="fs-5 fw-semibold">${cart.cart_product_qty}개 / <fmt:formatNumber value="${cart.cart_product_price}" pattern="#,###" />원</p>
									<input type="hidden" name="order_info_qty" value="${cart.cart_product_qty}"/>
									<input type="hidden" name="order_info_price" value="${cart.cart_product_price}"/>
								</td>
							</tr>
					</c:when>
				</c:choose>
			</table>
			<hr>
            <div class="mb-3 row">
				<label class="col-md-3 col-form-label fs-4">상품 합계</label>
				<div class="col-sm-9">
					<input type="text" class="form-control-plaintext fs-4 fw-bold"
						value="<fmt:formatNumber value="${total_price}" pattern="#,###" />원" readonly>
				</div>
			</div>
		</div>

		<div class="blank"></div>

		<div id="buyer_info" class="container-sm w-auto">
			<h5>주문자</h5>
			<input type="hidden" id="orderer_id" name="orderer_id" value="${orderer.mem_id}"/>
			<div class="mb-3">
				<label for="orderer_name" class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm">
					<input type="text" class="form-control form-control-lg"
						placeholder="이름" id="orderer_name" name="orderer_name" value="${orderer.mem_name}">
				</div>
				<div id="orderer_name_msg" class="text-danger"></div>
			</div>
			<div class="mb-3">
				<label for="orderer_phone" class="col-sm-2 col-form-label">연락처</label>
				<div class="col-sm">
					<input type="text" class="form-control form-control-lg"
						placeholder="연락처" id="orderer_phone" name="orderer_phone" value="${orderer.mem_phone}">
				</div>
				<div id="orderer_phone_msg" class="text-danger"></div>
			</div>
			<div class="mb-3">
				<label for="orderer_email" class="col-sm-2 col-form-label">이메일</label>
				<div class="col-sm">
					<input type="text" class="form-control form-control-lg"
						placeholder="이메일" id="orderer_email" name="orderer_email" value="${orderer.mem_email}">
				</div>
				<div id="orderer_email_msg" class="text-danger"></div>
			</div>
		</div>

		<div class="blank"></div>

		<div id="shipping_address" class="container-sm w-auto">
			<h5>배송지</h5>
			<c:choose>
				<c:when test="${orderer.mem_street_address eq null}">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
						<input type="radio" class="btn-check" name="address_btn" id="btnradio1" value="default" onclick="setAddress(event)"
							autocomplete="off" disabled>
						<label class="btn btn-outline-dark" for="btnradio1">기존 배송지</label>
						<input type="radio" class="btn-check" name="address_btn" id="btnradio2" value="new" onclick="setAddress(event)"
							autocomplete="off" checked>
						<label class="btn btn-outline-dark" for="btnradio2">신규 배송지</label>
					</div>
					<div class="mb-3">
						<label for="receiver_name" class="col-sm-2 col-form-label">수령인</label>
						<input type="text" class="form-control form-control-lg"
							placeholder="수령인" id="receiver_name" name="receiver_name">
						<div id="receiver_name_msg" class="text-danger"></div>
					</div>
					<label for="receiver_postalcode" class="col-sm-2 col-form-label">우편번호</label>
					<div class="input-group mb-3">
						<input type="text" class="form-control form-control-lg"
							placeholder="우편번호" id="receiver_zip_code" name="receiver_zip_code">
						<button class="btn btn-outline-dark" type="button" id="receiver_address_btn">검색</button>
						<div id="receiver_zip_code_msg" class="text-danger"></div>
					</div>
					<div class="mb-3">
						<label for="receiver_address" class="col-sm-2 col-form-label">주소</label>
						<input type="text" class="form-control form-control-lg"
							style="background-color: rgb(214, 214, 214);" placeholder="기본주소"
							id="receiver_address" name="receiver_address" readonly/>
						<div id="receiver_address_msg" class="text-danger"></div>
						<input type="text" class="form-control form-control-lg" placeholder="상세주소"
							id="receiver_detail_address" name="receiver_detail_address">
						<div id="receiver_detail_address_msg" class="text-danger"></div>
					</div>
					<div class="form-check">
						<input class="form-check-input" id="flexCheckDefault" type="checkbox" name="set_default_check" value="default" checked>
						<label class="form-check-label" for="flexCheckDefault"> 기본 배송지로 설정하기 </label>						
					</div>
				</c:when>
				<c:otherwise>
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
						<input type="radio" class="btn-check" name="address_btn" id="btnradio1" value="default" onclick="setAddress(event)"
							autocomplete="off" checked>
						<label class="btn btn-outline-dark" for="btnradio1">기존 배송지</label>
						<input type="radio" class="btn-check" name="address_btn" id="btnradio2" value="new" onclick="setAddress(event)"
							autocomplete="off">
						<label class="btn btn-outline-dark" for="btnradio2">신규 배송지</label>
					</div>
					<div class="mb-3">
						<label for="receiver_name" class="col-sm-2 col-form-label">수령인</label>
						<input type="text" class="form-control form-control-lg"
							placeholder="수령인" id="receiver_name" name="receiver_name" value="${orderer.mem_name}">
						<div id="receiver_name_msg" class="text-danger"></div>
					</div>
					<label for="receiver_postalcode" class="col-sm-2 col-form-label">우편번호</label>
					<div class="input-group mb-3">
						<input type="text" class="form-control form-control-lg"
							placeholder="우편번호" id="receiver_zip_code" name="receiver_zip_code" value="${orderer.mem_zip_code}">
						<button class="btn btn-outline-dark" type="button" id="receiver_address_btn">검색</button>
						<div id="receiver_zip_code_msg" class="text-danger"></div>
					</div>
					<div class="mb-3">
						<label for="receiver_address" class="col-sm-2 col-form-label">주소</label>
						<input type="text" class="form-control form-control-lg"
							style="background-color: rgb(214, 214, 214);" placeholder="기본주소"
							id="receiver_address" name="receiver_address" value="${orderer.mem_street_address}" readonly/>
						<div id="receiver_address_msg" class="text-danger"></div>
						<input type="text" class="form-control form-control-lg" placeholder="상세주소"
							id="receiver_detail_address" name="receiver_detail_address" value="${orderer.mem_detail_address}">
						<div id="receiver_detail_address_msg" class="text-danger"></div>
					</div>
					<div class="form-check">
						<input class="form-check-input" id="flexCheckDefault" type="checkbox" name="set_default_check" value="default">
						<label class="form-check-label" for="flexCheckDefault"> 기본 배송지로 설정하기 </label>						
					</div>
				</c:otherwise>
			</c:choose>
				<br>
				<div class="mb-3">
						<label for="receiver_phone" class="col-sm-2 col-form-label">연락처</label>
						<div class="col-md">
							<input type="text" class="form-control form-control-lg"
								placeholder="연락처" id="receiver_phone" name="receiver_phone" value="${orderer.mem_phone}">
						<div id="receiver_phone_msg" class="text-danger"></div>
						</div>
					</div>
				<div class="mb-3">
					<label for="receiver_req" class="col-sm-4 col-form-label">배송 시 요청사항</label>
					<div class="col-md">
						<input type="text" class="form-control form-control-lg"
							placeholder="요청사항" id="receiver_req" name="receiver_req">
					</div>
				</div>
			</div>

		<div class="blank"></div>

		<div id="payment_information" class="container-sm w-auto">
			<h5>결제 정보</h5>

			<div class="mb-3">
				<label for="discount_coupons" class="col-sm-2 col-form-label">할인 쿠폰</label>
				<c:choose>
					<c:when test="${coupons.size() > 0}">
						<select class="form-select form-select-lg" id="coupon" onchange="discount(this)">
							<option value="0" selected>선택하세요</option>
							<c:forEach items="${coupons}" var="coupon">
								<option value="${coupon.coupon_discount}">${coupon.coupon_name}</option>
							</c:forEach>
						</select>
					</c:when>
					<c:otherwise>
						<select class="form-select form-select-lg" id="coupon" disabled>
							<option value="0" selected>사용 가능한 쿠폰이 없습니다</option>
						</select>
					</c:otherwise>
				</c:choose>
				<input type="hidden" id="discount_coupon" name="discount_coupon"/>
			</div>
			<label for="discount_points" class="col-sm-6 col-form-label">
				적립금 (보유 적립금 <span id="mem_points_txt"><fmt:formatNumber value="${orderer.mem_point}" pattern="#,###" /></span>원)
				<input type="hidden" id="mem_points" value="${orderer.mem_point}"/>
			</label>
			<div class="input-group mb-3">
				<input type="text" class="form-control form-control-lg"
					placeholder="적립금" id="discount_points" name="discount_points" value="0">
				<button class="btn btn-outline-dark" type="button" id="discount_points_btn">적용</button>
			</div>
			<c:choose>
				<c:when test="${accessible_points <= orderer.mem_point}">
					<div>사용 가능한 적립금 : <span id="accessible_points_txt"><fmt:formatNumber value="${accessible_points}" pattern="#,###" /></span>원</div>
					<input type="hidden" id="accessible_points" value="${accessible_points}"/>
				</c:when>
				<c:otherwise>					
					<div>사용 가능한 적립금 : <span id="accessible_points_txt"><fmt:formatNumber value="${orderer.mem_point}" pattern="#,###" /></span>원</div>
					<input type="hidden" id="accessible_points" value="${accessible_points}"/>
				</c:otherwise>
			</c:choose>
			<hr>
			<div class="mb-3 row">
				<label for="total_price" class="col-sm-3 col-form-label">상품 합계</label>
				<div class="col-md-9">
					<input type="text" id="total_price_txt" class="form-control-plaintext fs-4 fw-bold" value="<fmt:formatNumber value="${total_price}" pattern="#,###" />원">
					<input type="hidden" id="total_price" name="total_price" value="${total_price}" readonly>
				</div>
				<label for="total_discount" class="col-sm-3 col-form-label">총 할인 금액</label>
				<div class="col-md-9">
					<input type="text" id="total_discount_txt" class="form-control-plaintext fs-4 fw-bold" value="0원">
					<input type="hidden" id="total_discount" name="total_discount" value="0">
				</div>
			</div>
			<hr>
			<div class="mb-3 row">
				<label for="pay_price" class="col-sm-3 col-form-label fs-4">결제 금액</label>
				<div class="col-md-9">
					<input type="text" id="pay_price_txt" class="form-control-plaintext fs-4 fw-bold" value="<fmt:formatNumber value="${total_price}" pattern="#,###" />원"/>
					<input type="hidden" id="pay_price" name="pay_price" value="${total_price}" readonly/>
				</div>
			</div>
		</div>
		
		<div class="blank"></div>
		
		<div id="payment_method" class="container-sm w-auto">
		<h5>결제 방법</h5>
			<div class="container-md text-center">
				<div class="row row-cols-2">
					<input type="radio" class="btn-check" name="pay_method" value="card" id="card" autocomplete="off" checked>
					<label class="btn btn-lg btn-outline-dark" for="card">신용/체크카드</label>
					<input type="radio" class="btn-check" name="pay_method" value="kakao" id="kakao" autocomplete="off">
					<label class="btn btn-lg btn-outline-dark" for="kakao">카카오페이</label>
	                <input type="radio" class="btn-check" name="pay_method" value="deposit" id="deposit" autocomplete="off">
					<label class="btn btn-lg btn-outline-dark" for="deposit">무통장 입금</label>
				</div>
			</div>
		</div>

        <div class="blank"></div>
        
        <br><br><br>
	        <footer id="purchased_btn_container" class="container">					
				<input type="hidden" id="payment_key" name="payment_key"/>
		      	<input type="hidden" id="order_id" name="order_id"/>
		    	<input type="hidden" id="amount" name="amount"/>
		    	<c:choose>
		    		<c:when test="${products != null}">		        			        		
		        		<button type="button" id="purchase_btn" class="btn btn-lg btn-dark w-100 rounded-1">
		        			<span id="pay_price_btn">
		        				<fmt:formatNumber value="${total_price}" pattern="#,###" />
		        			</span>원 결제하기
		        		</button>
		        	</c:when>
		        	<c:when test="${product != null}">
		        		<button type="button" id="purchase_btn_2" class="btn btn-lg btn-dark w-100 rounded-1">
		        			<span id="pay_price_btn">
		        				<fmt:formatNumber value="${total_price}" pattern="#,###" />
		        			</span>원 결제하기
		        		</button>		        		
		        	</c:when>
		        </c:choose>
	        </footer>
        </form>
	</div>
	
	<script src="https://js.tosspayments.com/v1/payment"></script>
	<script id="order_script">
		let clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq';
	    let tossPayments = TossPayments(clientKey);
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/order/js/discount.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/order/js/address.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/order/js/order_main.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/order/js/tosspayments.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>