<%@ include file="conn.jsp" %>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String author = request.getParameter("author");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        String sql = "INSERT INTO post (author, title, content) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, author);
        pstmt.setString(2, title);
        pstmt.setString(3, content);
        pstmt.executeUpdate();
        
        response.sendRedirect("main.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
