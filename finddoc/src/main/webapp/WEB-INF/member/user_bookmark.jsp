<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	color: black;
}

#title {
	text-align: center;
	padding: 40px;
}

table {
	width: 600px;
}

.input-group {
	width: 300px;
}

.form-control {
	width: 100px;
}

#delete {
	float: right;
	margin-right: 30px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="title">
		<h2>자주가는 병원 목록</h2>
	</div>

	<div class="container-fluid">
		<form>
			<select class="form-control col-sm-2" name="search">
				<option>병원명</option>
				<option>병웑 주소</option>
				<option>진료 과목</option>
			</select>
			<div class="input-group">
				<input type="text" class="form-control col-sm-2"> <span
					class="input-group-btn">
					<button class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
			<br>
			<table class="table table-hover">
				<th><input type="checkbox" name="ok">전체선택</th>
				<th>병원명</th>
				<th>병원 주소</th>
				<th>진료 과목</th>
				<tr>
					<td><input type="checkbox" name="ok"></td>
					<td><a>방배소아과</a></td>
					<td>서울특별시 방배동 효성로 193</td>
					<td>소아청소년과</td>
					<td><input type="button" value="예약"> <input
						type="button" value="접수"></td>
				</tr>
			</table>
			<br> <input class="btn btn-default" id="delete" type="button"
				value="삭제">
		</form>
	</div>
</body>
</html>




