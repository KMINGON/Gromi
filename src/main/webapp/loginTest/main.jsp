<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%
String uid = (String)session.getAttribute("id");
if(uid == null){
    out.print("로그인 실패 화면.");
}
else{
    out.print("로그인 성공 화면.");
    session.setAttribute("id", uid);
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
</head>
<body>
    <button type = "button" onclick = "location.href = 'logout.jsp';">로그아웃</button>
</body>
</html>
