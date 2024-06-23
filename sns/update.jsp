<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="conn.jsp" %>

<%
// 폼에서 전송된 데이터 가져오기
int postId = Integer.parseInt(request.getParameter("id"));
String title = request.getParameter("title");
String content = request.getParameter("content");

PreparedStatement pstmt = null;

try {
    String sql = "UPDATE post SET title = ?, content = ? WHERE id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, postId);
    int rowsUpdated = pstmt.executeUpdate();

    if (rowsUpdated > 0) {
        out.println("<h2>게시물이 성공적으로 수정되었습니다.</h2>");
        out.println("<a href='main.jsp'>목록으로 돌아가기</a>");
    } else {
        out.println("<h2>게시물 수정에 실패하였습니다.</h2>");
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    try {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>