<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies != null && cookies.length >0) {
		for(int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("id")){
				saveId = cookies[i].getValue();
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/Resource/css/bootstrap.css" rel="stylesheet">
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>    
	<title>MyBlog Main</title>
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
									<li><a href="${pageContext.request.contextPath}/research/researchPersonInfo.jsp">평가시작하기</a></li>
									<li><a href="${pageContext.request.contextPath}/research/Result.jsp">통계결과보기</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		<div>
			<img src="${pageContext.request.contextPath}/Resource/img/nightView2.jpg" class="img-responsive">
		</div>
	</header>
	<div class="container" id="content">
		<%if(userID == null) {%>
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="jumbotron">
					<form action="login.proc.jsp" method="post" >
						<h2 class="form-signin-heading">로그인</h2>
						<%if(saveId != null) {%>
						<input class="form-control" type="text" placeholder="아이디" name="id" maxlength="20" value="<%=saveId%>" required>
						<%}else{ %>
						<input class="form-control" type="text" placeholder="아이디" name="id" maxlength="20" required>
						<% }%>
						<input class="form-control" type="password" placeholder="비밀번호"name="password" maxlength="20" required>
						<input type="checkbox" name="saveid">아이디 기억하기 
						<div class="form-group">
							<input type="submit" value="로그인" class="btn btn-primary">
							<input type="button" value="회원가입" onclick="javascript:window.location='join.jsp'" class="btn btn-default">
						</div>
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
	  <div class="container">

      <div class="blog-header">
        <h1 class="blog-title">SSZ의 블로그</h1>
        <p class="lead blog-description">심심한대 끄적거리다 가요~</p>
      </div>

      <div class="row">
        <div class="col-sm-8 blog-main">
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
          	<ol class="carousel-indicators">
          		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          		<li data-target="#myCarousel" data-slide-to="1"></li>
          		<li data-target="#myCarousel" data-slide-to="2"></li>
          	</ol>
          	<div class="carousel-inner">
          		<div class="item active">
          			<a href="research/researchPersonInfo.jsp">
          			<img src="Resource/img/love.jpg" alt="love">
          			</a>
          			<div class="carousel-caption">
          				<h3>당신의 연애능력을 테스트해보세요!</h3>
          			</div>
          		</div>
          		<div class="item">
          			<a href="board.jsp">
          			<img src="Resource/img/board.jpg" alt="board">
          			</a>
          			<div class="carousel-caption">
          				<h3>게시판이 개설되었어요!</h3>
          			</div>
          		</div>
          		<div class="item">
          			<img src="Resource/img/spring.jpg" alt="spring">
          			<div class="carousel-caption">
          				<h3>여름이 오고 있어요</h3>
          			</div>
          		</div>
          	</div>
          	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
          		<span class="glyphicon glyphicon-chevron-left"></span>
          		<span class="sr-only">Previous</span>
          	</a>
          	<a class="right carousel-control" href="#myCarousel" data-slide="next">
          		<span class="glyphicon glyphicon-chevron-right"></span>
          		<span class="sr-only">Next</span>
          	</a>
          </div>
          <div class="blog-post">
            <h2 class="blog-post-title">Sample blog post</h2>
            <p class="blog-post-meta">January 1, 2014 by <a href="#">Mark</a></p>

            <p>This blog post shows a few different types of content that's supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>
            <hr>
            <p>Cum sociis natoque penatibus et magnis <a href="#">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>
            <blockquote>
              <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            </blockquote>
            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
            <h2>Heading</h2>
            <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
            <h3>Sub-heading</h3>
            <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
            <pre><code>Example code block</code></pre>
            <p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
            <h3>Sub-heading</h3>
            <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <ul>
              <li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>
              <li>Donec id elit non mi porta gravida at eget metus.</li>
              <li>Nulla vitae elit libero, a pharetra augue.</li>
            </ul>
            <p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>
            <ol>
              <li>Vestibulum id ligula porta felis euismod semper.</li>
              <li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>
              <li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>
            </ol>
            <p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>
          </div><!-- /.blog-post -->

          <div class="blog-post">
            <h2 class="blog-post-title">Another blog post</h2>
            <p class="blog-post-meta">December 23, 2013 by <a href="#">Jacob</a></p>

            <p>Cum sociis natoque penatibus et magnis <a href="#">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>
            <blockquote>
              <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            </blockquote>
            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
            <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
          </div><!-- /.blog-post -->

          <div class="blog-post">
            <h2 class="blog-post-title">New feature</h2>
            <p class="blog-post-meta">December 14, 2013 by <a href="#">Chris</a></p>

            <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <ul>
              <li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>
              <li>Donec id elit non mi porta gravida at eget metus.</li>
              <li>Nulla vitae elit libero, a pharetra augue.</li>
            </ul>
            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
            <p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>
          </div><!-- /.blog-post -->
         </div>
        </div>
        </div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/Resource/js/bootstrap.min.js"></script>
</body>
</html>