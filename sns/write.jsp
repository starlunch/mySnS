<%@ include file="conn.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>글 쓰기</h1>
        <form action="writeprocess.jsp" method="post">
            작성자: <input type="text" name="author" required><br>
            제목: <input type="text" name="title" required><br>
            내용: <textarea name="content" required></textarea><br>
            <input type="submit" value="제출">
        </form>
        <a href="main.jsp">게시판으로 돌아갈래요!</a>
</div>
</body>
</html>