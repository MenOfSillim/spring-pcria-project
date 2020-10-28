<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
	<link href="/res/css/template/mainTemplate.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/res/css/template/mainTemplateFonts.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/res/css/${css}.css" rel="stylesheet" type="text/css" media="all" />
	<title>PCria</title>
	</head>
<body>
<div id="container">
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="/main/seat">🎮🕹PCria</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li id="seat"><a href="/main/seat" accesskey="1" title="좌석 예약">좌석 예약</a></li>
				<li id="usageTime"><a href="/main/usageTime" accesskey="2" title="시간 예약">시간 예약</a></li>
				<li id="foodOrder"><a href="/main/food" accesskey="3" title="메뉴 예약">먹거리 주문</a></li>
				<li id="profile"><a href="/main/profile" accesskey="4" title="프로필">프로필</a></li>
				<li id="myPage"><a href="javascript:logout(1)" >사용종료</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="section"><jsp:include page="/WEB-INF/views/${view}.jsp"/></div>
<div id="footer-wrapper">
	<div id="copyright" class="container">
	<p>© 2020 PCria Co., Ltd. All rights reserved.</p>
</div>
</div>
</div>
</body>
<script type="text/javascript">
	var menu_id = ${menu_id}
	menu_id.classList.add('current_page_item')
	
	function logout(root) {
		var goout = false
		switch(root) {
		case 1: goout = confirm('로그아웃 하시겠습니까?')
		break
		case 2: goout = true
		break
		}
		if(goout) {
			sessionStorage.removeItem('timeset')
			sessionStorage.removeItem('count')
			sessionStorage.clear()
			if(sessionStorage.getItem('timeset') != null) {
				alert('다시 시도해주세요.')
				return false
			}
			location.href = '/access/logout'
		}
		return false
	}

	
    // 세션에 시간 흐르게 하는 함수 - 시작
    function session() {
    	if(sessionStorage.getItem('timeset') != null) {
            sessionStorage.setItem('timeset', sessionStorage.getItem('timeset') - 1000);
            sessionStorage.setItem('count', sessionStorage.getItem('count') - 1);
	    	console.log('session time : ' + sessionStorage.getItem('timeset'))
	    	console.log('session count : ' + sessionStorage.getItem('count'))
	    	disc_time()
    	}
    }
    var timerId = null
    
    function Start_timer() {
    	session()
	    timerId = setInterval(session, 1000)
    }
    Start_timer()
    // 여기까지 함수 - 끝
     
    function disc_time() {
    	if(sessionStorage.getItem('count') % 60 == 0) {
    		console.log(sessionStorage.getItem('count'))
    		axios.post('/count/ajaxDiscTime', {
    			u_time: 100
    		}).then(function(res) {
    			console.log('로그아웃 테스트 : ' + res.data)
    			if(res.data == '00:00:00') {
    				logout(2)
    				return false
    			}
    			var time = document.getElementById('span_time')
    			if(time != null) {
    				time.innerText = ''
    				time.innerText = others_time(res.data)    				
    			}
				var myBtn = document.querySelector('.btnMySelSeat')
				if(myBtn != null) {
					myBtn.removeChild(myBtn.lastChild)
					var myU_time = res.data
					var time_div = document.createElement('div')
					time_div.innerText = ''
					time_div.innerText = others_time(myU_time)
					
					myBtn.append(time_div)										
				}
    		})
    	}
    }

    function others_time(other_time) {
    	var otherArr = other_time.split(':')
    	return `\${otherArr[0]}:\${otherArr[1]}`
    }
</script>
</html>
