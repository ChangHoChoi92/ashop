<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//세션정보 초기화
	session.invalidate();
	
%>
<script>
		alert("로그아웃 되었습니다.");
		location.href='../main/main.jsp';
</script>

</body>
</html>