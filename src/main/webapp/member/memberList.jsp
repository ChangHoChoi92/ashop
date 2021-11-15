<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<style>
	body #body {
		width: 100%;
		padding-top: 100px;
		height : 100%;
		
	}
	
	#content {
		width: 80%;
		min-height: 700px;
		margin: auto;
		padding-top: 50px;
		padding-bottom: 50px;
	}
	
	table {
		text-align: center;
		width: 100%;
		font-size: 18px;
		border-collapse: collapse;
		margin : 0 auto;
	}
	
	table th {
		font-size: 20px;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		line-height : 3;
	}
	
	table td {
		border-bottom: 1px solid lightgray;
		line-height : 2;
	}
	
	table a {
		text-decoration-line: none;
	}
	
	table a:hover {
		text-decoration-line: underline;
	}
	
	.button {
		margin-bottom: 10px;
		font: 12px 맑은고딕;
		background-color: #006400;
        color: white;
        border-radius: 5px;
		width: 100px;
		height: 20px;
	}
</style>
</head>
<body>
	<%@ include file="../main/header.jsp" %>

	<div id="body">
		<div id="content">
			<h1>회원리스트</h1>
			<div align="right">
				<button type="button" class="button" onclick="location.href='${pageContext.request.contextPath}/main/main.jsp'">메인메뉴</button>
			</div>
			
			<%@ include file="../dbconn.jsp" %>
			
			<sql:query var="rs" dataSource="${conn}">
				select * from member order by id
			</sql:query>
			
			<table>
				<tr>
					<th width= "10%">아이디</th>
					<th width= "10%">비밀번호</th>
					<th width= "5%">이름</th>
					<th width= "10%">생년월일</th>
					<th width= "5%">성별</th>
					<th width= "15%">이메일</th>
					<th width= "15%">주소</th>
					<th width=" 10%">상세주소</th>
					<th width= "10%">닉네임</th>
					<th width= "5%">수정</th>
					<th width= "5%">삭제</th>
				</tr>
				
				<c:forEach var="row" items="${rs.rows}">
					<tr>
						<td><c:out value="${row.id}"/></td>
						<td><c:out value="${row.password}"/></td>
						<td><c:out value="${row.name}"/></td>
						<td><c:out value="${row.birthday}"/></td>
						<td><c:out value="${row.gender}"/></td>
						<td><c:out value="${row.email}"/></td>
						<td><c:out value="${row.addr}"/></td>
						<td><c:out value="${row.addr2}"/></td>
						<td><c:out value="${row.nickname}"/></td>
						<td>
							<a href="${pageContext.request.contextPath}/member/memberUpdate.jsp?id=${row.id}" style="color: blue;">
								수정
							</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/member/memberDelete.jsp?id=${row.id}" style="color: red;">
								삭제
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<%@ include file="../main/footer.jsp" %>
</body>
</html>