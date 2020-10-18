<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="/res/css/login.css">
</head>
<body>
	<div class="wrap">
	    <div class="form-wrap">
	        <div class="button-wrap">
	            <div id="btn"></div>
	            <button type="button" class="togglebtn" onclick="login()">로그인</button>
	            <button type="button" class="togglebtn" onclick="register()">회원가입</button>
	        </div>
	        <form id="login" action="" class="input-group">
	            <input type="text" class="input-field" placeholder="아이디를 입력하세요" required>
	            <input type="password" class="input-field" placeholder="비밀번호를 입력하세요" required>
	            <input type="checkbox" class="checkbox" id="checkbox">
	            <label for="checkbox">비밀번호 기억</label>
	            <button class="submit">로그인</button>
	        </form>
	        <form id="register" action="" class="input-group">
	            <input type="text" class="input-field" placeholder="아이디를 입력하세요" required>
	            <input type="email" class="input-field" placeholder="이메일을 입력하세요" required>
	            <input type="password" class="input-field" placeholder="비밀번호를 입력하세요" required>
	            <div id="registerBtn">
	            	<button class="submit">회원가입</button>
	            </div>
	        </form>
	    </div>
	</div>
    <script>
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