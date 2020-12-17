<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/* 	$(function(){
		$('#JoinBtn').on('click',function(){
			var mjoin=Number(${vo.mjoin}.val());
			var minwon=Number(${vo.minwon}.val());
			if(mjoin<minwon){
				Number(${vo.mjoin}+1)
			}if(mjoin>=minwon){
				$("#JoinBtn").hide();
			});
		});
	}); */
	
	 /* $(function(){
		$('#JoinBtn').on('click',function(){
			var mjoin=Number(${vo.mjoin}.val());
			var minwon=Number(${vo.minwon}.val());
			if(mjoin<minwon){
				Number(${vo.mjoin}+1)
			}
		});
		if(mjoin>=minwon){
			$("#JoinBtn").hide()
		
	}); */
</script>

</head>
<body>
	<div class="hero-wrap js-fullheight" style="background-image: url('../images/bg_2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">모임 상세보기</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row d-md-flex">
						<!-- 지도============================================================= -->
		                <div>
			              	<div id="map" style="width:500px;height:350px;"></div>

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
							geocoder.addressSearch('${vo.maddr}', function(result, status) {
							
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
							            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.maddr2}</div>'
							        });
							        infowindow.open(map, marker);
							
							        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							        map.setCenter(coords);
							    } 
							});    
							</script>
				        </div>
  					<!-- 지도 끝============================================================= -->
    		
	    		
	    		<div class="col-md-6 ftco-animate p-md-5">
		    	<div class="row">
		          <div class="col-md-12 d-flex align-items-center">
		            
		            <div class="tab-content ftco-animate" id="v-pills-tabContent">
						<!-- 첫번째 탭===================================================== -->
		              <div class="tab-pane fade show active" id="v-pills-whatwedo" role="tabpanel" aria-labelledby="v-pills-whatwedo-tab">
		              	<div>
			                <h2 class="mb-4">${vo.mname }</h2>
			                &nbsp;&nbsp;&nbsp;
			                <p>모임 주소 : ${vo.maddr } ${vo.maddr2 }</p>
			                <p>참여 인원 : ${vo.mjoin}/${vo.minwon }</p>
			                <p>모임 소개 : ${vo.mmsg }</p><br>
			                <a href="../meeting/update.do?mno=${vo.mno }" class="btn btn-xs btn-success" value="수정하기" id="UpdateBtn">수정하기</a>&nbsp;&nbsp;&nbsp;
			                <a href="../meeting/join.do?mno=${vo.mno }" class="btn btn-xs btn-info" value="참여" id="JoinBtn">참여하기</a>&nbsp;&nbsp;&nbsp;
			                <a href="../meeting/delete.do?mno=${vo.mno }" class="btn btn-xs btn-danger" value="삭제하기" id="DeleteBtn">삭제하기</a>&nbsp;&nbsp;&nbsp;
			                <a href="../meeting/list.do" class="btn btn-xs btn-warning" value="목록보기" id="ListBtn">목록보기</a>&nbsp;&nbsp;&nbsp;     
				        </div>
		              </div>   
		            </div>
		          </div>
		        <!-- 알약 탭 내용 구역 끝================================================================= -->
		          
		        </div>
		      </div>
		    </div>
    	</div>
    </section>
	
</html>