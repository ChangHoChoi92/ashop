<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- jstl 을 이용한 데이터베이스 연동 --%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--각 나라의 통화, 날짜, 시간등을 표현하기 위한 taglib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//클라이언트 입력 데이터 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
	%>
	
	<%--데이터베이스 연결 설정 --%>
	<sql:setDataSource
		var="conn"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/ashop?serverTimezone=Asia/Seoul"
		user="ashop"
		password="ashop1234"/>
		
</body>
</html>