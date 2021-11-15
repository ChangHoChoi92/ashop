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
		
		<sql:query var="rs" dataSource="${conn}">
			select * from menu where name = ?
			<sql:param value="${param.name}"/>
		</sql:query>
		
		<c:forEach var="row" items="${rs.rows}">
	
			<!-- 음료 삭제 시 음료리스트 화면으로 이동 -->
			<c:if test="${row.category == 'cold_brew' || row.category == 'espresso' || row.category == 'frappuccino' || row.category == 'blended' || row.category == 'tea' || row.category == 'signatue' || row.category == 'bottle' }">
				
				<script>
					alert("정상적으로 삭제되었습니다!");
				</script>
				
				<sql:update dataSource="${conn}">
		
					delete  
					  from menu
					 where name = ?
				  
					<sql:param value="${row.name}"/>
				</sql:update>
					
				<script>
					location.href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp";
				</script>
			</c:if>
			
			<!-- 푸드 삭제 시 푸드리스트 화면으로 이동 -->
			<c:if test="${row.category == 'bread' || row.category == 'cake' || row.category == 'salad' || row.category == 'soup' || row.category == 'fruit' || row.category == 'snack' || row.category == 'icecream' }">
				<script>
					alert("정상적으로 삭제되었습니다!");
				</script>
				
				<sql:update dataSource="${conn}">
		
					delete  
					  from menu
					 where name = ?
				  
					<sql:param value="${row.name}"/>
				</sql:update>
					
				<script>	
					location.href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp";
				</script>
			</c:if>
		
		</c:forEach>


</body>
</html>