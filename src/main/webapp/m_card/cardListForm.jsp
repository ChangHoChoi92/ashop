<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>카드 | Starbucks Coffee Korea</</title>
<style>

	* {
		margin: 0;
		padding: 0;
	}

	.list{
		width:100%;
		text-align: center;
	}
	#reg{
    	height:30px;
    	background-color: #046241; 
    	color : white;
    	vertical-align: middle;
    	border-radius: 5px;
    	width : 100px;
	}
</style>
</head>
<body>
<%@include file="../dbconn.jsp"%>
<%@include file="../main/header.jsp" %>
	
	<div style="padding-top: 120px; padding-bottom: 30px; width: 100%;"></div>
	
	<div style="width: 70%; margin: auto;">
	 
			<p style="width: 100%; font-size:40px; margin:20px 0;">&nbsp;&nbsp;<b>카드</b></p>
			
	
			<!-- 메뉴 추가 버튼 -->
			<c:if test="${sessionId == 'manager' }">
				<p style="margin-top: 30px; display: flex; justify-content: flex-end;">
					<input type="button"  value="카드 추가" onclick="location.href='${pageContext.request.contextPath}/m_card/cardInsert.jsp'" id="reg">
				</p>
			</c:if>
				<!-- 카드 리스트 시작 -->
				<div class="card" id="card">
					<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
						<strong style="font-size:18.72px;">&nbsp;&nbsp; 스타벅스 카드 &nbsp;&nbsp;</strong>
					</div>
						
					<sql:query var="rs" dataSource="${conn}">
						select * from  card
					</sql:query>
						
					<table class="list">
						<tr>
						<c:forEach var="row" items="${rs.rows}" varStatus = "num">
							<td style="width : 20%;">
								<a href="${pageContext.request.contextPath}/m_card/card_view.jsp?ccode=${row.ccode}">
									<img src="${pageContext.request.contextPath}/resources/img/card/<c:out value="${row.img}"/>"style="width: 100%; background-color:white">
								</a>
								
								<br>
								<c:out value="${row.cname }"/>
								<!-- 관리자 뷰 삭제 / 수정 버튼 -->
								<c:if test="${sessionId == 'manager' }">
									<br>
									<input type="button"  value="삭제" onclick="javascript:delete_chk('${row.ccode}')" >
									<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_card/cardUpdate.jsp?ccode=${row.ccode}'">
								</c:if>
								<br>
								<br>
							</td>
							<c:if test="${num.count % 4 == 0}">
								</tr><tr>
							</c:if>
						</c:forEach>
						</tr>	
					</table>		
				</div>
		</div>
			
	<!-- 데이터 삭제관련 스크립트 -->
	<script>
		function delete_chk(ccode) {
			if(confirm("정말로 삭제하시겠습니까?")) {
				location.href = "cardDelete.jsp?ccode=" + ccode;
			}else {
				alert("취소되었습니다.");
				history.reload();
			}
		}
	</script>
	
<!-- 체크박스 실행 제이쿼리 -->
	<script src="jquery-3.6.0.min.js"></script>
    
	
<%@include file="../main/footer.jsp" %>
			
</body>
</html>