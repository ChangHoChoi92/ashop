<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
	<style>
        * {
            margin: 0;
            padding: 0;
        }
        
        ul {
            list-style-type: none;
        }
        
        header {
            border-top: solid 2px black;
            width: 100%;
            height: 98px;
            background: linear-gradient(#f6f5ef 100px, #2c2a29 100px, #2c2a29);
            position: fixed;
            overflow: hidden;
            z-index: 100;
        }
        
        #header_div {
            width: 70%;
            height: 98px;
            background: linear-gradient(#f6f5ef 100px, #2c2a29 100px, #2c2a29);
            margin: auto;
            z-index: 100;
        }
        
        /* 로고영역 */
        #logo {
            width: 80px;
            height: 80px;
            padding-top: 10px;
        }
        
        /* 탑메뉴영역 */
        #top_menu {
            width: 70%;;
            position: absolute;
            top: 0;
            display: flex;
            justify-content: flex-end;
        }
        
        #top_menu > ul > li {
            float: left;
        }
        
        #top_menu > ul > li:after {
            content: "|";
            padding:0 10px;
            color: #bab9b5;
        }
        
        #top_menu > ul > li:last-child:after {
            content: "";
            display: none;
        }
        
        #top_menu > ul > li > a {
            text-decoration-line: none;
            color: #bab9b5;
        }
        
        #top_menu > ul > li > a:hover {
            text-decoration-line: underline;
        }
        
        /* 메인메뉴영역 */
        #main_menu {
            position: absolute;
            top: 60px;
            width: 70%;
        }
        
        #main_menu nav {
            position: relative;
            left: 30%;
        }
        
        #main_menu nav ul {
            float: left;
        }
        
        #main_menu nav ul li {
            width: 240px;
            text-align: center;
        }
        
        #main_menu nav ul #main_sub_menu {
            font-size: 23px;
            color : lightgray;
            margin: 10px 0 0 0;
        }
        
        #main_menu nav ul #main_sub_menu > a {
            color: black;
            text-decoration-line: none;
            display: block;
        }
        
        #main_menu nav ul #main_sub_menu > a:hover {
            text-decoration-line: underline;
            background-color: #2c2a29;
            color: darkgreen;
        }
        
        #main_menu nav ul #sub_title > a {
            font-size: 18px; 
            color: white;
        }
        
        #main_menu nav ul li > a {
            color: gray;
            text-decoration-line: none;
        }
        
        #main_menu nav ul li > a:hover {
            text-decoration-line: underline;
        }
        .table_search{
        	border: 1px solid lightgray;
        	border-radius: 5px;
        	border-collapse : separate;
        	background-color : white;
        }
        .button_search {
	        width: 30px;
	        height: 30px;
	        cursor: pointer;
	        border : none;
	        background-color : white;
     	}
     	.keyword{
     		font-size: 17px;
     		border : none;
     		color : #919191;
     		width : 150px;
     	}
     	.cardImg{
     		width : 150px;
     		height: 85px;
     	}
    </style>
    <script type="text/javascript">
	
		 function keyword_check(){
		
		  if(document.search.keyword.value==''){ //검색어가 없을 경우  
		
		  alert('검색어를 입력하세요'); //경고창 띄움 
		
		  document.search.keyword.focus(); //다시 검색창으로 돌아감 
		
		  return false; 
		
		  }
		
		  else return true;
		
		 }
	
	</script>
    
