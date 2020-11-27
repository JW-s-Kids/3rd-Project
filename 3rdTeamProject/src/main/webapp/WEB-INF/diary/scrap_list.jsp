<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.scrap_cancel{
	background-color: #f85959;
	color: white;
	transition-property: background-color;
	transition-property: color;
	transition-property: border;
	transition-duration: 0.5s;
	border: 1px solid white;
}

.scrap_cancel:hover{
	background-color: white;
	color: #f85959;
	cursor: pointer;
	border: 1px solid #f85959;
}

.scrap_subject:hover{
	text-decoration: underline;
}


</style>
</head>
<body>
	<div>
		<table style="width:100%; border: 1px solid #b3b3b3;">
			<h3 style="text-align: center;">여행기 스크랩 목록</h3>
			<tr style="background-color: #ECECEC;">
				<th style="width:20%; text-align: center">아이디</th>
				<th style="width:50%; text-align: center">제목</th>
				<th style="width:20%; text-align: center">작성일</th>
				<th style="width:10%; text-align: center"></th>
			</tr>
			<c:forEach var="scrap_vo" items="${boardList }">
			<tr>
				<td style="width:20%; text-align: center">${scrap_vo.id }</td>	
				<td style="width:60%; text-align: left">
					<a href="../diary/detail.do?no=${scrap_vo.no }" style="color: #4d4d4d;" class="scrap_subject">${scrap_vo.subject }</a>
				</td>
				<td style="width:20%; text-align: center">
					<fmt:formatDate value="${scrap_vo.regdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td style="width:10%; text-align: center">
					<input type="button" class="scrap_cancel" value="스크랩 취소" onclick="location.href='../diary/scrap_cancel.do?no=${scrap_vo.no}'">
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>