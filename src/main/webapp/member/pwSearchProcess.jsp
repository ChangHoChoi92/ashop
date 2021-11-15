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
		select password
		  from member
		 where id = ? and name = ?
		<sql:param value="${param.id}"/>
		<sql:param value="${param.name}"/>
	</sql:query>
	
	<c:forEach var="row" items="${rs.rows}" varStatus = "num">
		<c:if test="${num.count == 1 }">
			<script>
				alert("비밀번호를 재설정하세요!");
				location.href='pwUpdate.jsp?id=${param.id}';
			</script>
		</c:if>
	</c:forEach>
	
	<script>
		alert("일치하는 정보가 없습니다!\n정보를 다시 확인하세요!");
		location.href='pwSearch.jsp';
	</script>
</body>
</html>