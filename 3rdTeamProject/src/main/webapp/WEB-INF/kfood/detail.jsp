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
	// ���� �ۼ� ���� 
	$('.comment_Insert_area').hide();
	
	$('.bring_comment_tab').click(function(){				// bring_comment_tab Ŭ����
		let no = $(this).attr('id')						// ���� no�� Ŭ���� bring_comment_tab�� value��
		$('#comment_Insert_area' + no).toggle(); 			// #comment_Insert_area + no�� ���
	});
	
	// ��� ���� ����
	$('.comment_Update_area').hide();
	
	$('.bring_comment_update_tab').click(function(){				// bring_comment_tab Ŭ����
		let no = $(this).attr('id')						// ���� no�� Ŭ���� bring_comment_tab�� value��
		$('#comment_Update_area' + no).toggle(); 			// #comment_Insert_area + no�� ���
	});
	
	
	// ��� ���� ����
	$('.inputPwdComment').hide();
	
	$('.deleteCommentButton').click(function(){				// bring_comment_tab Ŭ����
		let comment_no = $(this).attr('id')								// ���� no�� Ŭ���� bring_comment_tab�� value��
		$('#inputPwdComment' + comment_no).toggle(); 			// #comment_Insert_area + no�� ���
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
          			<h2>${kfood_vo.kf_title }&emsp;&emsp;&emsp;${kfood_vo.kf_score }&emsp;&emsp;<input type="submit" value="�����ϱ�" class="btn btn-primary"></li></h2>
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
          	
          	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->          	
          	<div class="col-lg-12">
              <h3 class="mb-5">��� </h3>
              <!-- ��۸�� ��� ------------------------------------------------------------------------------------------------------------------------------------------ ��� ��� ��� -->
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
                    <%-- <p><a href="#" class="reply bring_comment_tab" id=${reply_vo.no }>���</a></p> --%>
                    <div>
	                    
	                    <c:if test="${sessionScope.id == reply_vo.id }">
	                    	<input type=button class="reply bring_comment_tab board_button" id=${reply_vo.no } value="����ۼ�">
	                    	<input type=button class="reply bring_comment_update_tab board_button" id=${reply_vo.no } value="����">
	                    	<input type=button class="reply deleteCommentButton board_button" value="����${reply_vo.no }"  id=${reply_vo.no }>
	                    </c:if>
                    </div>
                  </div>
                </li>
                
                <!-- ���� �Է� ���� ----------------------------------------------------------------------------------------------------------------------------- ���� �Է� ���� -->
                <div class="comment-form-wrap pt-5 comment_Insert_area" id="comment_Insert_area${reply_vo.no }">
	                <form action="insert_replyReply.do" class="p-5 bg-light" method="post">
		                  <div class="form-group">
		                    <textarea id="message" cols="30" rows="5" class="form-control" placeholder="����� �޾��ּ���" name=content></textarea>
		                    <input type=hidden name=kfood_no value=${kfood_vo.kf_no }>
		                    <input type=hidden name=parent_no value=${reply_vo.no }>
		                  </div>
		                  <div class="form-group">
		                    <input type="submit" value="��� �Է�" class="btn btn-primary">
		                  </div>
	                </form>
	              </div>
	              
	          <!-- ��� ���� ���� --------------------------------------------------------------------------------------------------------------------------------- ��� ���� ���� -->
	          
		          <div class="comment-form-wrap pt-5 comment_Update_area" id="comment_Update_area${reply_vo.no }">
		                <form action="updateReply.do" class="p-5 bg-light" method="post">
			                  <div class="form-group">
			                    <textarea id="message" cols="30" rows="5" class="form-control" name=content>${reply_vo.content }</textarea>
			                    <input type=hidden name=kfood_no value=${kfood_vo.kf_no }>
			                    <input type=hidden name=no value=${reply_vo.no }>
			                  </div>
			                  <div class="form-group">
			                    <input type="submit" value="����" class="btn btn-primary">
			                  </div>
		                </form>
	              </div>
	              
	          <!-- ��� ���� ���� --------------------------------------------------------------------------------------------------------------------------------- ��� ���� ���� -->
					<div class="inputPwdComment" id="inputPwdComment${reply_vo.no }" style="text-align: right;">
						<p style="display: inline; color: red; font-weight: bold;">* ������ ����� ������ �� �����ϴ�. �����Ͻðڽ��ϱ�?</p>
						<form action="../kfood/deleteReply.do" method="post" style="display: inline;">
							<!-- <input type="password" size=10 placeholder="��й�ȣ �Է�" name="pwd"> -->
							<input type="submit" value="����" class="littleButton deleteReplyButton">
							<input type=hidden value=${reply_vo.no } name="no">
							<input type=hidden name=kfood_no value=${kfood_vo.kf_no }>
						</form>
					</div>
              
              
              </ul>
              </c:forEach>
              
              <!-- END comment-list -->
              
              
              
              <!-- ��� �Է� ���� --------------------------------------------------------------------------------------------------------------------------------- ��� �Է� ���� -->
              <div class="comment-form-wrap pt-5">
                <form action="insert_reply.do" class="p-5 bg-light" method="post">
                  <div class="form-group">
                    <textarea id="message" cols="30" rows="5" class="form-control" placeholder="����� �޾��ּ���" name=content></textarea>
                    <input type=hidden name=kfood_no value=${kfood_vo.kf_no }>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="��� �Է�" class="btn btn-primary">
                  </div>

                </form>
              </div>
            </div>
          
          
          
          
               <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->	
          	  <div class="sidebar-box ftco-animate">
          	  <div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
              <h4>�ֱ� �� ����</h4>
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