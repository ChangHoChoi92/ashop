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

	<sql:query var="rs" dataSource="${conn}">
		select id
		  from member
		 where name = ? and phone = ?
		<sql:param value="${param.name}"/>
		<sql:param value="${param.phone}"/>
		
	</sql:query>
	
	

	<c:forEach var="row" items="${rs.rows}" varStatus = "num">	
		
		
		<c:if test="${num.count == 1 }">
			<script>
				alert("찾으시는 아이디는 '${row.id}' 입니다.");
				location.href='loginForm.jsp';
			</script>
		</c:if>
		
	</c:forEach>
	
	<script>
		alert("일치하는 ID가 없습니다!\n정보를 다시 확인하세요!");
		location.href='idSearch.jsp';
	</script>
	
</body>
</html>