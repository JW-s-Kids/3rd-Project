<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="hero-wrap js-fullheight" style="background-image: url('../images/diary_image.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html"><!-- Home --></a></span> <span class="mr-2"><a href="blog.html"><!-- Blog --></a></span> <span><!-- Blog Single --></span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">여행기</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate">
          <form action="../diary/update_ok.do?no=${diary_vo.no }">
		          <h2 class="mb-3"><input type=text name=subject value=${diary_vo.subject }></h2>
		          <div style="height:80px; margin-top: 30px; border-top:1px solid #f2f2f2; padding-top: 10px;">
		          	<p>방문일 <fmt:formatDate value="${diary_vo.visitdate }" pattern="yyyy-MM-dd"/></p>
		          </div>
		            <p>
		              <img src="../images/image_7.jpg" alt="" class="img-fluid">
		            </p>
		              <img src="../images/image_8.jpg" alt="" class="img-fluid">
		            <input type=text name=content value=${diary_vo.content }>
		            <div class="tag-widget post-tag-container mb-5 mt-5">
		              <div class="tagcloud">
		                <a href="#" class="tag-cloud-link">좋아요</a>
		                <a href="#" class="tag-cloud-link">스크랩</a>
		                <a href="#" class="tag-cloud-link">조회 ${diary_vo.hit }</a>
		                <c:if test="${sessionScope.id == diary_vo.id }">
		                	<button>수정완료</button>
		                	<a href="../diary/list.do" class="tag-cloud-link">취소</a>
		                </c:if>
		              </div>
		            </div>
		            <input type=hidden name=no value=${diary_vo.no }>
            </form>
            
            <div class="about-author d-flex p-5 bg-light">
              <div class="bio align-self-md-center mr-5">
                <img src="../images/person_1.jpg" alt="Image placeholder" class="img-fluid mb-4" style="width:150px; height:150px;">
              </div>
              <div class="desc align-self-md-center">
                <h3>${diary_vo.id }</h3>
                <p>사용자 소개</p>
              </div>
            </div>


            <div class="pt-5 mt-5">
              <h3 class="mb-5">댓글 ${diary_vo.reply }</h3>
              <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="../images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>
              </ul>
              <!-- END comment-list -->
              
              
              
              <div class="comment-form-wrap pt-5">
                <form action="#" class="p-5 bg-light">
                  <div class="form-group">
                    <textarea name="" id="message" cols="30" rows="5" class="form-control" placeholder="댓글을 달아주세요"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="댓글 입력" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
            </div>





          </div> <!-- .col-md-8 -->
          <div class="col-md-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="icon fa fa-search"></span>
                  <input type="text" class="form-control" placeholder="검색">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>카테고리</h3>
                <li><a href="#">축제 <span>(12)</span></a></li>
                <li><a href="#">맛집 <span>(22)</span></a></li>
                <li><a href="#">공원 <span>(37)</span></a></li>
                <li><a href="#">데이트 <span>(42)</span></a></li>
                <li><a href="#">실내활동 <span>(14)</span></a></li>
                <li><a href="#">취미 <span>(140)</span></a></li>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>최근 본 여행기</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(../images/image_1.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(../images/image_2.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(../images/image_3.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">dish</a>
                <a href="#" class="tag-cloud-link">menu</a>
                <a href="#" class="tag-cloud-link">food</a>
                <a href="#" class="tag-cloud-link">sweet</a>
                <a href="#" class="tag-cloud-link">tasty</a>
                <a href="#" class="tag-cloud-link">delicious</a>
                <a href="#" class="tag-cloud-link">desserts</a>
                <a href="#" class="tag-cloud-link">drinks</a>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Paragraph</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
            </div>
          </div>

        </div>
      </div>
    </section> <!-- .section -->
</body>
</html>