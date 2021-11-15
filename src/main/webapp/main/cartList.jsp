<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
    <meta charset="UTF-8" name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    >
    <title>Starbucks Coffee Korea</title>
    
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        
        a {
            text-decoration-line: none;
        }
        
        a:hover {
            text-decoration-line: underline;
        }
        
        #sub_bg {
            background-image: url(${pageContext.request.contextPath}/resources/img/myStarbucks/mypage_bg.jpg);
            padding-top: 100px;
            width: 100%;
        }
        
        #sub_title {
            width: 70%;
            margin: auto;
        }
        
        #sub_title span {
            float: right;
            color: white;
        }
        
        #sub_title span a {
            color: white;
            bottom: 0;
        }
        
        #content_bg {
            width: 100%;
            padding-top: 20px;
        }
        
        #content {
            width: 70%;
            height: 100%;
            margin: auto;
        }
        
        #content > div {
            width: 68%;
            margin-top: 30px;
        }
        
        
        #my_info {
            height: 100px;
            background-color: #f4f4f1;
            font-size: 20px;
        }
        
        #my_info span {
            font-size: 13px;
        }
        
        #my_info a {
            font-size: 15px;
            display: block;
            text-align: center;
            width: 100px;
            border: 1px solid gray;
            color: black;
            background-color: white;
            position: relative;
            top: 20px;
            left: 5px;
        }
        
        
        /*바 메뉴 CSS*/
        #content > #bar {
            width: 30%;
            float: right;
        }
        
        #content > #bar > ul {
            border-top: 3px solid black;
            border-bottom: 1px solid #dddddd;
        }
        
        #content > #bar > ul > li {
            list-style-type: none;
            border-top: 1px solid #dddddd;
            line-height: 50px;
            font-size: 25px;
        }
        
        #content > #bar > ul > li a {
            color: black;
        }
        
        #content > #bar > ul > li a:hover {
            color: darkgreen;
        }
        
        #content > #bar > ul > li span {
            float: right;
        }
        
        #content > #bar #bar_main .sub {
            display: none;
        }
        
        #content > #bar #bar_main .sub li {
            list-style-type: none;
        }
        
        #content > #bar #bar_main .sub li a {
            color: black;
        }
        
                    
          
        
        /* 상품리스트 출력 테이블 */
        .mylist table {
        	width: 100%;
        	border-collapse: collapse;
        	text-align: center;
        }
        
        .mylist p {
        	padding: 10px 0 15px 0;
        }
        
        .mylist table th {
        	border-top: 1px solid black;
        	border-bottom: 1px solid black;
        	padding: 15px 0;
        }
        
        .mylist table td {
        	border-bottom: 1px solid #dbdbdb;
        	padding: 15px 0;
        	height:20px;
        }
        
        .mylist table td img{
        	width:100px;
        	height:100px;
        }
        
       #orderbt {width: 100%; height:80px; background-color:#006633; text-align: center; margin:40px 0 100px 0;} 
       #orderbt input[type="submit"]{width: 100%; height: 100%; background-color:#006633; color: white; font-size: 25px;}
       
       #total {width: 150px; height: 30px; border: 0px; font-size: 30px; color: darkgreen; text-align:right;}
        
    </style>
    
