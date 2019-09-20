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
			<!-- <div>
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
			</div>-->
			<div id="num">
				<label>진료 예정 환자수 : ${panum}명</label>
			</div>
			<br>
			<table class="table table-hover">
				<th>예약번호</th>
				<th>예약자</th>
				<th>예약일</th>
				<th>진료과</th>
				<th>비고</th>
				<th>진료정보</th>
				<th> </th>
				<c:forEach var="todaylist" items="${todaylist}" >
					<tr>
						<%-- <td><input type="checkbox" name="myhosplist" value="${todaylist.booknum}"></td> --%>
						<td><a href="/finddoc/user/bookinfo.do?booknum=${todaylist.booknum}&action=read">${todaylist.booknum}</a></td>
						<td>${todaylist.name}</td>
						<td>${todaylist.bookdate}</td>
						<td>${todaylist.major}</td>
						<td>${todaylist.text}</td>
						<td>${todaylist.ing}</td>
						<td><input type="button" class="btn btn-default" value="진료완료" onclick="location.href='/finddoc/doc/todaycomplate.do?booknum=${todaylist.booknum}'"></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<br>
			<hr>
			<br>
			<br>
			<table class="table table-hover">
				<th>예약번호</th>
				<th>예약자</th>
				<th>예약일</th>
				<th>진료과</th>
				<th>비고</th>
				<th>진료정보</th>
				<c:forEach var="todaylist_accept" items="${todaylist_accept}" >
					<tr>
						<%-- <td><input type="checkbox" name="myhosplist" value="${todaylist.booknum}"></td> --%>
						<td><a href="/finddoc/user/bookinfo.do?booknum=${todaylist_accept.booknum}&action=read">${todaylist_accept.booknum}</a></td>
						<td>${todaylist_accept.name}</td>
						<td>${todaylist_accept.bookdate}</td>
						<td>${todaylist_accept.major}</td>
						<td>${todaylist_accept.text}</td>
						<td>${todaylist_accept.ing}</td>
					</tr>
				</c:forEach>
			</table>
			
<!-- 
			<div id="cancel">
				<input type="button" value="진료완료" class="btn btn-default" onclick="location.href='/finddoc/doc/todaycomplate.do'">
			</div> -->
		</form>
	</div>
</body>
</html>




