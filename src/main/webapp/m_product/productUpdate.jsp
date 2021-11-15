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
	
</style>
</head>
<body>
	<%@ include file="../dbconn.jsp"%>
	
	<%@ include file="../main/header.jsp" %>
	
	<% pageContext.setAttribute("lf", "\n"); %>
	
	<div style="height : 100px;"></div>


	<sql:query var="rs" dataSource="${conn}">
		select * from product where pcode = ?
		<sql:param value="${param.pcode}"/>
	</sql:query>

	<c:forEach var="row" items="${rs.rows}">
	<div id="bg1">
	<div id="bg2">
	<h1 style="padding-bottom:5px;">상품 수정 페이지</h1>
		<form name="Update" 
		      action="productUpdateProcess.jsp" method="post">
		      <table >
	 			
	 			<tr>
	 				<th>
	 					<label for="pcode">상품 코드</label>
	 				</th>
	 			</tr>
	 			<tr>
	 				<td>
	 					<input type="text" name="pcode" id="pcode" readonly 
	 					value="<c:out value='${row.pcode}'/>"/>
	 				</td>
	 			</tr>
	 			
	 			<tr>
	 				<th>
	 					<label for="pkind">상품 카테고리</label>
	 				</th>
	 			<tr>
	 				<td>
	 					<input type="text" name="pkind" id="pkind" 
	 					value="<c:out value='${row.pkind}'/>"/>
	 				</td>
	 			</tr>
	 			
	 			<tr>
	 				<th>
	 					<label for="pname">상품 이름</label>
	 				</th>
	 			</tr>
	 			<tr>
	 				<td>
	 					<input type="text" name="pname" id="pname" 
	 					value="<c:out value='${row.pname}'/>"/>
	 				</td>
	 			</tr>
	 			
	 			<tr>
	 				<th>
	 					<label for="pname_eng">상품 영어 이름</label>
	 				</th>
	 			</tr>
	 			<tr>
	 				<td>
	 					<input type="text" name="pname_eng" id="pname_eng" 
	 					value="<c:out value='${row.pname_eng}'/>"/>
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
							<label for="brief">상품 소개</label>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="brief" id="brief" rows=5;><c:out value="${row.brief}"/></textarea>
						</td>
					</tr>
					<tr>
						<th>
							<label for="expl">상품 상세 설명</label>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="expl" id="expl" rows=15;><c:out value="${row.expl}"/></textarea>
						</td>
					</tr>
				
					
					<tr>
						<th>
							<label for="pprice">가격</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="pprice" id="pprice"
							value="<c:out value='${row.pprice}'/>"/>
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
							<a href="productListForm.jsp">상품 리스트</a>
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