</head>
<body>

	<%@ include file="header.jsp" %>
	<%@ include file="../dbconn.jsp" %>
	
	<sql:query var="rs" dataSource="${conn}">
		select * from member where id = ?
		<sql:param value="${param.id}"/>
	</sql:query>

	<div style="height: 100px;"></div>
	
    <div id="sub_bg">
        <div id="sub_title">
            <img src="${pageContext.request.contextPath}/resources/img/myStarbucks/my_cart.png" alt="마이 메뉴">
            <span><a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/myStarbucks/icon_home.png" alt="홈"></a> > <a href="${pageContext.request.contextPath}/main/myMenu.jsp?id=${sessionId}">My Starbucks</a> > <a href="${pageContext.request.contextPath}/main/cartList.jsp?id=${sessionId}">My 장바구니</a></span>
        </div>
    </div>
    
    <div id="content_bg">
        <div id="content">
           
            <div id="bar">
                <ul id="bar_main">
                    <li class="main1"><a href="${pageContext.request.contextPath}/main/myMenu_card.jsp?id=${sessionId}">My 스타벅스 카드</a></li>
                    <li class="main2"><a href="${pageContext.request.contextPath}/main/cartList.jsp?id=${param.id}">My 장바구니</a></li>
                    <li class="main3"><a href="${pageContext.request.contextPath}/main/myMenu_list.jsp?id=${param.id}">My 메뉴</a></li>
                    <li class="main4"><a href="#">개인정보관리<span><img id="main4_img" src="${pageContext.request.contextPath}/resources/img/myStarbucks/down.png"></span></a></li>
                       <ul id="bar_sub4" class="sub">
                           <li><a href="${pageContext.request.contextPath}/member/memberUpdate.jsp?id=${sessionId}">· 개인정보확인 및 수정</a></li>
                           <li><a href="${pageContext.request.contextPath}/member/memberDelete.jsp?id=${sessionId}">· 회원 탈퇴</a></li>
                       </ul>
                </ul>
            </div>
           
            <div style="background-color: #f4f4f1; width: 68%; height: 130px;"></div>
            
            
            
            <div id="myCoffee_list" class="mylist">
            	<table>
            		<tr>
            			<th width="8%">
            				
            			</th>
            			<th width="8%">
            				<strong>No</strong>
            			</th>
            			<th width="22%">
            				<strong>상품이미지</strong>
            			</th>
            			<th width="30%">
            				<strong>상품명</strong>
            			</th>
            			<th width="22%">
            				<strong>옵션</strong>
            			</th>
            			<th width="10%">
            				<strong>가격</strong>
            			</th>
            		</tr>
            		
            		<%-- 장바구니 데이터 불러오기 --%>
	            	<sql:query var="rs" dataSource="${conn}">
						select * 
						from cart 
						where id = ? and orderyn = 'N'
						order by regdate
						<sql:param value="${param.id}"/>
					</sql:query>
            		
            		
            		<%-- cart 리스트 출력 --%>
            		<form name="frm1" method="post">
		            	<%-- 데이터가 있을 경우 장바구니 데이터 출력 --%>
		            	<c:forEach var="row" items="${rs.rows}" varStatus = "num">
		            		<tr>
		            			<td>
		            				<input type="submit"  value="삭제" onclick="btn_click('delete')">
		            				<c:set var="pk">${row.pk }</c:set>
		            				<input type="hidden" value="${pk }" name="chk1">
		            			</td>
								<td><c:out value="${num.count}"/></td>
								<c:if test="${row.category == 'loastBean' }">
									<td><img src="${pageContext.request.contextPath}/resources/img/loastBean/<c:out value="${row.img }"/>"></td>
								</c:if>
								<c:if test="${row.category == 'product' }">
									<td><img src="${pageContext.request.contextPath}/resources/img/product/<c:out value="${row.img }"/>"></td>
								</c:if>
								<td><c:out value="${row.cname }"/></td>
								<td><c:out value="${row.options }"/></td>
								<td><c:out value="${row.price }"/></td>
		            		</tr>
		            	</c:forEach>
		            		
		            	<%-- 데이터가 없을 경우 '데이터가 없습니다.' 출력 --%>
						<c:if test="${empty rs.rows }">
							<tr>
			            		<td colspan="6" style="color: gray; ">데이터가 없습니다.</td>
			            	<tr>
						</c:if>
            	</table>
            	
            	<c:set var = "total" value = "0" />

				<c:forEach var="result" items="${rs.rows}" varStatus="status">     

					<c:set var= "total" value="${total + result.price}"/>
					
				</c:forEach>
            	
            	<p stype="padding-top: 5px;">
	            	<span style="float: right; font-weight: bold;">결제 금액 : <input type="text" name="total" id="total" value="<fmt:formatNumber value="${total }" pattern="#,###"/>" readonly="readonly">원</span>
            	</p>
            	
            	
            	<div id="orderbt">
            		<input id="orderBtn" name="total_sum" type="submit" value="주문하기" onclick="javascript:btn_click('order')">
            	</div>
            		</form>
            </div>
            
            
        </div>
    </div>
    
    
    <%@ include file="footer.jsp" %>
    
    
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    
    <script>
    	<!--메뉴 펼치기 + 접기-->     
        $('#bar_main > .main4').click(function() {
            if($('#bar_sub4').is(":visible")) {
                $('#bar_sub4').css("display", "none");
                $('#main4_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/down.png");
            }else {
                $('#bar_sub4').css("display", "block");
                $('#main4_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/up.png");
            }
        });
        
        <!-- 리스트 선택, 삭제 스크립트 -->
		$(function() {
			
			$("[type=checkbox][name=chk1]").on("change", function() {
				
				var check = $(this).prop("checked");
				
				//전체 선택 클릭시 전체 선택
				if($(this).hasClass("chkAll1")) {
					$("[type=checkbox][name=chk1]").prop("checked", check);
					
				//전체 선택 클릭시 전체 해제, 하나라도 해제시 전체 선택 박스도 해제
				}else {
					var all = $("[type=checkbox][name=chk1].chkAll1");
					var allcheck = all.prop("checked")
					
					if(check != allcheck) {
						var len = $("[type=checkbox][name=chk1]").not(".chkAll1").length;
						var ckLen = $("[type=checkbox][name=chk1]:checked").not(".chkAll1").length;
						
						if(len === ckLen) {
							all.prop("checked", true);
						}else {
							all.prop("checked", false);
						}
					}
				}
			 }); 
		  });
        
        //삭제 & 주문 버튼 클릭 시
        function btn_click(str) {
        	
        	if(str == 'delete') {
        		frm1.action = "${pageContext.request.contextPath}/main/cartDelete.jsp?pk=${pk}"
        	}
        	
        	if(str == 'order') {
        		
        		if(${total == 0}) {
        			alert("주문하실 상품을 선택해주세요!");
        			
        			return false
        		}
        		
        		frm1.action = "${pageContext.request.contextPath}/main/cartOrder.jsp"
        	}
        	
        }
        
 
    </script>
    
    
</body>
</html>