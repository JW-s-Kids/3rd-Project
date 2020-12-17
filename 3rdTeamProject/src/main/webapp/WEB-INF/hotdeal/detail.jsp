<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
input.btn {
        color:#050;
        font-family:'trebuchet ms',helvetica,sans-serif, Gulim;
        font-size:84%;
        font-weight:bold;
        background-color:#fed;
        border:1px solid;
        border-top-color:#696;
        border-left-color:#696;
        border-right-color:#363;
        border-bottom-color:#363;
        padding-top:5px;
        filter:progid:DXImageTransform.Microsoft.Gradient(
                GradientType=1,StartColorStr='#ffffffff',EndColorStr='#ffeeddaa');
}
input.btnhov{
        border-top-color:#c63;
        border-left-color:#c63;
        border-right-color:#930;
        border-bottom-color:#930;
        color:#930;
}

</style>
<script type="text/javascript">
function hov(loc,cls){
        if(loc.className) loc.className=cls;
}
function chat() {
	 window.open("../chat/chat.jsp", "chat", "width=275,height=300");
}
</script>
</head>
<body>
 <div class="hero-wrap js-fullheight" style="background-image: url('../images/hotel-2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="hotel.html">Tour</a></span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">${vo.hd_name }</h1>
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
          			 <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						  <ol class="carousel-indicators">
						    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						  </ol>
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img class="d-block w-100" src="${vo.hd_img1 }" alt="First slide">
						    </div>
						    <div class="carousel-item">
						      <img class="d-block w-100" src="${vo.hd_img2 }" alt="Second slide">
						    </div>
						    <div class="carousel-item">
						      <img class="d-block w-100" src="${vo.hd_img3 }" alt="Third slide">
						    </div>
						  </div>
						  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
					</div>
          		</div>
          		<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
		            <table class="table">
		              <tr>
		               <td class="text-center">
		                <div id="map" style="width:100%;height:350px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e20dad3fe3f5c215f3d3a8df102a54a&libraries=services"></script>
					  <script>
		                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		        	    mapOption = {
		        	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        	        level: 3 // 지도의 확대 레벨
		        	    };  
		        	
		        	// 지도를 생성합니다    
		        	var map = new kakao.maps.Map(mapContainer, mapOption); 
		        	
		        	// 주소-좌표 변환 객체를 생성합니다
		        	var geocoder = new kakao.maps.services.Geocoder();
		        	
		        	// 주소로 좌표를 검색합니다
		        	geocoder.addressSearch('${vo.hd_addr2}', function(result, status) {
		        	
		        	    // 정상적으로 검색이 완료됐으면 
		        	     if (status === kakao.maps.services.Status.OK) {
		        	
		        	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        	
		        	        // 결과값으로 받은 위치를 마커로 표시합니다
		        	        var marker = new kakao.maps.Marker({
		        	            map: map,
		        	            position: coords
		        	        });
		        	
		        	        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        	        var infowindow = new kakao.maps.InfoWindow({
		        	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.hd_name}</div>'
		        	        });
		        	        infowindow.open(map, marker);
		        	
		        	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        	        map.setCenter(coords);
		        	    } 
		        	});    
		                </script>
		               </td>
		              </tr>
		            </table>
          		</div>
          		<div style="height:20px"></div>
          		 <div class="row">
				  <div class="col-md-12">
			       <table class="table">
			       <tr>
			        <td>
			          <sub style="color:black"><img src="../images/placepin.png">${vo.hd_addr2 }</sub>
			           &nbsp;&nbsp;&nbsp;&nbsp;
			          <input type="button" value="채팅으로 문의하기" class="btn" onmouseover="hov(this,'btn btnhov')" onmouseout="hov(this,'btn')" onclick="chat()"/>
			        </td>
			       </tr>
			       <br>
			       <tr> 
			        <td>
			         <h3>${vo.hd_name }</h3>
			          ${vo.hd_contents }
			        </td>
			       </tr>
			      </table>
			      <br>
			      <table class="table">
			       <tr>
			        <td width=20%>객실</td>
			        <td width=80%>${vo.hd_roomname }</td>
			       </tr>
			       <tr>
			        <td width=20%>서비스</td>
			        <td width=80%>
			        ${vo.hd_service }
			        </td>
			       </tr>
			       <tr>
			        <td width=20%>일반</td>
			        <td width=80%>${vo.hd_normal }</td>
			       </tr>
			       <tr>
			        <td width=20%>활동</td>
			        <td width=80%>${vo.hd_activity }</td>
			       </tr>
			       <tr>
			        <td width=20%>인터넷</td>
			        <td width=80%>${vo.hd_internet }</td>
			       </tr>
			       <tr>
			        <td width=20%>체크인</td>
			        <td width=80%>${vo.hd_checkin}</td>
			       </tr>
			       <tr>
			        <td width=20%>체크아웃</td>
			        <td width=80%>${vo.hd_checkout }</td>
			       </tr>
			      </table>
          	</div>
          </div>
        </div>
      </div>
    </section> 

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