<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="myblog.BlogDao" %>
<%
	BlogDao dao = BlogDao.getInstance();
	String id = request.getParameter("id");
	int result = dao.idCheck(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap -->
	<link href="Resource/css/bootstrap.css" rel="stylesheet">
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>    
<body>
	<br><b><%=id%></b>
		<%
			if(result == -1){out.println("는 이미 존재하는 ID입니다.<br><br>"); }
			else{out.println("는 사용가능합니다.<br><br>");}
		%>
			<a href="#" onClick="javascript:self.close()">닫기</a>
			
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Resource/js/bootstrap.min.js"></script>				
</body>
</html>