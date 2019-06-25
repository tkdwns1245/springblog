<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import="myblog.BoardDao" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bbs" class="myblog.Bbs"/>
<jsp:setProperty property="title" name="bbs"/>
<jsp:setProperty property="content" name="bbs"/>
<%
	String userID = null;
	if(session.getAttribute("userID") !=null)
		userID = (String)session.getAttribute("userID");
	bbs.setId(userID);
	bbs.setReadcount(0);
	bbs.setRegdate( new Timestamp(System.currentTimeMillis()));
	BoardDao dbPro = BoardDao.getInstance();
	dbPro.insertArticle(bbs);
	response.sendRedirect("board.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<f:view>

</f:view>
</body>
</html>