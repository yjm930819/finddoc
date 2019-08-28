<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#link {
	padding: 100px;
	padding-top: 150px;
	text-align: center;
}

i {
	font-size: 200px;
	color: skyblue;
}

a:hover {
	text-decoration: none;
}

i:hover {
	color: yellow;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div id="link">
		<div class="col-lg-3">
			<a href="/finddoc/receipt/booklist.do?action=main"><i
				class="fas fa-syringe"></i>
				<h4>병원접수</h4> 가장 최근 병원 접수(자동) </a>
		</div>
		<div class="col-lg-3">
			<a href="/finddoc/user/book.do?action=view"><i
				class="fas fa-stethoscope"></i>
				<h4>병원예약</h4> 병원 예약 </a>
		</div>
		<div class="col-lg-3">
			<a href="/finddoc/search/search.do"><i
				class="fas fa-search-location"></i>
				<h4>병원검색</h4> 현위치에서 병원검색 </a>
		</div>
		<div class="col-lg-3">
			<a href="/finddoc/board/noticeBoardList.do?category=all"><i
				class="far fa-clipboard"></i>
				<h4>게시판</h4> 게시판으로 이동 </a>
		</div>

	</div>
</body>
</html>