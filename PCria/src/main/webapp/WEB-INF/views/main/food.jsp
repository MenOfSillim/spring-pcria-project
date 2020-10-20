<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<div id="allContainer">
	<h1>PCria 먹거리 주문</h1>
	<div class="button_wrap">
        <button id="chk_8" onclick="parsingChk(this.id)">전체</button>
        <button id="chk_7" onclick="parsingChk(this.id)">인기상품</button>
        <button id="chk_1" onclick="parsingChk(this.id)">라면</button>
        <button id="chk_2" onclick="parsingChk(this.id)">분식</button>
        <button id="chk_3" onclick="parsingChk(this.id)">식품</button>
        <button id="chk_4" onclick="parsingChk(this.id)">음료</button>
        <button id="chk_5" onclick="parsingChk(this.id)">과자</button>
        <button id="chk_6" onclick="parsingChk(this.id)">기타</button>
    </div>
    <!-- ajax로 food_wrap에 값 삽입됨 -->
    <div id="food_wrap"></div>
    <div id="order_wrap">
    	<div id="order_wrap_header">
    		<h2>주문 목록</h2>
    		<h2 onclick="deleteAllFoodList()">전체 삭제</h2>
    	</div>
    	<div id="order_wrap_section"></div>
    	<div id="order_wrap_section2">
    		<h3>주문 금액 합계</h3>
    		<h3 id="payment"></h3>
    	</div>
    	<div id="order_wrap_footer"></div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	var totalPayment = 0;
	var menu_id = ${food_menu_id}
	var menuChk = 8;
	menu_id.classList.add('food_page_item')
	
	//ajax 기본적으로 전체 메뉴 들고오기
	ajaxSelMenuList(menuChk)
	appendPayment(totalPayment)
	
	function parsingChk(chk_id){
		var origin_class = document.querySelector('.food_page_item')
		var origin_id = document.getElementById(origin_class.id)
		origin_id.classList.remove('food_page_item')
		var current_id = document.getElementById(chk_id) 
		current_id.classList.add('food_page_item')
		var chk = chk_id.substring(4)
		ajaxSelMenuList(chk)
	}
	
	function appendPayment(totalPayment) {
		payment.innerText = numberWithCommas(totalPayment)+'원'
	}
	
	function ajaxSelMenuList(chk) {
			axios.get('/main/foodAjax', {
				params : {
					chk : chk
				}
			}).then(function(res) {
				//ajax로 식품 목록 넣어주는 기능
				food_wrap.innerHTML = ''
				selMenuList(res.data)
			})
	}
	function selMenuList(arrMenu) {
		for (var i = 0; i < arrMenu.length; i++) {
			var food_item = document.createElement('div')
			food_item.id = 'food_item'+(i+1)
			food_item.classList.add('food_item')
			food_wrap.append(food_item)
			
			var ul = document.createElement('ul')
			food_item.append(ul)
			
			var liF_pic = document.createElement('li')
			liF_pic.title = arrMenu[i].f_name
			ul.append(liF_pic)
			
			var imgF_pic = document.createElement('img')
			imgF_pic.src = arrMenu[i].f_pic.trim()
			liF_pic.append(imgF_pic)
			
			var liF_name = document.createElement('li')
			liF_name.innerText = arrMenu[i].f_name
			ul.append(liF_name)
			
			var liF_price = document.createElement('li')
			liF_price.innerText = numberWithCommas(arrMenu[i].f_price)+'원'
			ul.append(liF_price)
			
			var spanCart = document.createElement('span')
			spanCart.id = 'shopping_cart'
			spanCart.classList.add('material-icons')
			spanCart.innerText = 'shopping_cart'
			
			let f_pic = arrMenu[i].f_pic
			let f_price = arrMenu[i].f_price
			let f_name = arrMenu[i].f_name
			let seq = arrMenu[i].seq
			spanCart.addEventListener('click', event => addFoodList(f_pic, f_price, f_name, seq));
			food_item.append(spanCart)
		}
	}
	function addFoodList(f_pic, f_price, f_name, seq) {
		let childCount = order_wrap_section.childElementCount
		let chk = true;
		
		for (let i = 0; i < childCount; i++) {
			let childNodes_id = order_wrap_section.childNodes[i].id
			let childNodes_seq = childNodes_id.substring(4)
			
			if(childNodes_seq == seq){
				let childNodes_ul = order_wrap_section.childNodes[i].getElementsByTagName('ul')[0]
				let input_quantity = document.getElementById('quantity_'+seq)
				let li_price = childNodes_ul.childNodes[2]
				let f_price = removeComma(li_price.innerText.slice(0,-1)) / input_quantity.value
				
				chk = false;
				plusQuantity(input_quantity, li_price, f_price)
			}
		}
		if(chk){
			var div_seq = document.createElement('div')
			div_seq.id = 'seq_'+seq
			div_seq.classList.add('order_wrap_section_list')
			order_wrap_section.append(div_seq)
			
			var addUl =document.createElement('ul')
			div_seq.append(addUl)
			
			var li_title = document.createElement('li')
			li_title.innerText = f_name
			addUl.append(li_title)
			
			var li_quantity = document.createElement('li')
			addUl.append(li_quantity)
			
			var input_quantity = document.createElement('input')
			input_quantity.type = 'text'
			input_quantity.value = 1
			input_quantity.id = 'quantity_'+seq
			li_quantity.append(input_quantity)
			
			var li_price = document.createElement('li')
			li_price.innerText = numberWithCommas((input_quantity.value * f_price))+'원'
			addUl.append(li_price)
			
			//삭제 버튼 추가
			var li_delMenu = document.createElement('li')
			var span_delMenu = document.createElement('span')
			span_delMenu.classList.add('material-icons')
			span_delMenu.innerText = 'delete_outline'
			span_delMenu.addEventListener('click', event => deleteFoodList(div_seq, li_price));
			addUl.append(li_delMenu)
			li_delMenu.append(span_delMenu)
			
			//minus 버튼 추가
			var li_minus = document.createElement('li')
			var span_minus = document.createElement('span')
			span_minus.classList.add('material-icons')
			span_minus.innerText = 'remove'
			span_minus.addEventListener('click', event => minusQuantity(input_quantity, li_price, f_price));
			addUl.append(li_minus)
			li_minus.append(span_minus)
	
			//minus 버튼 추가
			var li_add = document.createElement('li')
			var span_add = document.createElement('span')
			span_add.classList.add('material-icons')
			span_add.innerText = 'add'
			span_add.addEventListener('click', event => plusQuantity(input_quantity, li_price, f_price));
			addUl.append(li_add)
			li_add.append(span_add)
			
			totalPayment += parseInt(f_price)
			appendPayment(totalPayment)
		}
	}
	//전체 삭제
	function deleteAllFoodList() {
		if(totalPayment > 0){
			if(confirm('전체 삭제하시겠습니까?')){
				order_wrap_section.innerHTML = ''
				totalPayment = 0
				appendPayment(totalPayment)
			}
		}else{
			alert('추가한 목록이 없습니다.')
		}
	}
	
	function deleteFoodList(orderList, li_price) {
		if(confirm('삭제하시겠습니까?')){
			orderList.remove()
			var int_price = removeComma(li_price.innerText.slice(0,-1))
			totalPayment -= int_price
			appendPayment(totalPayment)
		}
	}
	function plusQuantity(quantity, li_price, f_price) {
		if(quantity.value >= 10){
			alert('카운터로 문의 바랍니다.')
		}else{
			quantity.value++;
			li_price.innerText = numberWithCommas((quantity.value * f_price))+'원'
			totalPayment += parseInt(f_price)
			appendPayment(totalPayment)
		}
	}
	function minusQuantity(quantity, li_price, f_price) {
		if(quantity.value >= 2){
			quantity.value--; 
			li_price.innerText = numberWithCommas((quantity.value * f_price))+'원'
			totalPayment -= parseInt(f_price)
			appendPayment(totalPayment)
		}else{
			alert('최소 수량입니다.')
		}
	}
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function removeComma(str){
		n = parseInt(str.replace(/,/g,""));
		return n;
	}



</script>