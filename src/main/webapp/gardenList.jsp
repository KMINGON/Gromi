<%@page import="java.util.HashMap"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.net.URL"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String uid = (String) session.getAttribute("user_id");
String uname = (String) session.getAttribute("user_name");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="./style.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
	
</script>
<script src="./gardenList.js"></script>

<style>
/* 버튼 선택했을 때 테두리 색 변경 */
.btn-outline-secondary:focus, .btn-outline-secondary:active,
	.btn-outline-secondary.active {
	outline: none;
	box-shadow: none;
	border-color: green !important;
	background-color: transparent !important;
	/* 배경색 투명으로 설정 */
	color: green !important;
	/* 글자색 초록색으로 설정 */
}

/* 버튼에 마우스를 올려놓았을 때 배경색 변화 없음 */
.btn-outline-secondary:hover {
	background-color: transparent !important;
	/* 배경색 투명으로 설정 */
}
</style>

<title>실내정원용 식물</title>
<script type="text/javascript">
	//상세보기
	function fncDtl(cNo) {
		with (document.searchApiForm) {
			cntntsNo.value = cNo;
			method = "get";
			action = "gardenDtl.jsp";
			target = "_self";
			submit();
		}
	}

	//검색
	function fncSearch() {
		with (document.searchApiForm) {
			lightChkVal.value = fncCheckValue(document
					.getElementsByName("lightChk"));
			grwhstleChkVal.value = fncCheckValue(document
					.getElementsByName("grwhstleChk"));
			lefcolrChkVal.value = fncCheckValue(document
					.getElementsByName("lefcolrChk"));
			lefmrkChkVal.value = fncCheckValue(document
					.getElementsByName("lefmrkChk"));
			flclrChkVal.value = fncCheckValue(document
					.getElementsByName("flclrChk"));
			fmldecolrChkVal.value = fncCheckValue(document
					.getElementsByName("fmldecolrChk"));
			ignSeasonChkVal.value = fncCheckValue(document
					.getElementsByName("ignSeasonChk"));
			winterLwetChkVal.value = fncCheckValue(document
					.getElementsByName("winterLwetChk"));
			pageNo.value = "1";
			method = "get";
			action = "gardenList.jsp";
			target = "_self";
			submit();
		}
	}
	//페이지 이동
	function fncGoPage(page) {
		with (document.searchApiForm) {
			pageNo.value = page;
			method = "get";
			action = "gardenList.jsp";
			target = "_self";
			submit();
		}
	}

	function fncWordTypeOption() {
		var wordType = document.getElementById("wordType")[document
				.getElementById("wordType").selectedIndex].value;

		if (wordType == "cntntsSj") {
			document.getElementById("englishSrch").style.display = "none";
			document.getElementById("koreanSrch").style.display = "block";
		} else if (wordType == "plntbneNm") {
			document.getElementById("koreanSrch").style.display = "none";
			document.getElementById("englishSrch").style.display = "block";
		}
	}

	function fncContSearch(word) {
		document.searchApiForm.word.value = word;
		fncSearch();
	}

	function fncCheckValue(obj) {
		var checkValue = "";

		for (var i = 0; i < obj.length; i++) {
			if (obj[i].checked == true) {
				checkValue += obj[i].value + ",";
			}
		}

		if (checkValue != "")
			checkValue = checkValue.substring(0, checkValue.length - 1);

		return checkValue;
	}
