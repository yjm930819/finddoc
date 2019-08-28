<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9bfb989fa7aa3a476f7c82f860354a6&libraries=services"></script>
<style type="text/css">
#map {
	margin-left: 100px;
}
#search {height 200px;
	padding-top: 20px;
	padding-left: 120px;
	background-color: skyblue;
	margin: auto;
}
#drop {
	background-color: skyblue;
	padding: 20px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.481512, 126.997638), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨 
	    }; 

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">현위치</div>'; // 인포윈도우에 표시될 내용입니다
	        
	        // 현위치를 지도의 중심으로 이동합니다.
	        map.setCenter(locPosition); ;
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(37.481512, 126.997638),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	        	map.setCenter(locPosition); 
	}

	
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({
	    zIndex : 1,
	});


	// 지도 중심 좌표 변화 이벤트를 등록한다
	kakao.maps.event.addListener(map,'center_changed',function() {
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);
		var pm = new kakao.maps.services.Places(map);

		// 카테고리로 은행을 검색합니다
		ps.categorySearch('HP8', placesSearchCB, {
			useMapBounds : true
		});
		pm.categorySearch('PM9', placesSearchPM, {
			useMapBounds : true
		});

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status,pagination) {
			if (status === kakao.maps.services.Status.OK) {
				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
				}
			}
		}

		function placesSearchPM(data3, status,pagination) {
			if (status === kakao.maps.services.Status.OK) {
				for (var i = 0; i < data3.length; i++) {
					displayMarker3(data3[i]);
				}
			}
		}

		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커이미지의 주소입니다    
		imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다
		imageOption = {offset : new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		function displayMarker(place) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(place.y, place.x),
				image : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)// 마커이미지 설정 
			});
		
			marker.setMap(map);

			kakao.maps.event.addListener(marker,'click',function() { 
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow.setContent('<div style="padding:5px;font-size:12px;">'
										+ place.place_name + '</div>');
				infowindow.open(map,marker);
			});
		}

		function displayMarker3(place) {
			// 마커를 생성하고 지도에 표시합니다
			var marker3 = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker3.setMap(map);

			kakao.maps.event.addListener(marker3,'click',function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow.setContent('<div style="padding:5px;font-size:12px;">'
										+ place.place_name + '</div>');
				infowindow.open(map,marker3);
			});
		};
	});

	// 지도 확대 레벨 변화 이벤트를 등록한다
	kakao.maps.event.addListener(map,'zoom_changed',function() {
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);
		var pm = new kakao.maps.services.Places(map);

		// 카테고리로 은행을 검색합니다
		ps.categorySearch('HP8', placesSearchCB, {
			useMapBounds : true
		});
		pm.categorySearch('PM9', placesSearchPM, {
			useMapBounds : true
		});

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status,pagination) {
			if (status === kakao.maps.services.Status.OK) {
				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
				}
			}
		}

		function placesSearchPM(data3, status,pagination) {
			if (status === kakao.maps.services.Status.OK) {
				for (var i = 0; i < data3.length; i++) {
					displayMarker3(data3[i]);
				}
			}
		}

		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커이미지의 주소입니다    
		imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다
		imageOption = {offset : new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		function displayMarker(place) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(place.y, place.x),
				image : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)// 마커이미지 설정 
			});
		
			marker.setMap(map);

			kakao.maps.event.addListener(marker,'click',function() { 
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow.setContent('<div style="padding:5px;font-size:12px;">'
										+ place.place_name + '</div>');
				infowindow.open(map,marker);
			});
		}

		function displayMarker3(place) {
			// 마커를 생성하고 지도에 표시합니다
			var marker3 = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker3.setMap(map);

			kakao.maps.event.addListener(marker3,'click',function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow.setContent('<div style="padding:5px;font-size:12px;">'
										+ place.place_name + '</div>');
				infowindow.open(map,marker3);
			});
		};
	});
	
	function panTo(x, y, clCdNm, name, addr, telno, drTotCnt, sdrCnt) {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(y, x);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);     
	    
	    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',// 마커이미지의 주소입니다    
		imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
		imageOption = {offset : new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    
	    var marker2 = new kakao.maps.Marker({
			position : moveLatLon,
			image : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)// 마커이미지 설정 
		});
	
		marker2.setMap(map);
		
		kakao.maps.event.addListener(marker2,'click',function() {
			// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			infowindow.setContent("<div><div style='padding-left:20px;font-size:20px'>"+name+"</div><div style='padding-left:20px;font-size:12px'>병원 종류 : "
						+clCdNm+"</div><div style='padding-left:20px;font-size:12px'>주소 : "
						+addr+"</div><div style='padding-left:20px;font-size:12px'>전화번호 : "
						+telno+"</div><div style='padding-left:20px;font-size:12px'>총 의사 수 : "
						+drTotCnt+"</div><div style='padding-left:20px;font-size:12px'>전문의 수 : "
						+sdrCnt+"</div></div>");
			infowindow.open(map,marker2);
		});
	}        
	
		$("#sub").click(function() {
			$.ajax({
				url : "/finddoc/search/search_ajax.do",
				type : "get",
				data : {
					"loctxt" : $("#loctxt").val(),
					"hospname" : $("#hospname").val()
					},
				success : function(data) {
						hospall = data.response.body.items.item;
						hospinfo = "";
						size = hospall.length;
						searchlistx = new Array(size);
						searchlisty = new Array(size);
						
						for (i = 0; i < size; i++) {
							hospinfo = hospinfo+"<div class='dropdown'><div class='dropdown-toggle' data-toggle='dropdown'><h4  id='hospital"+i+"'> 병원명 : "+ hospall[i].yadmNm
									+ "</h4></div><div class='dropdown-menu'><div> 병원 주소 : "+ hospall[i].addr
									+ "</div><div> 전화번호 : "+ hospall[i].telno+ "</div></div></div>";
									
									searchlistx[i] = hospall[i].XPos;
									searchlisty[i] = hospall[i].YPos;
							$(document).on("click","#hospital"+i,function(){
								clicklist=$(this).attr("id")
								
								namesize = clicklist.length;
								num = parseInt(clicklist.substr(8, namesize-8));
								panTo(searchlistx[num], searchlisty[num], hospall[num].clCdNm, hospall[num].yadmNm, hospall[num].addr,
										hospall[num].telno, hospall[num].drTotCnt, hospall[num].sdrCnt);
							})
						}
						$("#hosplist").empty();
						$("#hosplist").append(hospinfo);
						
					}
			});
		});
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div id="search">
			<h3>검색 위치를 입력해주세요</h3>
			<form action="">
				<input type="text" id="loctxt"> 
				<input type="text" id="hospname">
				<input type="button" id="sub" value="검색">
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">상세검색</button>
					<div class="dropdown-menu" id="drop">
						병원 종류 
						<select name="big">
							<option value="">병원 대분류</option>
							<option value="">종합병원</option>
							<option value="">병원</option>
							<option value="">치과</option>
							<option value="">한방</option>
							<option value="">의원</option>
							<option value="">보건기관</option>
							<option value="">조산원</option>
						</select>
						<hr />
						진료과목 
						<input type="checkbox" name="major">일반의 
						<inputtype="checkbox" name="major">내과 
						<input type="checkbox"name="major">신경과 
						<input type="checkbox" name="major">정신건강의학과
						<input type="checkbox" name="major">외과 
						<input type="checkbox" name="major">정형외과 
						<input type="checkbox" name="major">신경외과 
						<input type="checkbox" name="major">흉부외과
						<input type="checkbox" name="major">성형외과 
						<input type="checkbox" name="major">마취통증의학과 
						<input type="checkbox" name="major">산부인과 
						<input type="checkbox" name="major">소아청소년과 
						<input type="checkbox" name="major">안과
						<input type="checkbox" name="major">이비인후과
						<hr />
						특수조건 
						<input type="checkbox" name="major">야간운영 
						<input type="checkbox" name="major">응급실 
						<input type="checkbox" name="major">응급의료병원 
						<input type="checkbox" name="major">신생아중환자실
					</div>
				</div>
		</div>
		<br> <br>
		<div id="map" class=col-sm-5>
			<div id="map" style="width: 600px; height: 500px;"></div>
			<script>
				
			</script>
		</div>
		<div class=col-sm-1></div>
		<div id="findresult" class=col-sm-5>
			<div id="hosplist">
			<!-- 병원정보 뿌려줄 곳 -->
			</div>
		</div>
		<br>
		<hr>
		<br>
		<div id="recommend">
			<h4>추천병원</h4>
			<div id="hosName">병원명 : 서울소아과</div>
			<div id="hosName">병원명 : 방배이비인후과</div>
			<div id="hosName">병원명 : 방배안과</div>
		</div>
			<input class="btn btn-default" type="button" value="접수" onclick="location.href='#'"> 
			<input class="btn btn-default" type="button" value="예약" onclick="location.href='/finddoc/user/book.do'">
			<input class="btn btn-default" type="button" value="길찾기" onclick="location.href='/finddoc/search/search.do'">
			<input class="btn btn-default" type="button" value="자주가는 병원 등록" onclick="location.href='/finddoc/mypage/mypage.do'">
			<input class="btn btn-default" type="button" value="게시판" onclick="location.href='#'">
	</div>
	<br>
	<hr>
	<br>
	<div id="recommend">
			<h4>추천병원</h4>
			<div id="hosName">병원명 : 서울소아과</div>
			<div id="hosName">병원명 : 방배이비인후과</div>
			<div id="hosName">병원명 : 방배안과</div>
	</div>
	</form>
</body>
</html>