<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="allContainer">
	<h1>PCria 사용 시간 예약</h1>
	<div id="user_info">
		<p>${user.u_id}님 반갑습니다.</p>
		<p>잔여 시간 ${user.u_time} 남았습니다.</p>
		<p>현재 잔액 ${user.u_wallet}원 남았습니다.</p>
	</div>
	<div id="sel_div"></div>
	<form id="timeFrm" action="" method="get" onsubmit="return chk()">
		<input type="hidden" name="hour" value="0">
		<input type="hidden" name="price" value="0">	
		<input type="submit" value="결제하기" id="time_sub">	
	</form>
	
</div>
<script>
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
		timeFrm.hour.value = hour
		timeFrm.price.value = price
	}
	
	function chk() {
		if(timeFrm.hour.value == 0 && timeFrm.price.value ==0) {
			alert('시간을 선택해 주세요.')
			return false
		}
		alert('선택이 완료되었습니다.')
	}
</script>