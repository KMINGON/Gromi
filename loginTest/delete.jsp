<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%
    String uid = request.getParameter("id");
    String upw = request.getParameter("ps");
    String uname = request.getParameter("name");

    //String sql = "SELECT pw FROM userList WHERE id = '";
    //sql += uid + "'";

    Class.forName("com.mysql.jdbc.Driver"); 
    
    String jdbcDriver ="jdbc:mysql://49.50.174.5:3306/TestDB?serverTimezone=UTC"; 
    String dbUser ="gon"; //mysql id
    String dbPass ="20193172"; //mysql password
    Connection conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

    String sql = "DELETE FROM userList WHERE id = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, uid);

    int count = stmt.executeUpdate();
    if(count == 1){
        out.print("삭제 완료");
    }
    else{
        out.print("삭제 실패");
    }
%>
