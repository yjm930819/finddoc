<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		searchPubTransPathAJAX();
	})
	function searchPubTransPathAJAX() {
		alert("searchPubTransPathAJAX")
		servicekey = "qjK4HBt9z90x4Dai3x1r11nV1AT933LByF%2B0JNJ054Y";
		var xhr = new XMLHttpRequest();
		var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX=126.9027279&SY=37.5349277&EX=126.9145430&EY=37.5499421&apiKey="
				+ "qjK4HBt9z90x4Dai3x1r11nV1AT933LByF"
				+ encodeURI("%2B")
				+ "0JNJ054Y";
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			alert("onreadystatechange")
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText); // <- xhr.responseText 로 결과를 가져올 수 있음
				alert(xhr.responseText)
			}
		}
	}
</script>
</head>
<body>

</body>
</html>