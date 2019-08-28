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
		<h2>예약하기</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal" name="myform" method="post"
			action="/finddoc/user/booklist.do">
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">병원명</label>
				<div class="col-sm-3">
					<input type="text" id="hosname" class="form-control"
						placeholder="병원명" required>
				</div>
				<div class="col-sm-3">
					<button type="button"
						class="btn btn-round btn-primary form-control">자주가는 병원에서
						선택</button>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">진료과</label>
				<div class="col-sm-3">
					<select class="form-control" name="major">
						<option>소아과</option>
						<option>정형외과</option>
						<option>피부과</option>
						<option>내과</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">예약 날짜</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="date"
						placeholder="예약 날짜를 달력에서 선택해주세요" required>
				</div>
				<div class="col-sm-1">
					<button type="button"
						class="btn btn-round btn-primary form-control">달력</button>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">예약자</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" placeholder="예약자"
						class="form-control" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="ssn">생년월일</label>
				<div class="col-sm-3">
					<input type="text" id="ssn" class="form-control" placeholder="생년월일">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phonehome">연락처</label>
				<div class="col-sm-5">
					<input type="text" id="phonecell" name="phonecell"
						placeholder="연락처" class="form-control" minlength="15">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phonehome">비고</label>
				<div class="col-sm-5">
					<input type="text" id="text" placeholder="증상 또는 주의사항"
						class="form-control">
				</div>
			</div>
			<br />
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-2">
					<input type="submit" value="예약하기" class="btn btn-success" id="book" />
					<input type="button" value="취소" class="btn btn-success"
						onclick="location.href='/finddoc/user/booklist.do'" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>