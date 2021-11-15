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
		String[] cOption = request.getParameterValues("option1");
		
		String[] fOption = request.getParameterValues("option2");
	%>
	
	<c:if test="${param.category == 'coffee' }">
		<c:set var="cOption">
			<%
				for(int i = 0; i < cOption.length; i++) {
					out.print(cOption[i]);
				}
			%>
		</c:set>
	</c:if>	
	
	
	<c:if test="${param.category == 'food' }">
		<c:set var="fOption">
			<%
				for(int j = 0; j < fOption.length; j++) {
					out.print(fOption[j]);
				}
			%>
		</c:set>
	</c:if>
	

	<sql:update dataSource="${conn}">
	
		insert into mymenu(jname, options, id, img, category, regdate)
			values(?, ?, ?, ?, ?, now())
		
		
		<sql:param value="${param.name}"/>
		
		<c:if test="${param.category == 'coffee' }">
			<sql:param value="${cOption }"/>
		</c:if>
		<c:if test="${param.category == 'food' }">
			<sql:param value="${fOption }"/>
		</c:if>
		
		<sql:param value="${param.id }"/>
		<sql:param value="${param.img}"/>
		<sql:param value="${param.category }"/>
			
	</sql:update>
	
	<script>
		var ck = confirm("정상적으로 등록되었습니다.\nMy Menu로 이동하시겠습니까?");
		
		if(ck == true) {
			location.href = "../main/myMenu_list.jsp?id=${param.id}"
		}else {
			history.back();
		}
	</script>


</body>
</html>