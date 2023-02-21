<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일별 통계 조회</title>
	<%@ include file="../admin_cdn.jspf" %>
</head>
<body>
	<%@ include file="../admin_header.jspf" %>
	
		<div class="stats-content">
			<div class="stats-inner-content">
				<div class="stats-title">주간 매출 그래프</div>
				<canvas id="daily-chart"></canvas>
			</div>
		</div>
		<div class="stats-content" style="height: auto;">
			<table border=1>
				<tr>
					<th>일자</th>
					<th>주문 건수</th>
					<th>매출액</th>
				</tr>
				<c:forEach items="${dailySales}" var="daySaleData">
					<tr>
						<td>${daySaleData.day}</td>
						<td><fmt:formatNumber value="${daySaleData.daily_sales_cnt}" pattern="#,###"/></td>
						<td><fmt:formatNumber value="${daySaleData.daily_sales}" pattern="#,###"/> 원</td>
					</tr>
				</c:forEach>
			</table>
			<table>
				<tr>
					<td>${dailySalesTotal.month}</td>
					<td><fmt:formatNumber value="${dailySalesTotal.sales_cnt_total}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${dailySalesTotal.daily_sales_total}" pattern="#,###"/> 원</td>

				</tr>
			</table>
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
		<script>
			var jsonData = ${dailySalesToChart};
			var jsonObject = JSON.stringify(jsonData);
			var jData = JSON.parse(jsonObject);
	
			var labelList = new Array();
			var dataList = new Array();
	
			for (var i = 0; i < jData.length; ++i) {
				var d = jData[i];
				labelList.push(d.day);
				dataList.push(d.daily_sales);
			}
	
			const ctx = document.getElementById('daily-chart');
	
			new Chart(ctx, {
			  type: 'line',
			  data: {
				labels: labelList,
				datasets: [{
				  label: '매출액',
				  data: dataList,
	              backgroundColor: [
	           	    'rgba(0, 99, 132, 0.6)',
	           	    'rgba(8, 99, 132, 0.6)',
		           	'rgba(16, 99, 132, 0.6)',
		           	'rgba(24, 99, 132, 0.6)',
		           	'rgba(32, 99, 132, 0.6)',
		           	'rgba(40, 99, 132, 0.6)',
		           	'rgba(48, 99, 132, 0.6)',
		           	'rgba(56, 99, 132, 0.6)',
		           	'rgba(64, 99, 132, 0.6)',
		           	'rgba(72, 99, 132, 0.6)',
		           	'rgba(80, 99, 132, 0.6)',
		           	'rgba(88, 99, 132, 0.6)',
		           	'rgba(96, 99, 132, 0.6)',
		           	'rgba(104, 99, 132, 0.6)',
		           	'rgba(112, 99, 132, 0.6)',
		           	'rgba(120, 99, 132, 0.6)',
		           	'rgba(128, 99, 132, 0.6)',
		           	'rgba(136, 99, 132, 0.6)',
		           	'rgba(144, 99, 132, 0.6)',
		           	'rgba(152, 99, 132, 0.6)',
		           	'rgba(160, 99, 132, 0.6)',
		           	'rgba(168, 99, 132, 0.6)',
		           	'rgba(176, 99, 132, 0.6)',
		           	'rgba(184, 99, 132, 0.6)',
		           	'rgba(192, 99, 132, 0.6)',
		           	'rgba(200, 99, 132, 0.6)',
		           	'rgba(208, 99, 132, 0.6)',
		           	'rgba(216, 99, 132, 0.6)',
		           	'rgba(224, 99, 132, 0.6)',
		           	'rgba(232, 99, 132, 0.6)',
		           	'rgba(240, 99, 132, 0.6)',
		           	'rgba(248, 99, 132, 0.6)'
	              ],
	              borderColor: [
	           	    'rgba(0, 99, 132, 1)',
	           	    'rgba(8, 99, 132, 1)',
	           	    'rgba(16, 99, 132, 1)',
	           	    'rgba(24, 99, 132, 1)',
	           	    'rgba(32, 99, 132, 1)',
	           	    'rgba(40, 99, 132, 1)',
	           	    'rgba(48, 99, 132, 1)',
	           	    'rgba(56, 99, 132, 1)',
	           	    'rgba(64, 99, 132, 1)',
	           	    'rgba(72, 99, 132, 1)',
	           	    'rgba(80, 99, 132, 1)',
	           	    'rgba(88, 99, 132, 1)',
	           	    'rgba(96, 99, 132, 1)',
	           	    'rgba(104, 99, 132, 1)',
	           	    'rgba(112, 99, 132, 1)',
	           	    'rgba(120, 99, 132, 1)',
	           	    'rgba(128, 99, 132, 1)',
	           	    'rgba(136, 99, 132, 1)',
	           	    'rgba(144, 99, 132, 1)',
	           	    'rgba(152, 99, 132, 1)',
	           	    'rgba(160, 99, 132, 1)',
	           	    'rgba(168, 99, 132, 1)',
	           	    'rgba(176, 99, 132, 1)',
	           	    'rgba(184, 99, 132, 1)',
	           	    'rgba(192, 99, 132, 1)',
	           	    'rgba(200, 99, 132, 1)',
	           	    'rgba(208, 99, 132, 1)',
	           	    'rgba(216, 99, 132, 1)',
	           	    'rgba(224, 99, 132, 1)',
	           	    'rgba(232, 99, 132, 1)',
	           	    'rgba(240, 99, 132, 1)',
	           	    'rgba(248, 99, 132, 1)'
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
		
	<%@ include file="../admin_footer.jspf" %>
</body>
</html>