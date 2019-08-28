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
<script type="text/javascript">
	$(document).ready(function() {
		var result = "${result}";
		var incorrect = "${incorrect}";
		if (incorrect != "") {
			confirm(incorrect);
		}
		if (result != "") {
			confirm("아이디 : " + result);
		}
		//컨트롤러 갔다가 왔으면 result에 값이 있으니 result를 리셋 해줘야 다시 버튼을 눌러도 실행이 된다.
		result = "";
		$("#find").click(function() {
			if (result == "") {
				document.getElementById("formid").submit();
			}

		});
	});
</script>
</head>
<body>
	<div id="title">
		<h2>아이디 찾기</h2>
	</div>

	<div class="container-fluid">
		<form role="form" class="form-horizontal" name="myform"
			action="/finddoc/login/idSearch.do" method="post" id="formid">

			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" placeholder="이름"
						class="form-control" minlength="3" required>
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
				<div class="col-sm-6 col-sm-offset-2">
					<input type="button" value="아이디 찾기" class="btn btn-success" id=find />
					<input type="button" value="취소" class="btn btn-success"
						onclick="location.href='/finddoc/login/loginView.do'" />
				</div>
			</div>

		</form>
	</div>
</body>
</html>