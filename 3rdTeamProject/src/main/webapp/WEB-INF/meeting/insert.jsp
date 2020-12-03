<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function postfind()
{
	new daum.Postcode({
		oncomplete:function(data)
		{
			$('#maddr').val(data.address);
		}
	}).open();
}
</script>
</head>
<body>
	<div class="hero-wrap js-fullheight" style="background-image: url('../images/bg_2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="#">Home</a></span> <span>Contact</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Contact Us</h1>
          </div>
        </div>
      </div>
    </div>

	<section class="ftco-section contact-section ftco-degree-bg">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-5 mb-4">
            <h2 class="h4">모임 만들기</h2>
          </div>
          <div class="col-md-5 mb-4">
            <h2 class="h4">지도로 장소 찾기</h2>
          </div>
          <div class="w-100"></div>
        </div>
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
            <form action="insert_ok.do" method="post">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="모임 제목" id="mname" name="mname">
              </div>
              <div class="form-group">
              	<input type=button value="장소 찾기" style="padding-left: 20px;" class="btn btn-xs btn-info" id="button" onclick="postfind()">
              	<input type=text name=maddr class="form-control" size=45 readonly id="maddr" placeholder="장소">
              	<input type=text name=maddr2 class="form-control" size=45 id="maddr2" placeholder="상세 주소(건물/상호명)">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="참석 인원 설정" id="minwon" name=minwon>
              </div>
              <div class="form-group">
                <textarea name="mmsg" id="mmsg" cols="30" rows="7" class="form-control" placeholder="모임 소개"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="모임 만들기" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          </div>
		<!-- 지도 영역====================================================================== -->
          <div class="col-md-6">
          	<div id="map" style="width:100%;height:350px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a82c9e85e71906b68998f594eac76e8c&libraries=services"></script>
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
			geocoder.addressSearch('#addr', function(result, status) {
			
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
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">약속장소</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
          </div>
        <!-- 지도 영역 끝====================================================================== -->
        </div>
      </div>
    </section>
</body>
</html>