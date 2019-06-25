<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "myblog.BoardDao" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = BoardDao.getInstance();
	int check = dao.deleteArticle(num);
	if(check ==1) {
%>
	<meta http-equiv="Refresh" content="0;url=Main.jsp?pageNum=<%=pageNum%>">
<% }else {%>
<script>
	alert("게시글 삭제에 실패했습니다.");
	history.go(-1);
</script>
<% } %>