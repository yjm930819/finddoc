<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
.col-md-8 {
	padding: 8px;
}
</style>
</head>
<body>

	<form class="form-horizontal"
		action="/finddoc/board/noticeBoard_update.do" method="post">
		<input type="hidden" name="action" value="read"> <input
			type="hidden" name="noticeboardnum"
			value="${noticeread.noticeboardnum}"> <input type="hidden"
			name="hname" value="${noticeread.hname}">
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">번호</label>
			</div>
			<div class="col-md-8">${noticeread.noticeboardnum}</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">조회수</label>
			</div>
			<div class="col-md-8">${noticeread.noticecount}</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">병원명</label>
			</div>
			<div class="col-md-8">${noticeread.hname}</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">작성자</label>
			</div>
			<div class="col-md-8">${noticeread.name}</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">제목</label>
			</div>
			<div class="col-md-8">${noticeread.title}</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">작성날짜</label>

			</div>
			<div class="col-md-8">${noticeread.txupdate }</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="text" class="control-label">내용</label>
			</div>
			<div class="col-md-8"
				style="width: 500px; height: 400px; border: solid 1px;">
				${noticeread.text }</div>
		</div>

		<div class="form-group">
			<div class="col-sm-3 col-sm-offset-2">
				<se:authorize access="hasRole('hadmin')">
					<input type="submit" value="수정" class="btn btn-success" id="update" />
				</se:authorize>
				<input type="button" value="취소" class="btn btn-success"
					onclick="location.href='/finddoc/board/noticeBoardList.do'" />
				<se:authorize access="hasRole('hadmin')">
					<input type="button" value="삭제" class="btn btn-success"
						onclick="location.href='/finddoc/board/noticeBoard_delete.do?noticeboardnum=${noticeread.noticeboardnum}'" />
				</se:authorize>
			</div>
		</div>
	</form>

</body>
</html>