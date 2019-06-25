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
	<title>연애능력 평가</title>
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
			<h3>연애능력 평가</h3>
			</div>
			<form action="${pageContext.request.contextPath}/research/researchInfoSave.jsp" method="POST">
				<fieldset>
					<legend>1번</legend>
					<label class="control-label">연애를 잘하고 싶은 오징어씨에게 필요한 것은 무엇일까?</label>
					<div class="form-group">
						<div>
						<input type="radio" value="1" name="q1">자신감과 센스
						</div>
						<div>
						<input type="radio" value="2" name="q1">S라인과 초콜릿 복근
						</div>
						<div>
						<input type="radio" value="3" name="q1">유머감각
						</div>
						<div>
						<input type="radio" value="4" name="q1">반미감정
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>2번</legend>
					<label class="control-label">다음 중 오징어 씨에게 유리한 소개팅 시간은 언제일까요?</label>
					<div class="form-group">
						<div>
						<input type="radio" value="1" name="q2">토요일 2시
						</div>
						<div>	
						<input type="radio" value="2" name="q2">일요일 4시
						</div>
						<div>
						<input type="radio" value="3" name="q2">금요일 7시
						</div>
						<div>
						<input type="radio" value="4" name="q2">서울시
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>3번</legend>
					<label class="control-label">이성과 대화하는 것이 어색한 오징어 씨에게 추천하는 소개팅 장소는 어디일까요?</label>
					<div class="form-group">
						<div>
						<input type="radio" value="1" name="q3">사람이 많은 커피 전문점
						</div>
						<div>
						<input type="radio" value="2" name="q3">놀이동산
						</div>
						<div>
						<input type="radio" value="3" name="q3">조용한 호텔 스카이라운지
						</div>
						<div>
						<input type="radio" value="4" name="q3">멀티방
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>4번</legend>
					<label class="control-label">남자에게 먼저 데이트 신청을 하고 싶을 때 가장 좋은 표현은?</label>
					<div class="form-group">
						<div>
						<input type="radio" value="1" name="q4">솔직히 저 어떻게 생각하세요?
						</div>
						<div>
						<input type="radio" value="2" name="q4">이번 주말에 영화 보여주세요!
						</div>
						<div>
						<input type="radio" value="3" name="q4">언제쯤 결혼하고 싶으세요?
						</div>
						<div>
						<input type="radio" value="4" name="q4">명길 씨, 우리 부모님이 한번 오시래요.
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>5번</legend>
					<label class="control-label">여성에게 데이트 신청을 할 때 추천하는 표현은?</label>
					<div class="form-group">
						<div>
						<input type="radio" value="1" name="q5">시간 있으면 주말에 영화 보러 안 갈래요?
						</div>
						<div>
						<input type="radio" value="2" name="q5">우리 영화 보러 갈래요?
						</div>
						<div>
						<input type="radio" value="3" name="q5">요즘 00이 예매율 1위라는데 주말에 가요.
						</div>
						<div>
						<input type="radio" value="4" name="q5">저녁에 오빠 집에서 영화 다운받아 볼까?
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>6번</legend>
					<div>
					<label class="control-label">소개팅을 나간 오징어 씨, 상대에게 "나이가 어떻게 되세요?"라고 물었더니</label>
					</div>
					<div>
					<label class="control-label">"몇 살 처럼 보이는대요?"라고 반문한다. 어떻게 하는것이 좋을까?</label>
					</div>
					<div class="form-group">
						<div>
						<input type="radio" value="1" name="q6">도전 골든벨 퀴즈 맞추는 마음으로 맞춘다.
						</div>
						<div>
						<input type="radio" value="2" name="q6">정직하게 보이는대로 말한다.
						</div>
						<div>
						<input type="radio" value="3" name="q6">귀찮게 하지 말고 솔직하게 말하라고 말한다.
						</div>
						<div>
						<input type="radio" value="4" name="q6">보이는 것보다 5살 정도 어리게 말한다.
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>7번</legend>
					<label class="control-label">연인이 되기 전 밀고 당기기는 효과가 있을까?</label>
					<div class="form-group">
						<div>
						<input type="radio" value="1" name="q7">밀당 따위는 효과가 없다.
						</div>
						<div>
						<input type="radio" value="2" name="q7">당밀이 효과적이다.
						</div>
						<div>
						<input type="radio" value="3" name="q7">관심 없는 듯 밀어야 한다.
						</div>
						<div>
						<input type="radio" value="4" name="q7">부모님과 상의 후 결정한다.
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>8번</legend>
					<div>					
					<label class="control-label">썸타는 사람이 옷을 바꾸러 가는데 따라간 오징어 씨, 그런데</label>
					</div>
					<div>
					<label class="control-label">구매한 지 한 달이 지나 환불 다툼이 생긴 상황, 어떻게 하는 것이 좋을까?</label>
					</div>
					<div class="form-group">
						<div>
						<input type="radio" value="1" name="q8">"백화점은 땅 파서 장사 하냐?" 대신 점원에게 사과하여 나의 아름다운 인성을 과시한다.
						</div>
						<div>
						<input type="radio" value="2" name="q8">"그깟 옷 얼마나 한다고 이래?" 더 좋은 걸로 사준다.
						</div>
						<div>
						<input type="radio" value="3" name="q8">사장 나오라고 한다.
						</div>
						<div>
						<input type="radio" value="4" name="q8">청와대에 탄원서를 넣는다.
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>9번</legend>
					<div>
					<label class="control-label">사소한 싸움이 감정싸움으로 번졌다. 감정이 격해질 떄로 격해진 상황에서</label>
					</div>
					<div>
					<label class="control-label">잘 싸울 수 있는 방법은 무엇일까?</label>
					</div>
					<div class="form-group">
						<div>
						<input type="radio" value="1" name="q9">인터넷에 올려'오지라퍼'들의 평가를 받는다.
						</div>
						<div>
						<input type="radio" value="2" name="q9">25분만 따로 있는다.
						</div>
						<div>
						<input type="radio" value="3" name="q9">법대로 한다.
						</div>
						<div>
						<input type="radio" value="4" name="q9">UFC룰에 따라 공정하게 싸운다.
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>10번</legend>
					<label class="control-label">테트리스 라는 게임을 하다 보면 한쪽 끝을 비워두고 '긴 막대기'를 기다리게 된다. 그럼 게임이 어떻게 될까?</label>
					<div class="form-group">
						<div>
						<input type="radio" value="1" name="q10">끝난다
						</div>
						<div>
						<input type="radio" value="2" name="q10">더 게임이 잘된다.
						</div>
						<div>
						<input type="radio" value="3" name="q10">열 받는다
						</div>
						<div>
						<input type="radio" value="4" name="q10">게임 후 이름을 새길 수 있다.
						</div>
					</div>
				</fieldset>
				<input class="btn btn-primary" type="submit" value="답안제출">
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