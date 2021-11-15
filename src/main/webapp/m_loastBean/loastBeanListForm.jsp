<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>원두 | Starbucks Coffee Korea</</title>
<style>

	* {
		margin: 0;
		padding: 0;
	}


	#checkbox {

		border:1px solid darkgray;
		width:100%;
		padding:50px;
	}
		
		
	
	td{ 
		text-align:center;		
	}
	
	.coffee > table {
		width:100%;
	}	
	
	
</style>
</head>
<body>
<%@include file="../dbconn.jsp"%>
<%@include file="../main/header.jsp" %>
	
	<div style="padding-top: 120px; padding-bottom: 30px; width: 100%;"></div>
	
	<div style="width: 70%; margin: auto;">
	
	<%
   		String category = request.getParameter("category");
   	%>
   
   <c:set var="cate"><%=category %></c:set>
	 
			<p style="width: 100%; font-size:40px; margin:20px 0;">&nbsp;&nbsp;<b>원두</b></p>
			
			
	<!-- 카테고리 별 분류 체크박스  -->


	<table id="checkbox">

		
		
		<tr>

			<td >
			 <div>
				<input type="checkbox" name="loastckall"  id="loastckall" onclick="allDisplay()" checked/>전체 상품보기&nbsp;&nbsp;
	
				<input type="checkbox" name="loastck"  id="loastck1"  onclick="loastck1Display()"/><label id="la1" for="loastck1">블론드 로스트</label>&nbsp;&nbsp;
	
				<input type="checkbox" name="loastck"  id="loastck2"  onclick="loastck2Display()"/><label id="la2" for="loastck2">미디엄 로스트</label>&nbsp;&nbsp;
	
				<input type="checkbox" name="loastck"  id="loastck3"  onclick="loastck3Display()"/><label id="la3" for="loastck3">다크 로스트</label>&nbsp;&nbsp;
	
				<input type="checkbox" name="loastck"  id="loastck4"  onclick="loastck4Display()"/><label id="la4" for="loastck4">플레이버</label>&nbsp;&nbsp;
	
				<input type="checkbox" name="loastck"  id="loastck5"  onclick="loastck5Display()"/><label id="la5" for="loastck5">리저브 원두</label>&nbsp;&nbsp;&nbsp;&nbsp;
				
				</div>
			
			</td>
		
		</tr>
		

	</table>

			
			<!-- 메뉴 추가 버튼 -->
			<c:if test="${sessionId == 'manager' }">
				<p style="margin-top: 30px; display: flex; justify-content: flex-end;">
					<input type="button"  value="메뉴 추가" onclick="location.href='${pageContext.request.contextPath}/m_loastBean/loastBeanInsert.jsp'">
				</p>
			</c:if>
				<!-- 원두 판매 리스트 시작 -->
				
				<!-- 블론드 로스트 -->
				<div id="blondLoast" class="loastBean">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;블론드 로스트 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  loastbean where bkind = '블론드 로스트'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_loastBean/loastBean_view.jsp?bcode=${row.bcode}">
								<img src="${pageContext.request.contextPath}/resources/img/loastBean/<c:out value="${row.img}"/>">
							</a>
							<br>
							<c:out value="${row.bname }"/>
							<!-- 관리자 뷰 삭제 / 수정 버튼 -->
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.bname}')" >
									
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_loastBean/loastBeanUpdate.jsp?bcode=${row.bcode}'">
							
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			
			<!-- 미디엄 로스트 -->
			
	 		<div id="mediumLoast" class="loastBean" >
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;미디엄 로스트 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  loastbean where bkind = '미디엄 로스트'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_loastBean/loastBean_view.jsp?bcode=${row.bcode}"><img src="${pageContext.request.contextPath}/resources/img/loastBean/<c:out value="${row.img}"/>"></a><br>
							<c:out value="${row.bname }"/>
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.bname}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_loastBean/loastBeanUpdate.jsp?bcode=${row.bcode}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
				</tr>		
			</table>
			</div>
			
				<!-- 다크 로스트 -->
			
	 		<div id="darkLoast" class="loastBean" >
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;다크 로스트 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  loastbean where bkind = '다크 로스트'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_loastBean/loastBean_view.jsp?bcode=${row.bcode}"><img src="${pageContext.request.contextPath}/resources/img/loastBean/<c:out value="${row.img}"/>"></a><br>
							<c:out value="${row.bname }"/>
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.bname}')">
								
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_loastBean/loastBeanUpdate.jsp?bcode=${row.bcode}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
				</tr>		
			</table>
			</div>
			
			
				<!-- 플레이버 -->
			
	 		<div id="flavorLoast" class="loastBean" >
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;플레이버 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  loastbean where bkind = '플레이버'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_loastBean/loastBean_view.jsp?bcode=${row.bcode}"><img src="${pageContext.request.contextPath}/resources/img/loastBean/<c:out value="${row.img}"/>"></a><br>
							<c:out value="${row.bname }"/>
							
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.bname}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_loastBean/loastBeanUpdate.jsp?bcode=${row.bcode}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
				</tr>		
			</table>
			</div>
			
			<!-- 리저브 -->
			
	 		<div id="reserveLoast" class="loastBean" >
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;스타벅스 리저브 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  loastbean where bkind = '스타벅스 리저브™'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_loastBean/loastBean_view.jsp?bcode=${row.bcode}">
							<img src="${pageContext.request.contextPath}/resources/img/loastBean/<c:out value="${row.img}"/>"></a><br>
							<c:out value="${row.bname }"/>
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.bname}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_loastBean/loastBeanUpdate.jsp?bcode=${row.bcode}'">
							</c:if>
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
		function delete_chk(bname) {
			if(confirm("정말로 삭제하시겠습니까?")) {
				location.href = "loastBeanDelete.jsp?bname=" + bname;
			}else {
				alert("취소되었습니다.");
				history.reload();
			}
		}
	</script>
	
	<!-- 데이터 수정 관련 스크립트 -->
	<!-- <script type="text/javascript">
		funtion update_chk(bname) {
			if{confirm("정말로 삭제하시겠습니까?")) {
				location.href="loastBeanUpdate.jsp?bname=" + bname;
			}else {
				alert("취소되었습니다.");
				history.reload();
			}
		}
	</script>
 --> 	
