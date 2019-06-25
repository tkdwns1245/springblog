<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="myblog.BoardDao" %>
<%@ page import="myblog.Bbs" %>
<%@ page import="myblog.Comment" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%
	BoardDao dao = BoardDao.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	Bbs article = dao.getArticle(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	ArrayList<Comment> commentList = dao.getCommentList(num);
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
	<div class="container" id="content">
		<%if(userID == null) {%>
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="jumbotron">
					<form action="login.proc.jsp" method="post" >
						<h2 class="form-signin-heading">로그인</h2>
						<input class="form-control" type="text" placeholder="아이디" name="id" maxlength="20" required>
						<input class="form-control" type="password" placeholder="비밀번호"name="password" maxlength="20" required>
						<tr>
							<td><input type="submit" value="확인">
							<input type="button" value="회원가입" onclick="javascript:window.location='join.jsp'"></td>
						</tr>
					</form>
				</div>
			</div>
		<%} else {%>
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="jumbotron">
					<form>
					<h4 class="form-signin-heading"><%=userID%>님 반갑습니다.</h2>
					<input type="button" value="정보수정" class="btn btn-default" onClick="javascript:window.location='update.jsp'">
					<input type="button" value="로그아웃" class="btn btn-default" onClick="javascript:window.location='logout.proc.jsp'">
					</form>
				</div>
			</div>
		<%} %>
		<div class="container" id="main">
			<div class="blog-header" style="margin-bottom:50px; text-align:center">
		    	<h1 class="blog-title">자유게시판</h1>
			</div>
      		<div class="row">
        		<div class="col-sm-8 blog-main">
					<div class="blog-post">
					<form>
						<table class="table table-striped table-bordered">
							<tr>
								<th>글 번호</th>
								<td><%= article.getNum() %></td>
								<th>조회수</th>
								<td><%= article.getReadcount() %></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><%= article.getId() %></td>
								<th>작성일</th>
								<td><%= article.getRegdate() %></td>
							</tr>
							<tr>
								<th>글제목</th>
								<td colspan="3" class="contenttitle>"><%=article.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
							</tr>
							<tr>
								<th>글내용</th>
								<td colspan="3" class="content" style="height:200px;"><%= article.getContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
							</tr>
							<tr>
						</table>
					<%if(article.getId().equals(userID)) { %>
						<input class="btn btn-primary" type="button" value="글수정"
						onClick="document.location.href=
						'updateBbsForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
							&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btn btn-default" type="button" value="글삭제"
						onClick="document.location.href=
						'deleteBbs.proc.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
						    &nbsp;&nbsp;&nbsp;&nbsp;	
						<input class="btn btn-default" type="button" value="글목록"
							onClick="document.location.href=
							'board.jsp?pageNum=<%=pageNum%>'">
					<%}else{ %>
						<input type="button" value="글목록"
						onClick="document.location.href=
						'board.jsp?pageNum=<%=pageNum%>'">
					<%} %>
					</form>
				</div>
				<div class="jumbotron">
				<% ArrayList<Comment> cList = dao.getCommentList(article.getNum());
						for(int i = 0 ; i< cList.size(); i ++){ %>
						<div class="form-group">
							<label><%=cList.get(i).getId() %></label><br>
							<label><%=cList.get(i).getContent() %></label><br>
							<label><%=sdf.format(cList.get(i).getRegdate()) %></label>
							<%if(cList.get(i).getId().equals(userID)){ %>
							<input class="btn btn-primary" type="button" value="삭제" onClick="javascript:location.href='deleteComment.proc.jsp?cnum=<%=cList.get(i).getCnum()%>&bnum=<%=num%>&pageNum=<%=pageNum%>'">
							<%} %>
						</div>
						<%} %>
				<%if(userID !=null){ %>
					<div class="form-group">
						<form action="comment.proc.jsp" method="POST">
						<label><input class="form-control" type="text" value="<%=userID%>" disabled></label><br>
						<textarea class="form-control" name="content" cols="100" rows="3" ></textarea><br>
						<input name="bnum" value="<%= article.getNum()%>" hidden>
						<input name="id" value="<%=userID%>" hidden>
						<input class="btn btn-primary" type="submit" value="등록">
						<input name="pageNum" value="<%=pageNum%>" hidden>
						</form>
					</div>
				<%} %>
				</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</article>
</section>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Resource/js/bootstrap.min.js"></script>
</body>
</html>