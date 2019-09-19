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

#choice {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var select = "${select}";
		var login = "${login}";
		var del = "${del}";
		if (select != "") {
			alert(select);
		}
		if (login != "") {
			alert(login);
		}
		if (del != "") {
			alert(del);
		}
		$("#login").click(function() {
			if (document.myform.action.value == '') {
				alert("사용자 유형을 선택하세요");
			} else {
				document.myform.submit();
			}
		})
	})
</script>
</head>
<body>
	<div id="title">
		<h2>로그인</h2>
	</div>

	<div class="container-fluid">
		<form role="form" class="form-horizontal" name="myform"
			action="/finddoc/j_spring_security_check" method="post">
			<div class="form-group">
				<div class="col-sm-7" id="choice">
					<input type="radio" name="action" value="user">사용자 <input
						type="radio" name="action" value="hadmin">병원관계자 <input
						type="radio" name="action" value="admin">관리자
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id" placeholder="아이디"
						class="form-control" minlength="3" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="pw" name="pw" placeholder="비밀번호"
						class="form-control" minlength="4" required>
				</div>

				<input type="button" value="로그인" class="btn btn-success" id="login" />
			</div>

			<br />
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-2">
					<input type="button" value="아이디/비밀번호찾기" class="btn btn-success"
						id=find onclick="location.href='/finddoc/login/idpwChoice.do'" />
					<input type="button" value="회원가입" class="btn btn-success"
						onclick="location.href='/finddoc/member/signupChoice.do'" />
				</div>
			</div>

		</form>
	</div>
</body>
</html>