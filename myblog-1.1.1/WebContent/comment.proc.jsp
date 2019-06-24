<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="myblog.BoardDao" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="tmpComment" class="myblog.Comment"/>
<jsp:setProperty name="tmpComment" property="content"/>
<%
	String bnum = request.getParameter("bnum");
	String pageNum = request.getParameter("pageNum");
	tmpComment.setBnum(Integer.parseInt(request.getParameter("bnum")));
	tmpComment.setId(request.getParameter("id"));
	BoardDao dao = BoardDao.getInstance();
	dao.insertComment(tmpComment);
	System.out.println("bnum : " + request.getParameter("id"));
	
	response.sendRedirect("content.jsp?num="+ bnum + "&pageNum=" + pageNum);
%>