<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>푸드 | Starbucks Coffee Korea</title>
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
   
   .food > table {
      width:100%;
   }
   
</style>
</head>
<body>
   <%@include file="../dbconn.jsp"%>
   <%@include file="../main/header.jsp" %>
   
   <%
   		String category = request.getParameter("category");
   %>
   
   <c:set var="cate"><%=category %></c:set>
   
   <div style="padding-top: 120px; padding-bottom: 30px; width: 100%;">
      <div style="width: 70%; margin: auto;">
    
         <p style="width: 100%; font-size:40px; margin:20px 0;">&nbsp;&nbsp;<b>푸드</b></p>
         
         <!-- 카테고리 별 분류 체크박스  -->
         <table id="checkbox" >
            
            <tr>
               <td>
                  <div>
                     <input type="checkbox" name="foodckall" id="foodckall" onclick="allDisplay()" checked/>전체 상품보기&nbsp;&nbsp;
            
                     <input type="checkbox" name="foodck" id="foodck1" onclick="foodck1Display()"/><label id="la1" for="foodck1">브레드</label>&nbsp;&nbsp;
            
                     <input type="checkbox" name="foodck" id="foodck2" onclick="foodck2Display()"/><label id="la2" for="foodck2">케이크</label>&nbsp;&nbsp;
            
                     <input type="checkbox" name="foodck" id="foodck3" onclick="foodck3Display()"/><label id="la3" for="foodck3">샌드위치 & 샐러드</label>&nbsp;&nbsp;
            
                     <input type="checkbox" name="foodck" id="foodck4" onclick="foodck4Display()"/><label id="la4" for="foodck4">따뜻한 푸드</label>&nbsp;&nbsp;&nbsp;&nbsp;
                     
                     <input type="checkbox" name="foodck" id="foodck5" onclick="foodck5Display()"/><label id="la5" for="foodck5">과일 & 요거트</label>&nbsp;&nbsp;
         
                     <input type="checkbox" name="foodck" id="foodck6" onclick="foodck6Display()"/><label id="la6" for="foodck6">스낵 & 미니 디저트</label>&nbsp;&nbsp;
                     
                     <input type="checkbox" name="foodck" id="foodck7" onclick="foodck7Display()"/><label id="la7" for="foodck7">아이스크림</label>&nbsp;&nbsp;
                     
                    </div>
               </td>
               
            </tr>
         </table>
			<!-- 메뉴 추가 버튼 -->
			<c:if test="${sessionId == 'manager' }">
				<p style="margin-top: 30px; display: flex; justify-content: flex-end;">
					<input type="button"  value="메뉴 추가" onclick="location.href='${pageContext.request.contextPath}/m_coffee_food/coffeeFoodInsert.jsp'">
				</p>
			</c:if>
				
				
			<!-- 푸드 판매 메뉴 리스트 시작 -->	
			<div id="bread" class="food">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;브레드 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'bread' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/food/<c:out value="${row.img }"/>"></a><br>
							<c:out value="${row.name }"/>
							<c:if test="${sessionId == 'manager' }">
								<br>
								<input type="button"  value="삭제" onclick="javascript:delete_chk('${row.name}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_coffee_food/coffeeFoodUpdate.jsp?name=${row.name}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			<div id="cake" class="food">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;케이크 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'cake' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/food/<c:out value="${row.img }"/>"></a><br>
							<c:out value="${row.name }"/>
							<c:if test="${sessionId == 'manager' }">
								<br>
								<input type="button"  value="삭제" onclick="javascript:delete_chk('${row.name}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_coffee_food/coffeeFoodUpdate.jsp?name=${row.name}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			<div id="salad" class="food">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;샌드위치 & 샐러드 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'salad' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/food/<c:out value="${row.img }"/>"></a><br>
							<c:out value="${row.name }"/>
							<c:if test="${sessionId == 'manager' }">
								<br>
								<input type="button"  value="삭제" onclick="javascript:delete_chk('${row.name}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_coffee_food/coffeeFoodUpdate.jsp?name=${row.name}'">
							</c:if>
						</td>
						
						
						
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			<div id="soup" class="food">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;따뜻한 푸드 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'soup' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/food/<c:out value="${row.img }"/>"></a><br>
							<c:out value="${row.name }"/>
							<c:if test="${sessionId == 'manager' }">
								<br>
								<input type="button"  value="삭제" onclick="javascript:delete_chk('${row.name}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_coffee_food/coffeeFoodUpdate.jsp?name=${row.name}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>

					</tr>	
				</table>		
			</div>
			
			<div id="fruit" class="food">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;과일 & 요거트 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'fruit' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/food/<c:out value="${row.img }"/>"></a><br>
							<c:out value="${row.name }"/>
							<c:if test="${sessionId == 'manager' }">
								<br>
								<input type="button"  value="삭제" onclick="javascript:delete_chk('${row.name}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_coffee_food/coffeeFoodUpdate.jsp?name=${row.name}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			<div id="snack" class="food">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;스낵 & 미니 디저트 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'snack' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/food/<c:out value="${row.img }"/>"></a><br>
							<c:out value="${row.name }"/>
							<c:if test="${sessionId == 'manager' }">
								<br>
								<input type="button"  value="삭제" onclick="javascript:delete_chk('${row.name}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_coffee_food/coffeeFoodUpdate.jsp?name=${row.name}'">
							</c:if>
						</td>
						<c:if test="${num.count % 4 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					</tr>	
				</table>		
			</div>
			
			
			<div id="icecream" class="food">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;아이스크림 &nbsp;&nbsp;</strong>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'icecream' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/food/<c:out value="${row.img }"/>"></a><br>
							<c:out value="${row.name }"/>
							<c:if test="${sessionId == 'manager' }">
								<br>
								<input type="button"  value="삭제" onclick="javascript:delete_chk('${row.name}')">
								<input type="button"  value="수정" onclick="location.href='${pageContext.request.contextPath}/m_coffee_food/coffeeFoodUpdate.jsp?name=${row.name}'">
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
	</div>
	
	
	<!-- 데이터 삭제관련 스크립트 -->
	<script>
		function delete_chk(name) {
			if(confirm("정말로 삭제하시겠습니까?")) {
				location.href = "coffeeFoodDelete.jsp?name=" + name;
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
            if($('input:checkbox[id=foodckall]').is(':checked')) { //제크박스 아이디
                
                if($('input:checkbox[name=foodck]').is(':checked')) {
                    $('input:checkbox[name=foodck]').prop("checked", false);
                }
                
                $('.food').show();
            
            }else {
                $('.food').hide();
            }
        }
        
        function foodck1Display() {
            if($('input:checkbox[id=foodck1]').is(':checked')) {
                
                if($('input:checkbox[id=foodckall]').is(':checked')) {
                    $('input:checkbox[id=foodckall]').prop("checked", false);
                    
                    $('.food').hide(); //전체 숨기기
                }
                
                $('#bread').show(); //블론드 로스트 id
            }else {
                $('#bread').hide();
            }
        }
        
        function foodck2Display() {
            if($('input:checkbox[id=foodck2]').is(':checked')) {
                
                if($('input:checkbox[id=foodckall]').is(':checked')) {
                    $('input:checkbox[id=foodckall]').prop("checked", false);
                    
                    $('.food').hide();
                }
                
                $('#cake').show();
            }else {
                $('#cake').hide();
            }
        }
        
        function foodck3Display() {
            if($('input:checkbox[id=foodck3]').is(':checked')) {
                
                if($('input:checkbox[id=foodckall]').is(':checked')) {
                    $('input:checkbox[id=foodckall]').prop("checked", false);
                    
                    $('.food').hide();
                }
                
                $('#salad').show();
            }else {
                $('#salad').hide();
            }
        }
        
        function foodck4Display() {
            if($('input:checkbox[id=foodck4]').is(':checked')) {
                
                if($('input:checkbox[id=foodckall]').is(':checked')) {
                    $('input:checkbox[id=foodckall]').prop("checked", false);
                    
                    $('.food').hide();
                }
                
                $('#soup').show();
            }else {
                $('#soup').hide();
            }
        }
        
        function foodck5Display() {
            if($('input:checkbox[id=foodck5]').is(':checked')) {
                
                if($('input:checkbox[id=foodckall]').is(':checked')) {
                    $('input:checkbox[id=foodckall]').prop("checked", false);
                    
                    $('.food').hide();
                }
                
                $('#fruit').show();
            }else {
                $('#fruit').hide();
            }
        }
        
        function foodck6Display() {
            if($('input:checkbox[id=foodck6]').is(':checked')) {
                
                if($('input:checkbox[id=foodckall]').is(':checked')) {
                    $('input:checkbox[id=foodckall]').prop("checked", false);
                    
                    $('.food').hide();
                }
                
                $('#snack').show();
            }else {
                $('#snack').hide();
            }
        }
        
        function foodck7Display() {
            if($('input:checkbox[id=foodck7]').is(':checked')) {
                
                if($('input:checkbox[id=foodckall]').is(':checked')) {
                    $('input:checkbox[id=foodckall]').prop("checked", false);
                    
                    $('.food').hide();
                }
                
                $('#icecream').show();
            }else {
                $('#icecream').hide();
            }
        }
        
        <!-- 카테고리를 클릭했을 때 -->
        window.onload = function() {
        	
        	if(${cate == 'bread'}) {
        		document.getElementById('la1').click();
        	}else if(${cate == 'cake'}) {
        		document.getElementById('la2').click();
        	}else if(${cate == 'salad'}) {
        		document.getElementById('la3').click();
        	}else if(${cate == 'soup'}) {
        		document.getElementById('la4').click();
        	}else if(${cate == 'fruit'}) {
        		document.getElementById('la5').click();
        	}else if(${cate == 'snack'}) {
        		document.getElementById('la6').click();
        	}else if(${cate == 'icecream'}) {
        		document.getElementById('la7').click();
        	}
			
		}
        
    </script> 
         
			<%@include file="../main/footer.jsp" %>
	
	
</body>
</html>