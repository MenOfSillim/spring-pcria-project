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
		<p id="current_time">잔여 시간 <span id="span_time"></span> 남았습니다.</p>
		<p id="current_price"></p>
		<div id="div_coin">
			<input type="text" name="coin" id="coin">원
			<button onclick="insert_coin()" id="coin_btn">충전하기</button>
		</div> 
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
	<button onclick="start()">시작</button>
    <h1>카운트 다운</h1> 
    <h2 id="sample01"></h2> <br/> 
</div>	
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	var data_u_time = '${data.u_time}'
	var time_value = others_time_1(data_u_time)
	span_time.innerText = time_value
	
	function curr_price(coin) {
		current_price.innerText = '현재 잔액 '+ numberFormat(coin) + '원 남았습니다.'
	}
	function others_time_1(other_time) {
    	var otherArr = other_time.split(':')
    	return `\${otherArr[0]}:\${otherArr[1]}`
    }
	curr_price(${data.u_wallet})
	
	function insert_coin() {
		var coin = document.getElementById('coin').value
		console.log('coin : ' + coin)
		if(confirm('충전하시겠습니까?')) {
			axios.post('/count/coinAjax', {
				u_wallet : coin
			}).then(function(res) {
				console.log(res)
				console.log(res.data)
				document.querySelector('#coin').value = 0
				current_price.innerText = ''
				curr_price(res.data.u_wallet)
			})
		}
	}

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
    const countDownTimer = function (id, date) { 
        var _vDate = new Date(date); // 전달 받은 일자 
        var _second = 1000; 
        var _minute = _second * 60; 
        var _hour = _minute * 60; 
        var _day = _hour * 24; 
        var timer; 
        var i = 0;

        function showRemaining() { 
            var now = new Date(); 
            var distDt = _vDate - now;
            if(sessionStorage.getItem('timeset') == null) {
	            sessionStorage.setItem('timeset', distDt); // 세션에 초기 시간 삽입
	            sessionStorage.setItem('count', i); // 세션에 초기 시간 삽입            	
            }
            if (distDt < 0) { 
                clearInterval(timer); 
                document.getElementById(id).textContent = '해당 이벤트가 종료 되었습니다!'; 
                return; 
        
            } 
            var days = Math.floor(distDt / _day); 
            var hours = Math.floor((distDt % _day) / _hour); 
            var minutes = Math.floor((distDt % _hour) / _minute); 
            var seconds = Math.floor((distDt % _minute) / _second); 

            //document.getElementById(id).textContent = date.toLocaleString() + "까지 : "; 
            document.getElementById(id).textContent = days + '일 '; 
            document.getElementById(id).textContent += hours + '시간 '; 
            document.getElementById(id).textContent += minutes + '분 '; 
            document.getElementById(id).textContent += seconds + '초'; 
            }

        timer = setInterval(showRemaining, 1000); 
    } 
    function start() {
        var dateObj = new Date(); 
    	var time = span_time.innerText
    	var real_time = 0
    	console.log(time)
    	if(time != '00:00:00') {
            var timeArr = time.split(':')
            console.log(parseInt(timeArr[0]))
            real_time = parseInt(timeArr[0] * 3600) + parseInt(timeArr[1] * 60) + parseInt(timeArr[0])
            console.log(real_time)
    	} else {
    		real_time = 0
    	}
        dateObj.setTime(dateObj.getTime() + real_time * 1000); 
        countDownTimer('sample01', dateObj); // 남은 시간부터 카운트다운
    }
</script>