<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="allContainer">
	<h1>${loginUser.u_name}님 프로필</h1>
	<div class="printImage">
		<c:choose>
			<c:when test="${loginUser.u_profile eq '' || loginUser.u_profile eq null}">
				<img class="profileImg" src="/res/img/login/default_image.jpg" alt="프로필 설정 가기">
			</c:when>
			<c:otherwise>
				<img class="profileImg" src="/images/u_profile/user/${loginUser.u_no}/${loginUser.u_profile}" alt="프로필 설정 가기">
			</c:otherwise>
		</c:choose>
	</div>
	<div class="frmContainer">
		<form id="frm" action="/main/profile" method="post" enctype="multipart/form-data" onsubmit="return chk()">
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
				<input type="password" name="u_repassword" value="" class="updList">
			</div>
			<div>
				<span class="name">생년월일</span>&nbsp;&nbsp;
				<input type="date" name="u_birth" value="${loginUser.u_birth}" class="updList">
			</div>
			<div id="btnBox">
				<input type="submit" value="업데이트" id="frmBtn">
			</div>
		</form>
	</div>
</div>
