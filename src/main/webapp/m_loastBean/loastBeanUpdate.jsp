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
      padding-bottom: 30px;
      height:100%;
    }
   
    #bg2{
      margin:auto;
      width:70%;
    }
   table{
   width:100%; height:100%; border-collapse: collapse;
   border-right:none;

border-left:none;

border-top:none;

border-bottom:none;
   }
	table >td,th {
		padding:10px;
	}
	table textarea{
		padding:3px 6px; width:100%;
	}
	table input[type="text"] {
		height:30px; padding:3px 6px; width: 100%;
	}
	table input[type="radio"] {
		padding:3px 6px;
	}
	table input[type="file"] {
		float: left;
	}
	table tr th > label {
		font-size: 20px; font-weight: bold; float: left;
	}
	
	
	/* .td_loastBean {
		font-weight:bold;
		font-size:x-large;
	} */
	
</style>
</head>
<body>

	<%@ include file="../dbconn.jsp"%>
	
	<%@ include file="../main/header.jsp" %>
	
	<% pageContext.setAttribute("lf", "\n"); %>
	
	<div style="height : 100px;"></div>


	<sql:query var="rs" dataSource="${conn}">
		select * from loastbean where bcode = ?
		<sql:param value="${param.bcode}"/>
	</sql:query>

	<c:forEach var="row" items="${rs.rows}">
	<div id="bg1">
	<div id="bg2">
	<h1 style="padding-bottom:5px;">원두 수정 페이지</h1>
		<form name="Update" 
		      action="loastBeanUpdateProcess.jsp" method="post">
		      	
	 		<table >
	 			
	 			
	 				
	 			
	 			
	 			<tr>
	 				<th>
	 					<label for="bcode">원두 코드</label>
	 				</th>
	 			</tr>
	 			<tr>
	 				<td>
	 					<input type="text" name="bcode" id="bcode" 
	 					value="<c:out value='${row.bcode}'/>"/>
	 				</td>
	 			</tr>
	 			
	 			<tr>
	 				<th>
	 					<label for="bkind">원두 로스팅 종류</label>
	 				</th>
	 			<tr>
	 				<td>
	 					<input type="text" name="bkind" id="bkind" 
	 					value="<c:out value='${row.bkind}'/>"/>
	 				</td>
	 			</tr>
	 			
	 			<tr>
	 				<th>
	 					<label for="bname">원두 이름</label>
	 				</th>
	 			</tr>
	 			<tr>
	 				<td>
	 					<input type="text" name="bname" id="bname" 
	 					value="<c:out value='${row.bname}'/>"/>
	 				</td>
	 			</tr>
	 			
	 			<tr>
	 				<th>
	 					<label for="bname_eng">원두 영어 이름</label>
	 				</th>
	 			</tr>
	 			<tr>
	 				<td>
	 					<input type="text" name="bname_eng" id="bname_eng" 
	 					value="<c:out value='${row.bname_eng}'/>"/>
	 				</td>
	 			</tr>
	 			
				  <tr>
					<th>
						<label for="img">이미지&nbsp;&nbsp;&nbsp;</label>
						<input type="file" name="img" id="img">
						
						
					</th>
				</tr> 
	 			 
	 			 <tr>
						<th>
							<label for="brief">원두 소개</label>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="brief" id="brief" rows=5;><c:out value="${row.brief}"/></textarea>
						</td>
					</tr>
					<tr>
						<th>
							<label for="expl">원두 상세 설명</label>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="expl" id="expl" rows=15;><c:out value="${row.expl}"/></textarea>
						</td>
					</tr>
				
					
					<tr>
						<th>
							<label for="bprice">가격</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="bprice" id="bprice"
							value="<c:out value='${row.bprice}'/>"/>
						</td>
					</tr>
					<tr>
						<th>
							<label for="dStory">디자인 스토리</label>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="dStory" id="dStory" rows=15;><c:out value="${row.dStory}"/></textarea>
						</td>
					</tr>
					<tr>
						<th>
							<label for="ctNote">커피 테이스팅 노트</label>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="ctNote" id="ctNote" rows=15;><c:out value="${row.ctNote}"/></textarea>
						</td>
					</tr> 
					
					<tr>
						<td colspan="2">
							<a href="javascript:Update.submit()">
								수정
							</a>&nbsp;&nbsp;&nbsp;
							
							<%
								if(session.getAttribute("sessionId").equals("manager")) {
								
							%>
							<a href="loastBeanListForm.jsp">원두 리스트</a>
							<%
								}
							%>
						</td>
	 				</tr>
	 	 		</table>
	 	</form>
	 	</div>
	 	</div>
	</c:forEach>
	<%@include file="../main/footer.jsp" %>
</body>
</html>