<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    
    <div class="hero-wrap js-fullheight" style="background-image: url('../images/bg_4.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Tips &amp; Articles</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row d-flex">
        
        	<c:forEach var="diary_vo" items="${list }">
		          <div class="col-md-3 d-flex ftco-animate">
		            <div class="blog-entry align-self-stretch">
		              <a href="detail.do" class="block-20" style="background-image: url('../images/image_1.jpg');">
		              </a>
		              <div class="text p-4 d-block">
		              	<span class="tag">${diary_vo.tag }</span>
		                <h3 class="heading mt-3"><a href="#">${diary_vo.subject }</a></h3>
		                <div class="meta mb-3">
		                  <div><a href="#">${diary_vo.visitdate }</a></div>
		                  <div><a href="#">${diary_vo.id }</a></div>
		                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> ${vo.reply }</a></div>
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