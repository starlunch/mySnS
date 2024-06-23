<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>일상공유</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        .post-card {
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 20px;
            width: 80%;
            max-width: 600px; 
            margin: 0 auto; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>목록</h1>
        
        <a class="write-link" href="write.jsp">글 쓰기</a>
        <div class="board">
            <% 
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                String sql = "SELECT * FROM post ORDER BY id DESC";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
            %>
                    <div class="post-card">
                        <h2 class="post-title"><%= rs.getString("title") %></h2>
                        <p class="post-author">작성자: <%= rs.getString("author") %></p>
                        <p class="post-content"><%= rs.getString("content") %></p>
                        <div class="post-actions">
                            <a class="edit-link" href="edit.jsp?id=<%= rs.getInt("id") %>">수정</a>
                            <a class="delete-link" href="delete.jsp?id=<%= rs.getInt("id") %>">삭제</a>
                        </div>
                    </div>
            <% 
                }
            } catch (SQLException e) {
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
        </div>
    </div>
</body>
</html>