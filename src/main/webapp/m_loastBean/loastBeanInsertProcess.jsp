<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>메뉴 등록 처리</title>
</head>
<body>
	<%@ include file="/dbconn.jsp" %>
	
	<sql:update dataSource="${conn}">
	
		insert into loastbean(bcode,bkind,bname,bname_eng,img,brief,expl,bprice,dStory,ctNote) 
		values(?, ?, ?, ?, ?, ?, ?, ?, ?,?)
		
		
		<sql:param value="${param.bcode}"/>
		<sql:param value="${param.bkind}"/>
		<sql:param value="${param.bname}"/>
		<sql:param value="${param.bname_eng}"/>
		<sql:param value="${param.img}"/>
		<sql:param value="${param.brief}"/>
		<sql:param value="${param.expl}"/>
		<sql:param value="${param.bprice}"/>
		<sql:param value="${param.dStory}"/>
		<sql:param value="${param.ctNote}"/>
		
	
	</sql:update>
	
	<!-- 음료 등록시 음료리스트 화면으로 이동 -->
	
		<script>
			alert("정상적으로 등록되었습니다!");
			
			location.href="${pageContext.request.contextPath}/m_loastBean/loastBeanListForm.jsp";
		</script>
	
	
</body>
</html>