<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="myblog.BlogDao" %>
<jsp:useBean id="user" class="myblog.User"/>
<jsp:setProperty name="user" property="password"/>
<jsp:setProperty name="user" property="email"/>
<%
	BlogDao dao = BlogDao.getInstance();
	String userID = null;
	if(session.getAttribute("userID") !=null)
		userID = (String)session.getAttribute("userID");
	user.setId(userID);
	int result = dao.updateUser(user);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Refresh" content="3;url=Main.jsp">
<title>Insert title here</title>
</head>
<body>
	<%if(result>0) { %>
		<b>회원정보가 성공적으로 변경되었습니다.</b><br>
		<b>3초 후 메인 페이지로 이동됩니다.</b>
	<%} else if(result ==-1) {%>
		<script>
			alert("데이터베이스 문제로 인해 회원정보를 변경하는데 실패하였습니다.");
			history.go(-1);
		</script>
	<%} %>
</body>
</html>