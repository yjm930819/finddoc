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
</head>
<body>
	<div id="title">
		<h2>로그인 성공!</h2>
	</div>
	<div class="container-fluid">

		<div class="form-group">
			<label class="control-label col-sm-2 col-sm-offset-2" for="orgtel">${loginuser.name }</label>
			<label class="control-label col-sm-2" for="orgtel">님 환영합니다.</label>
		</div>


		<br />
		<div class="form-group">
			<div class="col-sm-6 col-sm-offset-2">
				<input type="button" value="로그아웃" class="btn btn-success" id=find
					onclick="location.href='/finddoc/login/logout.do'" />
				<c:if test="${loginuser.state=='user' }">
					<input type="button" value="정보수정" class="btn btn-success"
						onclick="location.href='/finddoc/member/updateUser.do'" />
				</c:if>
				<c:if test="${loginuser.state=='hadmin' }">
					<input type="button" value="정보수정" class="btn btn-success"
						onclick="location.href='/finddoc/member/updateHadmin.do'" />
				</c:if>
			</div>
		</div>

		</form>
	</div>
</body>
</html>