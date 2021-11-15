<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo" %>
<%@ page import="vo.BoardBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	//전체 게시물을 출력하기 위해 ArrayList 사용
	//<> 제네릭 선언시 반드시 객체타입 선언해야 한다.
	//정수형 ArrayList => ArrayList<Integer>
	//Integer : Wrapper 클래스
	//실수 (float -> Float)
	//double -> Double
	//문자(char -> Charecter)
	//자바의 기본자료형을 객체타입으로 표시(위의 2개 제외 나머지는 첫글자만 대문자표시)
	ArrayList<BoardBean> articleList = (ArrayList<BoardBean>)request.getAttribute("articleList");
	
	//페이징 처리를 하기 위한 클래스
	//pageInfo 속성의 값을 가져온다.
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	int listCount = pageInfo.getListCount();//총게시물 건수
	int nowPage = pageInfo.getPage();//현재 페이지 번호
	int maxPage = pageInfo.getMaxPage();//리스트를 보여주기 위한 최대 페이지수
	int startPage = pageInfo.getStartPage();//해당 페이지에서 시작 페이지번호
	int endPage = pageInfo.getEndPage();//해당 페이지에서 마지막 페이지번호
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbuck Coffee Korea</title>
<style type="text/css">

	#bg1{padding-top:120px; height:850px;}
	#bg2{margin:auto; width:70%;}
	
	#registForm{
	 width:500px;
	 height:600px;
	 border:1px solid red;
	 margin:auto;
	}
	
	#boardwrite a{
		float:right;
		margin-bottom:50px;
		text-decoration-line : none;
		color:black;
	}
	
	a:hover{
	     color:#00A0C6; 
	     text-decoration:none; 
	      
	}
	a {
        text-decoration-line: none;
        text-decoration:none; 
        color:black;
     }
    #titleSub {
        width: 100%;
        margin: auto;
    }
    #titleSub span {
        float: right;
            
    }
	
	#listForm > table{
		text-align : center;
		width:100%;
		border-collapse:collapse;
		
	}
	
	
	#tr_top{
		
		text-align:center;
		
	}

	#listForm > #boardTable th{
		font-size:14px;
		border-top:1px solid black;
		border-bottom:1px solid black;
		margin-top:20px;
		padding:17px 0;
	}
	#listForm > #boardTable td{
		font-size:14px;
		border-bottom:1px solid #dddddd;
		padding:17px 0;
	}
	
	#no{
		margin:0px;
	}
	
	
	
	#pageList{
		margin:auto;
		width:500px;
		text-align:center;
	}
	
	#emptyArea{
		margin:auto;
		width:500px;
		text-align:center;
	}
	
	
</style>
</head>
<body>
	<%@ include file="/dbconn.jsp"%> 
	<%@ include file="/main/header.jsp" %>
	<div id="bg1">
	<div id="bg2">
	
	<!-- 게시판 리스트 -->
	<section id="listForm">
		<h1 style="font-size:30px">공지사항</h1>
	
		<div id="sub_bg">
	        <div id="titleSub">
	            <img src="${pageContext.request.contextPath}/resources/img/myStarbucks/mypage_title.png" alt="마이 페이지">
	            <span><a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/myStarbucks/icon_homeblack.png" alt="홈"></a>
	             > <a href="#">BOARD</a>
	             > 
	             <a href="boardList.bo">공지사항</a></span> 
	        </div>
	    </div>
	    
		<h2 id="boardwrite">
			&nbsp;
			<a href="boardWriteForm.bo">
				<c:if test="${sessionId == 'manager' }">
					게시판글쓰기
				</c:if>
			</a>
		</h2>
		
		<table id="boardTable" summary="공지사항">
			
			<% if(articleList != null && listCount > 0){ %>
			
			<tr id="tr_top">
				<th width="5%">NO</th>
				<th width="70%">제목</th>
				<th width="5%">작성자</th>
				<th width="10%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
			
			<% for(int i=0; i<articleList.size(); i++){ %>
			
			<tr>
				<td><%=articleList.get(i).getBOARD_NUM() %></td>
				<td id="no">
				<%if(articleList.get(i).getBOARD_RE_LEV() != 0){ %>
				<%for(int a=0; a<=articleList.get(i).getBOARD_RE_LEV()*2; a++){ %>
				&nbsp;
				<%} %> 
				<%}else{ %>  <%} %>
					<!--
						게시물 리스트에서 특정 게시물의 제목이 클릭하면
						boardDetail.bo 특정 게시물 상세보기를 처리한다.
						url로 이동할 때 상세보기를 하려는 게시물 번호와
						현재 작업중인 페이지번호도 함께 가지고 이동
					-->
					<a href="boardDetail.bo?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
					<%=articleList.get(i).getBOARD_SUBJECT() %>				
					</a>
				</td>
				<td><%=articleList.get(i).getBOARD_NAME() %></td>
				<td><%=articleList.get(i).getBOARD_DATE() %></td>
				<td><%=articleList.get(i).getBOARD_READCOUNT() %></td>
			</tr>
			<%} %>
		</table>
	</section>
	
	<section id="pageList">
		<%if(nowPage<=1){ %>
			[이전]&nbsp;
		<%}else{ %>
			<a href="boardList.bo?page=<%=nowPage-1%>">[이전]</a>&nbsp;
		<%} %>
		
		<%for(int a=startPage; a<=endPage; a++){
			if(a == nowPage){%>
				[<%=a %>]
			<%}else{ %>
			
				<a href="boardList.bo?page=<%=a%>">[<%=a %>]</a>&nbsp;
			<%} %>
		<%} %>
		<%if(nowPage >= maxPage){ %>
			[다음]
		<%}else{ %>
			<a href="boardList.bo?page=<%=nowPage+1%>">[다음]</a>
		<%} %>
	</section>
	<%
			}else{
	%>
		<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
			}
	%>
	</div>
	</div>
	 <%@ include file="../main/footer.jsp" %>
</body>
</html>