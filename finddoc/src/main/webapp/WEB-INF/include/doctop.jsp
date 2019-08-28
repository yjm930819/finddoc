<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Finddoc</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
#top {
	border-top: 5px solid #FF6C6C;
	border-bottom: 5px solid #FF6C6C;
	height: 50px;
	font-size: 15pt;
	font-weight: bolder;
}

#top img {
	width: 45px;
	height: 45px;
}

#top_logo i {
	font-size: 30px;
	color: skyblue;
	margin: 7px;
}

#menu_list {align =center;
	
}

div a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<div id="top">
		<div id="top_logo" class="col-sm-2">
			<a href="/finddoc/index.do"> <i class="fas fa-clinic-medical"></i>&nbsp;FINDDOC
			</a>
		</div>
		<div class="col-sm-8" align="center">
			<ul class="list-inline" id="menu_list">
				<li id="receipt"><a href="/finddoc/doc/booklist.do">병원관리</a></li>
				<li id="board"><a
					href="/finddoc/board/noticeBoardList.do?category=all">병원게시판</a></li>
			</ul>
		</div>
		<div id="top_right" class="col-sm-2" align="right">
			<a href="/finddoc/login/loginView.do"><i class="fas fa-door-open"></i>로그인</a>
			<a href="/finddoc/member/signupChoice.do">회원가입</a>
		</div>
	</div>
</body>
</html>