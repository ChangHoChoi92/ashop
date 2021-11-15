<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardBean" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#registForm {
		width:500px;
		height:610px;
		border:1px solid red;
		margin:auto;
	}
	
	h2 {
		text-align:center;
	}
	
	table {
		margin:auto;
		width:450px;
	}
	
	.td_left {
		width:150px;
		background:orange;
		text-align:center;
	}
	
	.td_right {
		width:300px;
		background:skyblue;
	}
	
	#commandCell {
		text-align:center;
	}
</style>
</head>
<body>
	<%
		BoardBean article = (BoardBean)request.getAttribute("article");
		String nowPage = (String)request.getAttribute("page");
	%>
	<section id="writeForm">
		<h2>게시판 글등록</h2>
		<form name="boardForm" 
		      action="boardReplyPro.bo" method="post">
			<input type="hidden" name="page" value="<%=nowPage%>"/>
			<input type="hidden" name="board_num" value="<%=article.getBOARD_NUM()%>"/>
			<input type="hidden" name="board_re_ref" value="<%=article.getBOARD_RE_REF()%>"/>
			<input type="hidden" name="board_re_lev" value="<%=article.getBOARD_RE_LEV()%>"/>			      
			<input type="hidden" name="board_re_seq" value="<%=article.getBOARD_RE_SEQ()%>"/>
			
			<table>
				<tr>
					<td class="td_left">
						<label for="board_name">글쓴이</label>
					</td>
					<td>	
						<%-- 
							required는 html 5부터 사용가능하고
							값을 입력하지 않으면 오류발생
						 --%>
						<input type="text" name="board_name" id="board_name" required="required"/>
					</td>
				</tr>
				<tr>
					<td class="td_left">
						<label for="board_pass">비밀번호</label>
					</td>
					<td>	
						<input type="password" name="board_pass" id="board_pass" required="required"/>
					</td>
				</tr>				
				<tr>
					<td class="td_left">
						<label for="board_subject">제목</label>
					</td>
					<td>	
						<input type="text" name="board_subject" id="board_subject" required="required"/>
					</td>
				</tr>
				<tr>
					<td class="td_left">
						<label for="board_content">내용</label>
					</td>
					<td><textarea name="board_content" cols="40" rows="15" id="board_content" required="required"></textarea>
					</td>
				</tr>			
			</table>
			<section id="commandCell">
				<input type="submit" value="답변글등록"/>&nbsp;&nbsp;
				<input type="reset" value="다시작성"/>
			</section>
		</form>
	</section>
</body>
</html>








