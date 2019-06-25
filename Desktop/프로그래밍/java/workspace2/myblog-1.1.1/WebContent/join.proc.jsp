<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="myblog.BlogDao" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id ="user" class = "myblog.User"/>
<jsp:setProperty name="user" property="*"/>
<%
	BlogDao dao = BlogDao.getInstance();
	int result = dao.insertUesr(user);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(result == 0) {
		out.println("<b>회원 가입을 축하드립니다.</b><br>");
		session.setAttribute("userID",user.getId());
		out.println("<a href=Main.jsp>로그인</a>");
	}else{
		out.println("<b>다시 입력하여 주십시오.</b><br>");
		out.println("<a href=join.jsp>다시가입</a>");
	}
%>
</body>
</html>