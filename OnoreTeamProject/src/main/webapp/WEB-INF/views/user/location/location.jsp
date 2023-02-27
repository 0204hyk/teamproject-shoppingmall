<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@include file="../member/member_header.jspf" %>   
</head>
<body>
<%@include file="../member/member_top.jspf" %>

<script>
function transportation_a_clicked() {
	document.getElementById("location_content_div1").style.display = "";
	document.getElementById("location_content_div2").style.display = "none";
}

function park_a_clicked()
		document.getElementById("location_content_div1").style.display = "none";
		document.getElementById("location_content_div2").style.display = "";
}
</script>

<!-- middle 시작 -->
<div class="middle_location_div">
	<div class="location_div">
		<div class="coming_direction_div">
			<div class="coming_direction_div">오시는 길</div>
		</div>
		<div class="map_div">
			<div class="map"></div>
		</div>
		<div class="transportation_car">
			<div class="transportation_div"><a class="transportation_a" onclick="transportation_a_clicked()">교통 이용 안내</a></div>
			<div class="park_div"><a class="park_a" onclick="park_a_clicked()">주차장 이용 안내</a></div>	
		</div>
			<div class="location_map_div">지도 api</div>
	<div class="location_content_div1">
		<div class="title_transportation">교통 이용 안내 내용</div>
		<div class=bus_subway_div>
			<div class="busBtn">버스</div>
			<div class="subwayBtn">지하철</div>
		</div>
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
		
		<div class="subway_content">
		▪ 지하철 경의중앙선 '구리역' <br>
		'구리역 1번 출구에서 도보 5분
		</div>
	</div>
		<div class="location_content_div2" style="display: none;">
			<div class="title_transportation">주차장 이용 안내 내용</div>
		</div>
	</div>
</div>
    
<!-- middle 끝 -->

<script src="/project/resources/menu/js/menubar.js"></script>
<%@include file="../member/member_bottom.jspf"%>