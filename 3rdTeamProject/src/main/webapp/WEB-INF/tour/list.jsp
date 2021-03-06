<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <title>DirEngine - Free Bootstrap 4 Template by Colorlib</title>
    <style type="text/css">
    .text {
    margin: 0 auto;
    height: 250px;
    }
    .d-flex {
    height: 75px;
    }
    .one0 {
    width: 220px;
    }
    .bottom-area {
    margin: 0 auto;
    }
    </style>
    <meta charset="utf-8">
   <!--  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css"> -->
  </head>
  <body>
   
    
    <div class="hero-wrap js-fullheight" style="background-image: url('../images/bg_3.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Tour</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">다양한 서울의 여행지</h1>
           <!--  <div style="position: relative;  top: 200px;">
            <p class="browse d-md-flex" >
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-fork"></i>가이드와 함께</a></span>
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-hotel"></i>부모님과 함께</a></span> 
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-meeting-point"></i>애인과 함께</a></span> 
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-shopping-bag"></i>친구와 함께</a></span>
            </p>
            </div> -->
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 sidebar ftco-animate">
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">여행지 검색</h3>
        			<form action="#">
        				<div class="fields">
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="Destination, City">
		              </div>
		             
		             
		              
		              <div class="form-group">
		                <input type="submit" value="Search" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
        		</div>
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">여행자 평점</h3>
        			<form method="post" class="star-rating">
							  <div class="form-check">
									<input type="checkbox" class="form-check-input" id="exampleCheck1">
									<label class="form-check-label" for="exampleCheck1">
										<p class="rate">
										<img src="http://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/5.0-20215-5.svg" alt="평점:5.0">
										</p>
									</label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						    	   <p class="rate">
						    	   <img src="http://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/4.0-20215-5.svg" alt="평점:4.0">
						    	   </p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate">
						      	<img src="http://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/3.0-20215-5.svg" alt="평점:3.0">
						      	</p>
						     </label>
							  </div>
							  <div class="form-check">
							    <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate">
						      	<img src="http://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/2.0-20215-5.svg" alt="평점:2.0">
						      	</p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate">
						      	<img src="http://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/1.0-20215-5.svg" alt="평점:1.0">
						      	</p>
							    </label>
							  </div>
							</form>
        		</div>
          </div>
          
<%-- /////////////// 리스트 페이지 출력 섹션 /////////////// --%>
          
          <div class="col-lg-9">
          	<div class="row"><%-- 게시물 6개씩 출력 --%>
          	 <c:forEach var="tour_vo" items="${list }">
          		<div class="col-md-4 ftco-animate">
		    				<div class="destination">
		    					<a href="../tour/detail.do?no=${tour_vo.tno }" class="img img-2 d-flex justify-content-center align-items-center">
		    						 <img src="${tour_vo.photo}" alt="여행지사진" width=100% height=100%>
		    					</a>
		    					<div class="text p-3">
		    						<div class="d-flex">
		    							<div class="one0">
				    						<h3>${tour_vo.title }</h3>
				    					</div>
				    				<c:if test="${tour_vo.site!=null }">
				    					<div class="one">
				    						<p class="rate">
				    							 <img src="${tour_vo.site}" alt="평점" style="width:100%">
				    						</p>
			    						</div>
			    					</c:if>
		    						</div>
		    						
		    						<c:choose>
									   <c:when test="${fn:length(tour_vo.content) gt 51}">
									   <c:out value="${fn:substring(tour_vo.content, 0, 50)}"/>...
									   </c:when>
									   <c:otherwise>
									   <c:out value="${tour_vo.content}"/>
									   </c:otherwise>
									</c:choose>
		    						
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
							<li><a href="../tour/list.do?page=${startpage-1 }">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${startpage }" end="${endpage }">
							<c:if test="${i==currpage }">
							<li class="active"><a href="../tour/list.do?page=${i }">${i }</a></li>
							</c:if>
							<c:if test="${i!=currpage }">
							<li><a href="../tour/list.do?page=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${endpage<totalpage }">
							<li><a href="../tour/list.do?page=${endpage+1 }">&gt;</a></li>
					</c:if>
              </ul>
            </div>
          </div>
        </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

  
  </body>
</html>