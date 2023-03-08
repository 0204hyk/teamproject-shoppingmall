<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일별 통계 조회</title>
</head>
<body>
	
	<div class="stats-content shadow">
		<div class="stats-inner-content">
			<div class="content-title"><h1>일별 매출 그래프</h1></div>
			<canvas id="daily-chart"></canvas>
		</div>
	</div>
	<div class="stats-content shadow" style="height: auto; padding-top: 15px; padding-left: 15px;">
		<table class="stats-table">
			<tr>
				<th class="stats-table-col-1">일자</th>
				<th class="stats-table-col-2">매출액</th>
				<th class="stats-table-col-3">주문 건수</th>
			</tr>
			<c:forEach items="${dailySales}" var="daySaleData">
				<tr>
					<td class="stats-table-col-1">${daySaleData.day}</td>
					<td class="stats-table-col-2"><fmt:formatNumber value="${daySaleData.daily_sales}" pattern="#,###"/> 원</td>
					<td class="stats-table-col-3"><fmt:formatNumber value="${daySaleData.daily_sales_cnt}" pattern="#,###"/> 건</td>
				</tr>
			</c:forEach>
		</table>
		<table class="stats-table">
			<tr>
				<th class="stats-table-col-1">${dailySalesTotal.month}</td>
				<td class="stats-table-col-2"><fmt:formatNumber value="${dailySalesTotal.daily_sales_total}" pattern="#,###"/> 원</td>
				<td class="stats-table-col-3"><fmt:formatNumber value="${dailySalesTotal.sales_cnt_total}" pattern="#,###"/> 건</td>
			</tr>
		</table>
	</div>
			
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

		dailyChart = document.getElementById('daily-chart');

		new Chart(dailyChart, {
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
		
</body>
</html>