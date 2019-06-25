<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=utf-8">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/Resource/css/bootstrap.css" rel="stylesheet">
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
				    	<a class="navbar-brand" href="${pageContext.request.contextPath}/Main.jsp">SSZ의 블로그</a>
				    </div>
				   <div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판</a>
								<ul class="dropdown-menu">
									<li><a href="${pageContext.request.contextPath}/board.jsp">자유게시판</a></li>
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
	<div class="container">
		<div class="row">
			<div class="jumbotron" style="margin-top:20px; border:1px solid;">
			<div class="mainheader" style="margin-bottom:40px;">
			<h3>평가자 정보 입력</h3>
			</div>
			<form action="${pageContext.request.contextPath}/research/researchPersonInfoSave.jsp" method="POST">
				<div class="form-group">
					<div class="row">
						<label class="control-label">성별</label>
					</div>
					<div class="row">
						<label>
							<input type="radio" name="gender" value="1">남자
						</label>
						<label>
						<input type="radio" name="gender" value="2" style="margin-left:20px;">여자
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label class="control-label">나이</label>
					</div>
					<div class="row">
						<input class="form-control" type="text" name="age" style="width:20%">
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label class="control-label">학력</label>
					</div>
					<div class="row">
						<label>
							<input type="radio" name="background" value="1">대학교 졸업 이상
						</label>
						<label>
							<input type="radio" name="background" value="2" style="margin-left:20px;">고등학교 졸업
						</label>
						<label>
							<input type="radio" name="background" value="3" style="margin-left:20px;">중학교 졸업
						</label>
						<label>
							<input type="radio" name="background" value="4" style="margin-left:20px;">초등학교 졸업
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label class="control-label">혈액형</label>
					</div>
					<div class="row">
						<label>
							<input type="radio" name="blood" value="A">A
						</label>
						<label>
							<input type="radio" name="blood" value="B" style="margin-left:20px;">B
						</label>
						<label>
							<input type="radio" name="blood" value="AB" style="margin-left:20px;">AB
						</label>
						<label>
							<input type="radio" name="blood" value="O" style="margin-left:20px;">O
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label class="control-label">결혼여부</label>
					</div>
					<div class="row">
						<label>
							<input type="radio" name="marry" value="1">결혼
						</label>
						<label>
							<input type="radio" name="marry" value="2" style="margin-left:20px;">미혼
						</label>
					</div>
				</div>
				<input class="btn btn-primary" type="submit" value="평가시작">
			</form>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/Resource/js/bootstrap.min.js"></script>
</body>
</html>