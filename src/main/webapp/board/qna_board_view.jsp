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
		padding-bottom:50px;
		min-height:850px;
	}
	
	#bg2{
		margin:auto;
		width:70%;
	}
	h2 a{
		float:right;
		margin-bottom:50px;
		text-decoration-line : none;
		color:black;
	}
	a{
		
		
	}
	td a{text-decoration-line : none;color:black;}
	a:hover{color:#00A0C6; text-decoration:none;}
	a {text-decoration-line: none; text-decoration-line : none; color:black;}
	#sub_title {width: 100%; margin: auto;}
    #sub_title span {float: right;}	
	table{
		width:100%;
	}
	
	span{
		padding-left:15px;
	}
	
	th{
		border-top:1px solid black;
		border-bottom:1px solid black;
		font-size:25px;
		padding:10px;
	}
	
	td{
		border-bottom:1px solid #dddddd;
	}
	
	#content{
		padding:20px;
		font-size:14px;
	}
	
	#commandList {
		margin:auto;
		width:500px;
		text-align:center;
	}
	#board_file{padding:20px 10px;}
</style>
</head>
<body>
	<%@ include file="/dbconn.jsp"%> 
	<%@ include file="../main/header.jsp" %>
	<div id="bg1">
	<div id="bg2">
	<%
		BoardBean article = (BoardBean)request.getAttribute("article");
		String nowPage = (String)request.getAttribute("page");
	%>
	<h1 style="font-size:30px">공지사항</h1>
	
		<div id="sub_bg">
	        <div id="sub_title">
	            <img src="${pageContext.request.contextPath}/resources/img/myStarbucks/mypage_title.png" alt="마이 페이지">
	            <span><a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/myStarbucks/icon_homeblack.png" alt="홈"></a>
	             > <a href="#">BOARD</a>
	             > 
	             <a href="boardList.bo">공지사항</a></span>
	             
	        </div>
	    </div>
	<table>
		<tr>
			<th width="30%">
				<span style="float:left"><%=article.getBOARD_SUBJECT()%></span>
			</th>
		</tr>
		<tr >
			<td id="board_file">
				첨부파일 :
				<%
				if(!(article.getBOARD_FILE() == null)){
			%>
				<%-- <a href="file_down?downFile=<%=article.getBOARD_FILE()%>">
					<%=article.getBOARD_FILE()%>
				</a> --%>
				
				<a href="${pageContext.request.contextPath}/resources/img/board/<%=article.getBOARD_FILE()%>"
					download="<%=article.getBOARD_FILE()%>">
					<%=article.getBOARD_FILE()%>
				</a>
			<%
				}
			%>
			</td>
		</tr>
		<tr>
			<td width="70%" id="content">
				<pre><%=article.getBOARD_CONTENT()%></pre>
				<img src="${pageContext.request.contextPath}/resources/img/board/<%=article.getBOARD_FILE()%>">
			</td>
		</tr>
	
	</table>
	<%-- <section id="articleForm">
		
		<section id="basicInfoArea">
			제목:<%=article.getBOARD_SUBJECT()%>
			첨부파일:
			<%
				if(!(article.getBOARD_FILE() == null)){
			%>
				<a href="file_down?downFile=<%=article.getBOARD_FILE()%>">
					<%=article.getBOARD_FILE()%>
				</a>
				
				<a href="resources/images/<%=article.getBOARD_FILE()%>"
					download="<%=article.getBOARD_FILE()%>">
					<%=article.getBOARD_FILE()%>
				</a>
			<%
				}
			%>
		</section>
		<section id="articleContentArea">
			<%=article.getBOARD_CONTENT()%>
		</section>
	</section> --%>
	
	<section id="commandList">
		<c:if test="${sessionId == 'manager' }">
			<a href="boardReplyForm.bo?board_num=<%=article.getBOARD_NUM()%>&page=<%=nowPage%>">
				[답변]
			</a>
			<a href="boardModifyForm.bo?board_num=<%=article.getBOARD_NUM()%>&page=<%=nowPage%>">
				[수정]
			</a>
			<a href="boardDeleteForm.bo?board_num=<%=article.getBOARD_NUM()%>&page=<%=nowPage%>">
				[삭제]
			</a>
		</c:if>
			<a href="boardList.bo?page=<%=nowPage%>">
				[목록]
			</a>
	</section>
	</div>
	</div>
	 <%@ include file="../main/footer.jsp" %>
</body>
</html>





