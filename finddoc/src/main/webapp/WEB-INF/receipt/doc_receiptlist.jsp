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

#num {
	float: right;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cancel").click(function() {
			$('input:checkbox[name="ok"]').each(function() {
				if ($(this).is(":checked")) {
					$.ajax({
						url : "/finddoc/doc/docok.do",
						type : "get",
						data : {
							"receiptnum" : $(this).val(),
						},
						success : function(massage) {
							alert(massage)
							location.href = "/finddoc/doc/receiptlist.do";
						}
					});
				}
			});
		});
	})
</script>
</head>
<body>
	<div id="title">
		<h2>접수 목록</h2>
	</div>
	<div class="container-fluid">
		<form>
			<br>
			<!-- <div>
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
			</div> -->
			<div id="num">
				<!-- <label>대기환자 수 : 1명</label> -->
			</div>
			<br>
			<table class="table table-hover">
				<th>선택</th>
				<th>접수번호</th>
				<th>접수자</th>
				<th>비고</th>
				<th>진료정보</th>
				<c:forEach var="doclist" items="${doclist }">
					<tr>
						<c:choose>
							<c:when test="${doclist.ing=='접수완료' }">
								<td><input type="checkbox" name="ok"
									value="${doclist.receiptnum }"></td>
							</c:when>
							<c:otherwise>
								<td><input type="checkbox" name="ok" disabled="disabled"></td>
							</c:otherwise>
						</c:choose>
						<td>${doclist.receiptnum }</td>
						<td>${doclist.name }</td>
						<td>${doclist.text }</td>
						<td>${doclist.ing }</td>
					</tr>
				</c:forEach>
			</table>

			<div id="cancel">
				<input type="button" value="진료완료" class="btn btn-default">
			</div>
		</form>
	</div>
</body>
</html>




