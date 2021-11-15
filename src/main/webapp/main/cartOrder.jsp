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

	<%	
		String[] chk1 = request.getParameterValues("chk1");
	%>
	

	
	<c:set var="chk1">
		<%
			for(int i = 0; i < chk1.length; i++) {
				if(i == 0) {
					out.print(chk1[i]);
				}else {
					out.print("," + chk1[i]);
				}
			}
		%>
	</c:set>
	
	<c:forTokens var="d_chk1" items="${chk1 }" delims="," varStatus="status">
		<sql:update dataSource="${conn}">
			
			update cart  
			set orderyn = 'Y'
			where pk = ?
 
			<sql:param value="${d_chk1}"/>
		</sql:update>
	</c:forTokens>
		
	<script>
		alert("정상적으로 주문완료 되었습니다!");
			
		location.href = "cartList.jsp?id=${sessionId}" 
	</script>
	
</body>
</html>