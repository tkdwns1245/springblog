<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="myblog.ResearchDao" %>
<jsp:useBean class="myblog.Research" id="tmpResearch"/>
<% 
	ResearchDao dao = ResearchDao.getInstance();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=utf-8">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap -->
	<link href="/MyBlog/Resource/css/bootstrap.css" rel="stylesheet">
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>    
	<title>연예능력 평가</title>
</head>
<body>
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
				    	<a class="navbar-brand" href="/MyBlog/Main.jsp">SSZ의 블로그</a>
				    </div>
				    <div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판</a>
								<ul class="dropdown-menu">
									<li><a href="/MyBlog/board.jsp">자유게시판</a></li>
									<li><a href="#">갤러리</a></li>
									<li><a href="#">끄적끄적</a></li>
									<li><a href="${pageContext.request.contextPath}/databoard/list.do">자료실</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">연애능력평가</a>
								<ul class="dropdown-menu">
									<li><a href="/MyBlog/research/researchPersonInfo.jsp">평가시작하기</a></li>
									<li><a href="/MyBlog/research/researchPersonInfo.jsp">통계결과보기</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		<div>
			<img src="/MyBlog/Resource/img/nightView2.jpg" class="img-responsive">
		</div>
	</header>
	<div class="container">
		<div class="row">

			<div class="jumbotron" style="margin-top:20px; border: 1px solid; text-align:center">
				<label class="control-label" >
					<h2>통계결과</h2><br>
					<h3>지금까지 참여한 총 인원수 <%=dao.getResearchCount() %></h3><br>
				</label>
				<div>
					<b>0~40점 : <%=dao.getScoreCount(0,40) %></b><br>
					<b>40점~60점 : <%=dao.getScoreCount(40,60)%></b><br>
					<b>60점~80점 : <%=dao.getScoreCount(60,80)%></b><br>
					<b>80점~100점 : <%=dao.getScoreCount(80,110)%></b><br>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/MyBlog/Resource/js/bootstrap.min.js"></script>
</body>
</html>