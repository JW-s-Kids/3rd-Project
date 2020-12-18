<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <title>DirEngine - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="../stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="../stylesheet" href="css/animate.css">
    
    <link rel="../stylesheet" href="css/owl.carousel.min.css">
    <link rel="../stylesheet" href="css/owl.theme.default.min.css">
    <link rel="../stylesheet" href="css/magnific-popup.css">

    <link rel="../stylesheet" href="css/aos.css">

    <link rel="../stylesheet" href="css/ionicons.min.css">

    <link rel="../stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="../stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="../stylesheet" href="css/flaticon.css">
    <link rel="../stylesheet" href="css/icomoon.css">
    <link rel="../stylesheet" href="css/style.css"> -->
  </head>
  <body>
    
    
    <div class="hero-wrap js-fullheight" style="background-image: url('../images/diary_image.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html"><!-- Home --></a></span> <span><!-- Blog --></span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">여행기</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section bg-light">
      <div class="container">
      	
      	<div style="height: 100px; margin: 0px auto; text-align: center;">
      		<form action="../diary/search.do">
              <div class="form-group" style="width:30%; text-align: center; margin: 0px auto; display: inline-block;">
                <span class="icon fa fa-search"></span>
                <input type="text" class="form-control" placeholder="검색어를 입력하세요." name="search_keyword">
              </div>
              <input type="submit" value="검색" class="btn btn-primary" style="height: 50px; border-radius: 3px;">
            </form>
      	</div>
      	
      	<div style="height: 60px; margin: 0px auto; text-align: right;">
      		<c:if test="${sessionScope.id != null || sessionScope.userEmail != null }">
      			<input type="button" class="btn btn-primary" value="여행기 작성" onclick="location.href='../diary/insert.do'">
      		</c:if>
      	</div>
      
        <div class="row d-flex">
        
        	<c:forEach var="diary_vo" items="${list }" varStatus="s">
		          <div class="col-md-3 d-flex ftco-animate">
		            <div class="blog-entry align-self-stretch">
		              <%-- <a href="../diary/detail_before.do?no=${diary_vo.no }" class="block-20" style="background-image: url('../images/diary_${s.count}.jpg');"> --%>
		              <a href="../diary/detail_before.do?no=${diary_vo.no }" class="block-20">
		              		<img src="${diary_vo.thumbnail }" style="width: 100%; height: 100%;">
		              </a>
		              <div class="text p-4 d-block">
		              	<span class="tag">${diary_vo.tag }</span>
		                <h3 class="heading mt-3" style="width: 205px;"><a href="../diary/detail_before.do?no=${diary_vo.no }">${diary_vo.subject }</a></h3>
		                <div class="meta mb-3">
		                  <div><a href="../diary/detail_before.do?no=${diary_vo.no }">
		                  	<fmt:formatDate value="${diary_vo.visitdate }" pattern="yyyy-MM-dd"/>
		                  </a></div>
		                  <div><a href="#">${diary_vo.id }</a></div>
		                  <div><a href="../diary/detail_before.do?no=${diary_vo.no }" class="meta-chat"><span class="icon-chat"></span>${diary_vo.reply }</a></div>
		                </div>
		              </div>
		            </div>
		          </div>
		    </c:forEach>
          
          
          
          
          
        </div>
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
               		<c:if test="${currpage>block }">
							<li><a href="../diary/list.do?page=${startpage-1 }">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${startpage }" end="${endpage }">
							<c:if test="${i==currpage }">
							<li class="active"><a href="../diary/list.do?page=${i }">${i }</a></li>
							</c:if>
							<c:if test="${i!=currpage }">
							<li><a href="../diary/list.do?page=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${endpage<totalpage }">
							<li><a href="../diary/list.do?page=${endpage+1 }">&gt;</a></li>
					</c:if>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
  </body>
</html>