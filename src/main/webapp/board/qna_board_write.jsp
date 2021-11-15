<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<style>
	#bg1{
		padding-top:120px;
		padding-bottom:30px;
		height:100%;
		
	}
	
	#bg2{
		margin:auto;
		width:70%;
	}
	#wirteForm{width:100%; height:100%;}
	#wirteForm td{padding:10px;}
	#wirteForm input{height:30px; padding:3px 6px;}
	#wirteForm textarea{padding:10px 10px;}
	#board_name{width:100%;}
	#board_pass{width:100%;}
	#board_subject{width:100%;}
	#board_content{width:100%;}
	strong{font-wight:900;}
	#board_content{width:100%;}
	
</style>
</head>
<body>
	<%@ include file="/dbconn.jsp"%> 
	<%@ include file="../main/header.jsp" %>
	<div id="bg1">
	<div id="bg2">
	<section id="writeForm">
		<form name="boardForm" 
		      action="boardWritePro.bo" method="post"
			  enctype="multipart/form-data">
	<h2>공지사항 작성</h2>
	<%-- 
		required는 html 5부터 사용가능하고
		값을 입력하지 않으면 오류발생
	 --%>
		<table id="wirteForm">
			<tr>
				<td><strong>작성자</strong></td>
			</tr>
			<tr>
				<td><input type="text" name="board_name" id="board_name" required="required" placeholder="작성자를 입력해주세요"/></td>
			</tr>
			<tr>
				<td><strong>비밀번호</strong></td>
			</tr>
			<tr>
				<td><input type="password" name="board_pass" id="board_pass" required="required" placeholder="비밀번호를 입력해주세요"/></td>
			</tr>
			<tr>
				<td><strong>제목</strong></td>
			</tr>
			<tr>
				<td><input type="text" name="board_subject" id="board_subject" required="required" placeholder="제목을 입력해주세요"/></td>
			</tr>
			<tr>
				<td><strong>내용</strong></td>
			</tr>
			<tr>
				<td><textarea name="board_content" rows="15" id="board_content" required="required" placeholder="내용을 입력해주세요"  style="resize: none;"></textarea></td>
			</tr>
			<tr>
				<td><strong>첨부파일</strong><input type="file" name="board_file" id="board_file" required="required"/></td>
			</tr>
				
		</table>
		<section id="commandCell">
			<input type="submit" value="등록">&nbsp;&nbsp;
			<input type="reset" value="다시쓰기">
		</section>
	
	</form>		
	</section>
			
			
	</div>
	</div>
	 <%@ include file="../main/footer.jsp" %>
</body>
</html>