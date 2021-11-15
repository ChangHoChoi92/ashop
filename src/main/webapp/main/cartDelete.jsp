<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/dbconn.jsp" %>
	
	
	<sql:update dataSource="${conn}">
			
		delete  
		from cart
		where pk = ?
 
		<sql:param value="${param.pk}"/>
	</sql:update>

	<script>
		alert("정상적으로 삭제되었습니다!");
			
		location.href = "cartList.jsp?id=${sessionId}" 
	</script>
	
</body>
</html>