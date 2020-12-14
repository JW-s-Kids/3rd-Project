<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	// 지도 ajax
	$('.images').click(function(){
		let no=$(this).attr("data-value");
		$.ajax({
			type:'POST',
			url:'../dogboard/parkfind.do',
			data:{"no":no},
			success:function(res)
			{
				$('#print').html(res);
			}
		});
	});
})
</script>

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
        <button onclick="location.href='../dog/parkmain.do#yong'" style='opacity: 0.7; font-size:24px; width:300pt; height:60pt;'><i class='fas fa-dog'></i> 반려견 산책</button>
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
            <h2 class="mb-3">글쓰기</h2>
                <form method="post" action="insert_ok.do" class="p-5 bg-light" enctype="multipart/form-data">
                  <div class="form-group">
                    <label for="website">제목 *</label>
                    <input type="text" class="form-control" name=subject>
                  </div>
                  <div class="form-group">
                    <label for="message">내용 *</label>
                    <textarea name=content cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <label for="pwd">비밀번호 *</label>
                    <input type="password" class="form-control" name=pwd>
                  </div>
                  <div class="form-group">
                    <label for="website">사진 업로드</label>
					 <input type="file" id="poster" name="file">
					 <div class="select_img"><img src="" /></div>
					 
					 <script>
					  $("#poster").change(function(){
					   if(this.files && this.files[0]) {
					    var reader = new FileReader;
					    reader.onload = function(data) {
					     $(".select_img img").attr("src", data.target.result).width(500);        
					    }
					    reader.readAsDataURL(this.files[0]);
					   }
					  });
					 </script>
					<%-- <%=request.getRealPath("/") %> --%>
                  </div>
                  <div class="form-group">
                    <input type=submit value="글쓰기" class="btn py-3 px-4 btn-primary">
                    <input type=button value="취소" class="btn py-3 px-4 btn-primary"
          			onclick="location.href='list.do#yong'"
         			>
                  </div>
                </form>
          </div>
          <!-- 사이드바 .col-md-8 -->
         <div class="col-md-4 sidebar ftco-animate">
          <h3 style="padding-left: 50px;">서울시 공원 맵 <img src="../images/dogreplyicon.png" width=50px height=50px style="padding-bottom: 12px;"> </h3>
            <div id="a">
		     <img id="seoul_1" src="../map/1111.png">
		      <c:forEach var="i" begin="1" end="25">
		       <img id="gu${i }" src="../map/gu_${i }_off.png" 
		         onmouseover="this.src='../map/gu_${i}_on.png'"  
		         onmouseout="this.src='../map/gu_${i}_off.png'" class="images" data-value="${i }"> 
		     </c:forEach>
		   </div>
		   <div id="print" class="row" style="padding-left: 50px;"></div>
           
        </div>

        </div>
      </div>
    </section> <!-- .section -->
  </body>
</html>
