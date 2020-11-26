<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<div class="hero-wrap js-fullheight" style="background-image: url('../images/dog_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="#">Home</a></span> <span>Board</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">반려견 산책코스</h1>
          <div style="position: relative; left: 0px; top: 250px;">
        <button style='opacity: 0.7; font-size:24px; width:300pt; height:60pt;'><i class='far fa-calendar-alt'></i> 일정세우기</button>&nbsp;&nbsp;&nbsp;
        <button onclick="location.href='../dogboard/list.do#yong'" style='opacity: 0.7; font-size:24px; width:300pt; height:60pt;'><i class='fab fa-gratipay'></i> 소통하기</button>
          </div>
          </div>
        </div>
      </div>
    </div>
	<a name="yong"></a>

	
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
          <div class="col-md-8 ftco-animate">
            <h2 class="mb-3"><span style="color:#FFB914;">공원명 | </span> ${vo.name }</h2>
            <p>${vo.content }</p>
            <br>
            <p style="text-align:center;">
              <img src="${vo.img }" style="filter: drop-shadow(3px 3px 3px #000); width:500px; height:300px;" class="img-fluid">
            </p>
            <br>
            <center><h5>난이도 : 
            <c:if test="${vo.star == 1}">
            <i style="color:#FFB914;" class="icon-star"></i>
			<i style="color:#FFB914;" class="icon-star-o"></i>
			<i style="color:#FFB914;" class="icon-star-o"></i>
            </c:if>
            
            <c:if test="${vo.star == 2}">
			<i style="color:#FFB914;" class="icon-star"></i>
			<i style="color:#FFB914;" class="icon-star"></i>
			<i style="color:#FFB914;" class="icon-star-o"></i>
			</c:if>
			
			<c:if test="${vo.star == 3}">
			<i style="color:#FFB914;" class="icon-star"></i>
			<i style="color:#FFB914;" class="icon-star"></i>
			<i style="color:#FFB914;" class="icon-star"></i>
			</c:if><br>
            산책 예상 시간 : ${vo.time }</h5></center>
            <br>
            <hr>
            <h2 class="mb-3"><span style="color:#FFB914;">오시는 길 | </span></h2>
            <pre>${vo.visit_road}</pre>
            <br>
            <h5>Map</h5>
            <img src="../images/seoulmap.jpg">
            <div class="tag-widget post-tag-container mb-5 mt-5">
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">${vo.zone }</a>
                <a href="#" class="tag-cloud-link">${vo.name }</a>
                <!-- <a href="#" class="tag-cloud-link">태그3</a>
                <a href="#" class="tag-cloud-link">태그4</a> -->
              </div>
            </div>
            
			<div style="text-align:right;">
            <a href="../dog/parkmain.do#yong" class="btn py-2 px-3 btn-warning">돌아가기</a>
           </div>

          
          <div class="pt-5 mt-5">
              <h3 class="mb-5">2 Comments</h3>
              <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="../images/dogicon1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>이안</h3>
                    <div class="meta">November 27, 2020 at 2:21pm</div>
                    <p style="font-size:16px;">정보 감사합니다. 코로나 조심하세요~!</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>
				<!--
                <li class="comment">
                  <div class="vcard bio">
                    <img src="images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>댓글내용</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>

                  <ul class="children">
                    <li class="comment">
                      <div class="vcard bio">
                        <img src="images/person_1.jpg" alt="Image placeholder">
                      </div>
                      <div class="comment-body">
                        <h3>John Doe</h3>
                        <div class="meta">June 27, 2018 at 2:21pm</div>
                        <p>댓글내용</p>
                        <p><a href="#" class="reply">Reply</a></p>
                      </div>


                      <ul class="children">
                        <li class="comment">
                          <div class="vcard bio">
                            <img src="images/person_1.jpg" alt="Image placeholder">
                          </div>
                          <div class="comment-body">
                            <h3>John Doe</h3>
                            <div class="meta">June 27, 2018 at 2:21pm</div>
                            <p>댓글내용</p>
                            <p><a href="#" class="reply">Reply</a></p>
                          </div>

                            <ul class="children">
                              <li class="comment">
                                <div class="vcard bio">
                                  <img src="images/person_1.jpg" alt="Image placeholder">
                                </div>
                                <div class="comment-body">
                                  <h3>John Doe</h3>
                                  <div class="meta">June 27, 2018 at 2:21pm</div>
                                  <p>댓글내용</p>
                                  <p><a href="#" class="reply">Reply</a></p>
                                </div>
                              </li>
                            </ul>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>
				-->
                <li class="comment">
                  <div class="vcard bio">
                    <img src="../images/dogicon2.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>개집사</h3>
                    <div class="meta">November 27, 2020 at 3:06pm</div>
                    <p style="font-size:16px;">다음에 저희집 갱얼쥐랑 같이 가야겠어요!</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>
              </ul>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">댓글 남기기</h3>
                <form action="#" class="p-5 bg-light">
                  <div class="form-group">
                    <label for="name">닉네임 *</label>
                    <input type="text" class="form-control" id="name">
                  </div>
                  <div class="form-group">
                    <label for="email">비밀번호 *</label>
                    <input type="password" class="form-control" id="password">
                  </div>
                  <div class="form-group">
                    <label for="message">내용 *</label>
                    <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="댓글달기" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
            </div>
          </div>
          
          <!-- 사이드바 .col-md-8 -->
          <div class="col-md-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="icon fa fa-search"></span>
                  <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>지역별 검색</h3>
                <li><a href="#">서울 동부 <span>(32)</span></a></li>
                <li><a href="#">서울 서부 <span>(22)</span></a></li>
                <li><a href="#">서울 남부 <span>(27)</span></a></li>
                <li><a href="#">서울 북부 <span>(19)</span></a></li>
              </div>
            </div>
			<div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>난이도별 검색</h3>
                <li><a href="#">
                <i class="icon-star"></i>
			<i class="icon-star"></i>
			<i class="icon-star"></i>
                <span>(49)</span></a></li>
                <li><a href="#">
                <i class="icon-star"></i>
			<i class="icon-star"></i>
			<i class="icon-star-o"></i>
                <span>(51)</span></a></li>
                <li><a href="#">
                <i class="icon-star"></i>
			<i class="icon-star-o"></i>
			<i class="icon-star-o"></i>
                <span>(31)</span></a></li>
              </div>
            </div>
            
            <div class="sidebar-box ftco-animate">
              <h3>최근 본 산책코스</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4"><img src="http://parks.seoul.go.kr/file/info/view.do?fIdx=1884" width="100px"; hieght="100px";></a>
                <div class="text">
                  <h3 class="heading"><a href="#">남산도시자연공원</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> 17:12</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 3</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4"><img src="http://parks.seoul.go.kr/file/info/view.do?fIdx=1888" width="100px"; hieght="100px";></a>
                <div class="text">
                  <h3 class="heading"><a href="#">월드컵공원</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> 17:15</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 2</a></div>
                  </div>
                </div>
              </div>
            </div>

            <!-- <div class="sidebar-box ftco-animate">
              <h3>태그별</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">태그1</a>
                <a href="#" class="tag-cloud-link">태그2</a>
                <a href="#" class="tag-cloud-link">태그3</a>
                <a href="#" class="tag-cloud-link">태그4</a>
                <a href="#" class="tag-cloud-link">태그5</a>
                <a href="#" class="tag-cloud-link">태그6</a>
                <a href="#" class="tag-cloud-link">태그7</a>
                <a href="#" class="tag-cloud-link">태그8</a>
              </div>
            </div> -->

            <!-- <div class="sidebar-box ftco-animate">
              <h3>핫딜</h3>
              <p>광고 자리</p>
            </div>
          </div> -->

        </div>
      </div>
    </section> <!-- .section -->
  </body>
</html>