<!-- 체크박스 실행 제이쿼리 -->
	<script src="jquery-3.6.0.min.js"></script>
    
    <script>   
        
        function allDisplay() {
            if($('input:checkbox[id=loastckall]').is(':checked')) { //제크박스 아이디
                
                if($('input:checkbox[name=loastck]').is(':checked')) {
                    $('input:checkbox[name=loastck]').prop("checked", false);
                }
                
                $('.loastBean').show();
            
            }else {
                $('.loastBean').hide();
            }
        }
        
        function loastck1Display() {
            if($('input:checkbox[id=loastck1]').is(':checked')) {
                
                if($('input:checkbox[id=loastckall]').is(':checked')) {
                    $('input:checkbox[id=loastckall]').prop("checked", false);
                    
                    $('.loastBean').hide(); //전체
                }
                
                $('#blondLoast').show(); //블론드 로스트 id
            }else {
                $('#blondLoast').hide();
            }
        }
        
        function loastck2Display() {
            if($('input:checkbox[id=loastck2]').is(':checked')) {
                
                if($('input:checkbox[id=loastckall]').is(':checked')) {
                    $('input:checkbox[id=loastckall]').prop("checked", false);
                    
                    $('.loastBean').hide();
                }
                
                $('#mediumLoast').show();
            }else {
                $('#mediumLoast').hide();
            }
        }
        
        function loastck3Display() {
            if($('input:checkbox[id=loastck3]').is(':checked')) {
                
                if($('input:checkbox[id=loastckall]').is(':checked')) {
                    $('input:checkbox[id=loastckall]').prop("checked", false);
                    
                    $('.loastBean').hide();
                }
                
                $('#darkLoast').show();
            }else {
                $('#darkLoast').hide();
            }
        }
        
        function loastck4Display() {
            if($('input:checkbox[id=loastck4]').is(':checked')) {
                
                if($('input:checkbox[id=loastckall]').is(':checked')) {
                    $('input:checkbox[id=loastckall]').prop("checked", false);
                    
                    $('.loastBean').hide();
                }
                
                $('#flavorLoast').show();
            }else {
                $('#flavorLoast').hide();
            }
        }
        
        function loastck5Display() {
            if($('input:checkbox[id=loastck5]').is(':checked')) {
                
                if($('input:checkbox[id=loastckall]').is(':checked')) {
                    $('input:checkbox[id=loastckall]').prop("checked", false);
                    
                    $('.loastBean').hide();
                }
                
                $('#reserveLoast').show();
            }else {
                $('#reserveLoast').hide();
            }
        }
        
        <!-- 카테고리를 클릭했을 때 -->
        window.onload = function() {
        	
        	if(${cate == '블론드 로스트'}) {
        		document.getElementById('la1').click();
        	}else if(${cate == '미디엄 로스트'}) {
        		document.getElementById('la2').click();
        	}else if(${cate == '다크 로스트'}) {
        		document.getElementById('la3').click();
        	}else if(${cate == '플레이버'}) {
        		document.getElementById('la4').click();
        	}else if(${cate == '리저브 원두'}) {
        		document.getElementById('la5').click();
        	}
			
		}
        
    </script>
	
<%@include file="../main/footer.jsp" %>
			
</body>
</html>