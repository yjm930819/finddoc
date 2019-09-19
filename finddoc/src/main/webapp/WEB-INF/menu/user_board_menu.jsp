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
			<a href="/finddoc/board/noticeBoardList.do" class="list-group-item">자주가는
				병원 공지사항</a> <a href="/finddoc/board/reviewBoardList.do"
				class="list-group-item">내가 쓴 후기보기</a>
			<!-- <a
				href="/finddoc/board/qaBoardList.do" class="list-group-item">나의
				Q&A</a> -->
		</div>
	</se:authorize>
	<se:authorize access="hasRole('hadmin')">
		<div class="list-group">
			<a href="/finddoc/board/noticeBoardList.do?category=all"
				class="list-group-item">우리 병원 공지사항</a> <a
				href="/finddoc/board/reviewBoardList.do?category=all"
				class="list-group-item">우리 병원 후기보기</a>
			<!-- <a
				href="/finddoc/board/qaBoardList.do?category=all"
				class="list-group-item">우리 병원 Q&A</a> -->
		</div>
	</se:authorize>
</body>
</html>