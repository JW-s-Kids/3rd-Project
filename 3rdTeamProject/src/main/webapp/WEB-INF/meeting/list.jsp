<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0067df060323083578dddb15ed33ea0c"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

//지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);




// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
});
</script>
</head>
<body>
    
    <div class="hero-wrap js-fullheight" style="background-image: url('../images/bg_5.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Hotel</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hotels</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        <!-- 사이드바 영역======================================================================= -->
        	<div class="col-lg-3 sidebar">
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">모임 찾기</h3>
        			<form action="#">
        				<div class="fields">
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="시,군/구">
		              </div>
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="동">
		              </div>
		              <div class="form-group">
		                <input type="submit" value="검색" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
        		</div>
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">Star Rating</h3>
        			<form method="post" class="star-rating">
					  <div class="form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1">
							<label class="form-check-label" for="exampleCheck1">
								<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
							</label>
					  </div>
					  <div class="form-check">
				      <input type="checkbox" class="form-check-input" id="exampleCheck1">
				      <label class="form-check-label" for="exampleCheck1">
				    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
				      </label>
					  </div>
					  <div class="form-check">
				      <input type="checkbox" class="form-check-input" id="exampleCheck1">
				      <label class="form-check-label" for="exampleCheck1">
				      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
				     </label>
					  </div>
					  <div class="form-check">
					    <input type="checkbox" class="form-check-input" id="exampleCheck1">
				      <label class="form-check-label" for="exampleCheck1">
				      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
				      </label>
					  </div>
					  <div class="form-check">
				      <input type="checkbox" class="form-check-input" id="exampleCheck1">
				      <label class="form-check-label" for="exampleCheck1">
				      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
					    </label>
					  </div>
					</form>
        		</div>
         	 </div>
         	 <!-- 사이드바 영역 끝======================================================================= -->
         	  
         	 <!-- 본문영역=================================================================================================== -->
          <div class="col-lg-9">
          	<div class="row">
          		<c:forEach var="vo" items="${list }">
          		<div class="col-md-4 ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center">
    					<img src="${vo.mimg }">
    						<div class="icon d-flex justify-content-center align-items-center">
  							<span class="icon-search2"></span>
  						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="hotel-single.html">${vo.mname }</a></h3>
	    						</div>
	    						<div class="two">
	    							<span class="price per-price">${vo.hit }<br><small>${vo.mjoin} / ${vo.minwon }</small></span>
    							</div>
    						</div>
    						<p>${vo.mmsg }</p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> ${vo.maddr }</span> 
    							<span class="btn btn-xs btn-success btns" value="참여하기">참여하기</span>
    							<!-- <span class="ml-auto"><a href="#">참여하기</a></span> -->
    						</p>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
          	</div>
          	
          	<!-- 페이징 영역============================================= -->
          	<div class="row mt-5">
	          <div class="col text-center">
	            <div class="block-27">
	              <ul>
	                <li><a href="#">&lt;</a></li>
	                <li class="active"><span>1</span></li>
	                <li><a href="list.do?page=2">2</a></li>
	                <li><a href="list.do?page=3">3</a></li>
	                <li><a href="list.do?page=4">4</a></li>
	                <li><a href="list.do?page=5">5</a></li>
	                <li><a href="#">&gt;</a></li>
	              </ul>
	            </div>
	          </div>
	        </div>
	        <!-- 페이징 영역 끝============================================= -->
          </div> <!-- .col-md-8 -->
          
          <!-- 내위치 기반 모임 찾기(지도)======================================= -->
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <h3 class="heading mb-4">내 위치에서 모임 찾기</h3>
          <div id="map" style="width:100%;height:350px;">지도</div>
        
          
          <!-- 본문영역=================================================================================================== -->
          
        </div>
      </div>
    </section> <!-- .section -->
</body>
</html>