<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>카드 등록 처리</title>
</head>
<body>
	<%@ include file="/dbconn.jsp" %>
	
	<sql:update dataSource="${conn}">
	
		insert into card(cname, cname_eng, img, rel) 
				values(?, ?, ?, ?)
		
		
		<sql:param value="${param.cname}"/>
		<sql:param value="${param.cname_eng}"/>
		<sql:param value="${param.img}"/>
		<sql:param value="${param.rel}"/>

	</sql:update>
	
	<!-- 카드 등록시 카드리스트 화면으로 이동 -->
	
		<script>
			alert("정상적으로 등록되었습니다!");
			
			location.href="${pageContext.request.contextPath}/m_card/cardListForm.jsp";
		</script>
	
	
</body>
</html>