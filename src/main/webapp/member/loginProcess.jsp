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
	
	<%-- 아이디 저장 관련 쿠키 --%>
	<%
		//파라미터 읽기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String login_id_save = request.getParameter("login_id_save");
		
		//login_id_save 란에 체크가 안되어 있으면 id라는 쿠키를 삭제
		//login_id_save fksdp cpzmrk ehldj dlTdmaus ㅑㅇ fksms znzldp dlqfurgks dkdlelfmf wjwkd
		Cookie cookie = new Cookie("id", id);
		if(login_id_save == null) {
			cookie.setMaxAge(0);
		}
		
		response.addCookie(cookie);
	%>
	
	<%--
	 member 테이블에서 로그인 사용자 존재여부
	 var : 변수 지정
	 dataSource : 데이터베이스 연결 설정.
	 ${} : EL(Expression Language : 표현언어)
	 변수값을 출력.
	 dbconn.jsp의 오라클 연결 설정을 가져와서 변수 rs에 대입
	  --%>
	<sql:query var="rs" dataSource="${conn}">
		select *
		from member
		where id = ? and password = ?
		<sql:param value="${param.id}"/>
		<sql:param value="${param.pw}"/>
	</sql:query>
	
	<%--로그인 하려는 사용자가 member 테이블에 존재 --%>
	<c:if test="${rs.rowCount > 0}">
		<%
			//폼에서 입력받은 id를 세션속성으로 지정
			session.setAttribute("sessionId",id);
		%>
		
		<%-- 닉네임값이 null이 아니면 닉네임으로 표시 --%>
		<%-- 닉네임값이 null이면 id로 표시 --%>
		<c:forEach var="row" items="${rs.rows}">
		<%-- 메인메뉴로 이동 --%>

			<c:if test = "${row.nickname eq ''}"> 
				<script>
					alert("${row.id} 님 환영합니다");
					location.href='../main/main.jsp';
				</script>
			</c:if>
			
			<c:if test = "${row.nickname ne ''}"> 
				<script>
					alert("${row.nickname} 님 환영합니다");
					location.href='../main/main.jsp';
				</script>	
			</c:if>	
			
		</c:forEach>
	</c:if>
	
	<%--
	로그인하려는 사용자가 member테이블에 존재하지 않음
	다시 로그인 화면으로 이동.
	 --%>
	<c:if test="${rs.rowCount == 0}">
		<script>
			alert("아이디 혹은 비밀번호를 확인하세요!");
			location.href='loginForm.jsp';
		</script>
	</c:if>
</body>
</html>