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
      min-height: 550px;
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
		select * from card where ccode = ?
		<sql:param value="${param.ccode}"/>
	</sql:query>

	<c:forEach var="row" items="${rs.rows}">
	<div id="bg1">
	<div id="bg2">
	<h1 style="padding-bottom:5px;">카드 수정 페이지</h1>
		<form name="Update" 
		      action="cardUpdateProcess.jsp" method="post">
		      <table >
		 			<tr>
		 				<th>
							<label for="cname">코드</label>
						</th>
					<tr>
						<td>
							<input type="text" name="ccode" id="ccode" readonly value="<c:out value='${row.ccode}'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="cname">카드 이름</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="cname" id="cname" value="<c:out value='${row.cname}'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="cname_eng">영어 이름</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="cname_eng" id="cname_eng" value="<c:out value='${row.cname_eng}'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="img">이미지&nbsp;&nbsp;&nbsp;</label><input type="file" name="img" id="img">
						</th>
					</tr>
					<tr>
						<th>
							<label for="rel">출시 년도</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="rel" id="rel" value="<c:out value='${row.rel}'/>" placeholder="xxxx년 x월">
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
							<a href="cardListForm.jsp">카드 리스트</a>
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
	
	<%@ include file="../main/footer.jsp" %>
</body>
</html>