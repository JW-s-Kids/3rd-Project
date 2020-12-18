<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	// 대댓글 작성 공간 
	$('.comment_Insert_area').hide();
	
	$('.bring_comment_tab').click(function(){				// bring_comment_tab 클릭시
		let no = $(this).attr('id')						// 변수 no는 클릭한 bring_comment_tab의 value값
		$('#comment_Insert_area' + no).toggle(); 			// #comment_Insert_area + no를 토글
	});
	
	// 댓글 수정 공간
	$('.comment_Update_area').hide();
	
	$('.bring_comment_update_tab').click(function(){				// bring_comment_tab 클릭시
		let no = $(this).attr('id')						// 변수 no는 클릭한 bring_comment_tab의 value값
		$('#comment_Update_area' + no).toggle(); 			// #comment_Insert_area + no를 토글
	});
	
	
	// 댓글 삭제 공간
	$('.inputPwdComment').hide();
	
	$('.deleteCommentButton').click(function(){				// bring_comment_tab 클릭시
		let comment_no = $(this).attr('id')								// 변수 no는 클릭한 bring_comment_tab의 value값
		$('#inputPwdComment' + comment_no).toggle(); 			// #comment_Insert_area + no를 토글
	});
})
</script>
<style type="text/css">
	.board_button{
		border: none;
	}
	.board_button:hover{
		cursor: pointer;
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
          			<h2>${kfood_vo.kf_title }&emsp;&emsp;&emsp;${kfood_vo.kf_score }&emsp;&emsp;<input type="submit" value="예약하기" class="btn btn-primary"></li></h2>
          			<p class="rate mb-5">
          				<span class="loc">
          				  <i class="icon-map">${(kfood_vo.kf_addr1)}</i>
          				  <!-- ${fn:substring(tour_vo.address, 5, 50)} -->
          				</span>
          				<c:if test="${kfood_vo.kf_park }">
	          				<span class="star">
	    						<img src="${kfood_vo.kf_tel }" alt="평점">
	    					</span>
	    			</c:if>
    				</p>
    						<p>${kfood_vo.kf_content }</p>
    						<div class="d-md-flex mt-5 mb-5">
    							<ul>
    								<li>주소&emsp;&emsp;&emsp;&emsp;&emsp;<span>${kfood_vo.kf_addr1 }</span></li>
	    							<li>전화번호&emsp;&emsp;&emsp;<span>${kfood_vo.kf_tel }</span></li>
	    							<li>주차&emsp;&emsp;&emsp;&emsp;&emsp;<span>${kfood_vo.kf_park }</span></li>
	    							<li>영업시간&emsp;&emsp;&emsp;<span>${kfood_vo.kf_time }</span></li>
	    							<li>휴일&emsp;&emsp;&emsp;&emsp;&emsp;<span>${kfood_vo.kf_holiday }</span></li>
	    							<li>대표메뉴&emsp;&emsp;&emsp;<span>${kfood_vo.kf_delemenu }</span></li>
	    							<li>포장&emsp;&emsp;&emsp;&emsp;&emsp;<span>${kfood_vo.kf_togo }</span></li>
	    							<li>예약&emsp;&emsp;&emsp;&emsp;&emsp;<span>${kfood_vo.kf_reserve }</span></li>
	    							
	    							
	    						</ul>
	    						
    						</div>
    						<!--  <p>${kfood_vo.kf_zone }</p>-->
          		</div>
          		<div class="col-md-6 hotel-single mt-4 mb-5 ftco-animate">
          			 <h4>주변 지도</h4>
		            <table class="table">
		              <tr>
		               <td class="text-center">
		                <div id="map" style="width:100%;height:350px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2bc9a127e05847fd362986264b83197&libraries=services"></script>
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
		        	geocoder.addressSearch('${kfood_vo.kf_addr1 }', function(result, status) {
		        	
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
		        	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${kfood_vo.kf_title}</div>'
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
          	
          	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->          	
          	<div class="col-lg-12">
              <h3 class="mb-5">댓글 </h3>
              <!-- 댓글목록 출력 ------------------------------------------------------------------------------------------------------------------------------------------ 댓글 목록 출력 -->
              <c:forEach var="reply_vo" items="${reply_list }">
             	<c:if test="${reply_vo.getGt() > 0 }">
              		
              		<img src="../images/reply_icon.png" style="width:30px; height: 30px;">
              		<c:forEach var="i" begin="1" end="${reply_vo.getGt() }">
              		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		</c:forEach>
              	</c:if>
              <ul class="comment-list">
              	
              	 
                <li class="comment">
                
                  <div class="vcard bio">
                    <img src="../images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>${reply_vo.id }</h3>
                    <div class="meta">
						<fmt:formatDate value="${reply_vo.regdate }" pattern="yyyy-MM-dd"/>
					</div>
                    <p>${reply_vo.content }</p>
                    <%-- <p><a href="#" class="reply bring_comment_tab" id=${reply_vo.no }>댓글</a></p> --%>
                    <div>
	                    
	                    <c:if test="${sessionScope.id == reply_vo.id }">
	                    	<input type=button class="reply bring_comment_tab board_button" id=${reply_vo.no } value="댓글작성">
	                    	<input type=button class="reply bring_comment_update_tab board_button" id=${reply_vo.no } value="수정">
	                    	<input type=button class="reply deleteCommentButton board_button" value="삭제${reply_vo.no }"  id=${reply_vo.no }>
	                    </c:if>
                    </div>
                  </div>
                </li>
                
                <!-- 대댓글 입력 공간 ----------------------------------------------------------------------------------------------------------------------------- 대댓글 입력 공간 -->
                <div class="comment-form-wrap pt-5 comment_Insert_area" id="comment_Insert_area${reply_vo.no }">
	                <form action="insert_replyReply.do" class="p-5 bg-light" method="post">
		                  <div class="form-group">
		                    <textarea id="message" cols="30" rows="5" class="form-control" placeholder="댓글을 달아주세요" name=content></textarea>
		                    <input type=hidden name=kfood_no value=${kfood_vo.kf_no }>
		                    <input type=hidden name=parent_no value=${reply_vo.no }>
		                  </div>
		                  <div class="form-group">
		                    <input type="submit" value="댓글 입력" class="btn btn-primary">
		                  </div>
	                </form>
	              </div>
	              
	          <!-- 댓글 수정 공간 --------------------------------------------------------------------------------------------------------------------------------- 댓글 수정 공간 -->
	          
		          <div class="comment-form-wrap pt-5 comment_Update_area" id="comment_Update_area${reply_vo.no }">
		                <form action="updateReply.do" class="p-5 bg-light" method="post">
			                  <div class="form-group">
			                    <textarea id="message" cols="30" rows="5" class="form-control" name=content>${reply_vo.content }</textarea>
			                    <input type=hidden name=kfood_no value=${kfood_vo.kf_no }>
			                    <input type=hidden name=no value=${reply_vo.no }>
			                  </div>
			                  <div class="form-group">
			                    <input type="submit" value="수정" class="btn btn-primary">
			                  </div>
		                </form>
	              </div>
	              
	          <!-- 댓글 삭제 공간 --------------------------------------------------------------------------------------------------------------------------------- 댓글 삭제 공간 -->
					<div class="inputPwdComment" id="inputPwdComment${reply_vo.no }" style="text-align: right;">
						<p style="display: inline; color: red; font-weight: bold;">* 삭제한 댓글은 복구할 수 없습니다. 삭제하시겠습니까?</p>
						<form action="../kfood/deleteReply.do" method="post" style="display: inline;">
							<!-- <input type="password" size=10 placeholder="비밀번호 입력" name="pwd"> -->
							<input type="submit" value="삭제" class="littleButton deleteReplyButton">
							<input type=hidden value=${reply_vo.no } name="no">
							<input type=hidden name=kfood_no value=${kfood_vo.kf_no }>
						</form>
					</div>
              
              
              </ul>
              </c:forEach>
              
              <!-- END comment-list -->
              
              
              
              <!-- 댓글 입력 공간 --------------------------------------------------------------------------------------------------------------------------------- 댓글 입력 공간 -->
              <div class="comment-form-wrap pt-5">
                <form action="insert_reply.do" class="p-5 bg-light" method="post">
                  <div class="form-group">
                    <textarea id="message" cols="30" rows="5" class="form-control" placeholder="댓글을 달아주세요" name=content></textarea>
                    <input type=hidden name=kfood_no value=${kfood_vo.kf_no }>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="댓글 입력" class="btn btn-primary">
                  </div>

                </form>
              </div>
            </div>
          
          
          
          
               <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->	
          	  <div class="sidebar-box ftco-animate">
          	  <div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
              <h4>최근 본 맛집</h4>
              <div class="row">
              <c:forEach var="cookie_vo" items="${cookie_list}" varStatus="s">
              		<c:if test="${s.index < 6 }">
			              <div class="block-21 mb-4 d-flex">
			                <a class="blog-img mr-4" style="background-image: url(${cookie_vo.kf_poster}); "></a>
			                <div class="text">
			                  <h3 class="heading"><a href="../kfood/detail.do?no=${cookie_vo.kf_no }">${cookie_vo.kf_title }</a></h3>
			                  <h3 class="heading"><a href="../kfood/detail.do?no=${cookie_vo.kf_no }">${cookie_vo.kf_zone }</a></h3>
			                  <div class="meta">
			                   
			                   
			                  </div>
			                </div>
			              </div>
	              	</c:if>
              </c:forEach>
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