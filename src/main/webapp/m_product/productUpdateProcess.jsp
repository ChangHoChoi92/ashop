<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 process</title>
</head>
<body>
<%@ include file="../dbconn.jsp"%>
	
	<%@ include file="../main/header.jsp" %>
	
	<div style="height : 100px;"></div>
	<sql:update dataSource="${conn}">
		update product
			   set  
			   	   pkind = ?,
			   	   pname = ?,
			   	   pname_eng = ?,
			   	   img = ?,
			   	   brief = ?,
			   	   expl =?,
			   	   pprice = ?
		 where pcode = ?
		 
		 <sql:param value="${param.pkind}"/>
		 <sql:param value="${param.pname}"/>
		 <sql:param value="${param.pname_eng}"/>
		 <sql:param value="${param.img}"/>
		 <sql:param value="${param.brief}"/>
		 <sql:param value="${param.expl}"/>
		 <sql:param value="${param.pprice}"/>
		 <sql:param value="${param.pcode}"/>
	</sql:update>
	<script>
		alert("정상적으로 수정되었습니다!");
		
		if("${sessionScope.sessionId}" == "manager"){
			location.href = "productListForm.jsp";
		}else{
			location.href = "productListForm.jsp";
		}
	</script>
</body>
</html>