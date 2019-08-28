<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>
	<div id="title">
		<h2>접수 수정</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal"
			action="/finddoc/receipt/bookupdate.do" method="post">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-sm-2">병원명</label>
					<div class="col-sm-3">방배소아과</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">진료과</label>
					<div class="col-sm-3">소아과</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">예약자</label>
					<div class="col-sm-3">김복숭아</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">연락처</label>
					<div class="col-sm-3">
						<input type="text" name="usertel">
						<!-- 연락처 -->
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">비고</label>
					<div class="col-sm-3">
						<input type="text" name="text">
						<!-- 비고 -->
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 col-sm-offset-2">
						<input type="submit" value="수정" class="btn btn-success" />
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>