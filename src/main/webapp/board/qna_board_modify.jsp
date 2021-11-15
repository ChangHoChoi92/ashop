<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardBean" %>      
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
	#boardtable{width:100%; height:100%;  /* border:1px solid black; border-collapse: collapse; */ }
	#boardtable td{ /* border:1px solid black; */ padding:10px 10px;}
	#board_num{height:30px; padding:3px 6px;}
	#board_page{height:30px; padding:3px 6px;}
	#modifyText{height:30px; padding:3px 6px; width:100%;}
	textarea{padding:10px 10px;}
	#board_name{width:100%;}
	#board_pass{width:100%;}
	#board_subject{width:100%;}
	#board_content{width:100%;}
	strong{font-wight:900;}
	
	
</style>
<script>
	function modifyboard(){
		modifyform.submit();
	}
</script>
</head>
<body>
	<%@ include file="/dbconn.jsp"%> 
	<%@ include file="../main/header.jsp" %>
	<div id="bg1">
		<div id="bg2">
		<%
			BoardBean article = (BoardBean)request.getAttribute("article");
			//2021 . 08.31
			String nowPage = (String)request.getAttribute("page");
		%>
		<section id="writeForm">
			<h2>공지사항 수정</h2>
			<form name="modifyform" 
			      action="boardModifyPro.bo"
				  method="post">
				<input id="board_num" type="hidden" name="board_num" value="<%=article.getBOARD_NUM()%>"/>
				<input id="board_page" type="hidden" name="page" value = "<%=nowPage %>"/>
		<table id="boardtable">
			<tr>
				<td><strong>작성자</strong></td>
			</tr>
			<tr>
				<td><input id="modifyText" type="text" name="board_name" id="board_name" value="<%=article.getBOARD_NAME()%>"/></td>
			</tr>
			<tr>
				<td><strong>비밀번호</strong></td>
			</tr>
			<tr>
				<td><input id="modifyText" type="password" name="board_pass" id="board_pass" required="required" placeholder="비밀번호를 입력해주세요"/></td>
			</tr>
			<tr>
				<td><strong>제목</strong></td>
			</tr>
			<tr>
				<td><input id="modifyText" type="text" name="board_subject" id="board_subject" value="<%=article.getBOARD_SUBJECT()%>"/></td>
			</tr>
			<tr>
				<td><strong>내용</strong></td>
			</tr>
			<tr>
				<td><textarea name="board_content" 
									  id="board_content"
									  cols="40" rows="15"><%=article.getBOARD_CONTENT()%></textarea></td>
			</tr>
			<tr>
				<td><strong>첨부파일</strong><input type="file" name="board_file" id="board_file" required="required"/></td>
			</tr>
				
		</table>
							
				<section id="commandCell">
					<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</section>
			</form>
		</section>
		</div>
	</div>
	<%@ include file="../main/footer.jsp" %>
</body>
</html>





