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
</style>
<title>Insert title here</title>
</head>
<body>
	<h2>승인 대기 병원목록</h2>
	<div class="container-fluid">
		<table class="table table-hover">
			<th>
				<form action="">
					<input type="checkbox" name="ok">전체선택
				</form>
			</th>
			<th>대기번호</th>
			<th>병원명</th>
			<th>주소</th>
			<th>대표</th>
			<th>가입신청일</th>
			<tr>
				<td><input type="checkbox" name="ok"></td>
				<td>1</td>
				<td>방배소아과</td>
				<td>서울특별시 방배동 효성로 193</td>
				<td>김사과</td>
				<td>2019-08-14</td>
			</tr>
		</table>
	</div>
	<br>

	<input type="button" value="가입 승인">
</body>
</html>




