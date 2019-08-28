<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		var result="${result}";
		if(result!=""){
			alert(result);
		}
		$("#delete").click(function() {
			var result = confirm("정말 탈퇴하시겠습니까?");
			if (result == true) {
				document.getElementById("formid").submit();
			}
		})
	})
</script>
</head>
<body>
	<div id="title">
		<h2>회원탈퇴</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal" name="myform" method="post"
			action="/finddoc/member/delete.do" id="formid">
			<input type="hidden" name="action" value="${loginuser.state }">

			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">아이디</label>
				<div class="col-sm-3">
					<c:if test="${loginuser.state=='user' }">
						<input type="text" id="id" class="form-control"
							disabled="disabled" value="${loginuser.userid}">
						<input type="hidden" name="id" value="${loginuser.userid }">
					</c:if>
					<c:if test="${loginuser.state=='hadmin' }">
						<input type="text" id="id" class="form-control"
							disabled="disabled" value="${loginuser.hadminid }">
						<input type="hidden" name="id" value="${loginuser.hadminid }">
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control"
						disabled="disabled" value="${loginuser.name}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="pw" name="pw" placeholder="비밀번호"
						class="form-control" required>
				</div>
			</div>

			<br />
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-2">
					<input type="button" value="회원탈퇴" class="btn btn-success"
						id="delete" /> <input type="button" value="취소"
						class="btn btn-success"
						onclick="location.href='/finddoc/login/loginAfter.do'" />
				</div>
			</div>

		</form>
	</div>
</body>
</html>