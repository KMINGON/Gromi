<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="parser.PlantParser"%>
<%@ page import="java.net.URL"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@ page import="org.w3c.dom.Document"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="java.io.*"%>




<!doctype html>
<%
String uid = (String) session.getAttribute("user_id");
String uname = (String) session.getAttribute("user_name");
%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Gromi</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/album/">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" src="style.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
	
</script>
<style>
.nav-item {
	padding-left: 50px;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>

</head>
<%
PlantParser parser = new PlantParser();
ArrayList<String> plantList = new ArrayList<>();
plantList = parser.getGardenList();
%>

<%
String sType = request.getParameter("sType") == null ? "" : request.getParameter("sType");
String wordType = request.getParameter("wordType") == null ? "" : request.getParameter("wordType");
String word = request.getParameter("word") == null ? "" : request.getParameter("word");
String priceType = request.getParameter("priceType") == null ? "" : request.getParameter("priceType");
String priceTypeSel = request.getParameter("priceTypeSel") == null ? "" : request.getParameter("priceTypeSel");
String waterCycleSel = request.getParameter("waterCycleSel") == null ? "" : request.getParameter("waterCycleSel");
%>


<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark bg-dark"
			aria-label="main-navbar">
			<div class="container">
				<a class="navbar-brand" href="index.jsp">Gromi</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navBoard"
					aria-controls="navBoard" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navBoard">
					<ul class="navbar-nav me-auto mb-2 mb-sm-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index.jsp">홈</a></li>
						<li class="nav-item"><a class="nav-link"
							href="recommend/recommend.html">식물 추천</a></li>
						<li class="nav-item"><a class="nav-link" href="#">블로그</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="board/viewBoard.jsp?boardType=free">자유 게시판</a></li>
								<li><a class="dropdown-item"
									href="board/viewBoard.jsp?boardType=QA">Q&A 게시판</a></li>
								<li><a class="dropdown-item"
									href="board/viewBoard.jsp?boardType=sale">분양 게시판</a></li>
							</ul></li>
					</ul>

					<div class="justify-content-end">
						<ul class="navbar-nav me-auto mb-2 mb-sm-0">
							<li class="nav-item dropdown">
								<%
								if (uid == null) {
								%> <a class="nav-link dropdown-toggle" href="#"
								data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="login/signin.jsp">로그인</a></li>
									<li><a class="dropdown-item" href="login/signup.jsp">회원가입</a></li>
								</ul> <%
 } else {
 %> <a class="nav-link dropdown-toggle" href="#"
								data-bs-toggle="dropdown" aria-expanded="false"><%=uname%></a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">개인정보수정</a></li>
									<li><a class="dropdown-item" href="login/logout.jsp">로그아웃</a></li>
								</ul> <%
 }
 %>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</nav>

	</header>

	<main>

		<section class="py-5 text-center container">
			<div class="row py-lg-1">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-bold">어떤 종류의 식물을 찾고 있나요?</h1>

					<form name="searchApiForm">
						<input type="hidden" name="cntntsNo"> <input type="hidden"
							name="pageNo"
							value="<%=request.getParameter("pageNo") == null ? "" : request.getParameter("pageNo")%>">

						<table width="100%" border="1" cellSpacing="0" cellPadding="0">
							<colgroup>
								<col width="20%" />
								<col width="80%" />
							</colgroup>
							<tr>
								<th><select name="sType">
										<option value="sCntntsSj"
											<%=sType.equals("sCntntsSj") ? "selected" : ""%>>식물명</option>
										<option value="sPlntbneNm"
											<%=sType.equals("sPlntbneNm") ? "selected" : ""%>>한명</option>
										<option value="sPlntzrNm"
											<%=sType.equals("sPlntzrNm") ? "selected" : ""%>>영명</option>
								</select></th>
								<td><input type="text" name="sText"
									value="<%=request.getParameter("sText") == null ? "" : request.getParameter("sText")%>">
									<input type="button" name="search" value="검색"
									onclick="return fncSearch();" /></td>
							</tr>
						</table>
					</form>

					<!-- 검색창  -->
					<form class="d-flex" action="searchAction.jsp">
						<input class="form-control me-3" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>

					<p class="col-lg-10">
						<br>
						<button
							class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
							onclick="toggleButton(this)"
							style="border-color: gray; color: gray; font-size: 15px;">보라색</button>
						<button
							class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
							onclick="toggleButton(this)"
							style="border-color: gray; color: gray; font-size: 15px;">sample
							category</button>
						<button
							class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
							onclick="toggleButton(this)"
							style="border-color: gray; color: gray; font-size: 15px;">sample
							category</button>
						<button
							class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
							onclick="toggleButton(this)"
							style="border-color: gray; color: gray; font-size: 15px;">sample
							category</button>
						<button
							class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
							onclick="toggleButton(this)"
							style="border-color: gray; color: gray; font-size: 15px;">sample
							category</button>
					</p>
				</div>
			</div>
		</section>

		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<%
					for (int i = 0; i < 9; i++) {
					%>
					<form method=post action="plantDetail.jsp" >
					<div class="col">
						<div>
							<svg class="bd-placeholder-img card-img-top" width="100%"
								height="225" xmlns="http://www.w3.org/2000/svg" role="img"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<input type="hidden" name="plant-id" value="<%= plantList.get(i)%>">
				            	<image class="rounded" xlink:href="<%= parser.getThumbnailImageById(plantList.get(i)) %>"
													width="100%" height="100%" />
          					  </svg>
							<div class="card-body">
								<p class="card-text"><%=parser.getNameById(plantList.get(i))%></p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group"></div>
								</div>
							</div>
						</div>
					</div>
					</form>
					<%
					}
					%>


				</div>
			</div>
		</div>

	</main>

	<div class="container">
		<footer
			class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<div class="col-md-4 d-flex align-items-center">
				<a href="/"
					class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">

					<img
					src="https://starteacher-v5-upload.s3.ap-northeast-2.amazonaws.com/institute/logoaf34051b140f0305b0593ebd85bf43b1170b2268067bd03b3e7a0353b0df1c8e877810ac50891df6e550db9a15ab69fe"
					width="30">
				</a> <span class="mb-3 mb-md-0 text-muted">&copy; Goormbbang
					Company, Inc</span>
			</div>

			<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
                            <use xlink:href="#instagram" />
                        </svg></a></li>
			</ul>
		</footer>
	</div>


	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
