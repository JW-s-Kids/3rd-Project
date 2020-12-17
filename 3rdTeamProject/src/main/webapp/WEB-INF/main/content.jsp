<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'post',
		url: '../main/tour.do',
		datatype: 'html',
		success: function(result){
			$('#print_tour').html(result);
		}
	});
});
</script> -->
</head>
<body>
	
	
	<div class="hero-wrap js-fullheight" style="background-image: url('../images/main_image.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>오늘<br></strong>뭐하니?</h1>
            <!-- <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">네이버 검색</p> -->
            <div style="height: 100px;"></div>
            <div class="block-17 my-4" style="background: none;">
              <!-- <form action="" method="post" class="d-block d-flex">
                <div class="fields d-block d-flex">
                  <div class="textfield-search one-third">
                  	<input type="text" class="form-control" placeholder="통합 검색">
                  </div>
                  <div class="select-wrap one-third">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control" placeholder="Keyword search">
                      <option value="">강동구</option>
                      <option value="">San Francisco USA</option>
                      <option value="">Berlin Germany</option>
                      <option value="">Lodon United Kingdom</option>
                      <option value="">Paris Italy</option>
                    </select>
                  </div>
                </div>
                  
              </form> -->
              
              <input type="button" class="btn btn-primary" value="통합 검색" style="width:400px; height:60px; border-radius: none; font-size: 12pt;" onclick="location.href='../main/totalsearch.do'">
            </div>
            <!-- <p>Or browse the highlights</p>
            <p class="browse d-md-flex">
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-fork"></i>Restaurant</a></span>
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-hotel"></i>Hotel</a></span> 
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-meeting-point"></i>Places</a></span> 
            	<span class="d-flex justify-content-md-center align-items-md-	center"><a href="#"><i class="flaticon-shopping-bag"></i>Shopping</a></span>
            </p> -->
          </div>
        </div>
      </div>
    </div>



<!-- 메인페이지 사진 바로 아래 ------------------------------------------------------------------------------------------------------------------------------ -->
	<!-- <section class="ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-guarantee"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Best Price Guarantee</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-like"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Travellers Love Us</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-detective"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Best Travel Agent</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-support"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Our Dedicated Support</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section> -->
    
    
<!-- 여행지 리스트 -------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
    <section class="ftco-section bg-light">
    	<div class="container">
				<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<span class="subheading">투어</span>
            <h2 class="mb-4"><strong>어디 </strong>갈래?</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    		<div class="row" id="print_tour">																	<!-- 여행지 출력하는 영역 -->
    			<c:forEach var="tour_vo" items="${tour_list }">
	    			<div class="col-sm col-md-6 col-lg ftco-animate">
	    				<div class="destination">
	    					<a href="../tour/detail.do?no=${tour_vo.tno }" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${tour_vo.photo});">		<!-- ../images/destination-1.jpg -->
	    						<div class="icon d-flex justify-content-center align-items-center">
	    							<span class="icon-search2"></span>
	    						</div>
	    					</a>
	    					<div class="text p-3">
	    						<div class="d-flex">
	    							<div class="one">
			    						<h3><a href="../tour/detail.do?no=${tour_vo.tno }">
		    									<c:if test="${fn:length(tour_vo.title)>12 }">											<!-- 이용시간 -->
						              				<span>${fn:substring(tour_vo.title, 0, 12) }...</span>
						              			</c:if>
						              			<c:if test="${fn:length(tour_vo.title)<=12 }">
						              				<span>${tour_vo.title}</span>
						              			</c:if>
			    						</a></h3>
			    						<!-- <p class="rate">
			    							<i class="icon-star"></i>
			    							<i class="icon-star"></i>
			    							<i class="icon-star"></i>
			    							<i class="icon-star"></i>
			    							<i class="icon-star-o"></i>
			    							<span>8 Rating</span>
			    						</p> -->
		    						</div>
		    						<div class="two">
		    							<span class="price" style="font-size: 7pt;">${tour_vo.thema }</span>
	    							</div>
	    						</div>
	    						<p>
	    										<c:if test="${fn:length(tour_vo.content)>45 }">											<!-- 설명 -->
						              				<span>${fn:substring(tour_vo.content, 0, 45) }...</span>
						              			</c:if>
						              			<c:if test="${fn:length(tour_vo.content)<=45 }">
						              				<span>${tour_vo.content}</span>
						              			</c:if>
	    						</p>
	    						<p class="days"><span>
					    						<c:if test="${fn:length(tour_vo.bhour)>27 }">											<!-- 이용시간 -->
						              				<span>${fn:substring(tour_vo.bhour, 0, 27) }...</span>
						              			</c:if>
						              			<c:if test="${fn:length(tour_vo.bhour)<=27 }">
						              				<span>${tour_vo.bhour}</span>
						              			</c:if>
	    						</span></p>
	    						<hr>
	    						<p class="bottom-area d-flex">
	    							<span><i class="icon-map-o"></i>
				    							<c:if test="${fn:length(tour_vo.address)>16 }">											<!-- 주소 -->
						              				<span>${fn:substring(tour_vo.address, 0, 16) }...</span>
						              			</c:if>
						              			<c:if test="${fn:length(tour_vo.address)<=16 }">
						              				<span>${tour_vo.address}</span>
						              			</c:if>
	    							</span> 
	    							<span class="ml-auto"><a href="#">찾아가기</a></span>
	    						</p>
	    					</div>
	    				</div>
	    			</div>
	    	</c:forEach>																				
    		</div>
    	</div>
    </section>