</script>
</head>
<body>
	<header> <nav
		class="navbar navbar-expand-md navbar-dark bg-dark"
		aria-label="main-navbar">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">Gromi</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navBoard" aria-controls="navBoard"
			aria-expanded="false" aria-label="Toggle navigation">
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
					class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
					aria-expanded="false">커뮤니티</a>
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
	</nav> </header>
	<main> <%
 String sType = request.getParameter("sType") == null ? "" : request.getParameter("sType");
 String wordType = request.getParameter("wordType") == null ? "" : request.getParameter("wordType");
 String word = request.getParameter("word") == null ? "" : request.getParameter("word");
 String priceType = request.getParameter("priceType") == null ? "" : request.getParameter("priceType");
 String priceTypeSel = request.getParameter("priceTypeSel") == null ? "" : request.getParameter("priceTypeSel");
 String waterCycleSel = request.getParameter("waterCycleSel") == null ? "" : request.getParameter("waterCycleSel");
 %>
	<form name="searchApiForm">
		<input type="hidden" name="cntntsNo"> <input type="hidden"
			name="pageNo"
			value="<%=request.getParameter("pageNo") == null ? "" : request.getParameter("pageNo")%>">
		<input type="hidden" name="word"
			value="<%=request.getParameter("word") == null ? "" : request.getParameter("word")%>">
		<input type="hidden" name="lightChkVal"
			value="<%=request.getParameter("lightChkVal") == null ? "" : request.getParameter("lightChkVal")%>">
		<input type="hidden" name="grwhstleChkVal"
			value="<%=request.getParameter("grwhstleChkVal") == null ? "" : request.getParameter("grwhstleChkVal")%>">
		<input type="hidden" name="lefcolrChkVal"
			value="<%=request.getParameter("lefcolrChkVal") == null ? "" : request.getParameter("lefcolrChkVal")%>">
		<input type="hidden" name="lefmrkChkVal"
			value="<%=request.getParameter("lefmrkChkVal") == null ? "" : request.getParameter("lefmrkChkVal")%>">
		<input type="hidden" name="flclrChkVal"
			value="<%=request.getParameter("flclrChkVal") == null ? "" : request.getParameter("flclrChkVal")%>">
		<input type="hidden" name="fmldecolrChkVal"
			value="<%=request.getParameter("fmldecolrChkVal") == null ? "" : request.getParameter("fmldecolrChkVal")%>">
		<input type="hidden" name="ignSeasonChkVal"
			value="<%=request.getParameter("ignSeasonChkVal") == null ? "" : request.getParameter("ignSeasonChkVal")%>">
		<input type="hidden" name="winterLwetChkVal"
			value="<%=request.getParameter("winterLwetChkVal") == null ? "" : request.getParameter("winterLwetChkVal")%>">
		<div class="container">
			<table class="mt-5 ">
				<tr>
					<th>
						<h1>어떤 종류의</h1>
					</th>
				</tr>
				<tr>
					<td>
						<h1>식물을 찾고있나요?</h1>
					</td>
				</tr>
				<tr class="mt-5">
					<td>
					<div class="option-button-list btn-group mb-3" role="group" aria-label="Basic oulined example">
						<button type="button" onclick="lightToggleButton()"
							class="toggleButton btn btn-outline-dark" data-bs-toggle="button"
							autocomplete="off">광도요구</button>
						<button type="button" onclick="growToggleButton()"
							class="toggleButton btn btn-outline-dark" data-bs-toggle="button"
							autocomplete="off">생육형태</button>
						<button type="button" onclick="leafColorToggleButton()"
							class="toggleButton btn btn-outline-dark" data-bs-toggle="button"
							autocomplete="off">잎색</button>
						<button type="button" onclick="flowerColorToggleButton()"
							class="toggleButton btn btn-outline-dark" data-bs-toggle="button"
							autocomplete="off">꽃색</button>
					</div>
					</td>
				</tr>
				<tr class="mt-5">
					<td><select name="sType">
							<option value="sCntntsSj"
								<%=sType.equals("sCntntsSj") ? "selected" : ""%>>식물명</option>
							<option value="sPlntbneNm"
								<%=sType.equals("sPlntbneNm") ? "selected" : ""%>>한명</option>
							<option value="sPlntzrNm"
								<%=sType.equals("sPlntzrNm") ? "selected" : ""%>>영명</option>
					</select></td>
					<td><input type="text" name="sText"
						value="<%=request.getParameter("sText") == null ? "" : request.getParameter("sText")%>">
						<input type="button" name="search" value="검색"
						onclick="return fncSearch();" /></td>
				</tr>

			</table>

			<%
			//apiKey
			String apiKey = "20230522XJWYEFWOSP5UXDCRIUCMG";
			//서비스 명
			String serviceName = "garden";
			//오퍼레이션 명	
			String[] operationName = { "lightList", "grwhstleList", "lefcolrList", "lefmrkList", "flclrList", "fmldecolrList",
					"ignSeasonList", "winterLwetList", "priceTypeList", "waterCycleList" };

			HashMap<String, Document> operationNameMap = new HashMap<String, Document>();

			Document doc = null;

			for (int i = 0; i < operationName.length; i++) {
				//XML 받을 URL 생성
				String parameter = "/" + serviceName + "/" + operationName[i];
				parameter += "?apiKey=" + apiKey;

				//서버와 통신
				URL apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
				InputStream apiStream = apiUrl.openStream();

				try {
					//xml document
					doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
					operationNameMap.put(operationName[i], doc);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					apiStream.close();
				}
			}

			int size = 0;
			String resultCode = "";
			String resultMsg = "";
			NodeList items = null;
			NodeList codes = null;
			NodeList codeNms = null;

			if (operationNameMap.containsKey("lightList")) {
				doc = operationNameMap.get("lightList");

				items = doc.getElementsByTagName("item");
				size = doc.getElementsByTagName("item").getLength();
				codes = doc.getElementsByTagName("code");
				codeNms = doc.getElementsByTagName("codeNm");

				try {
					resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
				} catch (Exception e) {
					resultCode = "";
				}
				try {
					resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
				} catch (Exception e) {
					resultMsg = "";
				}

			} else {
				out.print("조회한 정보가 없습니다.");
			}

			if (operationNameMap.containsKey("grwhstleList")) {
				doc = operationNameMap.get("grwhstleList");

				items = doc.getElementsByTagName("item");
				size = doc.getElementsByTagName("item").getLength();
				codes = doc.getElementsByTagName("code");
				codeNms = doc.getElementsByTagName("codeNm");

				try {
					resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
				} catch (Exception e) {
					resultCode = "";
				}
				try {
					resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
				} catch (Exception e) {
					resultMsg = "";
				}

				out.print("<tr><th>생육형태</th><td>");
				if (resultCode.equals("00")) {
					for (int i = 0; i < size; i++) {
				//코드
				String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
				//코드명
				String codeNm = codeNms.item(i).getFirstChild() == null ? ""
						: codeNms.item(i).getFirstChild().getNodeValue();
			%>

			<input type="checkbox" id="grwhstleChk" name="grwhstleChk"
				value="<%=code%>"
				<%if (request.getParameter("grwhstleChkVal") != null) {
	String chkVar = request.getParameter("grwhstleChkVal");
	String[] chkArr = chkVar.split(",");
	for (int j = 0; j < chkArr.length; j++) {
		if (code.equals(chkArr[j])) {
			out.print("checked");
		}
	}
}%> /><%=codeNm%>&nbsp;
			<%
			}

			} else {
			out.print("조회한 정보가 없습니다.");
			}
			out.print("</td></tr>");
			}
			//잎색 검색 조건
			if (operationNameMap.containsKey("lefcolrList")) {
			doc = operationNameMap.get("lefcolrList");

			items = doc.getElementsByTagName("item");
			size = doc.getElementsByTagName("item").getLength();
			codes = doc.getElementsByTagName("code");
			codeNms = doc.getElementsByTagName("codeNm");

			try {
			resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultCode = "";
			}
			try {
			resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultMsg = "";
			}

			out.print("<tr><th>잎색</th><td>");
			if (resultCode.equals("00")) {
			for (int i = 0; i < size; i++) {
			//코드
			String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
			//코드명
			String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
			%>
			<input type="checkbox" id="lefcolrChk" name="lefcolrChk"
				value="<%=code%>"
				<%if (request.getParameter("lefcolrChkVal") != null) {
	String chkVar = request.getParameter("lefcolrChkVal");
	String[] chkArr = chkVar.split(",");
	for (int j = 0; j < chkArr.length; j++) {
		if (code.equals(chkArr[j])) {
			out.print("checked");
		}
	}
}%> /><%=codeNm%>&nbsp;
			<%
			}

			} else {
			out.print("조회한 정보가 없습니다.");
			}
			out.print("</td></tr>");
			}
			//잎무늬 검색 조건
			if (operationNameMap.containsKey("lefmrkList")) {
			doc = operationNameMap.get("lefmrkList");

			items = doc.getElementsByTagName("item");
			size = doc.getElementsByTagName("item").getLength();
			codes = doc.getElementsByTagName("code");
			codeNms = doc.getElementsByTagName("codeNm");

			try {
			resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultCode = "";
			}
			try {
			resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultMsg = "";
			}

			out.print("<tr><th>잎 무늬</th><td>");
			if (resultCode.equals("00")) {
			for (int i = 0; i < size; i++) {
			//코드
			String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
			//코드명
			String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
			%>

			<input type="checkbox" id="lefmrkChk" name="lefmrkChk"
				value="<%=code%>"
				<%if (request.getParameter("lefmrkChkVal") != null) {
	String chkVar = request.getParameter("lefmrkChkVal");
	String[] chkArr = chkVar.split(",");
	for (int j = 0; j < chkArr.length; j++) {
		if (code.equals(chkArr[j])) {
			out.print("checked");
		}
	}
}%> /><%=codeNm%>&nbsp;
			<%
			}

			} else {
			out.print("조회한 정보가 없습니다.");
			}
			out.print("</td></tr>");
			}
			//꽃 색 검색 조건
			if (operationNameMap.containsKey("flclrList")) {
			doc = operationNameMap.get("flclrList");

			items = doc.getElementsByTagName("item");
			size = doc.getElementsByTagName("item").getLength();
			codes = doc.getElementsByTagName("code");
			codeNms = doc.getElementsByTagName("codeNm");

			try {
			resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultCode = "";
			}
			try {
			resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultMsg = "";
			}

			out.print("<tr><th>꽃색</th><td>");
			if (resultCode.equals("00")) {
			for (int i = 0; i < size; i++) {
			//코드
			String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
			//코드명
			String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
			%>
			<input type="checkbox" id="flclrChk" name="flclrChk"
				value="<%=code%>"
				<%if (request.getParameter("flclrChkVal") != null) {
	String chkVar = request.getParameter("flclrChkVal");
	String[] chkArr = chkVar.split(",");
	for (int j = 0; j < chkArr.length; j++) {
		if (code.equals(chkArr[j])) {
			out.print("checked");
		}
	}
}%> /><%=codeNm%>&nbsp;
			<%
			}

			} else {
			out.print("조회한 정보가 없습니다.");
			}
			out.print("</td></tr>");
			}
			//열매색 검색 조건
			if (operationNameMap.containsKey("fmldecolrList")) {
			doc = operationNameMap.get("fmldecolrList");

			items = doc.getElementsByTagName("item");
			size = doc.getElementsByTagName("item").getLength();
			codes = doc.getElementsByTagName("code");
			codeNms = doc.getElementsByTagName("codeNm");

			try {
			resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultCode = "";
			}
			try {
			resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultMsg = "";
			}

			out.print("<tr><th>열매색</th><td>");
			if (resultCode.equals("00")) {
			for (int i = 0; i < size; i++) {
			//코드
			String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
			//코드명
			String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
			%>
			<input type="checkbox" id="fmldecolrChk" name="fmldecolrChk"
				value="<%=code%>"
				<%if (request.getParameter("fmldecolrChkVal") != null) {
	String chkVar = request.getParameter("fmldecolrChkVal");
	String[] chkArr = chkVar.split(",");
	for (int j = 0; j < chkArr.length; j++) {
		if (code.equals(chkArr[j])) {
			out.print("checked");
		}
	}
}%> /><%=codeNm%>&nbsp;
			<%
			}

			} else {
			out.print("조회한 정보가 없습니다.");
			}
			out.print("</td></tr>");
			}
			//꽃피는 계절 검색 조건
			if (operationNameMap.containsKey("ignSeasonList")) {
			doc = operationNameMap.get("ignSeasonList");

			items = doc.getElementsByTagName("item");
			size = doc.getElementsByTagName("item").getLength();
			codes = doc.getElementsByTagName("code");
			codeNms = doc.getElementsByTagName("codeNm");

			try {
			resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultCode = "";
			}
			try {
			resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultMsg = "";
			}

			out.print("<tr><th>꽃피는 계절</th><td>");
			if (resultCode.equals("00")) {
			for (int i = 0; i < size; i++) {
			//코드
			String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
			//코드명
			String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
			%>
			<input type="checkbox" id="ignSeasonChk" name="ignSeasonChk"
				value="<%=code%>"
				<%if (request.getParameter("ignSeasonChkVal") != null) {
	String chkVar = request.getParameter("ignSeasonChkVal");
	String[] chkArr = chkVar.split(",");
	for (int j = 0; j < chkArr.length; j++) {
		if (code.equals(chkArr[j])) {
			out.print("checked");
		}
	}
}%> /><%=codeNm%>&nbsp;
			<%
			}

			} else {
			out.print("조회한 정보가 없습니다.");
			}
			out.print("</td></tr>");
			}
			//겨울 최저온도 검색 조건
			if (operationNameMap.containsKey("winterLwetList")) {
			doc = operationNameMap.get("winterLwetList");

			items = doc.getElementsByTagName("item");
			size = doc.getElementsByTagName("item").getLength();
			codes = doc.getElementsByTagName("code");
			codeNms = doc.getElementsByTagName("codeNm");

			try {
			resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultCode = "";
			}
			try {
			resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultMsg = "";
			}

			out.print("<tr><th>겨울 최저온도</th><td>");
			if (resultCode.equals("00")) {
			for (int i = 0; i < size; i++) {
			//코드
			String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
			//코드명
			String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
			%>
			<input type="checkbox" id="winterLwetChk" name="winterLwetChk"
				value="<%=code%>"
				<%if (request.getParameter("winterLwetChkVal") != null) {
	String chkVar = request.getParameter("winterLwetChkVal");
	String[] chkArr = chkVar.split(",");
	for (int j = 0; j < chkArr.length; j++) {
		if (code.equals(chkArr[j])) {
			out.print("checked");
		}
	}
}%> /><%=codeNm%>&nbsp;
			<%
			}

			} else {
			out.print("조회한 정보가 없습니다.");
			}
			out.print("</td></tr>");
			}
			//가격대 검색 조건
			if (operationNameMap.containsKey("priceTypeList")) {
			doc = operationNameMap.get("priceTypeList");

			items = doc.getElementsByTagName("item");
			size = doc.getElementsByTagName("item").getLength();
			codes = doc.getElementsByTagName("code");
			codeNms = doc.getElementsByTagName("codeNm");

			try {
			resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultCode = "";
			}
			try {
			resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
			} catch (Exception e) {
			resultMsg = "";
			}

			out.print("<tr><th>가격대</th><td>");
			if (resultCode.equals("00")) {
			for (int i = 0; i < size; i++) {
			//코드
			String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
			//코드명
			String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
			if (i == 0) {
			%>
			<input type="radio" id="priceType" name="priceType" value="big"
				<%=priceType.equals("big") ? "checked" : ""%> />대형&nbsp; <input
				type="radio" id="priceType" name="priceType" value="medium"
				<%=priceType.equals("medium") ? "checked" : ""%> />중형&nbsp; <input
				type="radio" id="priceType" name="priceType" value="3"
				<%=priceType.equals("3") ? "checked" : ""%> />소형&nbsp; <select
				id="priceTypeSel" name="priceTypeSel">
				<option value="">선택하세요.</option>
				<%
				}
				%>
				<option value="<%=code%>"
					<%=priceTypeSel.equals(code) ? "selected" : ""%>><%=codeNm%></option>
				<%
				}
				} else {
				out.print("조회한 정보가 없습니다.");
				}
				out.print("</select></td></tr>");
				}
				//물주기 검색 조건
				if (operationNameMap.containsKey("waterCycleList")) {
				doc = operationNameMap.get("waterCycleList");

				items = doc.getElementsByTagName("item");
				size = doc.getElementsByTagName("item").getLength();
				codes = doc.getElementsByTagName("code");
				codeNms = doc.getElementsByTagName("codeNm");

				try {
				resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
				} catch (Exception e) {
				resultCode = "";
				}
				try {
				resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
				} catch (Exception e) {
				resultMsg = "";
				}

				out.print("<tr><th>물주기</th><td>");
				if (resultCode.equals("00")) {
				for (int i = 0; i < size; i++) {
				//코드
				String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
				//코드명
				String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
				if (i == 0) {
				%>
				<select id="waterCycleSel" name="waterCycleSel">
					<option value="">선택하세요.</option>
					<%
					}
					%>
					<option value="<%=code%>"
						<%=waterCycleSel.equals(code) ? "selected" : ""%>><%=codeNm%></option>
					<%
					}
					} else {
					out.print("조회한 정보가 없습니다.");
					}
					out.print("</select></td></tr>");
					}
					%>

					</table>
					<!-- 광도요구 버튼 리스트 -->
					<div class="lightChk-button-list btn-group mb-3" role="group"
						aria-label="Basic outlined example" >
						<button type="button" id="lightChkButton" name="lightChk"
							class="btn btn-outline-primary">빛이 적어도 되는</button>
						<button type="button" id="lightChkButton" name="lightChk"
							class="btn btn-outline-primary">빛을 적당히 필요로 하는</button>
						<button type="button" id="lightChkButton" name="lightChk"
							class="btn btn-outline-primary">빛을 자주 봐야 하는</button>
					</div>
					<!-- 생육형태 버튼 리스트 -->
					<div class="grwhstleChk-button-list btn-group mb-3" role="group"
						aria-label="Basic outlined example">
						<button type="button" id="grwhstleChkButton" name="grwhstleChk"
							class="btn btn-outline-primary">직립형</button>
						<button type="button" id="grwhstleChkButton" name="grwhstleChk"
							class="btn btn-outline-primary">관목형</button>
						<button type="button" id="grwhstleChkButton" name="grwhstleChk"
							class="btn btn-outline-primary">덩굴성</button>
						<button type="button" id="grwhstleChkButton" name="grwhstleChk"
							class="btn btn-outline-primary">풀모양</button>
						<button type="button" id="grwhstleChkButton" name="grwhstleChk"
							class="btn btn-outline-primary">로제트형</button>
						<button type="button" id="grwhstleChkButton" name="grwhstleChk"
							class="btn btn-outline-primary">다육형</button>
					</div>
					
					<div class="lefcolrChk-button-list btn-group mb-3" role="group"
						aria-label="Basic outlined example">
						<button type="button" id="lefcolrChkButton" name="lefcolrChk"
							class="btn btn-outline-dark">녹색, 연두색</button>
						<button type="button" id="lefcolrChkButton" name="lefcolrChk"
							class="btn btn-outline-dark">금색, 노란색</button>
						<button type="button" id="lefcolrChkButton" name="lefcolrChk"
							class="btn btn-outline-dark">흰색, 크림색</button>
						<button type="button" id="lefcolrChkButton" name="lefcolrChk"
							class="btn btn-outline-dark">은색, 회색</button>
						<button type="button" id="lefcolrChkButton" name="lefcolrChk"
							class="btn btn-outline-dark">빨강, 분홍, 자주색</button>
						<button type="button" id="lefcolrChkButton" name="lefcolrChk"
							class="btn btn-outline-dark">여러색 혼합</button>
							
					</div>
					
					<div class="flclrChk-button-list btn-group mb-3" role="group"
						aria-label="Basic outlined example">
						<button type="button" id="flclrChkButton" name="flclrChk"
							class="btn btn-outline-primary">파랑색</button>
						<button type="button" id="flclrChkButton" name="flclrChk"
							class="btn btn-outline-primary">보라색</button>
						<button type="button" id="flclrChkButton" name="flclrChk"
							class="btn btn-outline-primary">분홍색</button>
						<button type="button" id="flclrChkButton" name="flclrChk"
							class="btn btn-outline-primary">빨강색</button>
						<button type="button" id="flclrChkButton" name="flclrChk"
							class="btn btn-outline-primary">오렌지색</button>
						<button type="button" id="flclrChkButton" name="flclrChk"
							class="btn btn-outline-primary">노랑색</button>
						<button type="button" id="flclrChkButton" name="flclrChk"
							class="btn btn-outline-primary">흰색</button>
						<button type="button" id="flclrChkButton" name="flclrChk"
							class="btn btn-outline-primary">혼합색</button>
					</div>
		</div>


	</form>

	<%
	//목록
	if (operationName.length == operationNameMap.size()) {
		//오퍼레이션 명
		String operationNameList = "gardenList";

		//XML 받을 URL 생성
		String parameter = "/" + serviceName + "/" + operationNameList;
		parameter += "?apiKey=" + apiKey;
		parameter += "&pageNo=" + request.getParameter("pageNo");

		//검색 조건
		String[] searchNmArr = { "sType", "sText", "wordType", "word", "lightChkVal", "grwhstleChkVal", "lefcolrChkVal",
		"lefmrkChkVal", "flclrChkVal", "fmldecolrChkVal", "ignSeasonChkVal", "winterLwetChkVal", "priceType",
		"priceTypeSel", "waterCycleSel" };
		for (int i = 0; i < searchNmArr.length; i++) {
			if (request.getParameter(searchNmArr[i]) != null && !request.getParameter(searchNmArr[i]).equals("")) {
		parameter += "&" + searchNmArr[i] + "=" + request.getParameter(searchNmArr[i]);
			}
		}
		//서버와 통신
		URL apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
		InputStream apiStream = apiUrl.openStream();

		try {
			//xml document
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			apiStream.close();
		}

		items = doc.getElementsByTagName("item");
		size = doc.getElementsByTagName("item").getLength();
		NodeList cntntsNos = doc.getElementsByTagName("cntntsNo");
		NodeList cntntsSjs = doc.getElementsByTagName("cntntsSj");
		NodeList rtnFileSeCodes = doc.getElementsByTagName("rtnFileSeCode");
		NodeList rtnFileSns = doc.getElementsByTagName("rtnFileSn");
		NodeList rtnOrginlFileNms = doc.getElementsByTagName("rtnOrginlFileNm");
		NodeList rtnStreFileNms = doc.getElementsByTagName("rtnStreFileNm");
		NodeList rtnFileCourss = doc.getElementsByTagName("rtnFileCours");
		NodeList rtnImageDcs = doc.getElementsByTagName("rtnImageDc");
		NodeList rtnThumbFileNms = doc.getElementsByTagName("rtnThumbFileNm");
		NodeList rtnImgSeCodes = doc.getElementsByTagName("rtnImgSeCode");

		try {
			resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
		} catch (Exception e) {
			resultCode = "";
		}
		try {
			resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
		} catch (Exception e) {
			resultMsg = "";
		}

		if (resultCode.equals("00")) {
	%>

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-4">
				<%
				if (size == 0) {
				%>
				<h2>조회한 정보가 없습니다.</h2>
				<%
				} else {
				%>


				<%
				for (int i = 0; i < size; i++) {
					//콘텐츠 번호
					String cntntsNo = cntntsNos.item(i).getFirstChild() == null ? "" : cntntsNos.item(i).getFirstChild().getNodeValue();
					//콘텐츠 제목
					String cntntsSj = cntntsSjs.item(i).getFirstChild() == null ? "" : cntntsSjs.item(i).getFirstChild().getNodeValue();
					//저장 파일명
					String rtnStreFileNm = rtnStreFileNms.item(i).getFirstChild() == null ? ""
					: rtnStreFileNms.item(i).getFirstChild().getNodeValue();
					String[] rtnStreFileNmArr = rtnStreFileNm.split("[|]");
					//파일경로
					String rtnFileCours = rtnFileCourss.item(i).getFirstChild() == null ? ""
					: rtnFileCourss.item(i).getFirstChild().getNodeValue();
					String[] rtnFileCoursArr = rtnFileCours.split("[|]");
				%>

				<div class="plant_list-item col mr-3">
					<a id="plant_detail-link"
						href="javascript:fncDtl('<%=cntntsNo%>');"
						style="text-decoration: none; color: black;"> <img
						src="http://www.nongsaro.go.kr/<%=rtnFileCoursArr[0]%>/<%=rtnStreFileNmArr[0]%>"
						class="rounded" alt="<%=cntntsSj + "사진"%>" width="100%"
						height="200">
						<div class="plant_title mb-3">

							<p class="h6 mt-2"><%=cntntsSj%></p>
						</div>
					</a>
				</div>

				<%
				}
				}
				%>
			</div>
		</div>
	</div>


	<%
	//페이징 처리
	//한 페이지에 제공할 건수
	String numOfRows = "";
	//조회된 총 건수
	String totalCount = "";
	//조회할 페이지 번호
	String pageNo = "";
	try {
		numOfRows = doc.getElementsByTagName("numOfRows").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		numOfRows = "";
	}
	try {
		totalCount = doc.getElementsByTagName("totalCount").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		totalCount = "";
	}
	try {
		pageNo = doc.getElementsByTagName("pageNo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		pageNo = "";
	}

	int pageGroupSize = 10;
	int pageSize = 0;
	try {
		pageSize = Integer.parseInt(numOfRows);
	} catch (Exception e) {
		pageSize = 10;
	}
	int start = 0;
	try {
		start = Integer.parseInt(pageNo);
	} catch (Exception e) {
		start = 1;
	}

	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(pageNo);
	} catch (Exception e) {
	}

	int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호 
	int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호      
	int count = Integer.parseInt(totalCount);
	int number = 0;

	number = count - (currentPage - 1) * pageSize;//글목록에 표시할 글번호                                                                  

	//페이지그룹의 갯수                                                                                                             
	//ex) pageGroupSize가 3일 경우 '[1][2][3]'가 pageGroupCount 개 만큼 있다.                                                       
	int pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
	//페이지 그룹 번호                                                                                                              
	//ex) pageGroupSize가 3일 경우  '[1][2][3]'의 페이지그룹번호는 1 이고  '[2][3][4]'의 페이지그룹번호는 2 이다.                   
	int numPageGroup = (int) Math.ceil((double) currentPage / pageGroupSize);
	%> <nav aria-label="...">
	<div class="container">
		<ul class="pagination ">
			<%
			if (count > 0) {
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				int startPage = pageGroupSize * (numPageGroup - 1) + 1;
				int endPage = startPage + pageGroupSize - 1;
				int prtPageNo = 0;

				if (endPage > pageCount) {
					endPage = pageCount;
				}

				if (numPageGroup > 1) {
					prtPageNo = (numPageGroup - 2) * pageGroupSize + 1;
			%>
			<li class="page-item disabled"><a class="page-link"
				href="javascript:fncGoPage(prtPageNo)" tabindex="-1"
				aria-disabled="true">이전</a></li>
			<%
			//out.println("<a href='javascript:fncGoPage("+prtPageNo+");'>[이전]</a>");
			}

			for (int i = startPage; i <= endPage; i++) {
			prtPageNo = i;
			//out.print("<a href='javascript:fncGoPage("+prtPageNo+");'>");
			if (currentPage == i) {
			%>
			<li class="page-item active" aria-current="page"><a
				class="page-link"
				href="javascript:fncGoPage(<%="+" + prtPageNo + "+"%>)"><%=i%></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="javascript:fncGoPage("+prtPageNo+")"><%=i%></a></li>
			<%
			}
			}

			if (numPageGroup < pageGroupCount) {
			prtPageNo = (numPageGroup * pageGroupSize + 1);
			//out.println("<a href='javascript:fncGoPage("+prtPageNo+");'>[다음]</a>");
			%>
			<li class="page-item"><a class="page-link"
				href='javascript:fncGoPage("+prtPageNo+")'>다음</a></li>
			<%
			}
			}
			//페이징 처리 끝
			} else {
			out.print(resultMsg);
			}
			%>
		</ul>
	</div>
	</nav> <%
 }
 %> </main>
	<div class="container">
		<footer
			class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
		<div class="col-md-4 d-flex align-items-center">
			<a href="https://www.deu.ac.kr"
				class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">

				<img
				src="https://starteacher-v5-upload.s3.ap-northeast-2.amazonaws.com/institute/logoaf34051b140f0305b0593ebd85bf43b1170b2268067bd03b3e7a0353b0df1c8e877810ac50891df6e550db9a15ab69fe"
				width="30">
			</a> <span class="mb-3 mb-md-0 text-muted">&copy; Goormbbang
				Company, Inc</span>
		</div>

		<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
			<li class="ms-3"><a class="text-muted" href="#"><svg
						class="bi" width="24" height="24"> <use
						xlink:href="#instagram" /> </svg></a></li>
		</ul>
		</footer>
	</div>
</body>
</html>