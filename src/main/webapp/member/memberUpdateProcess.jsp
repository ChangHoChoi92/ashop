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
	
	<sql:update dataSource="${conn}">
		update member 
		   set password = ?,
		   	   name = ?,
		   	   gender = ?,
		   	   birthday = ?,
		   	   phone=?,
		   	   email = ?,
		   	   postCd = ?,
		   	   addr = ?,
		   	   addr2 = ?,
		   	  
		   	 <c:if test="${param.nickname != null}">
		     	 nickname = ?,
		     </c:if>
		   	   updatedate = now()
		 where id = ?
		 
		 <sql:param value="${param.pw}"/>
		 <sql:param value="${param.name}"/>
		 <sql:param value="${param.gender}"/>
		 <sql:param value="${param.birthday}"/>
		 <sql:param value="${param.phone}"/>
		 <sql:param value="${param.email}"/>
		 <sql:param value="${param.postCd}"/>
		 <sql:param value="${param.addr}"/>
		 <sql:param value="${param.addr2}"/>
		 
		 <c:if test="${param.nickname != null}">
		   <sql:param value="${param.nickname}"/>
		</c:if>
		
		 <sql:param value="${param.id}"/>
	</sql:update>
	
	<script>
	
		alert("정상적으로 수정되었습니다!");
		
		if("${sessionScope.sessionId}" == "manager") {
			location.href = "memberList.jsp";
		}else {
			location.href = "../main/main.jsp";
		}
		
	</script>

</body>
</html>