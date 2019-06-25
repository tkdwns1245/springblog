<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${check == 1}">
	<meta http-equiv="Refresh" content=
	"0;url=${pageContext.request.contextPath}/databoard/list.do?pageNum=${pageNum}">
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<c:if test="${check == 0}">
	<%
		out.println("<script>");
		out.println("history.goback(-1)");
		out.println("</script>");
	%>
</c:if>
</body>
</html>