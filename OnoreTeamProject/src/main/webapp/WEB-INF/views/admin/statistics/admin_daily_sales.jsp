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
			<div class="stats-title">주간 매출 그래프</div>
			<canvas id="daily-chart"></canvas>
		</div>
		<div>통계 요약</div>
		
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
		<script>
			var jsonData = ${dailySalesToChart};
			var jsonObject = JSON.stringify(jsonData);
			var jData = JSON.parse(jsonObject);
	
			var labelList = new Array();
			var dataList = new Array();
	
			for (var i = jData.length - 1; i >= 0; --i) {
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
		
	<%@ include file="../admin_footer.jspf" %>
</body>
</html>