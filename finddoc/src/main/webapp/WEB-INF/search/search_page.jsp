<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9bfb989fa7aa3a476f7c82f860354a6&libraries=services"></script>
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
	$(document)
			.ready(
					function() {
						action = "";
						specialstate="";
						specialtext="";
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.481512, 126.997638), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

						// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
						if (navigator.geolocation) {
							// GeoLocation을 이용해서 접속 위치를 얻어옵니다
							navigator.geolocation
									.getCurrentPosition(function(position) {
										var lat = position.coords.latitude, // 위도
										lon = position.coords.longitude; // 경도

										var locPosition = new kakao.maps.LatLng(
												lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
										message = '<div style="padding:5px;">현위치</div>'; // 인포윈도우에 표시될 내용입니다

										// 현위치를 지도의 중심으로 이동합니다.
										map.setCenter(locPosition);

										//지도 켰을 때 바로 주변 병원 보이고 싶으면 활성화
										//searchlist();
									});
						} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
							var locPosition = new kakao.maps.LatLng(37.481512,
									126.997638), message = 'geolocation을 사용할수 없어요..'
							map.setCenter(locPosition);
						}

						// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
						var infowindow = new kakao.maps.InfoWindow({
							zIndex : 1,
						});

						//중심위치를 기준으로 몇 미터 내의 병원 찾아서 지도에 마크출력하고 병원정보 출력
						function searchlist() {
							action = "drag";
							var latlng = map.getCenter(); //현재 위도와 경도 받아오기

							$
									.ajax({
										url : "/finddoc/search/drag_map.do",
										type : "get",
										data : {
											"yPos" : latlng.getLat(),
											"xPos" : latlng.getLng(),
											"radius" : radius()
										},
										success : function(data) {
											hospall = data.response.body.items.item;
											for (i = 0; i < data.response.body.totalCount; i++) {
												displayMarker(hospall[i].XPos,
														hospall[i].YPos,
														hospall[i].yadmNm);
											}
											success_searchlist(data);
										},
										error : error_run
									});
						}

						// 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
						kakao.maps.event.addListener(map, 'dragend',
								function() {
									searchlist();
								});

						//맵을 움직여 나온 결과 마크표시
						function displayMarker(xPos, yPos, name) {
							var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; // 마커이미지의 주소입니다    
							var imageSize = new kakao.maps.Size(24, 35); // 마커이미지의 크기입니다
							var imageOption = {
								offset : new kakao.maps.Point(27, 69)
							};

							// 마커를 생성합니다
							marker = new kakao.maps.Marker({
								position : new kakao.maps.LatLng(yPos, xPos),
								image : new kakao.maps.MarkerImage(imageSrc,
										imageSize, imageOption)
							// 마커이미지 설정 
							});

							marker.setMap(map);

							//지도의 중심이 바뀌면 마커 없애기
							kakao.maps.event.addListener(map, 'center_changed',
									function() {
										marker.setMap(null);
									});

							kakao.maps.event
									.addListener(
											marker,
											'click',
											function() {
												// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
												infowindow
														.setContent('<div style="text-align: center; font-size:12px;">'
																+ name
																+ '</div>');
												infowindow.open(map, marker);
											});
						}

						//검색 결과 마크 표시
						function displayMarker2(moveLatLon, name) {
							var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; // 마커이미지의 주소입니다    
							var imageSize = new kakao.maps.Size(24, 35); // 마커이미지의 크기입니다
							var imageOption = {
								offset : new kakao.maps.Point(27, 69)
							};

							marker2 = new kakao.maps.Marker({
								position : moveLatLon
							});

							marker2.setMap(map);

							//지도의 중심이 바뀌면 마커 없애기
							kakao.maps.event.addListener(map, 'center_changed',
									function() {
										marker2.setMap(null);
									});

							kakao.maps.event
									.addListener(
											marker2,
											'click',
											function() {
												// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
												infowindow
														.setContent("<div style='text-align: center;font-size:20px; '>"
																+ name
																+ "</div>");
												infowindow.open(map, marker2);
											});
						}

						//지도 레벨에 따른 검색 반경
						function radius() {
							result = "";
							switch (map.getLevel()) {
							case 1:
								result = "50";
								break;
							case 2:
								result = "100";
								break;
							case 3:
								result = "200";
								break;
							case 4:
								result = "400";
								break;
							case 5:
								result = "800";
								break;
							case 6:
								result = "1600";
								break;
							case 7:
								result = "3200";
								break;
							case 8:
								result = "6400";
								break;
							case 9:
								result = "12800";
								break;
							case 10:
								result = "25600";
								break;
							case 11:
								result = "51200";
								break;
							case 12:
								result = "102400";
								break;
							case 13:
								result = "204800";
								break;
							case 14:
								result = "409600";
								break;
							}
							return result;
						}

						// 지도 확대 레벨 변화 이벤트를 등록한다
						kakao.maps.event.addListener(map, 'zoom_changed',
								function() {
									searchlist();
								});

						//검색 결과 클릭시 지도 중심을 부드럽게 이동시킵니다
						function panTo(x, y, name) {
							// 이동할 위도 경도 위치를 생성합니다 
							var moveLatLon = new kakao.maps.LatLng(y, x);

							// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
							map.panTo(moveLatLon);

							//지도에 위치 마크 표시
							displayMarker2(moveLatLon, name)
						}

						$('input:checkbox[name="dgsbjtCd"]').click(function() {
							if ($(this).is(":checked") == true) {
								searchspec[speccount] = $(this).val();
								alert(searchspec[speccount]);
								speccount++;
								$("#searchspec").append($(this).val());
							}
						})

						//검색버튼 눌렀을 때 조건에 맞게 검색
						$("#sub")
								.click(
										function searchbtnclick() {
											action = "search"
											//콤보상자에서 선택한 대분류항목의 번호를 리턴
											index = document.searchbox.zipCd.selectedIndex;
											indextext = document.searchbox.zipCd.options[index].value;
											if (index == 0) {
												indextext = "";
											}
											
											//콤보상자에서 선택한 항목의 번호를 리턴
											indexmajor = document.searchbox.dgsbjtCd.selectedIndex;
											majortext = document.searchbox.dgsbjtCd.options[indexmajor].value;
											if (indexmajor == 0) {
												majortext = "";
											}
											
											/* checkspecial = document.searchbox.special;
											for (i = 0; i < checkspecial.length; i++) {
												if (checkspecial[i].checked) {
													specialtext=checkspecial[i].value;
												}
											} */
											
											$
											.ajax({
												url : "/finddoc/search/search_ajax.do",
												type : "get",
												data : {
													"loctxt" : $("#loctxt").val(),
													"hospname" : $("#hospname").val(),
													"zipCd" : indextext,
													"dgsbjtCd" : majortext
												},
												success : success_searchlist,
												error : error_run
											});
											
											/* if(specialtext==""){
												$
												.ajax({
													url : "/finddoc/search/search_ajax.do",
													type : "get",
													data : {
														"loctxt" : $("#loctxt").val(),
														"hospname" : $("#hospname").val(),
														"zipCd" : indextext,
														"dgsbjtCd" : majortext
													},
													success : success_searchlist,
													error : error_run
												});
											}
											else{
												$
												.ajax({
													url : "/finddoc/search/search_ajax.do",
													type : "get",
													data : {
														"loctxt" : $("#loctxt").val(),
														"hospname" : $("#hospname").val(),
														"zipCd" : indextext,
														"dgsbjtCd" : majortext
														
													},
													success : function(specialsearch) {
														spechospall = specialsearch.response.body.items.item;
														stotalCount = specialsearch.response.body.totalCount;
														for(i=0; i<stotalCount; i++){
															specArry[i]=spechospall[i].ykiho;
														}
														alert(specArry[0]);
													},
													error : error_run
												});
											} */
							
										});

						//에러 메세지
						function error_run(obj, msg, statusMsg) {
							/*
								obj=XMLHttpRequest 객체, msg=응답, statusMsg=에러메세지
							 */
							alert(obj + "," + msg + "," + statusMsg);
						}

						//병원 조회 결과목록을 보여주고 누르면 상세정보를 뿌려줌
						function success_searchlist(data) {
							$("#pasing").empty();
							$("#hospinfo").empty();
							$("#hosplist").empty();
							hospall = data.response.body.items.item;
							hosplist = "";
							hospinfo = "";
							totalCount = data.response.body.totalCount;
							if (totalCount == 0) {
								hosplist = "검색 결과가 없습니다.";
								$("#hosplist").empty();
								$("#hosplist").append(hosplist);
							} else if (totalCount == 1) {
								resultone(hospall);
							}
							//검색 결과 여러개일 경우 페이징해서 보여준다
							else {
								pagelist = "";
								pageno = data.response.body.pageNo;
								endPage = (totalCount) / 10;
								endPage = Math.floor(endPage);
								if (action == "search") {
									pasing_ajax(pageno);
								} else if (action == "drag") {
									drag_pasing_ajax(pageno);
								}
								if (totalCount % 10 != 0) {
									endPage += 1;
								}
								for (j = 1; j <= endPage; j++) {
									pagelist = pagelist
											+ "<span id='page"+j+"'>" + j
											+ "</span>";
									$(document)
											.on(
													"click",
													"#page" + j,
													function() {
														clickpage = $(this)
																.attr("id");
														pagesize = clickpage.length;
														pageno = parseInt(clickpage
																.substr(
																		4,
																		pagesize - 4));
														if (action == "search") {
															pasing_ajax(pageno);
														} else if (action == "drag") {
															drag_pasing_ajax(pageno);
														}
													});
								}
								$("#pasing").append(pagelist);
							}
							$("#hosplist").empty();
							$("#hosplist").append(hosplist);
						}

						//검색페이징 ajax
						function pasing_ajax(pageno) {
							hosplist = "";
							$.ajax({
								url : "/finddoc/search/search_pasing.do",
								type : "get",
								data : {
									"pageno" : pageno,
									"loctxt" : $("#loctxt").val(),
									"hospname" : $("#hospname").val(),
									"zipCd" : indextext,
									"dgsbjtCd" : majortext
								},
								success : success_pasing,
								error : error_run
							});
						}

						//드래그 페이징
						function drag_pasing_ajax(pageno) {
							var latlng = map.getCenter();
							hosplist = "";
							$.ajax({
								url : "/finddoc/search/drag_pasing.do",
								type : "get",
								data : {
									"pageno" : pageno,
									"yPos" : latlng.getLat(),
									"xPos" : latlng.getLng(),
									"radius" : radius()
								},
								success : success_pasing,
								error : error_run
							});
						}

						//결과가 1개일 떄 출력물
						function resultone() {
							hosplist = "<h4  id='hospital'> 병원명 : "
									+ hospall.yadmNm + "</h4>";
							var popupOption = "width=600,height=700,location=no,status=no,toolbars=no,top=70,left=800"; //팝업창 옵션(optoin)
							var url = "/finddoc/search/search.do";
							$(document).on("click","#hospital",function() {
												//눌렀을 때 부드럽게 이동
								panTo(hospall.XPos,hospall.YPos,hospall.yadmNm);
								//병원상세정보 ajax
								$.ajax({
									url : "/finddoc/search/ykiho_DetailInfo.do",
									type : "get",
									data : {
										"ykiho" : hospall.ykiho
									},
									success : function(result) {
										detail = result.response[0].body.items.item.emyDayYn; //응급실 및 운영시간
										trans = result.response[1].body.items.item; //교통정보
										spcl = result.response[2].body.items.item; //특수진료
										hospinfo = "<div> 병원명 : "
											+ hospall.yadmNm
											+ "</div><div> 병원 종류 : "
											+ hospall.clCdNm
											+ "</div><div> 주소 : "
											+ hospall.addr
											+ "</div><div> 전화번호 : "
											+ hospall.telno
											+ "</div><div> 홈페이지 : "
											+ hospall.hospUrl
											+ "</div><div> 총 의사 수 : "
											+ hospall.drTotCnt
											+ "</div><div> 전문의 수 : "
											+ hospall.sdrCnt
											+ "</div><div> 일반의 수 : "
											+ hospall.gdrCnt;
										if(specialtext=="응급실"&detail!=undefined){
											hospinfo=hospinfo+"<div> 응급실 운영여부 : Y"
											+"</div>";
										}
										else{
											hospinfo=hospinfo+ "</div>";
										}
										hospinfo = hospinfo + "<input class='btn btn-default' type='button' value='접수' onclick='location.href="+'"/finddoc/receipt/book.do"'+"'>"
										+ "<input class='btn btn-default' type='button' id='book' value='예약'>"
										+ "<input class='btn btn-default' type='button' value='길찾기' onclick='load(hospall.XPos,hospall.YPos)'>"
										+ "<input class='btn btn-default' type='button' id='insert_mypage' value='자주가는 병원 등록'>"
										+ "<input class='btn btn-default' type='button' value='게시판' onclick='location.href="
										+ '"/finddoc/board/noticeBoardList.do?category=all"'
										+ "'>";
										$("#hospinfo").empty();
										$("#hospinfo").append(hospinfo);
										$(document).on("click","#book",function() {
											checkinserthos(hospall.ykiho, hospall.yadmNm);
										});
										$(document).on("click", "#insert_mypage",function() {
											insertbookmark(hospall.ykiho);
										});
									},
									error : error_run
								});
								$("#hosplist").empty();
								$("#hosplist").append(hosplist);
						});
						}
						
						//예약시 등록되어있는 병원인가 확인
						function checkinserthos(ykiho, yadmNm) {
							$.ajax({
								url : "/finddoc/search/check_inserthos.do",
								type : "get",
								data : {
									"ykiho" : ykiho
								},
								success : function(message) {
									if(message=="이용 불가능한 병원입니다."|message=="예약 페이지로 이동합니다."){
										var check = confirm(message);
										if (check=="예약 페이지로 이동합니다.") {
											location.href="/finddoc/user/book.do?action=search&hname="+encodeURI(yadmNm)+"&ykiho="+ykiho;
										}
									}
									else{
										location.href="/finddoc/login/loginView.do";
									}
								}
							});
						}

						//상세정보에서 자주가는 병원으로 등록할 때의 기능
						function insertbookmark(ykiho) {
								$.ajax({
									url : "/finddoc/mypage/insert_bookmark.do",
									type : "get",
									data : {
										"ykiho" : ykiho
									},
									success : function(message) {
										if(message=="등록할 수 없는 병원입니다. 확인을 누르면 자주가는 병원 목록으로 이동합니다."|message=="이미 등록된 병원입니다. 확인을 누르면 자주가는 병원 목록으로 이동합니다."|message == "등록이 완료되었습니다. 확인을 누르면 자주가는 병원 목록으로 이동합니다."){
											var check = confirm(message);
											if(check){
												location.href="/finddoc/mypage/bookmark.do";
											}
										}
										else{
											location.href="/finddoc/login/loginView.do";
										}
									}
								});
						}

						function success_pasing(pasingdata) {
							hospall = pasingdata.response.body.items.item;
							if (((totalCount % 10) == 1)
									& (pasingdata.response.body.pageNo == endPage)) {
								resultone(hospall);
							} else {
								size = pasingdata.response.body.items.item.length;
								searchlistx = new Array(size);
								searchlisty = new Array(size);
								ykiholist = new Array(size);
								for (i = 0; i < size; i++) {
									hosplist = hosplist
											+ "<h4  id='hospital"+i+"'> 병원명 : "
											+ hospall[i].yadmNm + "</h4>";
									searchlistx[i] = hospall[i].XPos;
									searchlisty[i] = hospall[i].YPos;
									ykiholist[i] = hospall[i].ykiho;
									//병원이름 클릭했을 때 병원 상세정보 보여준다
									$(document)
											.on(
													"click",
													"#hospital" + i,
													function() {
														clicklist = $(this)
																.attr("id")
														namesize = clicklist.length;
														num = parseInt(clicklist.substr(8,namesize - 8));
														panTo(
																searchlistx[num],
																searchlisty[num],
																hospall[num].yadmNm);
														//병원상세정보 ajax
														$.ajax({
															url : "/finddoc/search/ykiho_DetailInfo.do",
															type : "get",
															data : {
																"ykiho" : ykiholist[num]
															},
															success : function(result) {
																detail = result.response[0].body.items.item.emyDayYn; //응급실 및 운영시간
																trans = result.response[1].body.items.item; //교통정보
																spcl = result.response[2].body.items.item; //특수진료
																hospinfo = "<div> 병원명 : " + hospall[num].yadmNm
																		+ "</div><div> 병원 종류 : "+ hospall[num].clCdNm
																		+ "</div><div> 주소 : "+ hospall[num].addr
																		+ "</div><div> 전화번호 : "+ hospall[num].telno
																		+ "</div><div> 홈페이지 : "+ hospall[num].hospUrl
																		+ "</div><div> 총 의사 수 : "+ hospall[num].drTotCnt
																		+ " /  전문의 수 : "+ hospall[num].sdrCnt
																		+ " /  일반의 수 : "+ hospall[num].gdrCnt;
																if(specialtext=="응급실"&detail!=undefined){
																	hospinfo=hospinfo+"<div> 응급실 운영여부 : Y"
																	+"</div>";
																}
																else{
																	hospinfo=hospinfo+ "</div>";
																}
																hospinfo = hospinfo + "<input class='btn btn-default' type='button' value='접수' onclick='location.href="+'"/finddoc/receipt/book.do"'+"'>"
																		+ "<input class='btn btn-default' type='button' id='book' value='예약' onclick='checkinserthos(ykiholist[num], hospall[num].yadmNm)'>"
																		+ "<input class='btn btn-default' type='button' value='길찾기' onclick='load(hospall[num].XPos,hospall[num].YPos)'>"
																		+ "<input class='btn btn-default' type='button' id='insert_mypage' value='자주가는 병원 등록'>"
																		+ "<input class='btn btn-default' type='button' value='게시판' onclick='location.href="
																		+ '"/finddoc/board/noticeBoardList.do?category=all"'
																		+ "'>";
																/* $(document).on("click","#book",function() {
																	checkinserthos(ykiholist[num], hospall[num].yadmNm);
																}); */

																//상세정보에서 자주가는 병원으로 등록할 때의 기능
																$(document).on("click","#insert_mypage",function() {
																	insertbookmark(ykiholist[num]);
																});
																$("#hospinfo").empty();
																$("#hospinfo").append(hospinfo);
															},
															error : error_run
														});
													});
								}
							}
							$("#hosplist").empty();
							$("#hosplist").append(hosplist);
						}
					});
	function load(ex,ey) {
		popupOption = "width=600,height=700,location=no,status=no,toolbars=no,top=70,left=800"; //팝업창 옵션(optoin)
		url = "/finddoc/search/loadSearch.do?ex="+ex+"&ey="+ey;
		openWin = window.open(url, "child", popupOption);
	}
	//예약시 등록되어있는 병원인가 확인
	function checkinserthos(ykiho, yadmNm) {
		$.ajax({
			url : "/finddoc/search/check_inserthos.do",
			type : "get",
			data : {
				"ykiho" : ykiho
			},
			success : function(message) {
				if(message=="이용 불가능한 병원입니다."|message=="예약 페이지로 이동합니다."){
					var check = confirm(message);
					if (message=="예약 페이지로 이동합니다.") {
						location.href="/finddoc/user/book.do?action=search&hname="+encodeURI(yadmNm)+"&ykiho="+ykiho;
					}
				}
				else{
					location.href="/finddoc/login/loginView.do";
				}
			}
		});
	}

