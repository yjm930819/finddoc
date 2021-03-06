<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Datepicker - Default functionality</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
body {
	color: black;
}

#title {
	text-align: center;
	padding: 40px;
}
</style>
<script>
	var dtNow = new Date();
	dtNext = dtNow.getDate + 1;
	$(document).ready(function() {
		$(".ykiho").hide();
		$("#ohosname").hide();
		if("${action}"=="mypage"|"${action}"=="search"){
			$
			.ajax({
				url : "/finddoc/search/getmajorByykiho.do",
				type : "post",
				data : {
					"ykiho" : "${ykiho}"
				},
				success : function(data) {
					$("#major").empty();
					majorlist = data.response.body.items.item;
					size = data.response.body.totalCount;
					majorobj = '<option value="default">진료과목을 선택해주세요</option>';
					if (size == 1) {
						majorobj = majorobj
								+ "<option value='"+majorlist.dgsbjtCdNm+"'>"
								+ majorlist.dgsbjtCdNm
								+ "</option>"
					} else {
						for (i = 0; i < size; i++) {
							//alert(majorlist[i].dgsbjtCdNm);
							majorobj = majorobj
									+ "<option value='"+majorlist[i].dgsbjtCdNm+"'>"
									+ majorlist[i].dgsbjtCdNm
									+ "</option>"
						}
					}
					$("#major").append(
							majorobj);
				},
				error : function() {
					alert("에러");
				}
			});
		}
		
		$("#selecthos").change(function() {
			$("#ykiho").val($("#selecthos").val());
			$("#ohosname").val($("#selecthos option:selected").text());
			$
			.ajax({
				url : "/finddoc/search/getmajorByykiho.do",
				type : "post",
				data : {
					"ykiho" : $("#ykiho").val()
				},
				success : function(data) {
					$("#major").empty();
					majorlist = data.response.body.items.item;
					size = data.response.body.totalCount;
					majorobj = '<option value="default">진료과목을 선택해주세요</option>';
					if (size == 1) {
						majorobj = majorobj
								+ "<option value='"+majorlist.dgsbjtCdNm+"'>"
								+ majorlist.dgsbjtCdNm
								+ "</option>"
					} else {
						for (i = 0; i < size; i++) {
							//alert(majorlist[i].dgsbjtCdNm);
							majorobj = majorobj
									+ "<option value='"+majorlist[i].dgsbjtCdNm+"'>"
									+ majorlist[i].dgsbjtCdNm
									+ "</option>"
						}
					}
					$("#major").append(
							majorobj);
				},
				error : function() {
					alert("에러");
				}
			});
		})

		EvtChangeMonthYear(dtNow.getFullYear(), dtNow.getMonth());
	});
	/* function getMajor() {
		$
		.ajax({
			url : "/finddoc/search/getmajorByykiho.do",
			type : "post",
			data : {
				"ykiho" : $("#ykiho").val()
			},
			success : function(data) {
				$("#major").empty();
				majorlist = data.response.body.items.item;
				size = data.response.body.totalCount;
				majorobj = '<option value="default">진료과목을 선택해주세요</option>';
				if (size == 1) {
					majorobj = majorobj
							+ "<option value='"+majorlist.dgsbjtCdNm+"'>"
							+ majorlist.dgsbjtCdNm
							+ "</option>"
				} else {
					for (i = 0; i < size; i++) {
						//alert(majorlist[i].dgsbjtCdNm);
						majorobj = majorobj
								+ "<option value='"+majorlist[i].dgsbjtCdNm+"'>"
								+ majorlist[i].dgsbjtCdNm
								+ "</option>"
					}
				}
				$("#major").append(
						majorobj);
			},
			error : function() {
				alert("에러");
			}
		});
	}
	function getMajor2() {
		$
		.ajax({
			url : "/finddoc/search/getmajorByykiho.do",
			type : "post",
			data : {
				"ykiho" : ${ykiho}
			},
			success : function(data) {
				$("#major").empty();
				majorlist = data.response.body.items.item;
				size = data.response.body.totalCount;
				majorobj = '<option value="default">진료과목을 선택해주세요</option>';
				if (size == 1) {
					majorobj = majorobj
							+ "<option value='"+majorlist.dgsbjtCdNm+"'>"
							+ majorlist.dgsbjtCdNm
							+ "</option>"
				} else {
					for (i = 0; i < size; i++) {
						//alert(majorlist[i].dgsbjtCdNm);
						majorobj = majorobj
								+ "<option value='"+majorlist[i].dgsbjtCdNm+"'>"
								+ majorlist[i].dgsbjtCdNm
								+ "</option>"
					}
				}
				$("#major").append(
						majorobj);
			},
			error : function() {
				alert("에러");
			}
		});
	}
 */
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd', // 데이터는 yyyy-MM-dd로 나옴
					closeText : '닫기',
					prevText : '이전달',
					nextText : '다음달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					weekHeader : 'Wk',
					firstDay : 0,
					isRTL : false,
					duration : 200,
					showAnim : 'show',
					minDate : dtNext,
					showMonthAfterYear : true,
					yearSuffix : '년',
					showOtherMonths : true, // 나머지 날짜도 화면에 표시
					selectOtherMonths : true, // 나머지 날짜에도 선택을 하려면 true

					onChangeMonthYear : function(year, month, inst) {
						EvtChangeMonthYear(year, month);
					},

					beforeShow : function(input, inst) {
						// 일자 선택되기전 이벤트 발생
					},
					onSelect : function(dateText, inst) {
					}

				});
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		// 월이나 년이 바뀔때의 이벤트
	});

	$(function() {
		$("#birthpicker").datepicker(
				{
					dateFormat : 'yy-mm-dd', // 데이터는 yyyy-MM-dd로 나옴
					closeText : '닫기',
					prevText : '이전달',
					nextText : '다음달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					weekHeader : 'Wk',
					firstDay : 0,
					isRTL : false,
					duration : 200,
					showAnim : 'show',
					maxDate : dtNow,
					showMonthAfterYear : true,
					yearSuffix : '년',
					showOtherMonths : true, // 나머지 날짜도 화면에 표시
					selectOtherMonths : true, // 나머지 날짜에도 선택을 하려면 true

					onChangeMonthYear : function(year, month, inst) {
						EvtChangeMonthYear(year, month);
					},

					beforeShow : function(input, inst) {
						// 일자 선택되기전 이벤트 발생
					},
					onSelect : function(dateText, inst) {
					}

				});
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		// 월이나 년이 바뀔때의 이벤트
	});

	function EvtChangeMonthYear(Year, Month) {
		$(".ui-datepicker-current-day").attr("style",
				"background-color:#ff0000;"); // 선택된 날자에 테두리를 만든다.

		var vDt = new Date();
		var Day = getStrDay(vDt.getDate());
		var dtMin = new Date(Year, Month - 1, 1);

		dtMin = new Date(Year, Month - 1, 1 - dtMin.getDay()); // 달력의 최초 날자를 구하기 위해
		var strMin = dtMin.getFullYear() + "-"
				+ getStrMonth(dtMin.getMonth() + 1) + "-"
				+ getStrDay(dtMin.getDate());
		var dtMax = new Date(new Date(Year, Month, 1) - 86400000);

		var dtMax = new Date(Year, Month - 1, dtMax.getDate() + 6
				- dtMax.getDay()); // 달력의 마지막 날자를 구하기 위해
		var strMax = dtMax.getFullYear() + "-"
				+ getStrMonth(dtMax.getMonth() + 1) + "-"
				+ getStrDay(dtMax.getDate());
	}

	function getStrMonth(Month) {
		Month = Month + "";
		if (Month.length == 1) {
			Month = "0" + Month;
		}
		return Month;
	}

	function getStrDay(Day) {
		Day = Day + "";
		if (Day.length == 1) {
			Day = "0" + Day;
		}
		return Day;
	}
