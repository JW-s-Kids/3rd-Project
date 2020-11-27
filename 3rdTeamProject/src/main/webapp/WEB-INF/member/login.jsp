<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/project_css/member.css?after">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#log_id').val();
		if(id.trim()=="")
		{
			alert('아이디를 입력하세요');
			$('#log_id').focus();
			return;
		}
		
		let pwd=$('#log_pwd').val();
		if(pwd.trim()=="")
		{
			alert('비밀번호를 입력하세요');
			$('#log_pwd').focus();
			return;
		}
		$('#logFrm').submit(); 
	});
});
</script>
</head>
<body>

	<div class="hero-wrap js-fullheight" style="background-image: url('../images/bg_4.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">로그인</h1>
          </div>
        </div>
      </div>
    </div>
	
	<section class="ftco-section bg-light">
      <div class="container">
        <div class="row d-flex">
          	<div class="login_box">
          		<div class="box_in_login_box">
          			<div style="text-align: center; height:40px; line-height: 40px; margin-top: 50px;margin-bottom: 100px;">
          			<img src="../images/today.png" style="width:40px; height:40px; line-height: 40px;">&nbsp;&nbsp;&nbsp;&nbsp;
          			<h2 style="display: inline; line-height: 40px;">오늘 뭐하니?</h2>
          			</div>
          			<form action="../member/login_ok.do" method="post" id="logFrm">
	          			<div style="width: 100%; padding: 0px 10%;">
	          				<input type="text" placeholder="아이디" name="id" style="width:100%; border: 1px solid #E5E5E5; border-radius: 5px; height:40px;" id="log_id">
	          				<input type="password" placeholder="비밀번호" name="pwd" style="width:100%; border: 1px solid #E5E5E5; border-radius: 5px; height:40px; margin-top: 50px;" id="log_pwd">
	          			</div>
	          			<div style="text-align: center; margin-top: 20px;">
	          				<input type="button" value="로그인" id="logBtn" class="btn btn-primary" style="width: 183px; height: 45px;"></input>
	          			</div>
          			</form>
          			<div style="margin-top: 20px; text-align: center;">
          				         				
          				<c:if test="${userEmail == null }">
	          				<a href="https://kauth.kakao.com/oauth/authorize?client_id=b680389f36f31c90bbb5aea9d43841d6&redirect_uri=http://localhost:8064/web/member/kakao_login.do&response_type=code">
	          					<img src="../images/kakao_login_medium_narrow.png">
	          				</a>
          			</c:if>
          			</div>
          			<div style="margin-top:60px; border-top: 1px solid #E5E5E5; text-align: right; padding-top: 5px;">
          				<p>아직 계정이 없으신가요?&nbsp;&nbsp;<a class="all_a_tag" href="../member/join.do">회원가입</a></p>
          			</div>
          			
          			<%-- <c:if test="${userId != null }">
          				<h5>로그인 완료</h5>
          				<input type="button" value="로그아웃" onclick="location.href='kakao_logout.do'">
          			</c:if> --%>
          		</div>
          	</div>
          	
        </div>
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
</body>
</html>