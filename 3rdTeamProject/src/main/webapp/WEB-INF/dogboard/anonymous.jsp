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
		              <a href="list.do#yong" class="nav-link" aria-selected="true">같이가요</a>
		              <a href="insert.do#yong" class="nav-link" aria-selected="false">자랑해요</a>
		              <a href="anonymous.do#yong" class="nav-link active" aria-selected="false">익명게시판</a>
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
              <h3 class="mb-5">글을 등록할 때는 네티켓을 지켜 비방 및 욕설은 삼가주세요.</h3>
              <c:forEach var="vo" items="${list }">
              <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="../images/dogicon1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>익명</h3>
                    <div class="meta">${vo.regdate }</div>
                    <p style="font-size:16px;">${vo.msg }</p>
                    <p><a href="#" class="reply">Delete</a></p>
                  </div>
                </li>
              </ul>
              </c:forEach>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">글쓰기</h3>
                <form method="post" action="ano_insert_ok.do" class="p-5 bg-light">
                  <div class="form-group">
                    <label for="email">비밀번호 *</label>
                    <input type="password" class="form-control" name="pwd">
                  </div>
                  <div class="form-group">
                    <label for="message">내용 *</label>
                    <textarea name="msg" id="msg" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="글쓰기" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
			
			<!-- <td colspan="4" class="text-right">
           <div style="text-align:right;">
            <a href="../dogboard/list.do#yong" class="btn py-2 px-3 btn-warning">수정</a>
            <a href="../dogboard/list.do#yong" class="btn py-2 px-3 btn-warning">삭제</a>
            <a href="../dogboard/list.do#yong" class="btn py-2 px-3 btn-warning">목록</a>
           </div>
          </td> -->
          
          <!-- 페이지 -->
			<div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		              	<c:if test="${curpage>BLOCK }">
		                <li><a href="../dogboard/anonymous.do?page=${startPage-1 }#yong">&lt;</a></li>
		                </c:if>
		                <c:forEach var="i" begin="${startPage }" end="${endPage }">
		                 <c:if test="${i==curpage }">
		                 	<li class="active"><span><a href="../dogboard/anonymous.do?page=${i }#yong">${i }</a></span></li>
		                 </c:if>
		                 <c:if test="${i!=curpage }">
		                 	<li><a href="../dogboard/anonymous.do?page=${i }#yong">${i }</a></li>
		                 </c:if>
		                </c:forEach>
						<c:if test="${endPage<totalpage }">
		                <li><a href="../dogboard/anonymous.do?page=${endPage+1 }#yong">&gt;</a></li>
		                </c:if>
		              </ul>
		            </div>
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