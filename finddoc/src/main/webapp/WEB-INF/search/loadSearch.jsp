<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#title {
	margin: 20px;
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		ex = "${ex}";
		ey = "${ey}";
		$("#search").click(function() {
			radio = document.myform.choice.value
			searchPubTransPathAJAX(radio);
		})
	})
	function searchPubTransPathAJAX(radio) {
		servicekey = "qjK4HBt9z90x4Dai3x1r11nV1AT933LByF%2B0JNJ054Y";
		var xhr = new XMLHttpRequest();
		var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX=126.997638&SY=37.481512&EX="
				+ ex
				+ "&EY="
				+ ey
				+ "&SearchPathType="
				+ radio
				+ "&apiKey="
				+ "qjK4HBt9z90x4Dai3x1r11nV1AT933LByF%2B0JNJ054Y"
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				data = xhr.responseText; // <- xhr.responseText 로 결과를 가져올 수 있음\
				console.log(xhr.responseText)
				jsondata = JSON.parse(data);
				if (radio == '2') {
					loadinfo = jsondata.result.path[0].subPath
					nameArr = "";
					str = "";
					totalTime = jsondata.result.path[0].info.totalTime;
					payment = jsondata.result.path[0].info.payment;
					busStationCount = jsondata.result.path[0].info.busStationCount;
					document.getElementById("title").innerHTML = "이동시간 : "
							+ totalTime + "분, " + "요금 : " + payment + "원, "
							+ "버스 정류장 총합 : " + busStationCount

					for (var i = 0; i < loadinfo.length; i++) {
						if (loadinfo[i].lane != undefined) {
							nameArr = nameArr + "<span>버스 번호 : "
									+ loadinfo[i].lane[0].busNo + "</span>"
						}
						if (loadinfo[i].passStopList != undefined) {
							for (var j = 0; j < loadinfo[i].passStopList.stations.length; j++) {
								nameArr = nameArr
										+ "<p>"
										+ loadinfo[i].passStopList.stations[j].stationName
										+ "</p>"
							}
						}
					}
					document.getElementById("info").innerHTML = nameArr

					for (var i = 0; i < loadinfo.length; i++) {

					}
					document.getElementById("result").innerHTML = str
				} else {
					loadinfo = jsondata.result.path[0].subPath
					totalTime = jsondata.result.path[0].info.totalTime;
					payment = jsondata.result.path[0].info.payment;
					subwayStationCount = jsondata.result.path[0].info.subwayStationCount;
					document.getElementById("title").innerHTML = "이동시간 : "
							+ totalTime + "분, " + "요금 : " + payment + "원, "
							+ "지하철 정류장 총합 : " + subwayStationCount
					nameArr = "";

					for (var i = 0; i < loadinfo.length; i++) {
						if (loadinfo[i].lane != undefined) {
							nameArr = nameArr + "<span>지하철 번호 : "
									+ loadinfo[i].lane[0].name + "</span>"
						}
						if (loadinfo[i].passStopList != undefined) {
							for (var j = 0; j < loadinfo[i].passStopList.stations.length; j++) {
								nameArr = nameArr
										+ "<p>"
										+ loadinfo[i].passStopList.stations[j].stationName
										+ "</p>"
							}
						}
					}
					document.getElementById("info").innerHTML = nameArr

				}
			}
		}
	}
</script>
</head>
<body>
	<form action="" name="myform">
		<input type="radio" value="1" name="choice">지하철 <input
			type="radio" value="2" name="choice">버스 <input type="button"
			value="검색" id="search">
	</form>
	<div>
		<div id="title"></div>
		<div id="info"></div>
	</div>
	<div id="result"></div>

</body>
</html>