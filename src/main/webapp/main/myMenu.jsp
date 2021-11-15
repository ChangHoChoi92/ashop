<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
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
            height: 100%;
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
            height: 100%;
            padding-top: 20px;
        }
        
        #content {
            width: 70%;
            margin: auto;
            padding-bottom: 30px;
        }
        
        #content > div {
            width: 68%;
            margin-top: 30px;
            padding: 1%;
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
            width: 26%;
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
        
        
        
        
        /*스위퍼*/
        .swiper {
            width: 100%;
            height: 100%;
            background-color: #f4f4f1;
            
            margin-left: 0;
        }
        .swiper-slide {
	        text-align: center;
	        font-size: 18px;
	        background: white;
	
      }
        
        
        
        .swiper_div a {
            color: gray;
        }
        
        .swiper-slide img {

            object-fit: cover;
        }
       
    </style>
    
</head>
<body>

	<%@ include file="header.jsp" %>
	<%@ include file="../dbconn.jsp" %>
	
	<sql:query var="rs" dataSource="${conn}">
		select * from member where id = ?
		<sql:param value="${param.id}"/>
	</sql:query>
	
	<sql:query var="rs1" dataSource="${conn}">
		select * 
		from menu 
		where category = 'cold_brew' or category = 'espresso' or category = 'blended' or category = 'frapuccino' or category = 'tea' or category = 'signatue' or category = 'bottle'
		order by hit_cnt desc
		limit 5
	</sql:query>
	
	<sql:query var="rs2" dataSource="${conn}">
		select * 
		from menu 
		where category = 'bread' or category = 'cake' or category = 'salad' or category = 'snack' or category = 'fruit' or category = 'icecream' or category = 'soup'
		order by hit_cnt desc
		limit 5
	</sql:query>
	
	<sql:query var="rs3" dataSource="${conn}">
		select * 
		from loastBean
		order by hit_cnt desc
		limit 5
	</sql:query>

	<div style="height: 100px;"></div>
	
    <div id="sub_bg">
        <div id="sub_title">
            <img src="${pageContext.request.contextPath}/resources/img/myStarbucks/mypage_title.png" alt="마이 페이지">
            <span><a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/myStarbucks/icon_home.png" alt="홈"></a> > <a href="${pageContext.request.contextPath}/main/myMenu.jsp?id=${sessionId}">My Starbucks</a></span>
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
           
            <div id="my_info">
            	<c:forEach var="row" items="${rs.rows}">
                	<strong>${row.name}</strong> 님 안녕하세요.<br>
                </c:forEach>
                <span>(지금 스타벅스 카드를 등록하시면 Starbucks Rewards 혜택을 받으실 수 있습니다.)</span><br>
                <a href="${pageContext.request.contextPath}/member/memberUpdate.jsp?id=${sessionId}">개인정보수정</a>
            </div>
            
            <%-- 음료 순위 --%> 
            <div class="swiper mySwiper">
	            <p style="padding-bottom: 10px;">
	                가장 많이 찾는 나만의 <span style="color: #00704a; font-weight: bold;">음료</span>가 궁금하시죠 ? &nbsp;<span style="float: right; font-size: 13px; color: gray">스타벅스 리워드 집계 기준</span>
	            </p>
	            	            
	            <div id="coffeeDiv" class="swiper-wrapper">
	                <c:forEach var="row1" items="${rs1.rows}" varStatus="num1">
	                	<div class="swiper-slide">
	                		<p>부문별 음료 조회 순위</p>
		                	<p><strong>${num1.count }위&nbsp; ${row1.name }</strong></p>
		                	<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row1.name}"><img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value="${row1.img }"/>"></a><br> 	
	                	</div>
	                </c:forEach>   	
	            </div> 
	            	            
	            <%-- 좌/우 넘기는 버튼 --%>
	            <div class="swiper-button-next"></div>
	            <div class="swiper-button-prev"></div>
            </div>
            
	        <%-- 푸드 순위 --%>            
            <div class="swiper mySwiper">
	            <p style="padding-bottom: 10px;">
	                가장 많이 찾는 나만의 <span style="color: #00704a; font-weight: bold;">푸드</span>가 궁금하시죠 ? &nbsp;<span style="float: right; font-size: 13px; color: gray">스타벅스 리워드 집계 기준</span>
	            </p>

	            <div id="foodDiv" class="swiper-wrapper">
	                <c:forEach var="row2" items="${rs2.rows}" varStatus="num2">
	                	<div class="swiper-slide">
	                		<p>부문별 푸드 조회 순위</p>
		                	<p><strong>${num2.count }위&nbsp; ${row2.name }</strong></p>
		                	<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row2.name}"><img src="${pageContext.request.contextPath}/resources/img/food/<c:out value="${row2.img }"/>"></a><br>
	                	</div>
	                </c:forEach>   	
	            </div>
	            	            
	            <%-- 좌/우 넘기는 버튼 --%>
	            <div class="swiper-button-next"></div>
	            <div class="swiper-button-prev"></div>
            </div>
            
            <%-- 원두 순위 --%>
            <div class="swiper mySwiper">
	            <p style="padding-bottom: 10px;">
	                가장 많이 찾는 나만의 <span style="color: #00704a; font-weight: bold;">원두</span>가 궁금하시죠 ? &nbsp;<span style="float: right; font-size: 13px; color: gray">스타벅스 리워드 집계 기준</span>
	            </p>
	                       
	            <div id="loastBeanDiv" class="swiper-wrapper">
	                <c:forEach var="row3" items="${rs3.rows}" varStatus="num3">
	                	<div class="swiper-slide">
	                		<p>부문별 원두 조회 순위</p>
		                	<p><strong>${num3.count }위&nbsp; ${row3.bname }</strong></p>
		                	<a href="${pageContext.request.contextPath}/m_loastBean/loastBean_view.jsp?bcode=${row3.bcode}"><img src="${pageContext.request.contextPath}/resources/img/loastBean/<c:out value="${row3.img }"/>"></a><br>
	                	</div>
	                </c:forEach>   	
	            </div>
	            
	            <%-- 좌/우 넘기는 버튼 --%>
	            <div class="swiper-button-next"></div>
	            <div class="swiper-button-prev"></div>
            </div>
         
		</div>
    </div>
    
    
    <%@ include file="footer.jsp" %>
    
    
    
    
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
    
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <!--메뉴 펼치기 + 접기-->
    <script>
        $('#bar_main > .main4').click(function() {
            if($('#bar_sub4').is(":visible")) {
                $('#bar_sub4').css("display", "none");
                $('#main4_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/down.png");
            }else {
                $('#bar_sub4').css("display", "block");
                $('#main4_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/up.png");
            }
        })
    </script>
    
</body>
</html>