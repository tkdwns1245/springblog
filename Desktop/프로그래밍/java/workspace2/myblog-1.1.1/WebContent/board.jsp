<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="myblog.BoardDao" %>
<%@ page import="myblog.Bbs" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	BoardDao dao = BoardDao.getInstance();
%>
<%
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;	//전체 게시글 행의 수
	int number = 0;
	ArrayList<Bbs> articleList = null;
	count = dao.getArticleCount();
	if(count > 0 ){
		articleList = dao.getArticleList(startRow, endRow);//시작 행에서 마지막 행까지 행을 리스트에 받아온다.
	}
	number  = count - (currentPage-1) * pageSize;	//게시판 표시번호
%>
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
		<div class="container" id="content" style="text-align:center;">
			    <div class="blog-header" style="margin-bottom:50px;">
			      <h1 class="blog-title">자유게시판</h1>
			    </div>
      		<div class="row" >
      			<div class="col-sm-2" ></div>
        		<div class="col-sm-8 blog-main">
					<div class="blog-post">
					<table class="table table-striped table-bordered table-hover">
					<thead>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</thead>
					<%
						for(int i = 0 ; i < articleList.size(); i++){
							Bbs article = (Bbs)articleList.get(i);
					%>
					<tbody>
						<td> <%= number-- %></td>
						<td>
						<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage%>"><%= article.getTitle() %></a>
						</td>
						<td>
							<a><%= article.getId() %></a>
						</td>
						<td><%= sdf.format(article.getRegdate()) %></td>
						<td><%= article.getReadcount() %></td>
					</tbody>
					<% } %>
					</table>
					</div>
					<div class="row">
					<%
						if(count >0) {
							int pageBlock = 2;
							int imsi = count % pageSize == 0 ? 0 : 1;
							int pageCount = count / pageSize + imsi;	//총 페이지 수
							int startPage = (int)((currentPage-1) / pageBlock) * pageBlock + 1;//현제 페이지가 1+5의 배수일 때마다 시작 페이지 갱신
							int endPage = startPage + pageBlock - 1;
							if( endPage > pageCount) endPage = pageCount;//페이지 마지막번호가 pageCount보다 작으면 endpage = pagecount
							if(startPage > pageBlock) { %>
							<a href="board.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
					<%
						}
						for(int i = startPage; i <= endPage; i++){ %>
						<a href="board.jsp?pageNum=<%=i%>">[<%=i%>]</a>
					<% 
						}
						if(endPage < pageCount) { %>
						<a href="board.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
					<%
						}
						}
					%>
					<input class="col-lg-2 btn btn-primary" type="button" onClick="javascript:window.location='writeForm.jsp'" style= "float:left;"value="글쓰기"></input>
					</div>
				</div>
			</div>
		</div>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Resource/js/bootstrap.min.js"></script>
</body>
</html>