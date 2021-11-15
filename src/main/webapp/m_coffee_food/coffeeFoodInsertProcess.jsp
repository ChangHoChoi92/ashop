<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록 처리</title>
</head>
<body>
	<%@ include file="/dbconn.jsp" %>
	
	<sql:update dataSource="${conn}">
	
		insert into menu(name, ename, kcal, sugars, protein, salt, saturatedfat, caffeine, info, img, size, allergy, price, category, regdate) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())
		
		
		<sql:param value="${param.name}"/>
		<sql:param value="${param.ename}"/>
		<sql:param value="${param.kcal}"/>
		<sql:param value="${param.sugars}"/>
		<sql:param value="${param.protein}"/>
		<sql:param value="${param.salt}"/>
		<sql:param value="${param.saturatedfat}"/>
		<sql:param value="${param.caffeine}"/>
		<sql:param value="${param.info}"/>
		<sql:param value="${param.img}"/>
		<sql:param value="${param.size}"/>
		<sql:param value="${param.allergy}"/>
		<sql:param value="${param.price}"/>
		<sql:param value="${param.category}"/>
	
	</sql:update>
	
	<!-- 음료 등록시 음료리스트 화면으로 이동 -->
	<c:if test="${param.category == 'cold_brew' || param.category == 'espresso' || param.category == 'frappuccino' || param.category == 'blended' || param.category == 'tea' || param.category == 'signatue' || param.category == 'bottle' }">
		<script>
			alert("정상적으로 등록되었습니다!");
			
			location.href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp";
		</script>
	</c:if>
	
	<!-- 푸드 등록 시 푸드리스트 화면으로 이동 -->
	<c:if test="${param.category == 'bread' || param.category == 'cake' || param.category == 'salad' || param.category == 'soup' || param.category == 'fruit' || param.category == 'snack' || param.category == 'icecream' }">
		<script>
			alert("정상적으로 등록되었습니다!");
			
			location.href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp";
		</script>
	</c:if>
	
</body>
</html>