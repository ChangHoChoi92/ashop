<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>상품 등록 처리</title>
</head>
<body>
	<%@ include file="/dbconn.jsp" %>
	
	<sql:update dataSource="${conn}">
	
		insert into product(pcode, pkind, pname, pname_eng, img, brief, expl, pprice) 
		values(?, ?, ?, ?, ?, ?, ?, ?)
		
		
		<sql:param value="${param.pcode}"/>
		<sql:param value="${param.pkind}"/>
		<sql:param value="${param.pname}"/>
		<sql:param value="${param.pname_eng}"/>
		<sql:param value="${param.img}"/>
		<sql:param value="${param.brief}"/>
		<sql:param value="${param.expl}"/>
		<sql:param value="${param.pprice}"/>

	</sql:update>
	
	<!-- 음료 등록시 음료리스트 화면으로 이동 -->
	
		<script>
			alert("정상적으로 등록되었습니다!");
			
			location.href="${pageContext.request.contextPath}/m_product/productListForm.jsp";
		</script>
	
	
</body>
</html>