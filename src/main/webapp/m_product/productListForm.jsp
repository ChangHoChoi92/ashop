<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>상품 | Starbucks Coffee Korea</</title>
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
	 
			<p style="width: 100%; font-size:40px;">&nbsp;&nbsp;<b>상품</b></p>
			
			<!-- 카테고리 별 분류 체크박스  -->
			


	<table id="checkbox" >

		<tr>
			<td colspan="3" class="td_title" >
			</td>

		</tr>

		<tr>

			<td >
			  <div >
				<input type="checkbox" name="sangpumall" id="sangpumall" onclick="allDisplay()" checked/>전체 상품보기&nbsp;&nbsp;
	
				<input type="checkbox" name="sangpumck" id="sangpumck1" onclick="sangpumck1Display()"/><label id="la1" for="sangpumck1">머그</label>&nbsp;&nbsp;
	
				<input type="checkbox" name="sangpumck" id="sangpumck2" onclick="sangpumck2Display()"/><label id="la2" for="sangpumck2">글라스</label>&nbsp;&nbsp;
	
				<input type="checkbox" name="sangpumck" id="sangpumck3" onclick="sangpumck3Display()"/><label id="la3" for="sangpumck3">플라스틱 텀블러</label>&nbsp;&nbsp;
	
				<input type="checkbox" name="sangpumck" id="sangpumck4" onclick="sangpumck4Display()"/><label id="la4" for="sangpumck4">스테인리스 텀블러</label>&nbsp;&nbsp;
	
				<input type="checkbox" name="sangpumck" id="sangpumck5" onclick="sangpumck5Display()"/><label id="la5" for="sangpumck5">보온병</label>&nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="checkbox" name="sangpumck" id="sangpumck6" onclick="sangpumck6Display()"/><label id="la6" for="sangpumck6">악세서리</label>&nbsp;&nbsp;
				
				<input type="checkbox" name="sangpumck" id="sangpumck7" onclick="sangpumck7Display()"/><label id="la7" for="sangpumck7">커피용품</label>&nbsp;&nbsp;
				
			  </div>
			</td>
		
		</tr>
		

	</table>
			
			<!-- 메뉴 추가 버튼 -->
			<c:if test="${sessionId == 'manager' }">
				<p style="margin-top: 30px; display: flex; justify-content: flex-end;">
					<input type="button"  value="메뉴 추가" onclick="location.href='${pageContext.request.contextPath}/m_product/productInsert.jsp'">
				</p>
			</c:if>
				<!-- 상품 판매 리스트 시작 -->
				
				<!-- 머그 -->
				<div id="mug" class="sangpum">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;머그 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  product where pkind = '머그'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_product/product_view.jsp?pcode=${row.pcode}">
								<img src="${pageContext.request.contextPath}/resources/img/product/<c:out value="${row.img}"/>">
							</a>
							<br>
							<c:out value="${row.pname }"/>
							<!-- 관리자 뷰 삭제버튼 -->
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.pcode}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_product/productUpdate.jsp?pcode=${row.pcode}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			<!-- 글라스 -->
			<div id="glass" class="sangpum">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;글라스 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  product where pkind = '글라스'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_product/product_view.jsp?pcode=${row.pcode}">
								<img src="${pageContext.request.contextPath}/resources/img/product/<c:out value="${row.img}"/>">
							</a>
							<br>
							<c:out value="${row.pname }"/>
							<!-- 관리자 뷰 삭제버튼 -->
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.pcode}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_product/productUpdate.jsp?pcode=${row.pcode}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			<!-- 플라스틱 -->
			<div id="plastic" class="sangpum">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;플라스틱 텀블러&nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  product where pkind = '플라스틱 텀블러'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_product/product_view.jsp?pcode=${row.pcode}">
								<img src="${pageContext.request.contextPath}/resources/img/product/<c:out value="${row.img}"/>">
							</a>
							<br>
							<c:out value="${row.pname }"/>
							<!-- 관리자 뷰 삭제버튼 -->
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.pcode}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_product/productUpdate.jsp?pcode=${row.pcode}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			<!-- 스테인리스 -->
			<div id="stainless" class="sangpum">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;스테인리스 텀블러 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  product where pkind = '스테인리스 텀블러'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_product/product_view.jsp?pcode=${row.pcode}">
								<img src="${pageContext.request.contextPath}/resources/img/product/<c:out value="${row.img}"/>">
							</a>
							<br>
							<c:out value="${row.pname }"/>
							<!-- 관리자 뷰 삭제버튼 -->
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.pcode}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_product/productUpdate.jsp?pcode=${row.pcode}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			<!-- 보온병 -->
			<div id="warmBottle" class="sangpum">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;보온병 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  product where pkind = '보온병'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_product/product_view.jsp?pcode=${row.pcode}">
								<img src="${pageContext.request.contextPath}/resources/img/product/<c:out value="${row.img}"/>">
							</a>
							<br>
							<c:out value="${row.pname }"/>
							<!-- 관리자 뷰 삭제버튼 -->
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.pcode}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_product/productUpdate.jsp?pcode=${row.pcode}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			<!-- 악세서리 -->
			<div id="accessory" class="sangpum">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;악세서리 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  product where pkind = '악세서리'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_product/product_view.jsp?pcode=${row.pcode}">
								<img src="${pageContext.request.contextPath}/resources/img/product/<c:out value="${row.img}"/>">
							</a>
							<br>
							<c:out value="${row.pname }"/>
							<!-- 관리자 뷰 삭제버튼 -->
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.pcode}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_product/productUpdate.jsp?pcode=${row.pcode}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			<!-- 커피도구 -->
			<div id="coffeeTool" class="sangpum">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;커피 용품 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from  product where pkind = '커피용품'
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_product/product_view.jsp?pcode=${row.pcode}">
								<img src="${pageContext.request.contextPath}/resources/img/product/<c:out value="${row.img}"/>">
							</a>
							<br>
							<c:out value="${row.pname }"/>
							<!-- 관리자 뷰 삭제버튼 -->
							<c:if test="${sessionId == 'manager' }">
								<br><input type="button"  value="삭제" onclick="javascript:delete_chk('${row.pcode}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_product/productUpdate.jsp?pcode=${row.pcode}'">
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
		function delete_chk(pcode) {
			if(confirm("정말로 삭제하시겠습니까?")) {
				location.href = "productDelete.jsp?pcode=" + pcode;
			}else {
				alert("취소되었습니다.");
				history.reload();
			}
		}
	</script>	
			
	  <!-- 체크박스 실행 제이쿼리 -->
   <script src="jquery-3.6.0.min.js"></script>
    <script>   
        
        function allDisplay() {
            if($('input:checkbox[id=sangpumall]').is(':checked')) { //제크박스 아이디
                
                if($('input:checkbox[name=sangpumck]').is(':checked')) {
                    $('input:checkbox[name=sangpumck]').prop("checked", false);
                }
                
                $('.sangpum').show();
            
            }else {
                $('.sangpum').hide();
            }
        }
        
        function sangpumck1Display() {
            if($('input:checkbox[id=sangpumck1]').is(':checked')) {
                
                if($('input:checkbox[id=sangpumall]').is(':checked')) {
                    $('input:checkbox[id=sangpumall]').prop("checked", false);
                    
                    $('.sangpum').hide(); //전체
                }
                
                $('#mug').show(); 
            }else {
                $('#mug').hide();
            }
        }
        
        function sangpumck2Display() {
            if($('input:checkbox[id=sangpumck2]').is(':checked')) {
                
                if($('input:checkbox[id=sangpumall]').is(':checked')) {
                    $('input:checkbox[id=sangpumall]').prop("checked", false);
                    
                    $('.sangpum').hide();
                }
                
                $('#glass').show();
            }else {
                $('#glass').hide();
            }
        }
        
        function sangpumck3Display() {
            if($('input:checkbox[id=sangpumck3]').is(':checked')) {
                
                if($('input:checkbox[id=sangpumall]').is(':checked')) {
                    $('input:checkbox[id=sangpumall]').prop("checked", false);
                    
                    $('.sangpum').hide();
                }
                
                $('#plastic').show();
            }else {
                $('#plastic').hide();
            }
        }
        
        function sangpumck4Display() {
            if($('input:checkbox[id=sangpumck4]').is(':checked')) {
                
                if($('input:checkbox[id=sangpumall]').is(':checked')) {
                    $('input:checkbox[id=sangpumall]').prop("checked", false);
                    
                    $('.sangpum').hide();
                }
                
                $('#stainless').show();
            }else {
                $('#stainless').hide();
            }
        }
        
        function sangpumck5Display() {
            if($('input:checkbox[id=sangpumck5]').is(':checked')) {
                
                if($('input:checkbox[id=sangpumall]').is(':checked')) {
                    $('input:checkbox[id=sangpumall]').prop("checked", false);
                    
                    $('.sangpum').hide();
                }
                
                $('#warmBottle').show();
            }else {
                $('#warmBottle').hide();
            }
        }
        
        function sangpumck6Display() {
            if($('input:checkbox[id=sangpumck6]').is(':checked')) {
                
                if($('input:checkbox[id=sangpumall]').is(':checked')) {
                    $('input:checkbox[id=sangpumall]').prop("checked", false);
                    
                    $('.sangpum').hide();
                }
                
                $('#accessory').show();
            }else {
                $('#accessory').hide();
            }
        }
        
        function sangpumck7Display() {
            if($('input:checkbox[id=sangpumck7]').is(':checked')) {
                
                if($('input:checkbox[id=sangpumall]').is(':checked')) {
                    $('input:checkbox[id=sangpumall]').prop("checked", false);
                    
                    $('.sangpum').hide();
                }
                
                $('#coffeeTool').show();
            }else {
                $('#coffeeTool').hide();
            }
        }
        
        <!-- 카테고리를 클릭했을 때 -->
        window.onload = function() {
        	
        	if(${cate == '머그'}) {
        		document.getElementById('la1').click();
        	}else if(${cate == '글라스'}) {
        		document.getElementById('la2').click();
        	}else if(${cate == '플라스틱 텀블러'}) {
        		document.getElementById('la3').click();
        	}else if(${cate == '스테인리스 텀블러'}) {
        		document.getElementById('la4').click();
        	}else if(${cate == '보온병'}) {
        		document.getElementById('la5').click();
        	}else if(${cate == '액세사리'}) {
        		document.getElementById('la6').click();
        	}else if(${cate == '커피 용품'}) {
        		document.getElementById('la7').click();
        	}
			
		}
        
    </script> 
         
			<%@include file="../main/footer.jsp" %>
			
			
			
</body>
</html>