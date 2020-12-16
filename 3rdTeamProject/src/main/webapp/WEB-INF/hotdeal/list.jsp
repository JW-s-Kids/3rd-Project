<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <title>DirEngine - Free Bootstrap 4 Template by Colorlib</title>
    <style type="text/css">
    .text {
    margin: 0 auto;
    height: 250px;
    }
    .d-flex {
    height: 75px;
    }
    .one {
    margin: 0 auto;
    width: 220px;
    }
    .bottom-area {
    margin: 0 auto;
    }
    </style>
    <meta charset="utf-8">
  </head>
  <body>
    
    <div class="hero-wrap js-fullheight" style="background-image: url('../images/hotel-2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>HotDeal</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">핫딜 호텔 추천</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
         <div class="col-lg-3 sidebar">
        	<div class="sidebar-wrap bg-light ftco-animate">
        	  <h3 class="heading mb-4">최근 본 호텔</h3>
        		<c:forEach var="vo" items="${cList }" varStatus="s">
        		 <c:if test="${s.index<5 }">
        		  <div>
        		   <a href="../hotdeal/detail.do?hd_no=${vo.hd_no }">
        		    <span><img src="${vo.hd_img1 }" style="width:30px; height:30px;"></span>
        		  	<span style="font-size:12pt">${vo.hd_name }</span>
        		   </a>
        		  </div>
        		 </c:if>
        		</c:forEach>	
        		<hr>
        	</div>
         </div>	
          
		  <!-- 본문 출력 -->
		           
          <div class="col-lg-9">
          	<div class="row">
          	 <c:forEach var="vo" items="${list }">
          	  <div class="col-md-4 ftco-animate">
		    	<div class="destination">
		    	  <a href="../hotdeal/hotdeal_before.do?hd_no=${vo.hd_no }" class="img img-2 d-flex justify-content-center align-items-center">
		    		<img src="${vo.hd_img1}" width="100%" height="100%">
		    	  </a>
		    		<div class="text p-3">
		    		  <div class="d-flex">
		    		    <div class="one">
		    			  <font size="2em" color="green">
		    				${vo.hd_addr1 }
		    			  </font>
				    		<h3><a href="../hotdeal/detail.do?no=${vo.hd_no}">${vo.hd_name }</a></h3>
				    	</div>
				    	<div class="two">
				    	  <span><font color="green">${vo.hd_score }</font></span>
			    		</div>
		    		  </div>
		    			<hr>
		    			<br>
		    		  <div class="text-right" >
		    		    <img src="../images/hotelimg1.png">
		    			  <font size="5em" color="black">
		    			    ${vo.hd_price }
		    			  </font>
		    		  </div>
		    	  </div>
		    	</div>
		      </div>
		     </c:forEach>
          	</div>
          	<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
               		<c:if test="${currpage>block }">
							<li><a href="../hotdeal/list.do?page=${startpage-1 }">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${startpage }" end="${endpage }">
							<c:if test="${i==currpage }">
							<li class="active"><a href="../hotdeal/list.do?page=${i }">${i }</a></li>
							</c:if>
							<c:if test="${i!=currpage }">
							<li><a href="../hotdeal/list.do?page=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${endpage<totalpage }">
							<li><a href="../hotdeal/list.do?page=${endpage+1 }">&gt;</a></li>
					</c:if>
              </ul>
            </div>
          </div>
        </div>
          </div> 
        </div>
      </div>
    </section> 
  </body>
</html>