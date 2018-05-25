<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/board/freeBoard.css">
<script type="text/javascript" src="js/board/freeBoard.js"></script>
<title>Free Board</title>
</head>
<body>
	<jsp:include page="../userMenu.jsp" />
	<nav class="fh5co-nav" role="navigation">
	<div class="container-wrap">
		<div class="top-menu">
			<div class="row">
				<div class="col-xs-2">
					<div id="fh5co-logo">
						<a href="main.do">人Turn</a>
					</div>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li><a href="main.do">홈</a></li>
						<li class="has-dropdown"><a href="intro1.do">소개</a>
							<ul class="dropdown">
								<li><a href="intro1.do">사업소개</a></li>
								<li><a href="intro2.do">서비스소개</a></li>
							</ul></li>
						<li><a href="mentor.do">멘토찾기</a></li>
						<li><a href="mentee.do">멘티찾기</a></li>
						<li class="active"><a href="freeBoard.do?page_num=1">자유게시판</a></li>
						<li class="has-dropdown"><a href="#">이용안내</a>
							<ul class="dropdown">
								<li><a href="#">자주 묻는 질문</a></li>
								<li><a href="csBoard.do">고객서비스</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</nav>
	<div class="container-wrap">
		<div class="row">
			<table class="table table-striped">
				<thead>
					<tr>
						<th id="table">번호</th>
						<th id="table">제목</th>
						<th id="table">작성일</th>
						<th id="table">조회수</th>
						<th id="table">작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="freeBoard" items="${list}">
						<tr>
							<td id="table">${freeBoard.fb_num}</td>
							<td id="table">${freeBoard.title}</td>
							<td id="table">${freeBoard.regDate}</td>
							<td id="table">${freeBoard.hit}</td>
							<td id="table">${freeBoard.id}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row" style="text-align: center;">
			<ul class="pagination">
				<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
					<c:forEach var="i" begin="1" end="${page}" step="1">
					<c:if test="${thisPage eq i}">
						<li class="page-item active"><a class="page-link" href="freeBoard.do?page_num=${i}">${i}</a></li>
					</c:if>
					<c:if test="${thisPage ne i}">
						<li class="page-item"><a class="page-link" href="freeBoard.do?page_num=${i}">${i}</a></li>
					</c:if>
					</c:forEach>
				<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
			</ul>
		</div>
		<div class="row">
			<div id="searchSelect" class="form-group col-sm-4">
				<select name="condition" class="custom-select">
					<option value="title">글 제목</option>
					<option value="id">작성자</option>
				</select>
			</div>
			<div id="search" class="form-group col-sm-4">
				<input type="text" name="search" class="form-control"
					placeholder="검색">
			</div>
			<div class="form-group col-sm-4">
				<button id="searchBoardBtn" class="btn btn-success">검색</button>
				<button id="insertBoardBtn" class="btn btn-info">글쓰기</button>
			</div>
		</div>
	</div>
</body>
</html>