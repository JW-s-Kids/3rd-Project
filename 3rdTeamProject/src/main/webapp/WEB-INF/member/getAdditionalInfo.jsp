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
		
		let sex=$('.sex').val();
		if(pwd.trim()=="")
		{
			alert('성별을 입력하세요');
			$('.sex').focus();
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
          			
          				<h2 style="display: inline; line-height: 40px;">처음 방문이시네요</h2>
          				<h5>추가 정보를 입력하고 가입을 완료해주세요</h5>
          			</div>
          			<form action="../member/getAdditionalInfo_ok.do" method="post" id="logFrm">
	          			<div style="width: 100%; padding: 0px 10%;">
	          				<input type="text" placeholder="아이디" name="id" style="width:100%; border: 1px solid #E5E5E5; border-radius: 5px; height:40px;" id="log_id">
	          				<div style="text-align: right; margin-top: 5px;">
	          					<input type="button" value="중복확인" id="duplication">
	          				</div>
	          				<input type="password" placeholder="비밀번호" name="pwd" style="width:100%; border: 1px solid #E5E5E5; border-radius: 5px; height:40px; margin-top: 20px;" id="log_pwd">
	          				<input type="text" placeholder="전화번호 (숫자만 입력)" name="tel" style="width:100%; border: 1px solid #E5E5E5; border-radius: 5px; height:40px; margin-top: 20px;" id="log_tel">
	          				<div style="margin-top: 20px;">
	          					<select>
	          						<c:forEach var="i" begin="1900" end="2020">
	          							<option value=${i }>${i }</option>	
	          						</c:forEach>
	          					</select>년
	          					<select>
	          						<c:forEach var="i" begin="1" end="12">
	          							<option value=${i }>${i }</option>	
	          						</c:forEach>
	          					</select>월
	          					<select>
	          						<c:forEach var="i" begin="1" end="31">
	          							<option value=${i }>${i }</option>	
	          						</c:forEach>
	          					</select>일
	          				</div>
	          				<div style="margin-top: 20px;">
	          					<input type="radio" name="sex" value="남" class="sex"> 남  
	          					<input type="radio" name="sex" value="여" class="sex"> 여  
	          				</div>
	          			</div>
	          			<input type="hidden" value="${email }" name="email">
	          			<div style="text-align: center; margin-top: 20px;">
	          				<input type="button" value="확인" id="logBtn" class="btn btn-primary" style="width: 183px; height: 45px;"></input>
	          			</div>
          			</form>
          			
          			
          			
          			<%-- <c:if test="${userId != null }">
          				<h5>로그인 완료</h5>
          				<input type="button" value="로그아웃" onclick="location.href='kakao_logout.do'">
          			</c:if> --%>
          		</div>
          	</div>
          	
        </div>
      </div>
    </section>
</body>
</html>