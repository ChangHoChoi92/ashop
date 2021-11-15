<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
</head>
<body>
	<%@ include file="../dbconn.jsp" %>
		
		
	<sql:update dataSource="${conn}">
		
		delete  
		from card
		where ccode = ?
				  
		<sql:param value="${param.ccode}"/>
	</sql:update>
					
	<script>
		alert("정상적으로 삭제되었습니다!");
		location.href="${pageContext.request.contextPath}/m_card/cardListForm.jsp";
	</script>

</body>
</html>