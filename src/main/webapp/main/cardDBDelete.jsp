<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../dbconn.jsp"%>
	
	
	<div style="height : 100px;"></div>
	<sql:update dataSource="${conn}">
		update member
		
			set  
			   cardName = null,
			   cardPrice = null,
			   cardImg = null

		 where id = ?

		 <sql:param value="${param.id}"/>
		 
	</sql:update>
	
	<script>
		alert("카드가 정상적으로 삭제되었습니다!");

		location.href = "${pageContext.request.contextPath}/main/myMenu_card.jsp?id=${param.id}";
	</script>
</body>
</html>