<!-- 반려동물 산책 코스 ----------------------------------------------------------------------------------------------------------------------------------------------- -->
    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<span class="subheading">반려동물 산책코스</span>
            <h2 class="mb-4"><strong>반려동물과</strong> 함께</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    		<div class="row">
    		
    		
		    			<c:forEach var="park_vo" items="${park_list }">
			    			<div class="col-sm col-md-6 col-lg ftco-animate">
			    				<div class="destination">
			    					<a href="../dog/parkdetail.do?no=${park_vo.no }" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${park_vo.img});">		<!-- ../images/destination-1.jpg -->
			    						<div class="icon d-flex justify-content-center align-items-center">
			    							<span class="icon-search2"></span>
			    						</div>
			    					</a>
			    					<div class="text p-3">
			    						<div class="d-flex">
			    							<div class="one">
					    						<h3><a href="../dog/parkdetail.do?no=${park_vo.no }">
				    									<c:if test="${fn:length(park_vo.name)>12 }">											<!-- 이름 -->
								              				<span>${fn:substring(park_vo.name, 0, 12) }...</span>
								              			</c:if>
								              			<c:if test="${fn:length(park_vo.name)<=12 }">
								              				<span>${park_vo.name}</span>
								              			</c:if>
					    						</a></h3>
					    						<!-- <p class="rate">
					    							<i class="icon-star"></i>
					    							<i class="icon-star"></i>
					    							<i class="icon-star"></i>
					    							<i class="icon-star"></i>
					    							<i class="icon-star-o"></i>
					    							<span>8 Rating</span>
					    						</p> -->
				    						</div>
				    						<div class="two">
				    							<span class="price" style="font-size: 7pt;">${park_vo.zone }</span>
			    							</div>
			    						</div>
			    						<p>
			    										<c:if test="${fn:length(park_vo.content)>45 }">											<!-- 설명 -->
								              				<span>${fn:substring(park_vo.content, 0, 45) }...</span>
								              			</c:if>
								              			<c:if test="${fn:length(park_vo.content)<=45 }">
								              				<span>${tour_vo.content}</span>
								              			</c:if>
			    						</p>
			    						<p class="days"><span>산책 시간 &nbsp;
							    						<c:if test="${fn:length(park_vo.time)>27 }">											<!-- 산책 소요시간 -->
								              				<span>${fn:substring(park_vo.time, 0, 27) }...</span>
								              			</c:if>
								              			<c:if test="${fn:length(park_vo.time)<=27 }">
								              				<span>${park_vo.time}</span>
								              			</c:if>
			    						</span></p>
			    						<hr>
			    						<p class="bottom-area d-flex">
			    							<span><i class="icon-map-o"></i>
						    							<c:if test="${fn:length(park_vo.addr)>16 }">											<!-- 주소 -->
								              				<span>${fn:substring(park_vo.addr, 0, 16) }...</span>
								              			</c:if>
								              			<c:if test="${fn:length(park_vo.addr)<=16 }">
								              				<span>${park_vo.addr}</span>
								              			</c:if>
			    							</span> 
			    							<span class="ml-auto"><a href="#">찾아가기</a></span>
			    						</p>
			    					</div>
			    				</div>
			    			</div>
			    		</c:forEach>
    			
    			
    		</div>
    	</div>
    </section>

    <!-- <section class="ftco-section testimony-section bg-light">
      <div class="container">
        <div class="row justify-content-start">
          <div class="col-md-5 heading-section ftco-animate">
          	<span class="subheading">Best Directory Website</span>
            <h2 class="mb-4 pb-3"><strong>Why</strong> Choose Us?</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.</p>
            <p><a href="#" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3">Read more</a></p>
          </div>
					<div class="col-md-1"></div>
          <div class="col-md-6 heading-section ftco-animate">
          	<span class="subheading">Testimony</span>
            <h2 class="mb-4 pb-3"><strong>Our</strong> Guests Says</h2>
          	<div class="row ftco-animate">
		          <div class="col-md-12">
		            <div class="carousel-testimony owl-carousel">
		              <div class="item">
		                <div class="testimony-wrap d-flex">
		                  <div class="user-img mb-5" style="background-image: url(../images/person_1.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
		                  </div>
		                  <div class="text ml-md-4">
		                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                    <p class="name">Dennis Green</p>
		                    <span class="position">Guest from italy</span>
		                  </div>
		                </div>
		              </div>
		              <div class="item">
		                <div class="testimony-wrap d-flex">
		                  <div class="user-img mb-5" style="background-image: url(../images/person_2.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
		                  </div>
		                  <div class="text ml-md-4">
		                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                    <p class="name">Dennis Green</p>
		                    <span class="position">Guest from London</span>
		                  </div>
		                </div>
		              </div>
		              <div class="item">
		                <div class="testimony-wrap d-flex">
		                  <div class="user-img mb-5" style="background-image: url(../images/person_3.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
		                  </div>
		                  <div class="text ml-md-4">
		                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                    <p class="name">Dennis Green</p>
		                    <span class="position">Guest from Philippines</span>
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
          </div>
        </div>
      </div>
    </section> -->

    <!-- <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<span class="subheading">Special Offers</span>
            <h2 class="mb-4"><strong>Popular</strong> Restaurants</h2>
          </div>
        </div>    		
    		<div class="row">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../images/restaurant-1.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<h3><a href="#">Luxury Restaurant</a></h3>
    						<p class="rate">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							<span>8 Rating</span>
    						</p>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../images/restaurant-2.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<h3><a href="#">Luxury Restaurant</a></h3>
    						<p class="rate">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							<span>8 Rating</span>
    						</p>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Book Now</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../images/restaurant-3.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<h3><a href="#">Luxury Restaurant</a></h3>
    						<p class="rate">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							<span>8 Rating</span>
    						</p>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Book Now</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../images/restaurant-4.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<h3><a href="#">Luxury Restaurant</a></h3>
    						<p class="rate">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							<span>8 Rating</span>
    						</p>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Book Now</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section> -->