</head>
<body>
	<%@ include file="/dbconn.jsp"%>
	<header>
        <%--실제로 쓰일 헤더부분 영역--%>
        <div id="header_div">
            <%-- 로고영역 --%>
            <div id="logo">
                <a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/header/logo.png" alt="스타벅스 로고" style="width: 80px; height: 80px;"></a>
            </div>
            
            <%--탑메뉴 영역--%>
            <div id="top_menu">
                <ul id="top_menu_ul">
                	<%--아이디가 admin일 경우 관리자 메뉴를 보이게 함 --%>
                    <c:if test="${sessionId == 'manager'}">
                        <li id="topMenu_nav00"><a href="${pageContext.request.contextPath}/member/memberList.jsp">Manager Menu</a></li>
                    </c:if>
                    <%--sign out은 로그인 되었을때(세션아이디 값이 null이 아닐때)보이게 함 --%>
                    <c:if test="${sessionId != null}">
                        <li id="topMenu_nav01"><a href="${pageContext.request.contextPath}/member/logout.jsp">Sign out</a></li>
                    </c:if>
                    <%--sign in은 로그인 안되었을때(세션아이디 값이 null 일때)보이게 함 --%>
                    <c:if test="${sessionId == null}">
                      	<li id="topMenu_nav02"><a href="${pageContext.request.contextPath}/member/loginForm.jsp">Sign In</a></li>
                    </c:if>
                    <%--로그인이 안되어 있을때 로그인페이지로 이동 --%>
                    <%--로그인이 되어있으면 마이페이지로 이동 --%>
                    <c:if test="${sessionId == null}">
                        <li id="topMenu_nav03"><a href="${pageContext.request.contextPath}/member/loginForm.jsp">My Starbucks</a></li>
                    </c:if>
                    <c:if test="${sessionId != null}">
                        <li id="topMenu_nav03"><a href="${pageContext.request.contextPath}/main/myMenu.jsp?id=${sessionId}">My Starbucks</a></li>
                    </c:if>
                    <li>
	                    <div id="searchArea">
	                    	<form name="search" align="right" style="margin-right:70px;" method = "get" action ="${pageContext.request.contextPath}/main/search.jsp" onsubmit="return keyword_check()">
								<table class="table_search">
									<tr>
										<td class="td_keyword">
										  <input type="text" name="keyword" class="keyword" placeholder="통합검색"> 
										</td>
										<td>
											<button class="button_search" onclick="search.submit()">
												<img src=" ${pageContext.request.contextPath}/resources/img/myStarbucks/icon_magnifier_black.jpg"/>
											</button>
										</td>
									</tr>  
								</table>
							</form>
						</div>
                    </li>
                </ul>
            </div>
            
            <%--메인메뉴 영역--%>
            <div id="main_menu">
                <nav id="topMenu_nav">
                    <ul>
                        <li id="main_sub_menu"><a href="#">MENU</a></li>
                                <li id="sub_title"><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">음료</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp?category=cold_brew">콜드 브루</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp?category=espresso">에스프레소</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp?category=frappuccino">프라푸치노</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp?category=blended">블렌디드</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp?category=tea">티(티바나)</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp?category=signature">기타 제조 음료</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp?category=bottle">스타벅스 주스(병음료)</a></li>
                                
                                <li id="sub_title"><a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp">푸드</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp?category=bread">브레드</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp?category=cake">케이크</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp?category=salad">샌드위치 & 샐러드</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp?category=soup">따뜻한 푸드</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp?category=fruit">과일 & 요거트</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp?category=snack">스낵 & 미니 디저트</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp?category=icecream">아이스크림</a></li>
                    </ul>
                    <ul>             
                        <li id="main_sub_menu"><a href="#">STORE</a></li>
                                <li id="sub_title"><a href="${pageContext.request.contextPath}/m_loastBean/loastBeanListForm.jsp">원두</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_loastBean/loastBeanListForm.jsp?category=블론드 로스트">블론드 로스트</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_loastBean/loastBeanListForm.jsp?category=미디엄 로스트">미디엄 로스트</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_loastBean/loastBeanListForm.jsp?category=다크 로스트">다크 로스트</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_loastBean/loastBeanListForm.jsp?category=플레이버">플레이버</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_loastBean/loastBeanListForm.jsp?category=리저브 원두">리저브 원두</a></li>
                                        
                                <li id="sub_title"><a href="${pageContext.request.contextPath}/m_product/productListForm.jsp">상품</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_product/productListForm.jsp?category=머그">머그</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_product/productListForm.jsp?category=글라스">글라스</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_product/productListForm.jsp?category=플라스틱 텀블러">플라스틱 텀블러</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_product/productListForm.jsp?category=스테인리스 텀블러">스테인리스 텀블러</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_product/productListForm.jsp?category=보온병">보온병</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_product/productListForm.jsp?category=액세사리">액세사리</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_product/productListForm.jsp?category=커피 용품">커피 용품</a></li>
                                
                    </ul>
                    <ul>
                        <li id="main_sub_menu"><a href="#">BOARD</a></li>
                                <li id="sub_title"><a href="/boardList.bo">공지사항</a></li>
                                <li>&nbsp;</li>
                                <li>&nbsp;</li>
                                <li>&nbsp;</li>
                                <li>&nbsp;</li>
                                <li>&nbsp;</li>
                                <li id="sub_title"><a href="${pageContext.request.contextPath}/m_card/cardListForm.jsp">카드</a></li>
                                <li><a href="${pageContext.request.contextPath}/m_card/cardListForm.jsp"><img src="${pageContext.request.contextPath}/resources/img/header/starbuckscard.png" class="cardImg"></a></li>
                    </ul>
                    <ul>
                        <li id="main_sub_menu"><a href="${pageContext.request.contextPath}/map/map.jsp">FIND A STORE</a></li>
                        <li id="sub_title"><a href="${pageContext.request.contextPath}/map/map.jsp">찾아오시는 길</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <script>    
        $(function() {
            var $mainMenu = $('#main_menu #topMenu_nav ul li'),
                $header = $('header');
            
        
            $mainMenu.mouseover(function() {
                $header.stop().animate({height:'500px'}, 300);
            })
            .mouseout(function(){
                $header.stop().animate({height:'98px'}, 300);
            })
          })
          
    </script> 
</body>
</html>