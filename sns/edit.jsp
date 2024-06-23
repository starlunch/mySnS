<%@ include file="conn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>글 수정</h1>
        
        <%
        
        int postId = Integer.parseInt(request.getParameter("id"));

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM post WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String author = rs.getString("author");
                String title = rs.getString("title");
                String content = rs.getString("content");
        %>
                <form action="update.jsp" method="post">
                    <input type="hidden" name="id" value="<%= postId %>">
                    작성자: <input type="text" name="author" value="<%= author %>" readonly><br>
                    제목: <input type="text" name="title" value="<%= title %>" required><br>
                    내용: <textarea name="content" required><%= content %></textarea><br>
                    <input type="submit" value="수정하기">
                </form>
        <%
            } else {
                out.println("해당 게시물을 찾을 수 없습니다.");
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

        <a href="main.jsp">게시판으로 돌아가기</a>
    </div>
</body>
</html>