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
	
	<div id="index-content" class="shadow">
		<div class="main-inner-content">
			<div class="content-title"><h1>주간 매출 그래프</h1></div>
			<canvas id="index-chart" class="container"></canvas>
		</div>
	</div>
	<div id="index-content" class="shadow">
		<div class="content-title"><h1>일자별 현황</h1></div>
		<table class="stats-table" style="width: 620px; height: 440px; border-radius: 15px">
			<tr>
			  <th class="table-col-1">일자</th>
			  <th class="table-col-2">주문수</th>
			  <th class="table-col-3">매출액</th>
			  <th class="table-col-4">가입</th>
			  <th class="table-col-5">문의</th>
			  <th class="table-col-6">후기</th>
			</tr>
		    <c:forEach items="${dailySales}" var="daySaleData" varStatus="statusNum">
			  <tr>
				<td class="table-col-1">${daySaleData.day}</td>
				<td class="table-col-2"><fmt:formatNumber value="${daySaleData.daily_sales_cnt}" pattern="#,###"/></td>
				<td class="table-col-3"><fmt:formatNumber value="${daySaleData.daily_sales}" pattern="#,###"/> 원</td>
				<td class="table-col-4"><fmt:formatNumber value="${weeklyStats[statusNum.index].register_cnt}" pattern="#,###"/></td>
				<td class="table-col-5"><fmt:formatNumber value="${weeklyStats[statusNum.index].qna_cnt}" pattern="#,###"/></td>
			    <td class="table-col-6"><fmt:formatNumber value="${weeklyStats[statusNum.index].review_cnt}" pattern="#,###"/></td>
			  </tr>
	    	</c:forEach>
		</table>
		<table class="stats-table" style="width: 620px; height: 60px;">
			<tr>
				<th class="table-col-1">최근 7일 통계</td>
				<td class="table-col-2"><fmt:formatNumber value="${dailySalesTotal.sales_cnt_total}" pattern="#,###"/></td>
				<td class="table-col-3"><fmt:formatNumber value="${dailySalesTotal.daily_sales_total}" pattern="#,###"/> 원</td>
				<td class="table-col-4"><fmt:formatNumber value="${weeklyStatsTotal.register_cnt_total}" pattern="#,###"/></td>
				<td class="table-col-5"><fmt:formatNumber value="${weeklyStatsTotal.qna_cnt_total}" pattern="#,###"/></td>
				<td class="table-col-6"><fmt:formatNumber value="${weeklyStatsTotal.review_cnt_total}" pattern="#,###"/></td>
			</tr>
		</table>
		<table class="stats-table" style="width: 620px; height: 60px;">
			<tr>
				<th class="table-col-1">이번 달 통계</td>
				<td class="table-col-2"><fmt:formatNumber value="${monthSalesTotal.sales_cnt_total}" pattern="#,###"/></td>
				<td class="table-col-3"><fmt:formatNumber value="${monthSalesTotal.daily_sales_total}" pattern="#,###"/> 원</td>
				<td class="table-col-4"><fmt:formatNumber value="${monthStatsTotal.register_cnt_total}" pattern="#,###"/></td>
				<td class="table-col-5"><fmt:formatNumber value="${monthStatsTotal.qna_cnt_total}" pattern="#,###"/></td>
				<td class="table-col-6"><fmt:formatNumber value="${monthStatsTotal.review_cnt_total}" pattern="#,###"/></td>
			</tr>
		</table>
	</div>
	<div id="index-content" class="shadow">
		<div class="content-title"><h1>문 의</h1></div>
	</div>
	<div id="index-content" class="shadow">
		<div class="content-title"><h1>후 기</h1></div>
	</div>
		
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