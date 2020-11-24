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
          <div class="col-md-12 mb-4">
            <h2 class="h4">모임 만들기</h2>
          </div>
          <div class="w-100"></div>
        </div>
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
            <form action="insert_ok.do" method="post">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="모임 제목">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="모임 장소">
              </div>
              <div>
              	<input type="text" class="form-control" placeholder="이미지 올리기">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="참석 가능 인원">
              </div>
              <div class="form-group">
                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="모임 소개"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="모임 만들기" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          </div>

          <div class="col-md-6">지도로 장소찾기</div>
        </div>
      </div>
    </section>
</body>
</html>