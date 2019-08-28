<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
#title {
	text-align: center;
}
</style>
</head>
<body>
	<div id="title">
		<h2>공지사항 게시판</h2>
	</div>
	<div style="padding-top: 30px">
		<div class="col-md-3" style="padding-bottom: 10px">
			<form>
				병원 선택 <select name="category" id="category">
					<option value="all">전체게시물</option>
					<option value="굿닥">굿닥</option>
					<option value="똑닥">똑닥</option>
					<option value="뚝닥">뚝닥</option>
				</select>
			</form>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${board }">
					<tr>
						<td>${board.board_no }</td>
						<td><a
							href="/erp/board/read.do?board_no=${board.board_no }&action=read">${board.title}</a></td>
						<td>${board.id }</td>
						<td>${board.write_date }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<form action="/erp/board/search.do">
		<select name="tag" id="tag">
			<option value="id">작성자</option>
			<option value="title">제목</option>
			<option value="content">본문</option>
			<option value="write_date">작성일</option>
		</select> <input type="text" name="search" /> <input type="submit" value="검색">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/finddoc/board/noticeBoard_writeView.do"
				style="text-align: right;">글쓰기</a></li>
		</ul>
	</form>

</body>
</html>
