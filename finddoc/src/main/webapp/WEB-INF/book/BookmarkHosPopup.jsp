<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
<style type="text/css">
#cen{
	margin: auto;
	margin-top: 10px;
	width: 50%;
}
#close{
	text-align:center;
    padding: 5px;
    width: 100%;
}
#paging{
	text-align:center;
    padding: 5px;
    width: 100%;
}
#top{
	text-align: center;
}
a:hover {
	text-decoration: none;
}
</style>
<script>
	$(document).ready(function() {
		$("#ykiho").hide();
	}
</script>
</head>
<body>
	<div id="info"></div>
		<table class="table table-hover">
			<th><input type="checkbox" name="ok">&nbsp;&nbsp;&nbsp;전체선택</th>
				<th>병원명</th>
				<th>병원주소</th>
				<th class="ykiho">병원코드</th>
				<c:forEach var="findbooklist" items="${findbooklist}" >
					<tr>
						<td><input type="checkbox" name="myhosplist" value="${list.booknum}"></td>
						<td>${findbooklist.hname}</td>
						<td>${findbooklist.addr}</td>
						<td class="ykiho">${findbooklist.ykiho}</td>
					</tr>
				</c:forEach>	
		</table>
		
	<div class="form-group">
		<div class="col-sm-3" id="paging">
			
		</div>
	</div>
	
	<div class="form-group" id="cen">
			<div class="col-sm-3">
				<input type="button" id="close" value="닫기" class="btn btn-success">
			</div>
		</div>
</body>
</html>