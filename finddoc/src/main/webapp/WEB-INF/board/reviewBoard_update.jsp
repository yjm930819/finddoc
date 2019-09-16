<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.col-md-8 {
	padding: 8px;
}
</style>
</head>
<body>

	<h4>
		<i class="fa fa-angle-right"></i> 공지사항 게시글 수정하기
	</h4>
	<hr>
	<div class="row mt">
		<div class="col-lg-12">
			<div class="form-panel">

				<form class="form-horizontal style-form"
					action="/finddoc/board/reviewBoard_update.do" method="post">
					<input type="hidden" name="reviewboardnum"
						value="${review.reviewboardnum}"> <input type="hidden"
						name="action" value="update">
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="id" class="control-label">번호</label>
						</div>
						<div class="col-md-8">${review.reviewboardnum}</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="id" class="control-label">조회수</label>
						</div>
						<div class="col-md-8">${review.reviewcount}</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="id" class="control-label">병원명</label>
						</div>
						<div class="col-md-8">${review.hname}</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="id" class="control-label">작성자</label>
						</div>
						<div class="col-md-8">${review.name}</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="title" class="control-label">제목</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="title"
								value="${review.title}">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="title" class="control-label">마지막 수정날짜</label>

						</div>
						<div class="col-md-8">${review.moddate }</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="title" class="control-label">후기점수</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="reco"
								value="${review.reco}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">내용</label>
						<div class="col-sm-8">
							<textarea id="content"
								style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
								rows=15 name="text">${review.text}</textarea>

						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-2 text-center"></div>
						<div class="col-lg-2 text-center">
							<button type="submit" class="btn btn-success"
								style="width: 100px; background-color: #0ea006">수정</button>
						</div>
						<div class="col-lg-2 text-center">
							<button type="reset" class="btn btn-success"
								style="width: 100px; background-color: #0ea006">리셋</button>
						</div>
						<div class="col-lg-2 text-center">
							<button type="button" class="btn btn-success"
								onclick="location.href='/finddoc/board/reviewBoardList.do'"
								style="width: 100px; background-color: #0ea006">취소</button>
						</div>

					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>