<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%

	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String background = request.getParameter("background");
	String marry = request.getParameter("marry");
	String blood = request.getParameter("blood");
	
	Cookie cookie1 = new Cookie("gender", gender);
	Cookie cookie2 = new Cookie("age",age);
	Cookie cookie3 = new Cookie("background", background);
	Cookie cookie4 = new Cookie("marry", marry);
	Cookie cookie5 = new Cookie("blood",blood);
	
	cookie1.setPath("/MyBlog/research");
	cookie2.setPath("/MyBlog/research");
	cookie3.setPath("/MyBlog/research");
	cookie4.setPath("/MyBlog/research");
	cookie5.setPath("/MyBlog/research");
	
	response.addCookie(cookie1);
	response.addCookie(cookie2);
	response.addCookie(cookie3);
	response.addCookie(cookie4);
	response.addCookie(cookie5);
	
	out.println("<script>");
	out.println("location.href = 'research.jsp'");
	out.println("</script>");
%>