</script>
</head>
<body>
	<div class="container-fluid">
		<div id="search">
			<h3>&nbsp;&nbsp;검색 위치를 입력해주세요</h3>
			<form name="searchbox">
			<div class="row">
				<div class="col-sm-7">
					<div class="col-sm-3">
						<input type="text" class="form-control" id="loctxt" placeholder="주소"> 
					</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="hospname" placeholder="병원명">
					</div>
					<div class="col-sm-1">
						<input type="button" class="btn btn-default" id="sub" value="검색">
					</div>
				</div>
			</div>
			<br>
				&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">조건 검색하기</font></b>
				<br>
			<div class="row">
				<div class="col-sm-8">
					<div class="col-sm-3">
						<select class="form-control" name="zipCd">
							<option value="default">병원 종류</option>
							<option value="2010">종합병원</option>
							<option value="2030">병원</option>
							<option value="2050">치과</option>
							<option value="2060">한방</option>
							<option value="2070">의원</option>
							<option value="2080">보건기관</option>
							<option value="2090">조산원</option>
						</select>
					</div>
					<div class="col-sm-3">
						<select class="form-control" name="dgsbjtCd">
							<option value="default">진료과</option>
							<option value="00">일반의</option>
							<option value="01">내과</option>
							<option value="03">정신건강의학과</option>
							<option value="04">외과</option>
							<option value="05">정형외과</option>
							<option value="06">신경외과</option>
							<option value="07">흉부외과</option>
							<option value="08">성형외과</option>
							<option value="09">마취통증의학과</option>
							<option value="10">산부인과</option>
							<option value="11">소아청소년과</option>
							<option value="12">안과</option>
							<option value="13">이비인후과</option>
							<option value="14">피부과</option>
							<option value="15">비뇨기과</option>
							<option value="16">영상의학과</option>
							<option value="17">방사선종양학과</option>
							<option value="18">병리과</option>
							<option value="19">진단검사의학과</option>
							<option value="20">결핵과</option>
							<option value="21">재활의학과</option>
							<option value="22">핵의학과</option>
							<option value="23">가정의학과</option>
							<option value="24">응급의학과</option>
							<option value="25">직업환경의학과</option>
							<option value="26">예방의학과</option>
							<option value="49">치과</option>
							<option value="50">구강악안면외과</option>
							<option value="51">치과보철과</option>
							<option value="52">치과교정과</option>
							<option value="53">소아치과</option>
							<option value="54">치주과</option>
							<option value="56">구강내과 </option>
							<option value="57">구강악안면방사선과</option>
							<option value="58">구강병리과</option>
							<option value="59">예방치과</option>
							<option value="60">치과소계</option>
							<option value="80">한방내과</option>
							<option value="81">한방부인과</option>
							<option value="82">한방소아과</option>
							<option value="83">한방안이비인후피부과</option>
							<option value="84">한방신경정신과</option>
							<option value="85">침구과</option>
							<option value="87">사상체질과</option>
							<option value="88">한방응급</option>
							<option value="90">한방소계</option>
						</select>
					</div>
					<!-- <b><font size="2">특수 조건</font></b> -->
					<!-- <input type="radio" name="special" value="야간운영">야간운영 -->
					<!-- <input type="radio" name="special" value="응급실">응급실 -->
					<!-- <input type="radio" name="special" value="응급의료병원">응급의료병원
					<input type="radio"  name="special" value="신생아중환자실">신생아중환자실 -->
				</div>
			</div>
					<!-- <div class="row">
						<div class="col-sm-12">
							<div class="col-sm-2">
								<div class="radio">
									<input type="radio" name="special" value="야간운영">야간운영
								</div>
							</div>
							<div class="col-sm-2">
								<div class="radio">
									<input type="radio" name="special" value="응급실">응급실
								</div>
							</div>
							<div class="col-sm-3">
								<div class="radio">
									<input type="radio" name="special" value="응급의료병원">응급의료병원
								</div>
							</div>
							<div class="col-sm-4">
								<div class="radio">
									<input type="radio"  name="special" value="신생아중환자실">신생아중환자실
								</div>
							</div>
						</div>
					</div> -->
							<br>
							<br>
			</form>
		</div>
		<br> <br>
		<div id="searchresult">
			<div id="map" class=col-sm-5>
				<div id="map" style="width: 600px; height: 500px;"></div>
			</div>
			<div class=col-sm-1></div>
			<div id="findresult" class=col-sm-5>
				<div id="hosplist">
					<!-- 병원정보 뿌려줄 곳 -->
				</div>
				<br>
				<div class="form-group">
					<div class="col-sm-3" id="paging">
						<!-- 조회 페이지 뿌려줄 곳 -->
					</div>
					<div id="pasing">
						<!-- 페이지 뿌려줄 곳 -->
					</div>
					<div id="hospinfo" style="background-color: skyblue">
						<!-- 선택한 병원 정보 출력 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>