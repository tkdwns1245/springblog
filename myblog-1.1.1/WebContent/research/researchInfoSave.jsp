<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String[] question = new String[11];
	Cookie[] cookies = new Cookie[10];	
	for(int i = 1; i <=10; i ++)
	{
		question[i] = request.getParameter("q"+i);
	}
	for(int i = 0; i <10; i++)
	{
		cookies[i] = new Cookie("q"+(i+1),question[i+1]);
		cookies[i].setPath("/MyBlog/research");
		response.addCookie(cookies[i]);
	}
	
	out.println("<script>");
	out.println("location.href = 'researchResult.jsp'");
	out.println("</script>");
%>