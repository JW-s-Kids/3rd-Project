<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		/* $('#update_member').click(function(){
			$.ajax({
				type: 'get',
				url:'update.do',
				 async: false,
				 dataType:'html',
				 success:function(result)
				 {
					 $('#mypage_box').html(result);
				 }
			});	
		}); */
		
		$('.mypage_button').hover(function(){
			$(this).css("cursor", "pointer");
		}, function(){
			$(this).css("cursor", "");
		})
		
		$('#diary_scrap').click(function(){
			let no = $(this).attr('value');
			
			$.ajax({
				type: 'post',
				url: '../diary/scrap_list.do',
				success: function(result){
					$('#mypage_box').html(result);
				}
			});
		});
	})
</script>
</head>
<body>
	<div class="hero-wrap js-fullheight" style="background-image: url('../images/mypage_image.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html"><!-- Home --></a></span> <span class="mr-2"><a href="blog.html"><!-- Blog --></a></span> <span><!-- Blog Single --></span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">마이페이지</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate" style="height: 800px;">
          
          		<div id="mypage_box" 																					
          		style="width: 100%; height: 100%; background-color: white; padding:30px;">						<!-- 스크랩 목록 출력 -->
          		
          		</div>
          
          </div> <!-- .col-md-8 -->
          <div class="col-md-4 sidebar ftco-animate">
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>내 정보</h3>
                <li><span style="color: #f85959;" class="mypage_button" id="update_member">회원정보 수정</span></li>
                <li><span style="color: #f85959;" class="mypage_button" id="diary_scrap">여행기 스크랩</span></li>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <!-- <h3>Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">dish</a>
                <a href="#" class="tag-cloud-link">menu</a>
                <a href="#" class="tag-cloud-link">food</a>
                <a href="#" class="tag-cloud-link">sweet</a>
                <a href="#" class="tag-cloud-link">tasty</a>
                <a href="#" class="tag-cloud-link">delicious</a>
                <a href="#" class="tag-cloud-link">desserts</a>
                <a href="#" class="tag-cloud-link">drinks</a>
              </div> -->
            </div>


        </div>
      </div>
      </div>
    </section> <!-- .section -->
</body>
</html>