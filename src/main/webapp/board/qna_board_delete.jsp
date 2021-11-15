<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<style>
	#passForm {
		width:400px;
		margin:auto;
		border:1px solid orange;
	}
</style>

</head>
<body>
	<%
		int board_num = (Integer)request.getAttribute("board_num");
		String nowPage = (String)request.getAttribute("page");
	%>
	
	<section id="passForm">
		<%-- 삭제시 게시물번호를 가지고 이동 --%>
		<form name="deleteForm" 
		      action="boardDeletePro.bo?board_num=<%=board_num%>"
		      method="post">
		
			<input type="hidden" name="page" value="<%=nowPage%>"/>
			<table>
				<tr>
					<td>
						<label>글 비밀번호:</label>
					</td>
					<td>
						<input type="password" name="board_pass">
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="삭제"/>&nbsp;&nbsp;
						<input type="button" value="돌아가기" onClick="javascript:history.go(-1)"/>
					</td>
				</tr>
			</table>
		</form>	
	</section>
</body>
</html>