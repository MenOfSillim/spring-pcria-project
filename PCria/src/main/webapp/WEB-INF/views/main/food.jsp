<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<div id="allContainer">
	<h1>PCria 먹거리 주문</h1>
	<div class="button-wrap">
        <button id="total" onclick="login()">전체</button>
        <button id="popular" onclick="register()">인기상품</button>
        <button id="ramen" onclick="register()">라면</button>
        <button id="snackBar" onclick="register()">분식</button>
        <button id="food" onclick="register()">식품</button>
        <button id="beverage" onclick="register()">음료</button>
        <button id="snack" onclick="register()">과자</button>
        <button id="etc" onclick="register()">기타</button>
    </div>
    <div id="food-wrap">
    	<div id="food-item">
    		<ul>
    			<li><img src="https://www.costco.co.kr/medias/sys_master/images/h89/h03/28736559677470.jpg"></li>
    			<li>푸드이름</li>
    			<li>가격</li>
    		</ul>
    		<span class="material-icons" id="shopping_cart">shopping_cart</span>
    	</div>
    </div>
    <div id="order-wrap">
    	<div id="order-wrap-header">
    		<h2>주문 목록</h2>
    		<h2 onclick="deleteAllFoodList()">전체 삭제</h2>
    	</div>
    	<div id="order-wrap-section">
			<div id="order_wrap_section_list1" class="order-wrap-section-list">
				<ul>
					<li>참깨라면</li>		
					<li><input type="text" value="1" id="quantity1"></li>				
					<li>3000원</li>
					<li><span class="material-icons" onclick="deleteFoodList(order_wrap_section_list1)">delete_outline</span></li>
					<li><span class="material-icons" onclick="minusQuantity(quantity1)">remove</span></li>				
					<li><span class="material-icons" onclick="plusQuantity(quantity1)">add</span></li>				
				</ul>
			</div>    	
			<div id="order_wrap_section_list2" class="order-wrap-section-list">
				<ul>
					<li>참깨라면</li>		
					<li><input type="text" value="2" id="quantity2"></li>				
					<li>3000원</li>
					<li><span class="material-icons" onclick="deleteFoodList(order_wrap_section_list2)">delete_outline</span></li>
					<li><span class="material-icons" onclick="minusQuantity(quantity2)">remove</span></li>				
					<li><span class="material-icons" onclick="plusQuantity(quantity2)">add</span></li>				
				</ul>
			</div>    	
    	</div>
    	<div id="order-wrap-section2">
    		<h3>주문 금액 합계</h3>
    	</div>
    	<div id="order-wrap-footer"></div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	var menu_id = ${food_menu_id}
	menu_id.classList.add('food_page_item')
	
	//ajax 기본적으로 전체 메뉴 들고오기
	ajaxSelMenuList()
	
	function ajaxSelMenuList() {
			axios.get('/main/foodAjax', {
				params: {}
			}).then(function(res) {
				console.log(res.data)
			})
	}
	function addFoodList(foodList) {
		
	}
	function deleteAllFoodList() {
		var foodList = document.querySelectorAll('.order-wrap-section-list')
		for (var i = 0; i < foodList.length; i++) {
			foodList[i].remove()
		}
	}
	function deleteFoodList(orderList) {
		if(confirm('삭제하시겠습니까?')){orderList.remove()}
	}
	function plusQuantity(quantity) {
		if(quantity.value >= 10){
			alert('카운터로 문의 바랍니다.')
		}else{
			quantity.value++;
		}
	}
	function minusQuantity(quantity) {
		if(quantity.value >= 2){
			quantity.value--; 
		}else{
			alert('최소 수량입니다.')
		}
	}
</script>