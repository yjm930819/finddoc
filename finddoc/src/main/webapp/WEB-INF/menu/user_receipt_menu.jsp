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
	<se:authorize access="hasRole('user')">
		<div class="list-group">
			<a href="/finddoc/receipt/book.do?action=view"
				class="list-group-item">병원 접수</a> <a
				href="/finddoc/receipt/booklist.do" class="list-group-item">모든
				접수 목록</a>
		</div>
	</se:authorize>
	<se:authorize access="hasRole('hadmin')">
		<div class="list-group">
			<a href="/finddoc/doc/receiptlist.do" class="list-group-item">오늘 접수
				목록</a>
			<a href="/finddoc/doc/todaybooklist.do?action=all" class="list-group-item">오늘 예약
				목록</a>
		</div>
	</se:authorize>
</body>
</html>