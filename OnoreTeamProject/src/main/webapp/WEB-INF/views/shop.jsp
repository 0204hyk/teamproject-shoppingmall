<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shop</title>
</head>
<body>

<h1>${mem_id}님의 SHOP</h1>

<form action="<%=request.getContextPath()%>/order" method="POST">
	상품 1 : <input type="text" name="product_name"/> <br>
	  수량 :	<input type="text" onkeyup="if(window.event.keyCode==32){setPrice()}" name="order_info_qty"/> <br>
	  사이즈 : <input type="text" name="order_info_size"/> <br>
	  옵션 :	<input type="text" name="order_info_option"/> <br>
	  가격 : <input type="text" name="order_info_price"/> <br>
	  <br>
	상품 2 : <input type="text" name="product_name"/> <br>
	  수량 :	<input type="text" onkeyup="if(window.event.keyCode==32){setPrice()}" name="order_info_qty"/> <br>
	  사이즈 :<input type="text" name="order_info_size"/> <br>
	  옵션 :	<input type="text" name="order_info_option"/> <br>
	  가격 : <input type="text" name="order_info_price"/> <br>
	  
	  <input type="hidden" name="mem_id" value="${mem_id}"/> 
	  <input type="submit" value="구매"/>
</form>
<script>
	const order_info_qty = document.getElementsByName("order_info_qty");
	const order_info_price = document.getElementsByName("order_info_price");
	
	const stable_price = 1000;
	
	function setPrice() {
		for(i = 0; i < order_info_qty.length; i++) {
			if(order_info_qty[i].value != null) {
				order_info_price[i].value = stable_price * order_info_qty[i].value;
			}
		}
	}
	
</script>

</body>
</html>