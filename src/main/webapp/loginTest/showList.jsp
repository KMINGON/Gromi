<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="model.ConnectMysql" %>
<%
    //String sql = "SELECT * FROM userList";
    Connection conn = new ConnectMysql().getConn();

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