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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
#title {
	text-align: center;
	padding: 40px;
}
</style>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					//document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					//document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("addr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailaddr").focus();
			}
		}).open();
	}
</script>
</head>
<body>
	<div id="title">
		<h2>사용자 회원정보 수정</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal" name="myform" method="post"
			action="/finddoc/member/update.do">
			<input type="hidden" name="action" value="user">

			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="hadminid" name="hadminid"
						class="form-control" value="${loginuser.userid }"
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
						disabled="disabled" value="${loginuser.name }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">우편번호</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="zipcode" id="zipcode"
						placeholder="우편번호">
				</div>
				<div class="col-sm-2">
					<button type="button"
						class="btn btn-round btn-primary form-control"
						onclick="sample6_execDaumPostcode()">우편번호 검색</button>
				</div>
			</div>
			<div class="form-group">
				<!-- 주소-->
				<label class="control-label col-sm-2" for="addr">주소</label>
				<div class="col-sm-6">
					<input type="text" id="addr" name="addr" placeholder="주소"
						class="form-control" minlength="4" required>

				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label"></label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="detailaddr"
						id="detailaddr" placeholder="상세주소">
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