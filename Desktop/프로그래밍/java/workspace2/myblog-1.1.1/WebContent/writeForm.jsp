<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap -->
	<link href="Resource/css/bootstrap.css" rel="stylesheet">
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>    
</head>
<body>
<%
	String userID=null;
	if(session.getAttribute("userID") !=null)
		userID = (String)session.getAttribute("userID");
	else{
		out.println("<script>");
		out.println("alert('로그인을 하세요')");
		out.println("location.href='board.jsp'");
		out.println("</script>");
	}
%>
	<header>
		<nav class= "navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class = "container-fluid">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span> 
		    		</button>
					<div class="navbar-header">
				    	<a class="navbar-brand" href="Main.jsp">SSZ의 블로그</a>
				    </div>
				    <div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판</a>
								<ul class="dropdown-menu">
									<li><a href="board.jsp">자유게시판</a></li>
									<li><a href="#">갤러리</a></li>
									<li><a href="#">끄적끄적</a></li>
									<li><a href="${pageContext.request.contextPath}/databoard/list.do">자료실</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">연애능력평가</a>
								<ul class="dropdown-menu">
									<li><a href="research/researchPersonInfo.jsp">평가시작하기</a></li>
									<li><a href="research/Result.jsp">통계결과보기</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		<div>
			<img src="Resource/img/nightView2.jpg" class="img-responsive">
		</div>
	</header>
	<div class="container" id="content">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6 blog-header" style="margin-bottom:50px; text-align:center">
			    <h1 class="blog-title">글쓰기</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-2"></div>
			<form class="col-lg-8" method="post" name="writeForm" action="write.proc.jsp"
										onsubmit="return writeSave()">
			<table class="table table-striped table-bordered">
				<tr>
					<td class="attr">제목</td>
					<td><input class="form-control" type="text" name="title"/></td>
				</tr>
				<tr>
					<td class="attr">내용</td>
					<td>
						<textarea class="form-control" name="content" rows="27" cols="50"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="attr">
						<input class="btn btn-primary" type="submit" value="글쓰기"/>
						<input class="btn btn-primary" type="reset" value="다시 작성"/>
						<input class="btn btn-primary" type="button" value="목록"
								onClick="javascript:window.location='board.jsp'">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Resource/js/bootstrap.min.js"></script>	
</body>
</html>