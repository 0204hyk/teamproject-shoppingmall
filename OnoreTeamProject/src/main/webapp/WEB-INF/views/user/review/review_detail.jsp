<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@ include file="../header.jspf"%>
<link rel="icon" href="/project/resources/review/image/파비콘.png">
<link rel="stylesheet"
	href="/project/resources/review/css/review_detail.css?ver=2">
<script src="/project/resources/review/js/review_detail.js?ver=1" defer></script>
</head>
<body>

	<%@ include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto; margin: 50px; margin-top: 0px;">
		<hr>
		<div class="detail">
		<div class="container">
		<div class="a">
			<div name="prd_img">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20221209_17%2F1670592358699313Mx_JPEG%2F71728257412032350_95336586.jpg&type=sc960_832">
			</div>
		</div>
		<div class="b">
		<table>
			<div id="prd_name">${contents.product_num }(상품이름으로대체join)후기</div><br>
			<c:if test="${contents.review_rating eq 5 }">
				<div name="star">★★★★★</div>
			</c:if>
			<c:if test="${contents.review_rating eq 4 }">
				<div name="star">★★★★☆</div>
			</c:if>
			<c:if test="${contents.review_rating eq 3 }">
				<div name="star">★★★☆☆</div>
			</c:if>
			<c:if test="${contents.review_rating eq 2 }">
				<div name="star">★★☆☆☆</div>
			</c:if>
			<c:if test="${contents.review_rating eq 1 }">
				<div name="star">★☆☆☆☆</div>
			</c:if>
			<div name="idndate">${contents.mem_id }/${contents.review_date }</div>
		</table>	
		</div>	
		</div>
			<hr>
		<div class="container2">
			<div class="content">${contents.review_content }</div>
			<div class="img">${contents.review_ima_1 }</div>
			<div class="img">${contents.review_ima_2 }</div>
			<div class="img">${contents.review_ima_3 }</div>
		</div>
			<hr>
			
			<a href="./modify?review_num=${contents.review_num }">수정하기</a>/ 
			<a href="./delete?review_num=${contents.review_num }">삭제하기</a><br>
			<br> 
			
			<form action="./comment" method="POST">
			<input type="hidden" value="${contents.review_num }" id="num">
			<textarea id="comment_content"></textarea>
			<button type="button" id="comment">댓글달기</button>
			</form>

			<hr>
			
			<c:forEach items="${comments }" var="comment">
				<div>${comment.mem_id }/${comment.comment_date }</div>
				<div>${comment.comment_content }</div>
				<!-- <button id=com_modify>수정</button><button id=com_delete>삭제</button> -->
			<hr>
			</c:forEach>
			
			<div id="view"></div>
			<button onclick="location.href='./list'">목록으로</button>
			

		</div>
	</div>
	
	<hr>

	<%@ include file="../bottom.jspf"%>

	<script>
		const view = document.getElementById('view');
		//const num = document.getElementById('num').value;
		//const content = document.getElementById('comment_content').value;
		const comment = document.getElementById('comment');
		
		function refreshMemList(){
			location.reload();
		} 
		
		comment.addEventListener('click', (e) => {
		    const xhttp = new XMLHttpRequest();
		    xhttp.addEventListener('readystatechange', (e) => {
		    	console.log('readyState: ', xhttp.readyState);
		    	console.log('httpStatus: ', xhttp.status);
		        if (e.target.readyState == 4 && e.target.status == 200) {
		            
		            const obj = JSON.parse(e.target.responseText);
		            
		            view.innerHTML =`${obj.mem_id}`;
		            view.innerHTML =`${obj.comment_date}<br>`;
		            view.innerHTML =`${obj.comment_content}<br>`;
		            
		            //refreshMemList();
		        }
		    });
		    xhttp.open('POST', './comment');

		    xhttp.setRequestHeader('Content-type', 'application/json');
		    const num = document.getElementById('num').value;
		    const content = document.getElementById('comment_content').value;

			const com = {
					review_num: num,
					comment_content: content
			}
			
			console.log(num);
			console.log(content);
			
		    // send(payload) : 데이터를 실어 보낼 수 있다
		    xhttp.send(JSON.stringify(com));
		    
		});
	</script>

</body>
</html>