<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>News HTML-5 Template </title>

<style type="text/css">
	div.row1{
		width: 680px;
		height: 820px;
		margin-left: 50px;
		padding: 20px;
		background-color:  rgba( 0, 0, 0, 0.03);
	}
	#content { 
		font-size: 18pt;
		font-weight: bolder;
		margin-bottom: 15px;
		margin-left: 250px;
	}
	table.userform {
		width: 600px;
		height: 650px;
		margin-left: 30px;
	    border-collapse: collapse;
	    text-align: left;
	    line-height: 1.5;
	    border-top: 1px solid #ccc;
		vertical-align: middle;
	}
	table.userform th {
	    padding: 10px;
	    font-weight: bold;
	    font-size: medium;
	    vertical-align: middle;
	    color: #153d73;
	    border-bottom: 1px solid rgba(0,0,0,0.1);
	
	}
	table.userform td {
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid rgba(0,0,0,0.1);
	    vertical-align: middle;
	}
	
	#btn_group{
		width: 600px;
		margin:0 auto; 
		text-align: center;
	}
	
	#updateBtn{ 
		margin-right:20px;
		width:100px;
		border-color: white;
		background-color: rgba( 13, 80, 163);
		color: white; 
		font-weight: bolder; 
		margin-right: 50px;
	 } 

	#updateBtn:hover{ 
		color:black; 
		background-color: rgba( 13, 80, 163, 0.09);
	}

	#cancleBtn{ 
		margin-right:20px;
		width:100px;
		border-color: white;
		background-color: rgba( 255, 162, 119);
		color: white; 
		font-weight: bolder; 
		margin-right: 50px;
	} 
	
	#cancleBtn:hover{ 
		color:black; 
		background-color: rgba( 255, 110, 43, 0.09);
	}
	
	#button{
		width: 130px;
		border-color: white;
		background-color: rgba( 13, 80, 163, 0.6);
		color: white; 
		font-weight: bolder; 
		text-align: center;
		margin: 0 auto;
	}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function postfind()
{
	new daum.Postcode({
		oncomplete:function(data)
		{
			$('#post').val(data.zonecode);
			$('#addr1').val(data.address);
		}
	}).open();
}
function idcheck()
{
	window.open("../user/idcheck.do","idcheck","width=320,height=300,scrollbars=no");
}

$(function(){
	$('#updateBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		let pwd1=$('#pwd1').val();
		if(pwd1.trim()=="")
		{
			alert('비밀번호를 입력하세요');
			$('#pwd1').focus();
			return;
		}
		
		if(pwd!==pwd1)
		{
			alert("비밀번호를 다시 입력하세요");
			$('#pwd1').val("");
			$('#pwd1').focus();
			return;
		}
		
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		
		let birthday=$('#birthday').val();
		if(birthday.trim()=="")
		{
			$('#birthday').focus();
			return;
		}
		
		
		let post=$('#post').val();
		if(post.trim()=="")
		{
			$('#post').focus();
			return;
		}
		
		let addr1=$('#addr1').val();
		if(addr1.trim()=="")
		{
			$('#addr1').focus();
			return;
		}
		
		$('#updateFrm').submit();
	});
});
</script>
</head>

<body>
	<div class="whole-wrap" style="height: 850px">
			<div class="row" style="text-center">
			  <div class="row row1">
					<div id="content">회원정보</div>
				  <form method=post action="../user/update_ok.do" name="updateFrm" id="updateFrm">
					<table class="userform">
					  	<tr>
					  	  <th scope="row" width=30%>아이디*</th>
					  	  <td width=70%>
					  	  	<input type=text name=id class="input-sm" size=15 style="margin-right: 15px;" readonly id="id" value="${vo.id }">
					  	  	<input type=button value="중복체크" class="genric-btn radius small" id="button" onclick="idcheck()">
					  	  	<input type=hidden name=id value="${vo.id }">
					  	  </td>
					  	</tr>	
					  	<tr>
					  	  <th scope="row" width=30%>비밀번호*</th>
					  	  <td width=70%>
					  	  	<input type=password name=pwd class="input-sm" size=15 id="pwd" value="${vo.pwd }">
					  	  </td>
					  	</tr>
					  	<tr>
					  	  <th scope="row" width=30%>비밀번호확인*</th>
					  	  <td width=70%>
	      						<input type=password name=pwd1 class="input-sm" size=15 id="pwd1">
					  	  </td>
					  	</tr>
					  	<tr>
					  	  <th scope="row" width=30%>이름*</th>
					  	  <td width=70%>
					  	  	<input type=text name=name class="input-sm" size=15 id="name" value="${vo.name }">
					  	  </td>
					  	</tr>
					  	<tr>
					  	  <th scope="row" width=30%>이메일</th>
					  	  <td width=70%>
					  	  	<input type=text name=email class="input-sm" size=45 value="${vo.email }">
					  	  </td>
					  	</tr>
					  	<tr>
					  	  <th scope="row" width=30%>생년월일*</th>
					  	  <td width=70%>
					  	  	<input type=date name=birthday class="input-sm" size=25 id="birthday" value="${vo.birthday }">
					  	  </td>
					  	</tr>
					  	<tr>
					  	  <th scope="row" width=30%>성별</th>
					  	  <td width=70%>
					  	  	<input type=radio name=sex id="male" value="남" ${vo.sex=="남"?"checked":""}>
					  	  	<label for="male">남</label>
					  	  	<input type=radio name=sex id="female" style="margin-left: 30px;" value="여" ${vo.sex=="여"?"checked":""}>
					  	  	<label for="female">여</label>
					  	  </td>
					  	</tr>
					  	<tr>
					  	  <th scope="row" width=30%>우편번호*</th>
					  	  <td width=70%>
					  	  	<input type=text name=post class="input-sm" size=7 style="margin-right: 10px;" readonly id="post"  value="${vo.post }">
	      					<input type=button value="우편번호찾기" class="genric-btn radius small" id="button" onclick="postfind()">
					  	  </td>
					  	</tr>
					  	<tr>
					  	  <th scope="row" width=30%>주소*</th>
					  	  <td width=70%>
					  	  	<input type=text name=addr1 class="input-sm" size=45 readonly id="addr1" value="${vo.addr1 }">
					  	  </td>
					  	</tr>
					  	<tr>
					  	  <th scope="row" width=30%>상세주소</th>
					  	  <td width=70%>
					  	  	<input type=text name=addr2 class="input-sm" size=45 value="${vo.addr2 }">
					  	  </td>
					  	</tr>
					  	<tr>
					  	  <th scope="row" width=30%>전화번호</th>
					  	  <td width=70%>
					        <input type=text name=tel class="input-sm" size=25 placeholder="  숫자만 입력" value="${vo.tel }">
					       </td>
					  	</tr>
					</table>
					<div style="height: 20px;"></div>
					<div id="btn_group">
					 <input type=button value="수정" class="genric-btn success radius" id="updateBtn">
					 <input type=button value="취소" class="genric-btn danger radius" id="cancleBtn"
					  onclick="javascript:history.back()">
					</div>
				 
			   </form>
			  
			  </div>
			</div>
	</div>
</body>
</html>