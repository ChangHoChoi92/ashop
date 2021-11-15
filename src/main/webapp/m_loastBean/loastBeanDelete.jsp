<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../dbconn.jsp" %>
		
		<sql:query var="rs" dataSource="${conn}">
			select * from loastbean where bcode = ?
			<sql:param value="${param.bcode}"/>
		</sql:query>
		
		<c:forEach var="row" items="${rs.rows}">
	
			<!-- 음료 삭제 시 음료리스트 화면으로 이동 -->
			
				
				<script>
					alert("정상적으로 삭제되었습니다!");
				</script>
				
				<sql:update dataSource="${conn}">
		
					delete  
					  from loastbean
					 where bcode = ?
				  
					<sql:param value="${row.bcode}"/>
				</sql:update>
					
				<script>
				location.href="${pageContext.request.contextPath}/m_loastBean/loastBeanListForm.jsp";
				</script>
			
			
		
		</c:forEach>

</body>
</html>