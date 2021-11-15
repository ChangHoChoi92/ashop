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

	<sql:query var="rs" dataSource="${conn}">
		select * 
		from member 
		where id = ?
		<sql:param value="${sessionId}"/>
	</sql:query>
	
	<c:forEach var="row" items="${rs.rows}" varStatus = "num">
		<c:if test="${row.cardName == null }">
			<sql:update dataSource="${conn}">
	
				update member
					  set cardName = ?,
					        cardImg = ?,
					        cardPrice = ?
					where id = ?
				
				
				<sql:param value="${param.cname }"/>
				<sql:param value="${param.img}"/>
				<sql:param value="${param.price }"/>
				<sql:param value="${param.id }"/>
					
			</sql:update>
			
			<script>
				var ck = confirm("정상적으로 등록되었습니다.\nMy Menu_Card 로 이동하시겠습니까?");
				
				if(ck == true) {
					location.href = "../main/myMenu_card.jsp?id=${param.id}"
				}else {
					history.back();
				}
			</script>
		</c:if>
		
		<%-- 카드가 등록되어 있을 때 --%>
		<c:if test="${row.cardName != null }">
			<script>
				alert("카드가 이미 등록되어 있습니다!\n삭제 후 다시 이용해주세요.");
				
				history.back();
			</script>
		</c:if>
	</c:forEach>
	


</body>
</html>