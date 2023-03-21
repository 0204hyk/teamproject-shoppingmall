<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>회원 목록</title>
</head>
<body>
	
	<div class="member-content shadow">
		<div class="member-title">
			<h1>회원 목록</h1>
			<select name="search_type" class="form-select search-type">
				<c:choose>
					<c:when test="${search_type eq 'id'}">
						<option value="id" selected>아이디</option>
						<option value="name">이름</option>				
					</c:when>
					<c:when test="${search_type eq 'name'}">
						<option value="id">아이디</option>
						<option value="name" selected>이름</option>
					</c:when>
					<c:otherwise>
						<option value="id">아이디</option>
						<option value="name">이름</option>
					</c:otherwise>
				</c:choose>
			</select>
			<input type="text" class="form-control search-box" name="search_keyword" placeholder="검색어를 입력해주세요." value="${search_keyword}"/>
			<button type="submit" id="search-btn" style="color: gray;"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
		<form id="member-list-form" name="member-list-form" method="POST">
			<div class="container">
				<table class="member-board table table-hover">
					<thead class="table-secondary">
						<tr>
							<th><input type="checkbox" id="all-check"/></th>
							<th>I D</th>
							<th>이 름</th>
							<th>주소지</th>
							<td>연락처</td>
							<th>성 별</th>
							<th>가입일</th>
							<th>생년월일</th>
							<th>분 류</th>
						</tr>
					</thead>					
					<tbody>
						<c:forEach items="${memberList}" var="member">
							<tr style="vertical-align: middle; height: 80px;">
								<td style="width: 50px;"><input type="checkbox" class="row-check" name="row_check" value="${member.mem_id}"/></td>
								<td style="width: 150px;">${member.mem_id}</td>
								<td style="width: 70px;">${member.mem_name}</td>
								<c:choose>
									<c:when test="${empty member.mem_street_address}">
										<td>-</td>
									</c:when>
									<c:otherwise>
										<td>${member.mem_street_address}<br/>${member.mem_detail_address}</td>							
									</c:otherwise>
								</c:choose>
								<c:set var="phone_number" value="${member.mem_phone }"/>
									<td style="width: 140px;">
										${fn:substring(phone_number,0,3)}-
										${fn:substring(phone_number,3,7)}-
										${fn:substring(phone_number,7,11)}
									</td>
								<c:choose>
									<c:when test="${member.mem_gender eq 'M'}">
										<td style="width: 50px;">남</td>
									</c:when>
									<c:when test="${member.mem_gender eq 'F'}">
										<td style="width: 50px;">여</td>
									</c:when>
									<c:otherwise>
										<td style="width: 50px;">-</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${empty member.mem_register_date}">
										<td style="width: 100px;">-</td>
									</c:when>
									<c:otherwise>
										<td style="width: 100px;">${member.creationRegistDate}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${empty member.mem_birth_date}">
										<td style="width: 100px;">-</td>
									</c:when>
									<c:otherwise>
										<td style="width: 100px;">${member.creationBirthDate}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${member.mem_status eq 0}">
										<td style="width: 90px;">고객</td>
									</c:when>
									<c:when test="${member.mem_status eq 1}">
										<td style="width: 90px;">관리자</td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: right;">
					<ul class="pagination justify-content-center" style="margin-bottom: 0px;">
						<c:if test="${prev == true}">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/member/list?page=${pagination_start - 1}&search_type=${search_type}&search_keyword=${search_keyword}')">«</a>
							</li>												
						</c:if>
						
						<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
							<c:if test="${page == i}">
						    	<li class="page-item active">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/member/list?page=${i}&search_type=${search_type}&search_keyword=${search_keyword}')">${i}</a>
						    	</li>
							</c:if>
							<c:if test="${page != i}">
						    	<li class="page-item">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/member/list?page=${i}&search_type=${search_type}&search_keyword=${search_keyword}')">${i}</a>
						    	</li>
							</c:if>
						</c:forEach>
						
					    <c:if test="${next == true }">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/member/list?page=${pagination_end + 1}&search_type=${search_type}&search_keyword=${search_keyword}')">»</a>
							</li>				    					    
					    </c:if>
					</ul>
					<input type="button" id="member-delete-btn" class="action-btn" value="삭 제"/>
				</div>
			</div>
		</form>
	</div>

	<script src="<%=request.getContextPath()%>/resources/admin/js/member_list.js"></script>
	<script src="<%=request.getContextPath()%>/resources/admin/js/list_checkbox.js"></script>
	
</body>
</html>