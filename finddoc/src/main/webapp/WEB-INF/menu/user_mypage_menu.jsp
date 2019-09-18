<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="list-group">

		<se:authorize access="hasRole('user')">
			<a href="/finddoc/member/updateUser.do" class="list-group-item">정보수정</a>
		</se:authorize>
		<se:authorize access="hasRole('hadmin')">
			<a href="/finddoc/member/updateHadmin.do" class="list-group-item">정보수정</a>
			<a href="#" class="list-group-item">사이트 문의</a>
		</se:authorize>
		<se:authorize access="hasRole('user')">
			<a href="/finddoc/member/readUser.do" class="list-group-item">정보보기</a>
		</se:authorize>
		<se:authorize access="hasRole('hadmin')">
			<a href="/finddoc/member/readHadmin.do" class="list-group-item">정보보기</a>
		</se:authorize>
		<se:authorize access="hasRole('user')">
			<a href="/finddoc/mypage/bookmark.do" class="list-group-item">자주가능
				병원</a>
		</se:authorize>
		<se:authorize access="authenticated">
			<a href="/finddoc/member/deleteView.do" class="list-group-item">회원탈퇴</a>
		</se:authorize>
	</div>
</body>
</html>