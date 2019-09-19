<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Insert title here</title>
</head>
<body>
	<div id="title">
		<h2>예약 상세 정보</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal" action="" method="get">
			<div class="form-group">
				<label class="control-label col-sm-2">예약번호</label>
				<div class="col-sm-3">${userbookinfo.booknum}</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">병원명</label>
				<div class="col-sm-3">${userbookinfo.hname}</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">진료과</label>
				<div class="col-sm-3">${userbookinfo.major}</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">예약일</label>
				<div class="col-sm-3">${userbookinfo.bookdate} ${userbookinfo.hour} ${userbookinfo.mint}분</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">예약자</label>
				<div class="col-sm-3">${userbookinfo.name}</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">생년월일</label>
				<div class="col-sm-3">${userbookinfo.birthday}</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">연락처</label>
				<div class="col-sm-3">${userbookinfo.cp}</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">비고</label>
				<div class="col-sm-3">${userbookinfo.text}</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">진료정보</label>
				<div class="col-sm-3">${userbookinfo.ing}</div>
			</div>
			<se:authorize access="hasRole('user')">
			<c:choose>
				<c:when test="${userbookinfo.ing=='예약완료'}">
					<div class="form-group">
						<div class="col-sm-8 col-sm-offset-2">
							<input type="button" value="예약수정" class="btn btn-success"
								onclick="location.href='/finddoc/user/bookinfo.do?booknum=${userbookinfo.booknum}&action=update'" />
								<input type="button" value="예약취소" class="btn btn-success"
								onclick="location.href='/finddoc/user/bookcancel.do?booknum=${userbookinfo.booknum}'" />
								<input type="button" value="목록으로 돌아가기" class="btn btn-success"
						onclick="location.href='/finddoc/user/booklist.do'" />
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<div class="col-sm-8 col-sm-offset-2">
							<input type="button" value="목록으로 돌아가기" class="btn btn-success"
								onclick="location.href='/finddoc/user/booklist.do'" />
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			</se:authorize>
			<se:authorize access="hasRole('hadmin')">
				<div class="form-group">
						<div class="col-sm-8 col-sm-offset-2">
						<input type="button" value="목록으로 돌아가기" class="btn btn-success"
						onclick="location.href='/finddoc/doc/booklist.do?action=all'" />
						</div>
					</div>
			</se:authorize>
		</form>
	</div>
</body>
</html>