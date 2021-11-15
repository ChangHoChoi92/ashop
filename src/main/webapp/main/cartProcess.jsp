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
		String[] option = request.getParameterValues("option");
	%>
	
	<c:set var="option">
		<%
			for(int i = 0; i < option.length; i++) {
				out.print(option[i]);
			}
		%>
	</c:set>
	
	<sql:update dataSource="${conn}">
	
		insert into cart(cname, options, id, img, price, category, regdate)
			values(?, ?, ?, ?, ?, ?, now())
		
		
		<sql:param value="${param.cname}"/>
		<sql:param value="${option }"/>
		<sql:param value="${param.id }"/>
		<sql:param value="${param.img}"/>
		<sql:param value="${param.price }"/>
		<sql:param value="${param.category }"/>	
	</sql:update>
	
	<script>
		var ck = confirm("정상적으로 등록되었습니다.\n장바구니로 이동하시겠습니까?");
		
		if(ck == true) {
			location.href = "../main/cartList.jsp?id=${param.id}"
		}else {
			history.back();
		}
	</script>
	
</body>
</html>