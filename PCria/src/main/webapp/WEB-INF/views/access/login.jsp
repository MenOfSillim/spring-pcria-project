<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="/res/css/${css}.css">
</head>
<body>
	<div class="wrap">
	    <div class="form-wrap">
	        <div class="button-wrap">
	            <div id="btn"></div>
	            <button type="button" class="togglebtn" onclick="login()">로그인</button>
	            <button type="button" class="togglebtn" onclick="register()">회원가입</button>
	        </div>
			<div class="msg">${msg}</div>
	        <form id="login" action="" class="input-group">
	            <input type="text" class="input-field" placeholder="아이디를 입력하세요" required>
	            <input type="password" class="input-field" placeholder="비밀번호를 입력하세요" required>
	            <input type="checkbox" class="checkbox" id="checkbox">
	            <label for="checkbox">비밀번호 기억</label>
	            <button class="submit">로그인</button>
	        </form>
	        <form action="/access/join" id="register" method="post" class="input-group register">
	        	<div id="idChkResult" class="msg"></div>
	        	<div>
		            <input type="text" class="input-field" name="u_id" id="u_id" placeholder="아이디를 입력하세요" required>
		            <button type="button" onclick="chkId(u_id)">아이디 중복 체크</button>
	            </div>
	            <input type="password" class="input-field" name="u_password" placeholder="비밀번호를 입력하세요" required>
	            <input type="text" class="input-field" name="u_name" placeholder="이름을 입력하세요" required>
	            <input type="date" class="input-field" name="u_birth" required>
	            <div id="registerBtn">
	            	<button class="submit">회원가입</button>
	            </div>
	        </form>
	    </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>
		function chkId(id) {												
			let u_id = id.value
			console.log(u_id)
			var text;									
			axios.post('/access/ajaxIdChk', {					
					u_id: u_id								
			}).then(function(res) {									
				console.log(res)											
				if(res.data == 2) { // 아이디 사용 가능								
					idChkResult.innerText = '사용 가능한 아이디 입니다.'							
				} else if(res.data == 3) { // 아이디 중복 됨								
					idChkResult.innerText = '중복된 아이디 입니다.'							
				}								
			})									
		}
		
        var x = document.getElementById("login");
        var y = document.getElementById("register");
        var z = document.getElementById("btn");

        function login(){
            x.style.left = "50px";
            y.style.left = "450px";
            z.style.left = "0";
        }

        function register(){
            x.style.left = "-400px";
            y.style.left = "50px";
            z.style.left = "110px";
        }
    </script>
</body>
</html>