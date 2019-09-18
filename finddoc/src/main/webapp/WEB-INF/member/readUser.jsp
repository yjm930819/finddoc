<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="title">
		<h2>사용자 정보</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal" name="myform">
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="userid" name="userid" class="form-control"
						value="${loginuser.userid}" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control"
						value="${loginuser.name}" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">비밀번호</label>
				<div class="col-sm-3">
					<input type="text" id="pw" name="pw" class="form-control"
						value="${loginuser.pw }" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">성별</label>
				<div class="col-sm-3">
					<c:if test="${loginuser.gender=='m'}">
						<input type="text" id="gender" name="gender" class="form-control"
							value="남자" disabled="disabled">
					</c:if>
					<c:if test="${loginuser.gender=='f'}">
						<input type="text" id="gender" name="gender" class="form-control"
							value="여자" disabled="disabled">
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phonehome">핸드폰번호</label>
				<div class="col-sm-5">
					<input type="text" id="cp" name="cp" class="form-control"
						value="${loginuser.cp }" disabled="disabled">

				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sn">주민번호</label>
				<div class="col-sm-2">
					<input type="text" id="sn1" name="sn1" class="form-control"
						value="${loginuser.sn1 }" disabled="disabled">
				</div>
				<div class="col-sm-2">
					<input type="text" id="sn2" name="sn2" class="form-control"
						value="${loginuser.sn2 }" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="addr">주소</label>
				<div class="col-sm-6">
					<input type="text" id="addr" name="addr" class="form-control"
						value="${loginuser.addr }" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="grade">이메일</label>
				<div class="col-sm-3">
					<input type="text" id="email" name="email" class="form-control"
						value="${loginuser.email }" disabled="disabled">

				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">가입날짜</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="signdate"
						id="signdate" value="${loginuser.signdate }" disabled="disabled">
				</div>
			</div>

			<br />
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-2">
					<input type="button" value="정보수정" class="btn btn-success"
						onclick="location.href='/finddoc/member/updateUser.do'" /> <input
						type="button" value="취소" class="btn btn-success"
						onclick="location.href='/finddoc/login/loginAfter.do'" />
				</div>
			</div>

		</form>
	</div>
</body>
</html>