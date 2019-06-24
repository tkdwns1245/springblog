<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="myblog.ResearchDao" %>
<jsp:useBean class="myblog.Research" id="tmpResearch"/>
<% 
	ResearchDao dao = ResearchDao.getInstance();
	Cookie[] cookies = request.getCookies();
	int gender=0;
	int age=0;
	int background=0;
	int marry=0;
	String blood = null;
	int[] question = new int[11];
	int j = 1;
	
	if(cookies != null && cookies.length >0){
		for(int i = 0; i <cookies.length; i++)
		{
			if(cookies[i].getName().equals("gender"))
				gender = Integer.parseInt(cookies[i].getValue());
			else if(cookies[i].getName().equals("age"))
				age = Integer.parseInt(cookies[i].getValue());
			else if(cookies[i].getName().equals("background"))
				background = Integer.parseInt(cookies[i].getValue());
			else if(cookies[i].getName().equals("marry"))
				marry = Integer.parseInt(cookies[i].getValue());
			else if(cookies[i].getName().equals("blood"))
				blood = cookies[i].getValue();
			else if(cookies[i].getName().equals("q"+j))
			{
				question[j] = Integer.parseInt(cookies[i].getValue());
				j++;
			}
		}
	}
	
	tmpResearch.setGender(gender);
	tmpResearch.setAge(age);
	tmpResearch.setBackground(background);
	tmpResearch.setMarry(marry);
	tmpResearch.setBlood(blood);
	tmpResearch.setQ1(question[1]);
	tmpResearch.setQ2(question[2]);
	tmpResearch.setQ3(question[3]);
	tmpResearch.setQ4(question[4]);
	tmpResearch.setQ5(question[5]);
	tmpResearch.setQ6(question[6]);
	tmpResearch.setQ7(question[7]);
	tmpResearch.setQ8(question[8]);
	tmpResearch.setQ9(question[9]);
	tmpResearch.setQ10(question[10]);
	tmpResearch.setSum(question[1],question[2],question[3],question[4],question[5],
			question[6],question[7],question[8],question[9],question[10]);
	dao.insertResearch(tmpResearch);
	
	if(cookies != null && cookies.length >0){
		for(int i = 0; i <cookies.length; i++)
		{
			Cookie cookie = new Cookie(cookies[i].getName(),"");
			cookie.setMaxAge(0);
			response.addCookie(cookies[i]);
		}
	}
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
									<li><a href="/MyBlog/research/Result.jsp">통계결과보기</a></li>
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
		<%if (cookies.length>10) {%>
			<div class="jumbotron" style="margin-top:20px; border:1px solid; text-align:center">
			<div class="mainheader" style="margin-bottom:40px; text-align:center">
				<h3 style="color:blue;">수고 많으셨습니다.</h3>
			</div>
			<div style="text-align:center">
				<h2>검사결과 당신은</h2><br>
				<%
					int sum = tmpResearch.getSum();
					if(sum <=40){
				%>
				<h3><%=sum%>점으로 심각한 연애고자입니다.</h3>
				<% }else if(sum >40 && sum<=60){%>
				<h3><%=sum%>점으로 평생쏠로를 권장합니다.</h3>
				<%}else if(sum>60 && sum <=80) {%>
				<h3><%=sum%>점으로 살짝 위험했스무니다.</h3>
				<%}else if(sum>80 && sum <=100) {%>
				<h3><%=sum%>점으로 완벽한 연애의 고수입니다.</h3>
				<%} %>
			</div>
			</div>
		<%} %>
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