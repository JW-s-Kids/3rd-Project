<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>DirEngine - Free Bootstrap 4 Template by Colorlib</title>
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
    
  
    
    <div class="hero-wrap js-fullheight" style="background-image: url('../images/bg_5.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="hotel.html">Hotel</a></span> <span>Hotel Single</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hotels Details</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	
          <div class="col-lg-12">
          	<div class="row">
          		<div class="col-md-12 ftco-animate">
          			<div class="single-slider owl-carousel">
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(${tour_vo.photo});"></div>
          				</div>
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(../images/hotel-3.jpg);"></div>
          				</div>
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(../images/hotel-4.jpg);"></div>
          				</div>
          			</div>
          		</div>
          		<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
          			<span>${tour_vo.thema }</span>
          			<h2>${tour_vo.title }</h2>
          			<p class="rate mb-5">
          				<span class="loc"><a href="#"><i class="icon-map"></i>${tour_vo.address }</a></span>
          				<span class="star">
    						<img src="${tour_vo.site}" alt="평점">
    					</span>
    						</p>
    						<p>${tour_vo.content }</p>
    						<div class="d-md-flex mt-5 mb-5">
    							<ul>
    								<li>${tour_vo.tel }</li>
	    							<li>${tour_vo.bday }</li>
	    							<li>${tour_vo.bhour }</li>
	    							<li>${tour_vo.notice }</li>
	    							<li>${tour_vo.trans }</li>
	    						</ul>
	    						
    						</div>
    						<p>${tour_vo.tag }</p>
          		</div>
          	
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-4">연관 추천 정보</h4>
          			<div class="row">
          				<div class="col-md-4">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2" style="background-image: url(../images/room-4.jpg);"></a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
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
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<div class="col-md-4">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2" style="background-image: url(../images/room-5.jpg);"></a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
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
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<div class="col-md-4">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2" style="background-image: url(../images/room-6.jpg);"></a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
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
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
          			</div>
          		</div>
          		
          		
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
          			<h4 class="mb-4">주변 맛집 추천</h4>
          			<div class="row">
          				<div class="col-md-4">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2" style="background-image: url(../images/hotel-1.jpg);"></a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
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
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<div class="col-md-4">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2" style="background-image: url(../images/hotel-2.jpg);"></a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
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
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<div class="col-md-4">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2" style="background-image: url(../images/hotel-3.jpg);"></a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
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
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
          			</div>
          		</div>

          	</div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

  


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>