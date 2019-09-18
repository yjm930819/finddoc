<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	color: black;
}

#title {
	text-align: center;
	padding: 40px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#hos").change(function() {
			$("#hname").val($("#hos").val());
		})
	})
</script>
</head>
<body>
	<div id="title">
		<h2>접수하기</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal" name="myform" method="post"
			action="/finddoc/receipt/book.do">
			<input type="hidden" name="action" value="book"> <input
				type="hidden" name="userid"
				value="<se:authentication property="principal.id" />">
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">병원명</label>
				<div class="col-sm-3">
					<input type="text" id="hname" name="hname" class="form-control"
						placeholder="병원명" required>

				</div>
				<div class="col-sm-5">
					<div class="container-fluid">
						자주가능 병원에서 선택 <select class="form-control col-sm-4" name="hos"
							id="hos">
							<c:forEach var="hoslist" items="${hoslist }">
								<option value="${hoslist.hname }">${hoslist.hname }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">접수자</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" placeholder="접수자"
						class="form-control" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="ssn">생년월일</label>
				<div class="col-sm-3">
					<input type="text" id="ssn" name="birthday" class="form-control"
						placeholder="생년월일">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phonehome">연락처</label>
				<div class="col-sm-5">
					<input type="text" id="cp" name="cp" placeholder="연락처"
						class="form-control" minlength="15">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phonehome">비고</label>
				<div class="col-sm-5">
					<input type="text" id="text" name="text" placeholder="증상 또는 주의사항"
						class="form-control">
				</div>
			</div>
			<br />
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-2">
					<input type="submit" value="접수하기" class="btn btn-success" id="book" />
					<input type="button" value="취소" class="btn btn-success"
						onclick="location.href='/finddoc/receipt/booklist.do'" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>