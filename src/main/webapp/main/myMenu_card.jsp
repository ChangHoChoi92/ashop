<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
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
        
        #card_bg{width:100%; height:600px; background-color:#626260; margin-bottom:200px; }
        #card_header{text-align: center; height:20%;}
        #card_header h2{color:#fff; padding-top:120px;}
        #card_img{height:60%; text-align: center; display:table; width:100%;}
 		#card_img_bg{display:table-cell; vertical-align:middle;}
 		#card_img_bg img{width:280px; height:180px;}                   
        #card_subject{width:100%; height:20%; background-color:#f6f5ef; margin-bottom:100px;}  
        
        #card_subject{display: flex; display:table;}
        #card_subject #card_price,#card_bt{width:50%; display:table-cell; vertical-align:middle; text-align: center;}
        #card_bt a{ background:#e2c383; border:1px solid #bb9f65; color:#222; margin-left:4px; font-size:14px; line-height:28px; text-align:center; width:85px; padding:5px;}
        #card_price strong{color:#006541; font-size:30px;}
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
            <img src="${pageContext.request.contextPath}/resources/img/myStarbucks/my_card.png" alt="마이 메뉴">
            <span><a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/myStarbucks/icon_home.png" alt="홈"></a> > <a href="${pageContext.request.contextPath}/main/myMenu.jsp?id=${sessionId}">My Starbucks</a> > <a href="${pageContext.request.contextPath}/main/myMenu_card.jsp?id=${sessionId}">My 스타벅스 카드</a></span>
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
           
            <c:forEach var="row" items="${rs.rows}">  
              
	            <%-- 카드가 없을 때 --%>
	            <c:if test="${row.cardName == null }">
		            <div id="card_bg">
		            	<div id="card_header">
		            		<c:if test="${row.nickname eq '' }">
		            			<h2>${row.id }님의 스타벅스 카드</h2>
		            		</c:if>
		            		<c:if test="${row.nickname ne '' }">
		            			<h2>${row.nickname }님의 스타벅스 카드</h2>
		            		</c:if>
		            	</div>
		            	<div id="card_img">
		            		<div id="card_img_bg">
		            			<img src="${pageContext.request.contextPath}/resources/img/main/nocardlogo.png" alt="카드이미지">
		            		</div>
		            	</div>
		            	<div id="card_subject">
		            		<div id="card_price">
		            			잔액 <strong>0</strong>원
		            		</div>
		            		<div id="card_bt">
		            			<a href="${pageContext.request.contextPath}/m_card/cardListForm.jsp">카드 등록</a>
		            			<a href="delete_no()">카드 삭제</a>
		            		</div>
		           		</div>
		            </div>
	            </c:if>
	            
	            <%-- 카드가 있을 때 --%>
	            <c:if test="${row.cardName != null }">
		            <div id="card_bg">
		            	<div id="card_header">
		            		<c:if test="${row.nickname eq '' }">
		            			<h2>${row.id }님의 스타벅스 카드</h2>
		            		</c:if>
		            		<c:if test="${row.nickname ne '' }">
		            			<h2>${row.nickname }님의 스타벅스 카드</h2>
		            		</c:if>
		            		<br>
		            		<p style="font-size: 25px; color: white;"><strong>${row.cardName }</strong></p>
		            	</div>
		            	<div id="card_img">
		            		<div id="card_img_bg">
		            			<img src="${pageContext.request.contextPath}/resources/img/card/<c:out value='${row.cardImg }'/>" alt="카드이미지">
		            		</div>
		            	</div>
		            	<div id="card_subject">
		            		<div id="card_price">
		            			잔액 <strong><fmt:formatNumber value="${row.cardPrice }" pattern="#,###"/></strong>원
		            		</div>
		            		<div id="card_bt">
		            			<a href="${pageContext.request.contextPath}/m_card/cardListForm.jsp">카드 등록</a>
		            			<a onclick="delete_chk()">카드 삭제</a>
		            		</div>
		           		</div>
		            </div>
	            </c:if>
            </c:forEach>
            
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
        
        <!-- 데이터 삭제관련 스크립트 -->
    	function delete_chk() {
    		if(confirm("남은 금액은 반환되지 않습니다.\n정말로 삭제 하시겠습니까?")) {
    			location.href = "cardDBDelete.jsp?id=${sessionId}"
    		}else {
    			alert("취소되었습니다.");
    			history.reload();
    		}
    	}
        
    	<!-- 삭제할 카드가 없을 때 -->
    	function delete_no() {
    		alert("삭제할 카드가 없습니다!");
			history.reload();
    	}
	    
    </script>
    
    
</body>
</html>