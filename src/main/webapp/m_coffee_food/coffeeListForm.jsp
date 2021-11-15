<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>음료 | Starbucks Coffee Korea</title>
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
   
   <%
   		String category = request.getParameter("category");
   %>
   
   <c:set var="cate"><%=category %></c:set>
   
   <div style="padding-top: 120px; padding-bottom: 30px; width: 100%;">
      <div style="width: 70%; margin: auto;">
    
         <p style="width: 100%; font-size:40px;margin:20px 0;">&nbsp;&nbsp;<b>음료</b></p>
         
         <!-- 카테고리 별 분류 체크박스  -->
         <table id="checkbox" >
            
            
            <tr>
               <td>
                  <div>
                     <input type="checkbox" name="coffeeall" id="coffeeall" onclick="allDisplay()" checked/>전체 상품보기&nbsp;&nbsp;

                     <input type="checkbox" name="coffeeck" id="coffeeck1" onclick="coffeeck1Display()"/><label id="la1" for="coffeeck1">콜드 브루 커피</label>&nbsp;&nbsp;
            
                     <input type="checkbox" name="coffeeck" id="coffeeck2" onclick="coffeeck2Display()"/><label id="la2" for="coffeeck2">에스프레소</label>&nbsp;&nbsp;
            
                     <input type="checkbox" name="coffeeck" id="coffeeck3" onclick="coffeeck3Display()"/><label id="la3" for="coffeeck3">프라푸치노</label>&nbsp;&nbsp;
            
                     <input type="checkbox" name="coffeeck" id="coffeeck4" onclick="coffeeck4Display()"/><label id="la4" for="coffeeck4">블렌디드</label>&nbsp;&nbsp;&nbsp;&nbsp;
                     
                     <input type="checkbox" name="coffeeck" id="coffeeck5" onclick="coffeeck5Display()"/><label id="la5" for="coffeeck5">티(티바나)</label>&nbsp;&nbsp;
                     
                     <input type="checkbox" name="coffeeck" id="coffeeck6" onclick="coffeeck6Display()"/><label id="la6" for="coffeeck6">기타 제조 음료</label>&nbsp;&nbsp;
         
                     <input type="checkbox" name="coffeeck" id="coffeeck7" onclick="coffeeck7Display()"/><label id="la7" for="coffeeck7">스타벅스 주스(병음료)</label>&nbsp;&nbsp;
                     
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
				
				
			<!-- 커피 판매 메뉴 리스트 시작 -->	
			<div id="coldbrew" class="coffee">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;콜드 브루 커피 &nbsp;&nbsp;</strong><span style="font-size:15px;">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'cold_brew' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value="${row.img }"/>"></a><br>
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
			
			<div id="espresso" class="coffee">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;에스프레소 &nbsp;&nbsp;</strong><span style="font-size:15px;">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'espresso' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value="${row.img }"/>"></a><br>
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
			
			<div id="frappuccino" class="coffee">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;프라푸치노 &nbsp;&nbsp;</strong><span style="font-size:15px;">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'frappuccino' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value="${row.img }"/>"></a><br>
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
			
			<div id="blended" class="coffee">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;블렌디드 &nbsp;&nbsp;</strong><span style="font-size:15px;">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'blended' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value="${row.img }"/>"></a><br>
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
			
			<div id="tea" class="coffee">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;티(티바나) &nbsp;&nbsp;</strong><span style="font-size:15px;">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'tea' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value="${row.img }"/>"></a><br>
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
			
			<div id="signatue" class="coffee">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;기타 제조 음료 &nbsp;&nbsp;</strong><span style="font-size:15px;">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'signatue' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value="${row.img }"/>"></a><br>
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
			
			
			<div id="bottle" class="coffee">
				<div style="background-color:#F4F4F2; width:100%; height: 50px; margin:30px 0; padding-top: 23px;">
					<strong style="font-size:18.72px;">&nbsp;&nbsp;스타벅스 주스(병음료) &nbsp;&nbsp;</strong><span style="font-size:15px;">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span>
				</div>
					
				<sql:query var="rs" dataSource="${conn}">
					select * from menu where category = 'bottle' order by regdate desc
				</sql:query>
					
				<table>
					<tr>
					<c:forEach var="row" items="${rs.rows}" varStatus = "num">
						<td>
							<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value="${row.img }"/>"></a><br>
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
            if($('input:checkbox[id=coffeeall]').is(':checked')) { //체크박스 아이디
                
                if($('input:checkbox[name=coffeeck]').is(':checked')) {
                    $('input:checkbox[name=coffeeck]').prop("checked", false);
                }
                
                $('.coffee').show();
            
            }else {
                $('.coffee').hide();
            }
        }
        
        function coffeeck1Display() {
            if($('input:checkbox[id=coffeeck1]').is(':checked')) {
                
                if($('input:checkbox[id=coffeeall]').is(':checked')) {
                    $('input:checkbox[id=coffeeall]').prop("checked", false);
                    
                    $('.coffee').hide(); //전체
                }
                
                $('#coldbrew').show(); 
            }else {
                $('#coldbrew').hide();
            }
        }
        
        function coffeeck2Display() {
            if($('input:checkbox[id=coffeeck2]').is(':checked')) {
                
                if($('input:checkbox[id=coffeeall]').is(':checked')) {
                    $('input:checkbox[id=coffeeall]').prop("checked", false);
                    
                    $('.coffee').hide();
                }
                
                $('#espresso').show();
            }else {
                $('#espresso').hide();
            }
        }
        
        function coffeeck3Display() {
            if($('input:checkbox[id=coffeeck3]').is(':checked')) {
                
                if($('input:checkbox[id=coffeeall]').is(':checked')) {
                    $('input:checkbox[id=coffeeall]').prop("checked", false);
                    
                    $('.coffee').hide();
                }
                
                $('#frappuccino').show();
            }else {
                $('#frappuccino').hide();
            }
        }
        
        function coffeeck4Display() {
            if($('input:checkbox[id=coffeeck4]').is(':checked')) {
                
                if($('input:checkbox[id=coffeeall]').is(':checked')) {
                    $('input:checkbox[id=coffeeall]').prop("checked", false);
                    
                    $('.coffee').hide();
                }
                
                $('#blended').show();
            }else {
                $('#blended').hide();
            }
        }
        
        function coffeeck5Display() {
            if($('input:checkbox[id=coffeeck5]').is(':checked')) {
                
                if($('input:checkbox[id=coffeeall]').is(':checked')) {
                    $('input:checkbox[id=coffeeall]').prop("checked", false);
                    
                    $('.coffee').hide();
                }
                
                $('#tea').show();
            }else {
                $('#tea').hide();
            }
        }
        
        function coffeeck6Display() {
            if($('input:checkbox[id=coffeeck6]').is(':checked')) {
                
                if($('input:checkbox[id=coffeeall]').is(':checked')) {
                    $('input:checkbox[id=coffeeall]').prop("checked", false);
                    
                    $('.coffee').hide();
                }
                
                $('#signatue').show();
            }else {
                $('#signatue').hide();
            }
        }
        
        function coffeeck7Display() {
            if($('input:checkbox[id=coffeeck7]').is(':checked')) {
                
                if($('input:checkbox[id=coffeeall]').is(':checked')) {
                    $('input:checkbox[id=coffeeall]').prop("checked", false);
                    
                    $('.coffee').hide();
                }
                
                $('#bottle').show();
            }else {
                $('#bottle').hide();
            }
        }
        
        <!-- 카테고리를 클릭했을 때 -->
        window.onload = function() {
        	
        	if(${cate == 'cold_brew'}) {
        		document.getElementById('la1').click();
        	}else if(${cate == 'espresso'}) {
        		document.getElementById('la2').click();
        	}else if(${cate == 'frappuccino'}) {
        		document.getElementById('la3').click();
        	}else if(${cate == 'blended'}) {
        		document.getElementById('la4').click();
        	}else if(${cate == 'tea'}) {
        		document.getElementById('la5').click();
        	}else if(${cate == 'signature'}) {
        		document.getElementById('la6').click();
        	}else if(${cate == 'bottle'}) {
        		document.getElementById('la7').click();
        	}
			
		}
     
    </script> 
         
			<%@include file="../main/footer.jsp" %>
	
	
</body>
</html>