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
<title>Insert title here</title>
<style type="text/css">
#main {
	padding: 20%;
	text-align: center;
}

i {
	font-size: 200px;
	color: skyblue;
}
</style>
</head>
<body>
	<div id="main">
		<div class="col-sm-6">
			<a href="/finddoc/login/idSearchView.do"><i
				class="fas fa-id-card-alt"></i>
				<h4>아이디 찾기</h4></a>
		</div>
		<div class="col-sm-6">
			<a href="/finddoc/login/pwSearchView.do"><i class="fas fa-key"></i>
				<h4>비밀번호 찾기</h4></a>
		</div>
	</div>

</body>
</html>