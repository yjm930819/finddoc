<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
#title {
	text-align: center;
	padding: 40px;
}
</style>
</head>
<body>
	<div id="title">
		<h2>사용자 회원정보 수정</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal" name="myform" method="post"
			action="/finddoc/member/userUpdate.do">
			<input type="hidden" name="action" value="update">
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="userid" name="userid" class="form-control"
						required disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="pw" name="pw" placeholder="비밀번호"
						class="form-control" minlength="4" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control"
						disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="ssn">주민번호</label>
				<div class="col-sm-2">
					<input type="text" id="sn1" name="sn1" class="form-control"
						disabled="disabled">
				</div>
				<div class="col-sm-2">
					<input type="text" id="sn2" name="sn2" class="form-control"
						disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">우편번호</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="zipcode" id="zipcode"
						placeholder="우편번호">
				</div>
				<div class="col-sm-2">
					<button type="button"
						class="btn btn-round btn-primary form-control">우편번호 검색</button>
				</div>
			</div>
			<div class="form-group">
				<!-- 주소-->
				<label class="control-label col-sm-2" for="addr">주소</label>
				<div class="col-sm-6">
					<input type="text" id="addr" name="addr" placeholder="주소"
						class="form-control" minlength="4" required>

				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label"></label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="detailaddr"
						id="detailaddr" placeholder="상세주소">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phonehome">핸드폰번호</label>
				<div class="col-sm-5">
					<input type="text" id="cp" name="cp" placeholder="핸드폰번호"
						class="form-control" minlength="15" required>

				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="grade">이메일</label>
				<div class="col-sm-3">
					<input type="text" id="email" name="email" placeholder="이메일"
						class="form-control" minlength="4" required>

				</div>
			</div>

			<br />
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-2">
					<input type="submit" value="정보수정" class="btn btn-success"
						id="update" /> <input type="button" value="취소"
						class="btn btn-success"
						onclick="location.href='/finddoc/login/loginView.do'" />
				</div>
			</div>

		</form>
	</div>
</body>
</html>