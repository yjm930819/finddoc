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
	<c:if test="${loginuser.state=='user'}">
		<div class="list-group">
			<a href="/finddoc/user/book.do?action=view" class="list-group-item">병원예약</a> 
			<a href="/finddoc/user/booklist.do" class="list-group-item">모든 예약 목록</a>
		</div>
	</c:if>
	<c:if test="${loginuser.state=='hadmin' }">
		<div class="list-group">
			<a href="/finddoc/doc/todaybooklist.do" class="list-group-item">오늘 예약 조회</a> 
			<a href="/finddoc/doc/booklist.do" class="list-group-item">모든 예약 목록</a>
		</div>
	</c:if>
</body>
</html>