<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="list-group">
		<c:choose>
			<c:when test="${empty loginuser }">
				<a href="/finddoc/login/loginView.do" class="list-group-item">정보수정</a>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${loginuser.state=='user' }">
						<a href="/finddoc/member/updateUser.do" class="list-group-item">정보수정</a>
					</c:when>
					<c:otherwise>
						<a href="/finddoc/member/updateHadmin.do" class="list-group-item">정보수정</a>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${empty loginuser }">
				<a href="/finddoc/login/loginView.do" class="list-group-item">정보보기</a>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${loginuser.state=='user' }">
						<a href="/finddoc/member/readUser.do" class="list-group-item">정보보기</a>
					</c:when>
					<c:otherwise>
						<a href="/finddoc/member/readHadmin.do" class="list-group-item">정보보기</a>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		<c:if test="${loginuser.state=='user' }">
			<a href="/finddoc/mypage/mypage.do" class="list-group-item">자주가능
				병원 수정</a>
		</c:if>
		<c:choose>
			<c:when test="${empty loginuser}">
				<a href="/finddoc/login/loginView.do" class="list-group-item">회원탈퇴</a>
			</c:when>
			<c:otherwise>
				<a href="/finddoc/member/deleteView.do" class="list-group-item">회원탈퇴</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>