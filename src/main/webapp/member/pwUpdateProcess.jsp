<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
</head>
<body>
	<%@ include file="../dbconn.jsp" %>
	
	<sql:update dataSource="${conn}">
		update member 
		   set password = ?,
		   	   updatedate = now()
		 where id = ?
		 
		 <sql:param value="${param.pw1}"/>
		 <sql:param value="${param.id}"/>
	</sql:update>
	
	<script>
	
		alert("정상적으로 변경되었습니다!\n다시 로그인 해주세요!");
		
		location.href = "loginForm.jsp";
		
	</script>

</body>
</html>