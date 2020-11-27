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
    <div class="hero-wrap js-fullheight" style="background-image: url('../images/dog_3.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="#">Home</a></span> <span>Board</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">소통하기</h1>
          <div style="position: relative; left: 0px; top: 250px;">
        <button style='opacity: 0.7; font-size:24px; width:300pt; height:60pt;'><i class='far fa-calendar-alt'></i> 일정세우기</button>&nbsp;&nbsp;&nbsp;
        <button onclick="location.href='../dog/parkmain.do#yong'" style='opacity: 0.7; font-size:24px; width:300pt; height:60pt;'><i class='fas fa-dog'></i> 반려견산책코스</button>
          </div>
          </div>
        </div>
      </div>
    </div>

	<a name="yong"></a>      
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
      
      <td class="text-center">
          <div class="nav ftco-animate nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		              <a href="list.do#yong" class="nav-link active" aria-selected="true">같이가요</a>
		              <a href="../pet/list.do" class="nav-link" aria-selected="false">자랑해요</a>
		              <a href="anonymous.do#yong" class="nav-link" aria-selected="false">익명게시판</a>
		  </div>
          </td>
          <div style="height:30px"></div>
          
          <table class="table">
          <tr>
            <td class="text-right">
            </td>
          </tr>
          </table>
          
        <div class="row">    
          <div class="col-md-8 ftco-animate">
            <h2 class="mb-3"><span style="color:#FFB914;">같이가요 | </span> ${vo.subject }</h2>
           
            <div class="bg-light" style="width:730px; height:40px;">
            &nbsp;&nbsp;&nbsp;&nbsp;<span style="text-algin:right;"><i class='far fa-address-card' style='font-size:20px'></i><span style="font-size:20px;"> <b>${vo.id }</b></span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="text-algin:right;"><span style="font-size:16px"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></span>&nbsp;&nbsp;<i class='fas fa-eye' style='font-size:16px;'></i><span style="font-size:16px;"> ${vo.hit }</span></span>
            </div>
            
            <div style="height:20px;"></div>
            
            <p>
              <img src="../images/dog_2.jpg" alt="" class="img-fluid">
            </p>
            <pre style="font-size:16px;">${vo.content }</pre>
			<td colspan="4" class="text-right">
           <!--<c:if test="${sessionScope.id!=null }">-->
            <a href="../dogboard/reply.do?no=${vo.no }" class="btn btn-xs btn-danger">답변</a>
            <a href="#" class="btn btn-xs btn-success">수정</a>
            <a href="#" class="btn btn-xs btn-info">삭제</a>
           <!--</c:if>-->
           <div style="text-align:right;">
            <a href="../dogboard/list.do#yong" class="btn py-2 px-3 btn-warning">수정</a>
            <a href="../dogboard/list.do#yong" class="btn py-2 px-3 btn-warning">삭제</a>
            <a href="../dogboard/list.do#yong" class="btn py-2 px-3 btn-warning">목록</a>
           </div>
          </td>

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
                    <p style="font-size:16px;">시바견 2마리랑 한강라이딩 같이 가실래요?</p>
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
                    <h3>갱얼쥐</h3>
                    <div class="meta">November 27, 2020 at 3:06pm</div>
                    <p style="font-size:16px;">산책싫어하는 저희집 불독이랑 다음에 같이가요~</p>
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
                <h3>카테고리</h3>
                <li><a href="#">같이가요 <span>(12)</span></a></li>
                <li><a href="#">자랑해요 <span>(22)</span></a></li>
                <li><a href="#">익명게시판 <span>(37)</span></a></li>
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
			<!--  
            <div class="sidebar-box ftco-animate">
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
            </div>
			
            <div class="sidebar-box ftco-animate">
              <h3>핫딜</h3>
              <p>아라님 자리</p>
            </div>
          </div>
			-->
        </div>
      </div>
    </section> <!-- .section -->
  </body>
</html>