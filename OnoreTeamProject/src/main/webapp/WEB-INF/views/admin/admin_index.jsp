<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<%@ include file="./admin_cdn.jspf" %>
</head>
<body>
	<%@ include file="./admin_header.jspf" %>
	
	<div class="index-content">
		<div class="inner-content">
			<div class="main-content-title">주간 매출 그래프</div>
			<canvas id="index-chart"></canvas>
		</div>
	</div>
	<div class="index-content">
		<div class="main-content-title">일자별 현황</div>
		<table border="1" style="width: 650px; height: 450px;">
			<thead>
			  <tr>
			    <th class="tg-0pky">일자</th>
			    <th>주문 건수</th>
			    <th>매출액</th>
			    <th>가입</th>
			    <th>문의</th>
			    <th>후기</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			  	<c:forEach items="${weeklyStats}" var="dailyStats">
			  	  <td>${dailyStats.day}</td>
			  	  <td><fmt:formatNumber value="${dailyStats.daily_sales}" pattern="#,###"/></td>
			  	</c:forEach>
			  </tr>
			  <tr>
			    <td>1</td>
			    <td>2</td>
			    <td>3</td>
			    <td>4</td>
			    <td>5</td>
			    <td>6</td>
			  </tr>
			  <tr>
			    <td>1</td>
			    <td>2</td>
			    <td>3</td>
			    <td>4</td>
			    <td>5</td>
			    <td>6</td>
			  </tr>
			  <tr>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			  </tr>
			  <tr>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			  </tr>
			  <tr>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			  </tr>
			  <tr>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			  </tr>
			</tbody>
		</table>
		<table border="1" style="width: 650px; height: 150px;">
			
		</table>
	</div>
	<div class="index-content">문의</div>
	<div class="index-content">후기</div>
		
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
	<script>
		var jsonData = ${dailySales};
		var jsonObject = JSON.stringify(jsonData);
		var jData = JSON.parse(jsonObject);

		var labelList = new Array();
		var dataList = new Array();

		for (var i = 0; i < jData.length; ++i) {
			var d = jData[i];
			labelList.push(d.day);
			dataList.push(d.daily_sales);

		}

		const ctx = document.getElementById('index-chart');

		new Chart(ctx, {
		  type: 'bar',
		  data: {
			labels: labelList,
			datasets: [{
			  label: '매출액',
			  data: dataList,
              backgroundColor: [
           	    'rgba(0, 99, 132, 0.6)',
           	    'rgba(30, 99, 132, 0.6)',
           	    'rgba(60, 99, 132, 0.6)',
           	    'rgba(90, 99, 132, 0.6)',
           	    'rgba(120, 99, 132, 0.6)',
           	    'rgba(150, 99, 132, 0.6)',
           	    'rgba(180, 99, 132, 0.6)',
           	    'rgba(210, 99, 132, 0.6)',
              ],
              borderColor: [
           	    'rgba(0, 99, 132, 1)',
           	    'rgba(30, 99, 132, 1)',
           	    'rgba(60, 99, 132, 1)',
           	    'rgba(90, 99, 132, 1)',
           	    'rgba(120, 99, 132, 1)',
           	    'rgba(150, 99, 132, 1)',
           	    'rgba(180, 99, 132, 1)',
           	    'rgba(210, 99, 132, 1)',
              ],
			  borderWidth: 2
			}]
		  },
		  options: {
			maintainAspectRatio :false,
			scales: {
			  y: {
				beginAtZero: true
			  }
			}
		  }
		});
	  </script>
	  
	
	<%@ include file="./admin_footer.jspf" %>
</body>
</html>