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
    	<div id="food-item">
    		<ul>
    			<li><img src="https://www.costco.co.kr/medias/sys_master/images/h89/h03/28736559677470.jpg"></li>
    			<li>푸드이름</li>
    			<li>가격</li>
    		</ul>
    		<span class="material-icons" id="shopping_cart">shopping_cart</span>
    	</div>
    	<div id="food-item">
    		<ul>
    			<li><img src="https://www.costco.co.kr/medias/sys_master/images/h89/h03/28736559677470.jpg"></li>
    			<li>푸드이름</li>
    			<li>가격</li>
    		</ul>
    		<span class="material-icons" id="shopping_cart">shopping_cart</span>
    	</div>
    	<div id="food-item">
    		<ul>
    			<li><img src="https://www.costco.co.kr/medias/sys_master/images/h89/h03/28736559677470.jpg"></li>
    			<li>푸드이름</li>
    			<li>가격</li>
    		</ul>
    		<span class="material-icons" id="shopping_cart">shopping_cart</span>
    	</div>
    	<div id="food-item">
    		<ul>
    			<li><img src="https://www.costco.co.kr/medias/sys_master/images/h89/h03/28736559677470.jpg"></li>
    			<li>푸드이름</li>
    			<li>가격</li>
    		</ul>
    		<span class="material-icons" id="shopping_cart">shopping_cart</span>
    	</div>
    	<div id="food-item">
    		<ul>
    			<li><img src="https://www.costco.co.kr/medias/sys_master/images/h89/h03/28736559677470.jpg"></li>
    			<li>푸드이름</li>
    			<li>가격</li>
    		</ul>
    		<span class="material-icons" id="shopping_cart">shopping_cart</span>
    	</div>
    	<div id="food-item">
    		<ul>
    			<li><img src="https://www.costco.co.kr/medias/sys_master/images/h89/h03/28736559677470.jpg"></li>
    			<li>푸드이름</li>
    			<li>가격</li>
    		</ul>
    		<span class="material-icons" id="shopping_cart">shopping_cart</span>
    	</div>
    	<div id="food-item">
    		<ul>
    			<li><img src="https://www.costco.co.kr/medias/sys_master/images/h89/h03/28736559677470.jpg"></li>
    			<li>푸드이름</li>
    			<li>가격</li>
    		</ul>
    		<span class="material-icons" id="shopping_cart">shopping_cart</span>
    	</div>
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
    		<h2>전체 삭제</h2>
    	</div>
    	<div id="order-wrap-section"></div>
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
	
</script>