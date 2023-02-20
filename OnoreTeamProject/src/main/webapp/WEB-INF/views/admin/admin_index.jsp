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
		<div class="main-inner-content">
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
			    <th>주문수</th>
			    <th>매출액</th>
			    <th>가입</th>
			    <th>문의</th>
			    <th>후기</th>
			  </tr>
			</thead>
			<tbody>
			  	<c:forEach items="${dailySales}" var="daySaleData" varStatus="statusNum">
				  <tr>
				  	<td>${daySaleData.day}</td>
				  	<td><fmt:formatNumber value="${daySaleData.daily_sales_cnt}" pattern="#,###"/></td>
				  	<td><fmt:formatNumber value="${daySaleData.daily_sales}" pattern="#,###"/> 원</td>
				  	<td><fmt:formatNumber value="${weeklyStats[statusNum.index].register_cnt}" pattern="#,###"/></td>
				  	<td><fmt:formatNumber value="${weeklyStats[statusNum.index].qna_cnt}" pattern="#,###"/></td>
				  	<td><fmt:formatNumber value="${weeklyStats[statusNum.index].review_cnt}" pattern="#,###"/></td>
				  </tr>
			  	</c:forEach>
			</tbody>
		</table>
		<table border="1" style="width: 650px; height: 75px;">
			<tr>
				<td>최근 7일 통계</td>
				<td><fmt:formatNumber value="${dailySalesTotal.sales_cnt_total}" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${dailySalesTotal.daily_sales_total}" pattern="#,###"/> 원</td>
				<td><fmt:formatNumber value="${weeklyStatsTotal.register_cnt_total}" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${weeklyStatsTotal.qna_cnt_total}" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${weeklyStatsTotal.review_cnt_total}" pattern="#,###"/></td>
			</tr>
		</table>
		<table border="1" style="width: 650px; height: 75px;">
			<tr>
				<td>이번 달 통계</td>
				<td><fmt:formatNumber value="${monthSalesTotal.sales_cnt_total}" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${monthSalesTotal.daily_sales_total}" pattern="#,###"/> 원</td>
				<td><fmt:formatNumber value="${monthStatsTotal.register_cnt_total}" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${monthStatsTotal.qna_cnt_total}" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${monthStatsTotal.review_cnt_total}" pattern="#,###"/></td>
			</tr>
		</table>
	</div>
	<div class="index-content">문의</div>
	<div class="index-content">후기</div>
		
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
	  
	
	<%@ include file="./admin_footer.jspf" %>
</body>
</html>