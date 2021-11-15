<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원두 수정 process</title>
</head>
<body>
	<%@ include file="../dbconn.jsp"%>
	
	<%@ include file="../main/header.jsp" %>
	
	<div style="height : 100px;"></div>
	
	<sql:update dataSource="${conn}">
		update loastbean
			   set bcode = ?, 
			   	   bkind = ?,
			   	   bname = ?,
			   	   bname_eng = ?,
			   	   brief = ?,
			   	   img = ?,
			   	   expl =?,
			   	   bprice = ?,
			   	   dStory = ?,
			   	   ctNote = ?
		 where bcode = ?
		 <sql:param value="${param.bcode}"/>
		 <sql:param value="${param.bkind}"/>
		 <sql:param value="${param.bname}"/>
		 <sql:param value="${param.bname_eng}"/>
		 <sql:param value="${param.brief}"/>
		 <sql:param value="${param.img}"/>
		 <sql:param value="${param.expl}"/>
		 <sql:param value="${param.bprice}"/>
		 <sql:param value="${param.dStory}"/>
		 <sql:param value="${param.ctNote}"/>
		  <sql:param value="${param.bcode}"/>
	</sql:update>
	
	<script>
		alert("정상적으로 수정되었습니다!");
		
		if("${sessionScope.sessionId}" == "manager"){
			location.href = "loastBeanListForm.jsp";
		}else{
			location.href = "loastBeanListForm.jsp";
		}
	</script>
</body>
</html>