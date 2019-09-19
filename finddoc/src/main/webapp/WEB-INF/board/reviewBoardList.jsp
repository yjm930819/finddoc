<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
#title {
	text-align: center;
	padding: 40px;
}

body {
	color: black;
}

table {
	width: 600px;
}

.input-group {
	width: 300px;
}

.form-control {
	width: 100px;
}

#write {
	float: right;
	margin-right: 30px;
}

#searchbar {
	width: 300px;
}

#paging {
	text-align: center;
	padding: 5px;
	width: 100%;
	font-size: 15px;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#hadminid")
								.change(
										function() {
											location.href = "/finddoc/board/reviewBoard_searchhname.do?category="
													+ encodeURI($("#hadminid")
															.val())
										});
						var category = '${category}';
						if (category == "") {
							$("#hadminid").closest("option").attr("selected",
									"selected");
						} else {
							$("#hadminid").val(category).attr("selected",
									"selected");
						}
					});

	function fn_paging(curPage) {
		if ($("#hadminid").val() == 'all') {
			location.href = "/finddoc/board/reviewBoardList.do?curPage="
					+ curPage + "&category=" + $("#category").val();
		} else {
			location.href = "/finddoc/board/reviewBoard_searchhname.do?category="
					+ encodeURI($("#hadminid").val()) + "&curPage=" + curPage
		}

	}

	function link(reviewboardnum, hname) {
		location.href = "/finddoc/board/reviewBoard_read.do?reviewboardnum="
				+ reviewboardnum + "&hname=" + encodeURI(hname)
	}
</script>
</head>
<body>
	<div id="title">
		<h2>후기 게시판</h2>
	</div>

	<div class="container-fluid">
		<form>
			<se:authorize access="hasRole('user')">
				<select class="form-control col-sm-4" name="hadminid" id="hadminid">
					<option value="all">전체</option>
					<c:forEach var="hoslist" items="${hnamelist }">
						<option value="${hoslist.hadminid }">${hoslist.hname }</option>
					</c:forEach>
				</select>
			</se:authorize>
			<br>

			<table class="table table-hover">
				<th>번호</th>
				<th>병원명</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>

				<c:forEach var="review" items="${reviewlist }">
					<tr>
						<td>${review.rn }</td>
						<td><a href="#"
							onClick="link('${review.reviewboardnum }','${review.hname}')">
								${review.hname}</a></td>
						<td>${review.title }</td>
						<td>${review.name }</td>
						<td>${review.txupdate }</td>
						<td>${review.reviewcount }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="paging">
				<c:if test="${not empty reviewlist}">
					<c:if test="${pagedto.curPage ne 1}">
						<a href="#" onClick="fn_paging('${pagedto.prevPage }')">[이전]</a>
					</c:if>

					<c:forEach var="pageNum" begin="${pagedto.startPage }"
						end="${pagedto.endPage }">
						<c:choose>
							<c:when test="${pageNum eq  pagedto.curPage}">
								<span style="font-weight: bold;"><a href="#"
									onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
							</c:when>
							<c:otherwise>
								<a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pagedto.curPage ne pagedto.pageCnt}">
						<a href="#" onClick="fn_paging('${pagedto.nextPage }')">[다음]</a>
					</c:if>
				</c:if>
			</div>
		</form>
	</div>

	<form action="/finddoc/board/reviewBoard_search.do">
		<input type="hidden" name="hadminid" value="${category }"> <select
			class="form-control col-sm-2" name="category">
			<option value="title">제목</option>
			<option value="text">본문</option>
			<option value="txupdate">작성일</option>
		</select> <input type="text" name="search" class="form-control col-sm-3"
			id="searchbar"> <input type="submit" value="검색"
			class="btn btn-default">
		<se:authorize access="hasRole('user')">
			<input type="button" value="글쓰기" class="btn btn-default" id="write"
				onclick='location.href="/finddoc/board/reviewBoard_writeView.do?userid=<se:authentication property="principal.id" />"'>
		</se:authorize>
	</form>

</body>
</html>
