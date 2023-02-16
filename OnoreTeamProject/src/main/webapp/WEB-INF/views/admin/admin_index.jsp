<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div style="height: 50px;">주간 매출 그래프</div>
			<canvas id="index-chart"></canvas>
		</div>
	</div>
	<div class="index-content">일자별 현황</div>
	<div class="index-content">문의</div>
	<div class="index-content">후기</div>
		
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
	<script>
		var jsonData = ${dailySales};
		var jsonObject = JSON.stringify(jsonData);
		var jData = JSON.parse(jsonObject);

		var labelList = new Array();
		var dataList = new Array();

		const today = new Date();

		const year = today.getFullYear(); // 년
		const month = today.getMonth();   // 월
		const day = today.getDate();      // 일

		for (var i = 0; i < 7; ++i) {
			labelList.push(new Date(year, month, day -6 + i).toLocaleDateString());
		}

		for (var i = 0; i < jData.length; ++i) {
			var d = jData[i];
			dataList.push(d.total_price);

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