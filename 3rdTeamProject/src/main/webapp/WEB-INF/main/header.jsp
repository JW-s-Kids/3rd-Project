<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index.html">dirEngine.</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active"><a href="../main/main.do" class="nav-link">홈</a></li>
          <li class="nav-item"><a href="../tour/list.do" class="nav-link">투어</a></li>
          <li class="nav-item"><a href="tour.html" class="nav-link">Tour</a></li>
          <li class="nav-item"><a href="../psyTest/main.do" class="nav-link">성향테스트</a></li>
          <li class="nav-item"><a href="../diary/list.do" class="nav-link">여행기</a></li>
          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
          <c:if test="${userId == null }">
          	<li class="nav-item cta"><a href="../member/login.do" class="nav-link"><span>로그인</span></a></li>
          </c:if>
          <c:if test="${userId != null }">
          	<li class="nav-item cta"><a href="../member/kakao_logout.do" class="nav-link"><span>로그아웃</span></a></li>
          </c:if>
        </ul>
      </div>
    </div>
  </nav>
    <!-- END nav -->
    
    
</body>
</html>