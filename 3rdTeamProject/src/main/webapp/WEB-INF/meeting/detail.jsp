<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="hero-wrap js-fullheight" style="background-image: url('../images/bg_2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>About</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">About Us</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row d-md-flex">
	    		<div class="col-md-6 ftco-animate img about-image">
	    			<img alt="meeting_image" src="${vo.mimg }" width="550" height="600">
	    		</div>
	    		<div class="col-md-6 ftco-animate p-md-5">
		    	<div class="row">
		    	<!-- 알약모양 탭 버튼구역=============================================== -->
		          <div class="col-md-12 nav-link-wrap mb-5">
		            <div class="nav ftco-animate nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		              <a class="nav-link active" id="v-pills-whatwedo-tab" data-toggle="pill" href="#v-pills-whatwedo" role="tab" aria-controls="v-pills-whatwedo" aria-selected="true">모임 상세</a>
		              <a class="nav-link" id="v-pills-mission-tab" data-toggle="pill" href="#v-pills-mission" role="tab" aria-controls="v-pills-mission" aria-selected="false">위치보기</a>
		            </div>
		          </div>
		        <!-- 알약모양 탭 버튼구역 끝=============================================== -->
		        <!-- 알약 탭 내용 구역================================================================= -->
		          <div class="col-md-12 d-flex align-items-center">
		            
		            <div class="tab-content ftco-animate" id="v-pills-tabContent">

		              <div class="tab-pane fade show active" id="v-pills-whatwedo" role="tabpanel" aria-labelledby="v-pills-whatwedo-tab">
		              	<div>
			                <h2 class="mb-4">${vo.mname }</h2>
			              	<p>모임 소개 : ${vo.mmsg }</p>
			                <p>모임 주소 : ${vo.maddr } ${vo.maddr2 } ${vo.maddr3 } ${vo.maddr4 }</p>
			                <p>참여 인원 : ${vo.mjoin}/${vo.minwon }</p><br>
			                <input type=button value="참여하기" class="btn btn-xs btn-success" id="JoinBtn">&nbsp;&nbsp;&nbsp;
			                <input type=button value="채팅하기" class="btn btn-xs btn-info" id="ChatBtn">&nbsp;&nbsp;&nbsp;
			                <input type=button value="목록보기" class="btn btn-xs btn-danger" id="ListBtn" onclick="javascript:history.back()">
			                
				        </div>
		              </div>

		              <div class="tab-pane fade" id="v-pills-mission" role="tabpanel" aria-labelledby="v-pills-mission-tab">
		                <div>
			                <h2 class="mb-4">지도 넣기</h2>
			              	<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
			                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt voluptate, quibusdam sunt iste dolores consequatur</p>
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