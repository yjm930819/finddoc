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
		<h2>접수 목록</h2>
	</div>
	<div class="container-fluid">
		<form>
			<br>
			<div>
				<select class="form-control col-sm-2" name="search">
					<option>접수번호</option>
					<option>접수자</option>
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
				<label>대기환자 수 : 1명</label>
			</div>
			<br>
			<table class="table table-hover">
				<th><input type="checkbox" name="ok">&nbsp;&nbsp;&nbsp;전체선택</th>
				<th>접수번호</th>
				<th>접수자</th>
				<th>비고</th>
				<th>진료정보</th>
				<tr>
					<td><input type="checkbox" name="ok"></td>
					<td>2</td>
					<td><a href="/finddoc/user/bookinfo.do?action=read&booknum=">이복숭아</a></td>
					<td>코가 막힘</td>
					<td>접수중</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="ok"></td>
					<td>1</td>
					<td>이바보</td>
					<td>눈이 아픔</td>
					<td>진료완료</td>
				</tr>
			</table>

			<div id="cancel">
				<input
					type="button" value="진료완료" class="btn btn-default"
					onclick="location.href='/finddoc/doc/receiptlist.do'">
			</div>
		</form>
	</div>
</body>
</html>




