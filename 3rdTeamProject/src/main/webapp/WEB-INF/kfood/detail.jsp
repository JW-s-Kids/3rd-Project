<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style type="text/css">
.hotel-img {
width: 700px;
height: 500px;
margin: 0px auto;
}
</style>
  </head>
  <body>
    
  
    
    <div class="hero-wrap js-fullheight" style="background-image: url('../images/kfood03.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="hotel.html">Tour</a></span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">${kfood_vo.kf_title }</h1>
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
                  	<input type="text" class="form-control" placeholder="������ ������ ?">
                  </div>
                  <div class="select-wrap one-third">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control" placeholder="Keyword search">
                    <div><a href="../kfood/detail.do?no=${kfood_vo.kf_no }">
					                 
					                  </a></div>
                      <option value="detail.do?tag=����">����</option>
                      <option value="">��õ</option>
                      <option value="">����</option>
                      <option value="">�뱸</option>
                      <option value="">����</option> 
                      <option value="">�λ�</option> 
                      <option value="">���</option> 
                      <option value="">����Ư����ġ��</option> 
                      <option value="">��⵵</option>
                      <option value="">������</option>
                      <option value="">��û��</option>
                      <option value="">���</option>
                      <option value="">����</option>
                      <option value="">���ֵ�</option>
                       
                      
                    </select>
                  </div>
                </div>
                <input type="submit" class="search-submit btn btn-primary" value="Search">  
              </form>
            </div>
        <div class="row">
        	
          <div class="col-lg-12">
          	<div class="row">
          		<div class="col-md-12 ftco-animate">
          			<div class="single-slider owl-carousel">
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(${kfood_vo.kf_poster});"></div>
          				</div>
          			</div>
          		</div>
          		<div class="col-md-6 hotel-single mt-4 mb-5 ftco-animate">
          			<span>${kfood_vo.kf_zone }</span>
          			<h2>${kfood_vo.kf_title }&emsp;&emsp;&emsp;&emsp;${kfood_vo.kf_score }</li></h2>
          			<p class="rate mb-5">
          				<span class="loc">
          				  <i class="icon-map">${(kfood_vo.kf_addr1)}</i>
          				  <!-- ${fn:substring(tour_vo.address, 5, 50)} -->
          				</span>
          				<c:if test="${kfood_vo.kf_park }">
	          				<span class="star">
	    						<img src="${kfood_vo.kf_tel }" alt="����">
	    					</span>
	    			</c:if>
    				</p>
    						<p>${kfood_vo.kf_content }</p>
    						<div class="d-md-flex mt-5 mb-5">
    							<ul>
    								<li>�ּ�&emsp;&emsp;&emsp;&emsp;&emsp;<span>${kfood_vo.kf_addr1 }</span></li>
	    							<li>��ȭ��ȣ&emsp;&emsp;&emsp;<span>${kfood_vo.kf_tel }</span></li>
	    							<li>����&emsp;&emsp;&emsp;&emsp;&emsp;<span>${kfood_vo.kf_park }</span></li>
	    							<li>�����ð�&emsp;&emsp;&emsp;<span>${kfood_vo.kf_time }</span></li>
	    							<li>����&emsp;&emsp;&emsp;&emsp;&emsp;<span>${kfood_vo.kf_holiday }</span></li>
	    							<li>��ǥ�޴�&emsp;&emsp;&emsp;<span>${kfood_vo.kf_delemenu }</span></li>
	    							<li>����&emsp;&emsp;&emsp;&emsp;&emsp;<span>${kfood_vo.kf_togo }</span></li>
	    							<li>����&emsp;&emsp;&emsp;&emsp;&emsp;<span>${kfood_vo.kf_reserve }</span></li>
	    							
	    							
	    						</ul>
	    						
    						</div>
    						<!--  <p>${kfood_vo.kf_zone }</p>-->
          		</div>
          		<div class="col-md-6 hotel-single mt-4 mb-5 ftco-animate">
          			 <h4>�ֺ� ����</h4>
		            <table class="table">
		              <tr>
		               <td class="text-center">
		                <div id="map" style="width:100%;height:350px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2bc9a127e05847fd362986264b83197&libraries=services"></script>
					  <script>
		                var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		        	    mapOption = {
		        	        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
		        	        level: 3 // ������ Ȯ�� ����
		        	    };  
		        	
		        	// ������ �����մϴ�    
		        	var map = new kakao.maps.Map(mapContainer, mapOption); 
		        	
		        	// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
		        	var geocoder = new kakao.maps.services.Geocoder();
		        	
		        	// �ּҷ� ��ǥ�� �˻��մϴ�
		        	geocoder.addressSearch('${kfood_vo.kf_addr1 }', function(result, status) {
		        	
		        	    // ���������� �˻��� �Ϸ������ 
		        	     if (status === kakao.maps.services.Status.OK) {
		        	
		        	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        	
		        	        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
		        	        var marker = new kakao.maps.Marker({
		        	            map: map,
		        	            position: coords
		        	        });
		        	
		        	        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
		        	        var infowindow = new kakao.maps.InfoWindow({
		        	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${kfood_vo.kf_title}</div>'
		        	        });
		        	        infowindow.open(map, marker);
		        	
		        	        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
		        	        map.setCenter(coords);
		        	    } 
		        	});    
		                </script>
		               </td>
		              </tr>
		            </table>
          		</div>
          	
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-4">���� ��õ ����</h4>
          			<div class="row">
          		  <c:forEach var="kfood_vo" items="${list }"> 
          				<div class="col-md-4">
				    				<div class="destination">
				    					<a href="../kfood/detail.do?no=${kfood_vo.kf_no }" class="img img-2 d-flex justify-content-center align-items-center">
		    						 		<img src="${kfood_vo.kf_poster}" alt="���� ����" width=100% height=100%>
		    							</a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">${kfood_vo.kf_title }</a></h3>
						    					<!-- 	<c:if test="${kfood_vo.kf_score!=null }"> -->
						    						  <p class="rate">
						    						   <img src="${kfood_vo.kf_score}" alt="����" style="width:100%"> 
						    					    	  </p>
						    					<!-- 	</c:if> -->
					    						</div>
				    						</div>
				    					</div>
				    				</div>
				    			</div>
				     	</c:forEach> 
          			</div>
          		</div>
          		
          		
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
          			<h4 class="mb-4">�ֺ� ���� ��õ</h4>
          			<div class="row">
          		 	<c:forEach var="kfood_vo" items="${list }"> 
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
				    		</c:forEach>
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