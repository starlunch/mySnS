<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="conn.jsp" %>

<%
    int postId = Integer.parseInt(request.getParameter("id"));
    
    try {
        String sql = "DELETE FROM post WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, postId);
        pstmt.executeUpdate();
        
        
        response.sendRedirect("main.jsp");
        
        pstmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>