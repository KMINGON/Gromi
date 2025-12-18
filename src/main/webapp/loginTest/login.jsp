<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%
    String uid = request.getParameter("id");
    String upw = request.getParameter("ps");

    //String sql = "SELECT pw FROM userList WHERE id = '";
    //sql += uid + "'";

    Class.forName("com.mysql.jdbc.Driver"); 
    
    String jdbcDriver ="jdbc:mysql://49.50.174.5:3306/TestDB?serverTimezone=UTC"; 
    String dbUser ="gon"; //mysql id
    String dbPass ="20193172"; //mysql password
    Connection conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    String sql = "SELECT pw FROM userList WHERE id = ?";

    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, uid);
    ResultSet rs = stmt.executeQuery();
    String pw = "";
    while(rs.next()){
        pw = rs.getString("pw");
    }
    if(pw.equals(upw)){
        session.setAttribute("id", uid);
    }
//<jsp:forward page="main.jsp"/>
response.sendRedirect("main.jsp");
%>
