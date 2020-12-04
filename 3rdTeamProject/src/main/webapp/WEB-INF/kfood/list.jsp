<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <title>DirEngine - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
  </head>
  <body>
  
  
     <div class="hero-wrap js-fullheight" style="background-image: url('../images/kfood03.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Tour</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">맛집 순례</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg">
    
      <div class="container">
       <div class="block-17 my-4">
              <form action="" method="post" class="d-block d-flex">
                <div class="fields d-block d-flex">
                  <div class="textfield-search one-third">
                  	<input type="text" class="form-control" placeholder="오늘은 뭐먹지 ?">
                  </div>
                  <div class="select-wrap one-third">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control" placeholder="Keyword search">
                    <div><a href="../kfood/detail.do?no=${kfood_vo.kf_no }">
					                 
					                  </a></div>
                      <option value="detail.do?tag=서울">서울</option>
                      <option value="">인천</option>
                      <option value="">대전</option>
                      <option value="">대구</option>
                      <option value="">광주</option> 
                      <option value="">부산</option> 
                      <option value="">울산</option> 
                      <option value="">세종특별자치시</option> 
                      <option value="">경기도</option>
                      <option value="">강원도</option>
                      <option value="">충청도</option>
                      <option value="">경상도</option>
                      <option value="">전라도</option>
                      <option value="">제주도</option>
                       
                      
                    </select>
                  </div>
                </div>
                <input type="submit" class="search-submit btn btn-primary" value="Search">  
              </form>
            </div>
        
          	<div class="row d-flex">
          	
          		    	<c:forEach var="kfood_vo" items="${list }" varStatus="s">
					          	<div class="col-md-3 d-flex ftco-animate">
					            <div class="blog-entry align-self-stretch">
					              <a href="../kfood/detail.do?no=${kfood_vo.kf_no }" class="block-20" style="background-image: url(${kfood_vo.kf_poster });">
					              </a>
					              <div class="text p-4 d-block">
					              	<span class="tag">${kfood_vo.kf_title }</span>
					                <h3 class="heading mt-3" style="width: 205px;"><a href="../kfood/detail.do?no=${kfood_vo.kf_no }">${kfood_vo.kf_content }</a></h3>
					               <div class="meta mb-3">
					             <div><a href="../kfood/detail.do?no=${kfood_vo.kf_no }">
					                 
					                  </a></div>
					                  <div><a href="../kfood/detail.do?no=${kfood_vo.kf_no }">${kfood_vo.kf_tel }</a></div>
					                  <div><a href="../kfood/detail.do?no=${kfood_vo.kf_no }" class="meta-chat"><span class="icon-chat"></span></a></div>
					                  <div><a href="../kfood/detail.do?no=${kfood_vo.kf_zone }">${kfood_vo.kf_zone }</a></div>
					               </div>
					              </div>
					            </div>
					          </div>
					        
					    </c:forEach>
				    						<%-- <h3><a href="#">${kfood_vo.kf_title }</a></h3>
				    						<p class="rate">
				    							<i class="icon-star"></i>
				    							<i class="icon-star"></i>
				    							<i class="icon-star"></i>
				    							<i class="icon-star"></i>
				    							<i class="icon-star-o"></i>
				    							<span>8 Rating</span>
				    						</p>
			    						</div>
			    						<div class="two">
			    							<span class="price">${kfood_vo.kf_price }</span>
		    							</div>
		    						</div>
		    						<p>Far far away, behind the word mountains, far from the countries</p>
		    						<p class="days"><span>2 days 3 nights</span></p>
		    						<hr>
		    						<p class="bottom-area d-flex">
		    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
		    							<span class="ml-auto"><a href="#">Discover</a></span>
		    						</p>
		    					</div>
		    				</div>
		    			</div> --%>
		    			
		    			
		    		<!--   --------------------------- -->	
		    			
    </div>
          	<div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
               		<c:if test="${currpage>block }">
							<li><a href="../kfood/list.do?page=${startpage-1 }">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${startpage }" end="${endpage }">
							<c:if test="${i==currpage }">
							<li class="active"><a href="../kfood/list.do?page=${i }">${i }</a></li>
							</c:if>
							<c:if test="${i!=currpage }">
							<li><a href="../kfood/list.do?page=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${endpage<totalpage }">
							<li><a href="../kfood/list.do?page=${endpage+1 }">&gt;</a></li>
					</c:if>
              </ul>
            </div>
          </div>
        </div>
     </div>
    </section> <!-- .section -->

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">dirEngine</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Service</a></li>
                <li><a href="#" class="py-2 d-block">Terms and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Become a partner</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                <li><a href="#" class="py-2 d-block">How it works</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
</head>
<body>

</body>
</html>