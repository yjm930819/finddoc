<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#cancel {
	float: right; .
	margin-right: 30px;
}
#num{
	float: right; 
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="title">
		<h2>오늘 예약 목록</h2>
	</div>
	<div class="container-fluid">
		<form>
			<br>
			<div>
				<select class="form-control col-sm-2" name="search">
					<option>예약번호</option>
					<option>예약자</option>
					<option>날짜</option>
					<option>진료정보</option>
				</select>
			</div>
			<div class="input-group col-sm-2">
				<input type="text" class="form-control"> <span
					class="input-group-btn">
					<button class="btn btn-default " type="button">
						<span class="glyphicon glyphicon-search "></span>
					</button>
				</span>
			</div>
			<div id="num">
				<label>오늘의 예약환자 수 : 1명</label>
			</div>
			<br>
			<table class="table table-hover">
				<th><input type="checkbox" name="ok">&nbsp;&nbsp;&nbsp;전체선택</th>
				<th>예약번호</th>
				<th>예약자</th>
				<th>예약일</th>
				<th>비고</th>
				<th>진료정보</th>
				<c:forEach var="list" items="${list}" >
					<tr>
						<td><input type="checkbox" name="myhosplist" value="${list.booknum}"></td>
						<td>${list.booknum}</td>
						<td>${list.name}</td>
						<td>${list.bookdate}</td>
						<td>${list.text}</td>
						<td>${list.ing}</td>
					</tr>
				</c:forEach>
			</table>

			<div id="cancel">
				<input type="button" value="진료완료" class="btn btn-default" onclick="location.href='/finddoc/doc/todaycomplate.do'">
			</div>
		</form>
	</div>
</body>
</html>




