<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/notice/list.css" />
</head>
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<body>
	<div class="header-blackbox"></div>
	<header>
		<nav>
			<a href="/">Primavera</a>
		</nav>
		<nav>
			<a href="/map/mainMap">Store</a> 
			<a href="#">Guide</a>
			<a href="collectPage">PickUp</a>
			<a href="list">Board</a> 
			<span> 
			<a href="/review/list">Riew</a> 
			<a href="/listQna">Q & A</a> 
			<a href="/notice/list">Notice</a>
			</span> 
			<a href="myPage"><i class="fa-regular fa-user"></i></a>
		</nav>
	</header>
	<!-- ---------------------------------------------------------------------------- -->
	<main>
		<section class="section1">
			<img src="../../../resources/images/pexels-pixabay-158827.jpg" alt="" />
			<h1 class="h2">Notice</h1>
		</section>
		<section class="section2">
			<div>
				<div class="container">
					<h1>Notice</h1>
					<a href="/notice/write" class="btn btn-outline-warning" id="admit">게시글 등록</a>
				</div>
				<table border="1" class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticeList}" var="notice" varStatus="status">
							<tr>
								<td>${status.count + paging.pageSize * (paging.page-1)}</td>
								<td><a
									href="/notice/noticeView?noticeNum=${notice.noticeNum}">${notice.title}</a>
								</td>
								<td>${notice.content}</td>
								<td><fmt:formatDate value="${notice.writeDate}"
										pattern="yy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav>
					<ul class="pagination">
						<li class="page-item ${paging.prev ? '' : 'disabled' }"><a
							class="page-link"
							href="/notice/list?page=${paging.startPage - 1}">Previous</a></li>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
							var="page">
							<li class="page-item"><a
								class="page-link ${page == page ? 'active' : ''}"
								href="/notice/list?page=${page}">${page}</a></li>
						</c:forEach>

						<li class="page-item ${paging.next ? '' : 'disabled'}"><a
							class="page-link" href="/notice/list?page=${paging.endPage + 1}">Next</a>
						</li>
					</ul>
				</nav>
			</div>
		</section>
	</main>
</body>
</html>