<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
   
   <c:if test="${count==0 }">
     <h3 class="text-center">검색결과가 없습니다</h3>
   </c:if>
   <c:if test="${count>0 }">
	   <c:forEach var="vo" items="${list }">
	   
	   
	    <div class="block-21 mb-4 d-flex">
	                <a href="../dog/parkdetail.do?no=${vo.no }#yong" class="blog-img mr-4"><img src="${vo.img}" width=130px height=80px></a>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="text">
	                  <div class="meta">
	                  	<p style="color:#FFB914; font-weight:bold; margin:0px 0px 0px 0px;"><a href="../dog/parkdetail.do?no=${vo.no }#yong"><span style="color:#FFB914">${vo.name }</span></a></p>
	                    <div><a href="../dog/parkdetail.do?no=${vo.no }#yong">
	                    <i class="icon-map-o"></i>&nbsp;&nbsp;${vo.zone}
	                    </a></div>
	                    <div><a href="../dog/parkdetail.do?no=${vo.no }#yong"><i class="fa fa-eye" style="font-size:16px"></i>&nbsp;&nbsp;${vo.hit }</a></div>
	                  </div>
	                </div>
	              </div>
	   </c:forEach>
   </c:if>
</body>
</html>