<!-- 수치들 나오는 곳 ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->
    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(../images/main_tower.jpeg);">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4"><!-- Some fun facts --></h2>
            <!-- <span class="subheading">More than 100,000 websites hosted</span> -->
          </div>
        </div>
    		<div class="row justify-content-center">
    			<div class="col-md-10">
		    		<div class="row" style="margin: 0px auto;">
		          <!-- <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="100000">0</strong>
		                <span>Happy Customers</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="40000">0</strong>
		                <span>Destination Places</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="87000">0</strong>
		                <span>Hotels</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="56400">0</strong>
		                <span>Restaurant</span>
		              </div>
		            </div>
		          </div> -->
		          <div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">모임 찾기</h3>
        			<form action="../meeting/find.do">
        				<div class="fields">
			              <div class="form-group">
			                <input type="text" class="form-control" placeholder="모임 이름 검색" name="fmname">
			              </div>
			              <div class="form-group">
			                <input type="submit" value="검색" class="btn btn-primary py-3 px-5">
			              </div>
		            	</div>
	            	</form>
        		</div>
		          
		        </div>
	        </div>
        </div>
    	</div>
    </section>


<!-- 여행기 -------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
            <span class="subheading">여행기</span>
            <h2><strong>여행 후기 </strong>궁금해?</h2>
          </div>
        </div>
        <div class="row d-flex">
        
        	<c:forEach var="diary_vo" items="${diary_list }" varStatus="s">
		          <div class="col-md-3 d-flex ftco-animate">
		            <div class="blog-entry align-self-stretch">
		              <a href="../diary/detail.do?no=${diary_vo.no }" class="block-20" style="background-image: url('../images/diary_${s.count}.jpg');">
		              </a>
		              <div class="text p-4 d-block">
		              	<span class="tag">${diary_vo.tag }</span>
		                <h3 class="heading mt-3" style="width: 205px;"><a href="../diary.detail.do?no=${diary_vo.no }">
									<c:if test="${fn:length(diary_vo.subject)>20 }">											<!-- 제목 -->
			              				<span>${fn:substring(diary_vo.subject, 0, 20) }...</span>
			              			</c:if>
			              			<c:if test="${fn:length(diary_vo.subject)<=20 }">
			              				<span>${diary_vo.subject}</span>
			              			</c:if>
						</a></h3>
		                <div class="meta mb-3">
		                  <div><a href="#">
		                  			<fmt:formatDate value="${diary_vo.visitdate }" pattern="yyyy-MM-dd"/>
		                  </a></div>
		                  <div><a href="#">${diary_vo.id }</a></div>
		                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span>${diary_vo.reply}</a></div>
		                </div>
		              </div>
		            </div>
		          </div>
          	</c:forEach>
          
          
        </div>
      </div>
    </section>
    
    
    



