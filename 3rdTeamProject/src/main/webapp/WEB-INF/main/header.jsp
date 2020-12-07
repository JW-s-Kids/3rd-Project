<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘 뭐하니?</title>
<link rel="stylesheet" type="text/css" href="../css/member/member.css?after">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="../main/main.do">오늘 뭐하니?</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item" style="color: black;"><a href="../main/main.do" class="nav-link">홈</a></li>
          <li class="nav-item" style="color: black;"><a href="../tour/list.do" class="nav-link">투어</a></li>
          <li class="nav-item" style="color: black;"><a href="../dog/parkmain.do" class="nav-link">반려견산책코스</a></li>
          <li class="nav-item" style="color: black;"><a href="../psyTest/main.do" class="nav-link">성향테스트</a></li>
          <li class="nav-item" style="color: black;"><a href="../meeting/list.do" class="nav-link"><span>자만추</span></a></li>
          <li class="nav-item" style="color: black;"><a href="../diary/list.do" class="nav-link">여행기</a></li>
          <li class="nav-item" style="color: black;"><a href="../news/list.do" class="nav-link">여행소식</a></li>
          <li class="nav-item" style="color: black;"><a href="../kfood/list.do" class="nav-link">맛집순례</a></li>
          
          <c:if test="${sessionScope.userName != null }">
          	<li class="nav-item"><a href="../member/mypage.do" class="nav-link">${sessionScope.userName }님</a></li>
          </c:if>
          <c:if test="${sessionScope.name != null }">
          	<li class="nav-item"><a href="../member/mypage.do" class="nav-link">${sessionScope.name }님</a></li>
          </c:if>
          
          
          <c:if test="${userEmail == null && sessionScope.id == null}">
          	<li class="nav-item cta"><a href="../member/login.do" class="nav-link"><span>로그인</span></a></li>
          </c:if>
          <c:if test="${userEmail != null }">
          	<li class="nav-item cta"><a href="../member/kakao_logout.do" class="nav-link"><span>로그아웃</span></a></li>
          </c:if>
          <c:if test="${sessionScope.id != null }">
          	<li class="nav-item cta"><a href="../member/logout.do" class="nav-link"><span>로그아웃</span></a></li>
          </c:if>
        </ul>
      </div>
    </div>
  </nav>
    <!-- END nav -->
    
    
</body>
</html>