</script>
</head>
<body>
	<div id="title">
		<h2>예약하기</h2>
	</div>
	<div class="container-fluid">
		<form role="form" class="form-horizontal" name="myform" method="get"
			action="/finddoc/user/insertbook.do">
			<c:choose>
				<c:when test="${action=='view'}">
					<div class="form-group">
						<input type="text" id="ykiho" class="ykiho" name="ykiho">
						<input type="text" id="ohosname" class="form-control" name="hname"
							required>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="orgtel">병원명</label>
						<div class="col-sm-3">
							<select name="selecthos" class="form-control" id="selecthos">
								<option value="default">자주가는 병원 목록에서 선택하기</option>
								<c:forEach var="myhos" items="${myhos}">
									<option value="${myhos.ykiho}">${myhos.hname}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<input type="text" class="ykiho" name="ykiho" value="${ykiho}">
						<label class="control-label col-sm-2" for="orgtel">병원명</label>
						<div class="col-sm-3">
							<input type="text" id="hosname" class="form-control" name="hname"
								value="${book}" placeholder="병원명" required>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">진료과</label>
				<div class="col-sm-3">
					<select class="form-control" name="major" id="major">
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">예약 날짜</label>
				<div class="col-sm-3">
					<input type="text" id="datepicker" class="form-control"
						name="bookdate">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">예약 시간</label>
				<div class="col-sm-3">
					<select name="hour" class="form-control">
						<option value="default">진료시간 선택</option>
						<option value="오전 12시">오전 12시</option>
						<option value="오전 1시">오전 1시</option>
						<option value="오전 2시">오전 2시</option>
						<option value="오전 3시">오전 3시</option>
						<option value="오전 4시">오전 4시</option>
						<option value="오전 5시">오전 5시</option>
						<option value="오전 6시">오전 6시</option>
						<option value="오전 7시">오전 7시</option>
						<option value="오전 8시">오전 8시</option>
						<option value="오전 9시">오전 9시</option>
						<option value="오전 10시">오전 10시</option>
						<option value="오전 11시">오전 11시</option>
						<option value="오후 12시">오후 12시</option>
						<option value="오후 1시">오후 1시</option>
						<option value="오후 2시">오후 2시</option>
						<option value="오후 3시">오후 3시</option>
						<option value="오후 4시">오후 4시</option>
						<option value="오후 5시">오후 5시</option>
						<option value="오후 6시">오후 6시</option>
						<option value="오후 7시">오후 7시</option>
						<option value="오후 8시">오후 8시</option>
						<option value="오후 9시">오후 9시</option>
						<option value="오후 10시">오후 10시</option>
						<option value="오후 11시">오후 11시</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label"></label>
				<div class="col-sm-6">
					<input type="radio" name="mint" value="0">0분
					&nbsp;&nbsp;&nbsp; <input type="radio" name="mint" value="10">10분&nbsp;&nbsp;&nbsp;
					<input type="radio" name="mint" value="20">20분&nbsp;&nbsp;&nbsp;
					<input type="radio" name="mint" value="30">30분&nbsp;&nbsp;&nbsp;
					<input type="radio" name="mint" value="40">40분&nbsp;&nbsp;&nbsp;
					<input type="radio" name="mint" value="50">50분
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="orgtel">예약자</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" placeholder="예약자"
						class="form-control" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="ssn">생년월일</label>
				<div class="col-sm-3">
					<input type="text" name="birthday" class="form-control"
						id="birthpicker">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phonehome">연락처</label>
				<div class="col-sm-5">
					<input type="text" id="tel" name="cp" placeholder="010-1234-1234"
						class="form-control" minlength="13" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phonehome">비고</label>
				<div class="col-sm-5">
					<input type="text" id="text" name="text" placeholder="증상 또는 주의사항"
						class="form-control">
				</div>
			</div>
			<br />
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-2">
					<input type="submit" value="예약하기" class="btn btn-success" id="book" />
					<input type="button" value="취소" class="btn btn-success"
						onclick="location.href='/finddoc/user/booklist.do'" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>