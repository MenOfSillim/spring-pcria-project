<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="/res/css/main/modal.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<div id="allContainer">
	<h1>PCria 사용 시간 예약</h1>
	<div id="user_info">
		<p>${data.u_name}님 반갑습니다.</p>
		<p>잔여 시간 ${data.u_time} 남았습니다.</p>
		<p id="current_price"></p>
	   	<div class="msg">${msg}</div>
	</div>
	<div id="sel_div"></div>
	<form id="timeFrm" action="/count/time" method="post" onsubmit="return chk()">
		<input type="hidden" name="u_time" value="0" readonly="readonly">
		<input type="hidden" name="u_wallet" value="0" readonly="readonly">	
		<div id="open">결제하기</div>
	    <div class="modal hidden">
	       <div class="modal__overlay"></div>
	       <div class="modal__content">
	        <div id="modal_btn"><span class="material-icons">clear</span></div>
	 		<div id="sel_time">
	 			<span id="sel__time"></span>
	 			<span id="sel__price"></span>
	 		</div>
	 		<input type="submit" value="결제하기" id="time_sub">
	       </div>
	    </div>  
	</form>
</div>
<script>
	function curr_price() {
		current_price.innerText = '현재 잔액 '+ numberFormat(${data.u_wallet}) + '원 남았습니다.'
	}
	
	curr_price()

	function make_btn() {
		var selArr =[1, 2, 3, 5, 10, 20]
		var selDiv = document.createElement('div')
		selDiv.setAttribute('id', 'sel_btn')
		for(var i = 0; i < selArr.length; i++) {
			var sel_btn = document.createElement('button')
			sel_btn.setAttribute('onclick', 'pc_time('+selArr[i]+')')
			sel_btn.innerText = selArr[i]+':00시간\n'+numberFormat(selArr[i]*1200)+'원'
			selDiv.append(sel_btn)
			if(i % 2 == 1) {
				var br = document.createElement('br')
				selDiv.appendChild(br)
			}
		}
		sel_div.append(selDiv)
	}
	make_btn()

	function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function pc_time(put_hour) {
		var hour = put_hour
		var price = hour * 1200
		
		console.log("hour : " + hour)
		console.log("price : " + price)
		timeFrm.u_time.value = hour * 10000
		timeFrm.u_wallet.value = price
		
		sel__time.innerText = hour + ':00 시간'
		sel__price.innerText = numberFormat(price) + '원'
	}
	
	const openButton = document.getElementById("open")
    const modal = document.querySelector(".modal")
    const overlay = modal.querySelector(".modal__overlay")
    const closeBtn = modal.querySelector("#modal_btn")
    const openModal = () => {
        modal.classList.remove("hidden")
    }
    const closeModal = () => {
        modal.classList.add("hidden")
    }
    closeBtn.addEventListener("click", closeModal)
    openButton.addEventListener("click", openModal)
	
	function chk() {
		if(timeFrm.u_time.value == 0 && timeFrm.u_wallet.value ==0) {
			alert('시간을 선택해 주세요.')
			return false
		}
		alert('선택이 완료되었습니다.')
	}
</script>