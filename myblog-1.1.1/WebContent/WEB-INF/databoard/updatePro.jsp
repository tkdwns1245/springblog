<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == 1}">
	<meta http-equiv="Refresh" content="0; url=${pageContext.request.contextPath}/databoard/list.do?pageNum=${pageNum}">
</c:if>
<c:if test="${check == -1}">
<a href="javascript:history.go(-1)">[수정화면으로 돌아가기]</a>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link href="${pageContext.request.contextPath}/boardtwo/css/styls.css" rel="stylesheet" type="text/css"/> 
</head>