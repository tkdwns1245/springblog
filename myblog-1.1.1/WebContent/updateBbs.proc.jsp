<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="myblog.BoardDao" %>
<%@ page import="myblog.Bbs" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	BoardDao dao = BoardDao.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	String tmpContent = request.getParameter("content");
	String tmpTitle = request.getParameter("title");
	
	Bbs bbs = dao.getArticle(num);
	bbs.setContent(tmpContent);
	bbs.setTitle(tmpTitle);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<% 
	int result = dao.updateArticle(bbs);
	if(result ==-1) {
		out.println("<script>");
		out.println("alert('글 수정에 실패했습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("location.href = 'board.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>