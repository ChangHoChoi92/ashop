<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 수정 process</title>
</head>
<body>
<%@ include file="../dbconn.jsp"%>
	
	
	<div style="height : 100px;"></div>
	<sql:update dataSource="${conn}">
		update card
		
			set  
			   cname = ?,
			   cname_eng = ?,
			   img = ?,
			   rel = ?
			   
		 where ccode = ?
		 
		 <sql:param value="${param.cname}"/>
		 <sql:param value="${param.cname_eng}"/>
		 <sql:param value="${param.img}"/>
		 <sql:param value="${param.rel}"/>
		 <sql:param value="${param.ccode}"/>
		 
	</sql:update>
	
	<script>
		alert("정상적으로 수정되었습니다!");

		location.href = "cardListForm.jsp";
	</script>
</body>
</html>