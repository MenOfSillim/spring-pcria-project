<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="allContainer">
	<h1>${loginUser.u_name}님 프로필</h1>
	<div id="leftContainer">
		<div class="printImage">
			<c:choose>
				<c:when test="${loginUser.u_profile eq '' || loginUser.u_profile eq null}">
					<img class="profileImg" src="/res/img/login/default_image.jpg" alt="프로필 설정 가기">
				</c:when>
				<c:otherwise>
					<img class="profileImg" src="/res/img/u_profile/user/${loginUser.u_no}/${loginUser.u_profile}" alt="프로필 설정 가기">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="frmContainer">
			<form id="frm" action="/main/profile" method="post" enctype="multipart/form-data">
				<div>
					<span class="name">사진 변경</span>&nbsp;&nbsp;
					<input type="file" name="profile_img" accept="image/*" value="이미지 선택" class="imgFile">
				</div>
				<div>
					<span class="name">아이디</span>&nbsp;&nbsp;
					<input type="search" name="u_id" value="${loginUser.u_id}" class="updList" readonly>
				</div>
				<div>
					<span class="name">이름</span>&nbsp;&nbsp;
					<input type="search" name="u_name" value="${loginUser.u_name}" class="updList">
				</div>
				<div>
					<span class="name">비밀번호 변경</span>&nbsp;&nbsp;
					<input type="password" name="u_password" value="" class="updList" placeholder="변경하시려면 입력해주세요">
				</div>
				<div>
					<span class="name">비밀번호 확인</span>&nbsp;&nbsp;
					<input type="password" name="u_repassword" value="" class="updList" placeholder="위와 동일하게 입력해주세요">
				</div>
				<div>
					<span class="name">생년월일</span>&nbsp;&nbsp;
					<input type="date" name="u_birth" value="${loginUser.u_birth}" class="updList">
				</div>
				<div id="btnBox">
					<input type="submit" value="업데이트" id="frmBtn" onclick="checkUptUser()">
				</div>
			</form>
		</div>
	</div>
	<div id="rightContainer">
		<h3>나의 주문 목록</h3>
		<div id="myOrderList">
		
		</div>
	</div>
	<script type="text/javascript">
		var origin_name = '${loginUser.u_name}'
		var result = '${result}'
		
		if(result == 1) alert('프로필 업데이트 완료되었습니다.')
		
		function checkUptUser() {
	      if(frm.u_password.value.length > 0) {         
	         if(frm.u_password.value.length < 5){
	            alert('비밀번호는 5글자 이상입니다')
	            return false
	         }
	         if(frm.u_password.value != frm.u_repassword.value) {
	            alert('비밀번호가 일치하지 않습니다')
	            return false
	         }
	      }
	      if(frm.u_name.value.length > 0){
	    	  if(frm.u_name.value.length > 6){
	    		  alert('이름을 5글자 이하로 설정해주세요.')
	    		  frm.u_name.value = origin_name
	    		  return false
	    	  }
	      }
	      frm.submit();
		}
	</script>
</div>
