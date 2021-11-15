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
			select * from product where pcode = ?
			<sql:param value="${param.pcode}"/>
		</sql:query>
		
		<c:forEach var="row" items="${rs.rows}">

				<script>
					alert("정상적으로 삭제되었습니다!");
				</script>
				
				<sql:update dataSource="${conn}">
		
					delete  
					  from product
					 where pcode = ?
				  
					<sql:param value="${row.pcode}"/>
				</sql:update>
					
				<script>
					location.href="${pageContext.request.contextPath}/m_product/productListForm.jsp";
				</script>

		</c:forEach>


</body>
</html>