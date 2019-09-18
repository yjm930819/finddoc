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
	margin-right: 100px;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#cancel")
								.click(
										function() {
											$('input:checkbox[name="ok"]')
													.each(
															function() {
																if ($(this)
																		.is(
																				":checked")) {
																	$
																			.ajax({
																				url : "/finddoc/receipt/cancel.do",
																				type : "get",
																				data : {
																					"receiptnum" : $(
																							this)
																							.val(),
																				},
																				success : function(
																						massage) {
																					alert(massage)
																					location.href = "/finddoc/receipt/booklist.do?action=view";
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
		<br> <br>
		<form action="/finddoc/receipt/receiptcancel">
			<table class="table table-hover">
				<th>선택</th>
				<th>접수번호</th>
				<th>병원명</th>
				<th>접수자</th>
				<th>접수일</th>
				<th>비고</th>
				<th>진료정보</th>
				<c:forEach var="receiptlist" items="${receiptlist }">
					<tr>
						<c:choose>
							<c:when test="${receiptlist.ing=='접수완료' }">
								<td><input type="checkbox" name="ok"
									value="${receiptlist.receiptnum }"></td>
							</c:when>
							<c:otherwise>
								<td><input type="checkbox" name="ok" disabled="disabled"></td>
							</c:otherwise>
						</c:choose>
						<td>${receiptlist.receiptnum }</td>
						<td>${receiptlist.hname }</td>
						<td>${receiptlist.name }</td>
						<td>${receiptlist.receiptdate }</td>
						<td>${receiptlist.text }</td>
						<c:choose>
							<c:when test="${receiptlist.ing=='접수완료' }">
								<td><a
									href="/finddoc/receipt/bookinfo.do?action=read&receiptnum=${receiptlist.receiptnum }">${receiptlist.ing }</a></td>
							</c:when>
							<c:otherwise>
								<td>${receiptlist.ing }</td>
							</c:otherwise>
						</c:choose>

					</tr>
				</c:forEach>

			</table>
		</form>
		<br> <input id="cancel" type="button" value="접수취소"
			class="btn btn-default">
	</div>
</body>
</html>




