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
	
		delete  
		  from member
		 where id = ?
		  
		 <sql:param value="${param.id}"/>
		 
	</sql:update>
	
	<script>
	
		alert("정상적으로 삭제되었습니다!");
		
		if("${sessionScope.sessionId}" == "manager") {
			location.href = "memberList.jsp";
		}else {
			location.href = "loginForm.jsp";
		}
		
	</script>
</body>
</html>