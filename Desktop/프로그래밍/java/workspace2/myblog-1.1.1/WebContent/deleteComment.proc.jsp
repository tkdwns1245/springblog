<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="myblog.BoardDao" %>
<%
	String bnum = request.getParameter("bnum");
	String pageNum = request.getParameter("pageNum");
	BoardDao dao = BoardDao.getInstance();
	dao.deleteComment(Integer.parseInt(request.getParameter("cnum")));
	
	response.sendRedirect("content.jsp?num="+ bnum + "&pageNum=" + pageNum);
%>