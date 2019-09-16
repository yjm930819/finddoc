<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h2>접수 상세 정보</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal"
			action="/finddoc/receipt/bookupdate.do" method="post">
			<input type="hidden" name="receiptnum"
				value="${receiptdto.receiptnum }">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-sm-2">병원명</label>
					<div class="col-sm-3">${receiptdto.hname }</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">접수번호</label>
					<div class="col-sm-3">${receiptdto.receiptnum }</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">접수일</label>
					<div class="col-sm-3">${receiptdto.receiptdate }</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">예약자</label> <input
						type="text" value="${receiptdto.name }" name="name">
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">연락처</label> <input
						type="text" value="${receiptdto.cp }" name="cp">
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">비고</label> <input type="text"
						value="${receiptdto.text }" name="text">
				</div>
				<div class="form-group">
					<div class="col-sm-3 col-sm-offset-2">
						<input type="submit" value="수정" class="btn btn-success" /> <input
							type="button" value="취소" class="btn btn-success"
							onclick="location.href='/finddoc/receipt/booklist.do'" />
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>