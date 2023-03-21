<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>월별 통계 조회</title>
</head>
<body>
	
	<div class="stats-content shadow">
		<div class="stats-inner-content">
			<div class="content-title"><h1>월별 매출 그래프</h1></div>
			<canvas id="monthly-chart"></canvas>
		</div>
	</div>
	<div class="stats-content shadow" style="height: auto; padding-top: 15px; padding-left: 15px;">
		<table class="stats-table">
			<tr>
				<th class="stats-table-col-1">일자</th>
				<th class="stats-table-col-2">매출액</th>
				<th class="stats-table-col-3">주문 건수</th>
			</tr>
			<c:forEach items="${monthlySales}" var="monthSaleData">
				<c:if test="${monthSaleData.monthly_sales ne 0}">
					<tr>					
						<td class="stats-table-col-1">${monthSaleData.month}</td>
						<td class="stats-table-col-2"><fmt:formatNumber value="${monthSaleData.monthly_sales}" pattern="#,###"/> 원</td>
						<td class="stats-table-col-3"><fmt:formatNumber value="${monthSaleData.monthly_sales_cnt}" pattern="#,###"/> 건</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<table class="stats-table">
			<tr>
				<th class="stats-table-col-1">${monthlySalesTotal.year}</th>
				<td class="stats-table-col-2"><fmt:formatNumber value="${monthlySalesTotal.monthly_sales_total}" pattern="#,###"/> 원</td>
				<td class="stats-table-col-3"><fmt:formatNumber value="${monthlySalesTotal.monthly_sales_cnt_total}" pattern="#,###"/> 건</td>
			</tr>
		</table>
	</div>
	
	<script>
		var jsonData = ${monthlySalesToChart};
		var jsonObject = JSON.stringify(jsonData);
		var jData = JSON.parse(jsonObject);

		var labelList = new Array();
		var dataList = new Array();

		for (var i = 0; i < jData.length; ++i) {
			var d = jData[i];
			
			if (d.monthly_sales != '0') {
				labelList.push(d.month);
				dataList.push(d.monthly_sales);				
			}
		}

		monthlyChart = document.getElementById('monthly-chart');

		new Chart(monthlyChart, {
		  type: 'bar',
		  data: {
			labels: labelList,
			datasets: [{
			  label: '매출액',
			  data: dataList,
              backgroundColor: [
           	    'rgba(0, 99, 132, 0.6)',
           	    'rgba(20, 99, 132, 0.6)',
	           	'rgba(40, 99, 132, 0.6)',
	           	'rgba(60, 99, 132, 0.6)',
	           	'rgba(80, 99, 132, 0.6)',
	           	'rgba(100, 99, 132, 0.6)',
	           	'rgba(120, 99, 132, 0.6)',
	           	'rgba(140, 99, 132, 0.6)',
	           	'rgba(160, 99, 132, 0.6)',
	           	'rgba(180, 99, 132, 0.6)',
	           	'rgba(200, 99, 132, 0.6)',
	           	'rgba(220, 99, 132, 0.6)',
	           	'rgba(240, 99, 132, 0.6)'
              ],
              borderColor: [
           	    'rgba(0, 99, 132, 1)',
           	    'rgba(20, 99, 132, 1)',
           	    'rgba(40, 99, 132, 1)',
           	    'rgba(60, 99, 132, 1)',
           	    'rgba(80, 99, 132, 1)',
           	    'rgba(100, 99, 132, 1)',
           	    'rgba(120, 99, 132, 1)',
           	    'rgba(140, 99, 132, 1)',
           	    'rgba(160, 99, 132, 1)',
           	    'rgba(180, 99, 132, 1)',
           	    'rgba(200, 99, 132, 1)',
           	    'rgba(220, 99, 132, 1)',
           	    'rgba(240, 99, 132, 1)'
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