<!-- 맛집순례 -------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
            <span class="subheading">맛집</span>
            <h2><strong>맛있는거 </strong>땡기지 않아?</h2>
          </div>
        </div>
        <div class="row d-flex">
        
        	<c:forEach var="kfood_vo" items="${kfood_list }" varStatus="s">
			          	<div class="col-md-3 d-flex ftco-animate">
			            <div class="blog-entry align-self-stretch">
			              <a href="../kfood/detail_before.do?no=${kfood_vo.kf_no }" class="block-20" style="background-image: url(${kfood_vo.kf_poster });">
			              </a>
			              <div class="text p-4 d-block">
			              	<span class="tag">${kfood_vo.kf_title }</span>
			                <h3 class="heading mt-3" style="width: 205px;"><a href="../kfood/detail_before.do?no=${kfood_vo.kf_no }">
								<c:if test="${fn:length(kfood_vo.kf_content)>20 }">											<!-- 제목 -->
		              				<span>${fn:substring(kfood_vo.kf_content, 0, 20) }...</span>
		              			</c:if>
		              			<c:if test="${fn:length(kfood_vo.kf_content)<=20 }">
		              				<span>${kfood_vo.kf_content}</span>
		              			</c:if>
							</a></h3>
			               <div class="meta mb-3">
			             <div><a href="../kfood/detail_before.do?no=${kfood_vo.kf_no }">
			                 
			                  </a></div>
			                  <div><a href="../kfood/detail_before.do?no=${kfood_vo.kf_no }">${kfood_vo.kf_tel }</a></div>
			                  <div><a href="../kfood/detail_before.do?no=${kfood_vo.kf_no }" class="meta-chat"><span class="icon-chat"></span></a></div>
			                  <div><a href="../kfood/detail_before.do?no=${kfood_vo.kf_zone }">${kfood_vo.kf_zone }</a></div>
			               </div>
			              </div>
			            </div>
			          </div>
			        
			    </c:forEach>
          
          
        </div>
      </div>
    </section>
		
		<!-- <section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
              <h2>Subcribe to our Newsletter</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
              <div class="row d-flex justify-content-center mt-5">
                <div class="col-md-8">
                  <form action="#" class="subscribe-form">
                    <div class="form-group d-flex">
                      <input type="text" class="form-control" placeholder="Enter email address">
                      <input type="submit" value="Subscribe" class="submit px-3">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->
</body>
</html>