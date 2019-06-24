<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="myblog.BlogDao" %>
<jsp:useBean id="user" class="myblog.User"/>
<jsp:setProperty name="user" property="id"/>
<jsp:setProperty name="user" property="password"/>
<%
	BlogDao dao = BlogDao.getInstance();
	String saveId = request.getParameter("saveid");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = null;
	String id = request.getParameter("id");
	if(saveId !=null)
	{
		Cookie cookie = new Cookie("id",id);
		cookie.setPath("/");
		response.addCookie(cookie);
	}else
	{
		Cookie cookie = new Cookie("id",null);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
	if(session.getAttribute(userID) != null)
		{
			userID = (String)session.getAttribute(userID);
		}
	if(userID !=null)
	{
		out.println("<script>");
		out.println("alert('이미 로그인이 되었습니다.')");
		out.println("location.href = 'main.jsp'");
		out.println("</script>");
	}else
	{
		int result;
		result = dao.loginUser(user.getId(),user.getPassword());
		if(result ==1) {
			session.setAttribute("userID",user.getId());
			out.println("<script>");
			out.println("location.href = 'Main.jsp'");
			out.println("</script>");
		}else if(result ==0) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.')");
			out.println("history.back()");//이전페이지로 돌려보냄
			out.println("</script>");
		}else if(result == -1) {
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else if(result == -2) {
			out.println("<script>");
			out.println("alert('데이터베이스 오류가 발생했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
%>
</body>
</html>