<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%
    //String sql = "SELECT * FROM userList";

    Class.forName("com.mysql.jdbc.Driver"); 
    
    String jdbcDriver ="jdbc:mysql://49.50.174.5:3306/TestDB?serverTimezone=UTC"; 
    String dbUser ="gon"; //mysql id
    String dbPass ="20193172"; //mysql password
    Connection conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

    //Statement stmt = conn.createStatement();
    String sql = "SELECT * FROM userList";
    PreparedStatement stmt = conn.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery();
    while(rs.next()){
        String str = "id : " + rs.getString("id") + "\npw : " + rs.getString("pw") + "\nname : " + rs.getString("name");
        out.println(str);
    }
    out.flush();
%>