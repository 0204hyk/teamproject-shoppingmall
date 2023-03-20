<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@ include file="../header.jspf" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75e78a8a9cdd102b783fb3c5f36e1da5"></script>
<link href="<%=request.getContextPath() %>/resources/menu/css/location.css" rel="stylesheet"/>
<link rel="icon" href="<%=request.getContextPath() %>/resources/main/images/fabicon.png">
</head>
<body>
<%@ include file="../top.jspf" %>
<!-- middle 시작 -->
<div class="middle_location_div">
	<div class="location_div">
		<div class="coming_direction_div">오시는 길</div>
		
		<div class="map_div">
			<div class="location_map_div1">
				<div id="location_map_div2">
				</div>
			</div>
			
			<div class="location_content_div1">
				<div class="location_content_div2">
					<div class="bus_div">버스</div>
						<div class="bus_content">
						▪ 간선<br>
						　301, 341, 360, 362<br><br>
						▪ 지선<br>
						　3217, 3313, 3314, 3315, 3317, 3411, 3414, 4319<br><br>
						▪ 롯데백화점 잠실점과 함께 하는 대중교통 캠페인<br><br>
						
						버스, 지하철, 자전거를 탈수록 서울은 맑고 깨끗해집니다.<br>
						환경도 지키고 에너지도 절약하는 생활 속의 좋은 습관입니다.<br><br>
						
						교통 체증 없고, 환경을 위한 작은 실천,<br>
						대중교통 이용에 적극 동참해주세요.<br>
						</div>
			
					<div class="subway_div">지하철</div>
						<div class="subway_content">
						▪ 지하철 경의중앙선 '구리역' <br>
						'구리역 1번 출구에서 도보 5분
						</div>
						
					<div class="park_div">주차</div>
						<div class="park_content">
						▪ 문의전화<br>
						02-1234-1234<br><br>
						▪ 주차요금 부과 기준<br>
						최초 30분 1,000원<br>
						추가 10분당 1,000원<br><br>
						</div>
				</div>
			</div>
		</div>
		
		<div class="location_content_div2" style="display: none;">
			<div class="title_transportation">주차장 이용 안내 내용</div>
		</div>
		
	</div>
</div>  
<!-- middle 끝 -->

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/menu/js/location.js"></script>
<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js"></script>
<%@ include file="../bottom.jspf" %>