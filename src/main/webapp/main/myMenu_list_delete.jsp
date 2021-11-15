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
		
		String[] chk2 = request.getParameterValues("chk2");
	%>
	

	<%-- 음료 삭제 --%>
	<c:if test="<%=chk1 != null %>">
		
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
			
				delete  
				from mymenu
				where pk = ?
 
			<sql:param value="${d_chk1}"/>
			</sql:update>
		</c:forTokens>
		
		<script>
			alert("정상적으로 삭제되었습니다!");
			
			location.href = "myMenu_list.jsp?id=${sessionId}" 
		</script>
		
	</c:if>
	
	<%-- 푸드 삭제 --%>
	<c:if test="<%=chk2 != null %>">
		
		<c:set var="chk2">
			<%
				for(int j = 0; j < chk2.length; j++) {
					if(j == 0) {
						out.print(chk2[j]);
					}else {
						out.print("," + chk2[j]);
					}
				}
			%>
		</c:set>
	
	
		<c:forTokens var="d_chk2" items="${chk2 }" delims="," varStatus="status">
			<sql:update dataSource="${conn}">
			
				delete  
				from mymenu
				where pk = ?
					  
				<sql:param value="${d_chk2}"/>
			</sql:update>
		</c:forTokens>
		
		<script>
			alert("정상적으로 삭제되었습니다!");
			
			location.href = "myMenu_list.jsp?id=${sessionId}" 
		</script>
		
	</c:if>
	
	<%-- 아무것도 선택 안했을 때 --%>
	<c:if test="<%=chk1 == null %>">
		<script>
			alert("삭제하실 메뉴를 선택해주세요!");
			
			location.href = "myMenu_list.jsp?id=${sessionId}" 
		</script>
	</c:if>
	
	<%-- 아무것도 선택 안했을 때 --%>
	<c:if test="<%=chk2 == null %>">
		<script>
			alert("삭제하실 메뉴를 선택해주세요!");
			
			location.href = "myMenu_list.jsp?id=${sessionId}" 
		</script>
	</c:if>
	
	
</body>
</html>