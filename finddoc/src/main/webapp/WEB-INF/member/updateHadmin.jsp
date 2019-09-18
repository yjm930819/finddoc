<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
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
		<h2>병원관계자 회원정보 수정</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal" name="myform" method="post"
			action="/finddoc/member/update.do">
			<input type="hidden" name="action" value="hadmin">
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">병원명</label>
				<div class="col-sm-3">
					<input type="text" id="hanme" name="hanme" disabled="disabled"
						class="form-control"
						value="<se:authentication property="principal.hname" />">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="hadminid" name="hadminid"
						class="form-control"
						value="<se:authentication property="principal.id" />"
						disabled="disabled">
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
						disabled="disabled"
						value="<se:authentication property="principal.name" />">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phonehome">핸드폰번호</label>
				<div class="col-sm-3">
					<input type="text" id="cp" name="cp" placeholder="예)010-1234-5678"
						class="form-control" minlength="13" required>

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
						onclick="location.href='/finddoc/login/loginAfter.do'" />
				</div>
			</div>

		</form>
	</div>
</body>
</html>