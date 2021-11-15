<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
    <meta charset="UTF-8" name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    >
    <title>통합검색 | Starbucks Coffee Korea</title>
    
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
            color:black;
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
            min-height: 600px;
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
        
        /* 나만의 상품 리스트 선택 */
        #list_choice {
        	width: 68%;
        	padding: 10px 0;
        }
        
        #list_choice table {
        	width: 100%;
        }
        
        #list_choice table td {
        	width: 19%;
        	height: 50px;
        	border: 1px solid gray;
        	text-align: center;
        	border-radius : 5px;
        	margin:1%;
        }       
        
        #list_choice table td a {
        	display: block;
        }
        
        #coffee_search {
        	color: black;
        }
        
        #food_search {
        	color: black;
        }
        
        #product_search {
        	color: black;
        }
        
         #allchoice {
        	background-color: darkgreen;
        	color:white;
        }
        
          
        
        /* 상품리스트 출력 테이블 */
        .search table {
        	width: 100%;
        	border-collapse: collapse;
        	text-align: center;
        }
        
        .search p {
        	padding: 10px 0 15px 0;
        }
        
        .search table th {
        	border-top: 1px solid black;
        	border-bottom: 1px solid black;
        	padding: 15px 0;
        }
        
        .search table td {
        	border-bottom: 1px solid #dbdbdb;
        	padding: 15px 0;
        }
        #subject_area{
        	text-align: left;
        	font-family: nanumgothic;
        }
        .Img{
        	width : 100px;
        	height : 100px;
        } 
        .imgArea{
        	width : 15%;
        }
        .infoArea{
        	width : 85%;
        	text-align : left;
        }
        .Name{
        	font-weight: bold;
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

	<%@ include file="header.jsp" %>
	<%@ include file="../dbconn.jsp" %>
	<div style="height: 100px;"></div>
		
	<div>
	
    <div id="sub_bg">
        <div id="sub_title">
        <form name="allSearch" action="search.jsp" method="get">
            <img src="${pageContext.request.contextPath}/resources/img/myStarbucks/total_search_ttl.jpg" alt="통합검색">
            <span><a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/myStarbucks/icon_home.png" alt="홈"></a> > <a href="${pageContext.request.contextPath}/main/search.jsp">통합검색</a></span>
       </form>
       </div>
    </div>
    <div id="content">
   
            <div style="width: 68%; height: 130px; text-align: center;">
            	<p style="font-size : 150%; font-weight : bold; margin : 4% 0 ;">원하시는 검색어를 입력하신 후 검색 버튼을 클릭하세요.</p>
            	<form name="search" method = "get"  action ="${pageContext.request.contextPath}/main/search.jsp" onsubmit="return keyword_check()">
	            	<div><input type="text" name ="keyword" style="border : 3px solid #006633; border-radius : 23px; width : 90%;height : 45px; display:inline block; float: left;"></div>
	            	<div>
	            		<input type="image" src="${pageContext.request.contextPath}/resources/img/myStarbucks/btn_total_search.png" onclick="search.submit();">
	            	</div>
           		</form>
            </div>
            
            <div id="list_choice">
            	<table>
            		<tr>
            			<td id="allchoice"><a href="#" id="allSearch" style="color:white">통합검색</a></td>
            			<td id="choice1"><a href="#" id="coffee">음료</a></td>
            			<td id="choice2"><a href="#" id="food">푸드</a></td>
            			<td id="choice3"><a href="#" id="product">상품</a></td>
            			<td id="choice4"><a href="#" id="loastBean">원두</a></td>
            		</tr>
            	</table>
            </div>
            
            
             <!-- 음료 검색 결과 -->
             
             
            <sql:query var="rs" dataSource="${conn}">
				select * 
						from menu 
					where  (category = 'frappuccino' or category = 'blended' or category = 'bottle' or category = 'cold_brew' or category = 'espresso' or category = 'signature' or category = 'tea')and
								(locate(?, name) > 0 or
								locate(?, ename) > 0 or
								locate(?, info) > 0)
				<sql:param value="${param.keyword}"/>
				<sql:param value="${param.keyword}"/>
				<sql:param value="${param.keyword}"/>
			</sql:query>
	
            <div id="coffee_search" class="search">
            	<table>
            		<tr id="subject_area">
            			<th colspan="2">
            				음료
            			</th>
            		</tr>
            		<c:forEach var="row" items="${rs.rows}" >
            		
            		<c:if test="${empty rs.rows }">
						<tr>
			            	<td colspan="2" style="color: gray; ">검색 결과가 없습니다.</td>
			            <tr>
					</c:if>
						
            		<tr>
            			<c:if test ="${row.img != '' }">
							<td class="imgArea">
									<img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value='${row.img}'/>" class="Img" >
							</td>
						</c:if>
						
						<td class="infoArea">
							<c:if test ="${row.name != '' }">
								<span class="Name"><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><c:out value="${row.name}"/></a></span>
								<br>
								<c:out value="${row.info}"/>
							</c:if>
						</td>
            		</tr>
            		</c:forEach>
            		<c:if test="${empty rs.rows }">
						<tr>
							<td colspan ="2"><h4>검색 결과가 없습니다.</h4></td>
						</tr>
					</c:if>
             	</table>
            </div>
            
            <!-- 푸드 검색 결과 -->
            <sql:query var="rs" dataSource="${conn}">
				select * 
						from menu 
					where  (category = 'bread' or category = 'cake' or category = 'fruit' or category = 'icecream' or category = 'salad' or category = 'snack' or category = 'soup')and
								(locate(?, name) > 0 or
								locate(?, ename) > 0 or
								locate(?, info) > 0)
				<sql:param value="${param.keyword}"/>
				<sql:param value="${param.keyword}"/>
				<sql:param value="${param.keyword}"/>
			</sql:query>
			
            <div id="food_search" class="search">
            	<table>
            		<tr id="subject_area">
            			<th colspan="2">
            				푸드
            			</th>
            		</tr>
            		<c:forEach var="row" items="${rs.rows}" >
            		
            		<tr>
            		
            			<c:if test ="${empty row.img}">
							<td class="imgArea">
									&nbsp;
							</td>
						</c:if>
						
						<c:if test ="${row.img != '' }">
							<td class="imgArea">
								<img src="${pageContext.request.contextPath}/resources/img/food/<c:out value='${row.img}'/>" class="Img">
							</td>
						</c:if>	
						
						
						<td class="infoArea">
							<c:if test ="${row.img != '' }">
								<span class="Name"><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><c:out value="${row.name}"/></a></span>
								<br>
								<c:out value="${row.info}"/>
							</c:if>
							<c:if test ="${row.name == null }">
								<h3 style="text-align : center;">검색 결과가 없습니다.</h3>
							</c:if>
						</td>
            		</tr>
            		</c:forEach>
            		<c:if test="${empty rs.rows }">
						<tr>
							<td colspan ="2"><h4>검색 결과가 없습니다.</h4></td>
						</tr>
					</c:if>
            	</table>
            </div>
            
            
            
            <!-- 상품 검색 결과 -->
			<sql:query var="rs" dataSource="${conn}">
				select * 
						from product 
					where  locate(?, pname) > 0 or
								locate(?, pname_eng) > 0 or
								locate(?, brief) > 0
				<sql:param value="${param.keyword}"/>
				<sql:param value="${param.keyword}"/>
				<sql:param value="${param.keyword}"/>
			</sql:query>
			
            <div id="product_search" class="search">
            	<table>
            		<tr id="subject_area">
            			<th colspan="4">
            				상품
            			</th>
            		</tr>
            		<c:forEach var="row" items="${rs.rows}" >
            		<tr>
            			<c:if test ="${empty row.img}">
							<td class="imgArea">
									&nbsp;
							</td>
						</c:if>
						
						<c:if test ="${row.img != '' }">
							<td class="imgArea">
								<img src="${pageContext.request.contextPath}/resources/img/product/<c:out value='${row.img}'/>" class="Img">
							</td>
						</c:if>
						
						<td class="infoArea">
							<c:if test ="${row.img != '' }">
								<span class="Name"><a href="${pageContext.request.contextPath}/m_product/product_view.jsp?pcode=${row.pcode}"><c:out value="${row.pname}"/></a></span>
								<br>
								<c:out value="${row.brief}"/>
							</c:if>
						</td>
            		</tr>
            		</c:forEach>
            		<c:if test="${empty rs.rows }">
						<tr>
							<td colspan ="2"><h4>검색 결과가 없습니다.</h4></td>
						</tr>
					</c:if>
           		</table>
            </div>
            
            
            
            <!-- 원두 검색 결과 -->
            <sql:query var="rs" dataSource="${conn}">
				select * 
						from loastbean 
					where  locate(?, bname) > 0 or
								locate(?, bname_eng) > 0
				<sql:param value="${param.keyword}"/>
				<sql:param value="${param.keyword}"/>
			</sql:query>
			
            <div id="loastBean_search" class="search">
            	<table>
            		<tr id="subject_area">
            			<th colspan="4">
            				원두
            			</th>
            		</tr>
            		<c:forEach var="row" items="${rs.rows}" >
            		<tr>
            			<c:if test ="${empty row.img}">
							<td class="imgArea">
									&nbsp;
							</td>
						</c:if>
						
						<c:if test ="${row.img != '' }">
							<td class="imgArea">
								<img src="${pageContext.request.contextPath}/resources/img/loastBean/<c:out value='${row.img}'/>" class="Img">
							</td>
						</c:if>
						
						<td class="infoArea">
							<c:if test ="${row.img != '' }">
								<span class="Name"><a href="${pageContext.request.contextPath}/m_loastBean/loastBean_view.jsp?bcode=${row.bcode}"><c:out value="${row.bname}"/></a></span>
								<br>
								<c:out value="${row.brief}"/>
							</c:if>
						</td>
            		</tr>
            		</c:forEach>
            		
            		<c:if test="${empty rs.rows }">
						<tr>
							<td colspan ="2"><h4>검색 결과가 없습니다.</h4></td>
						</tr>
					</c:if>
            		
            	</table>
            	
            </div>
         </div>   
        </div>
    
 <%@ include file="footer.jsp" %>
    
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    
    <script>
    	<!--메뉴 펼치기 + 접기-->
    	$('#bar_main > .main1').click(function() {
            if($('#bar_sub1').is(":visible")) {
                $('#bar_sub1').css("display", "none");
                $('#main1_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/down.png");
            }else {
                $('#bar_sub1').css("display", "block");
                $('#main1_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/up.png");
            }
        });
        
        $('#bar_main > .main2').click(function() {
            if($('#bar_sub2').is(":visible")) {
                $('#bar_sub2').css("display", "none");
                $('#main2_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/down.png");
            }else {
                $('#bar_sub2').css("display", "block");
                $('#main2_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/up.png");
            }
        });
        
        $('#bar_main > .main4').click(function() {
            if($('#bar_sub4').is(":visible")) {
                $('#bar_sub4').css("display", "none");
                $('#main4_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/down.png");
            }else {
                $('#bar_sub4').css("display", "block");
                $('#main4_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/up.png");
            }
        });
        
        
        
        <!-- 나만의 상품 리스트 보여주기 스크립트 -->
        $('#coffee').click(function() {
        	$('#coffee_search').css("display", "block");
        	$('#food_search').css("display", "none");
        	$('#product_search').css("display", "none");
        	$('#loastBean_search').css("display", "none");
        	
        	$('#coffee').css("color", "white");
        	$('#food').css("color", "black");
        	$('#product').css("color", "black");
        	$('#loastBean').css("color", "black");
        	$('#allSearch').css("color", "black");
        	
        	$('#choice1').css("background-color", "#006633");
        	$('#choice2').css("background-color", "white");
        	$('#choice3').css("background-color", "white");
        	$('#choice4').css("background-color", "white");
        	$('#allchoice').css("background-color", "white");
        });
        
        $('#food').click(function() {
        	$('#coffee_search').css("display", "none");
        	$('#food_search').css("display", "block");
        	$('#product_search').css("display", "none");
        	$('#loastBean_search').css("display", "none");
        	
        	$('#coffee').css("color", "black");
        	$('#food').css("color", "white");
        	$('#product').css("color", "black");
        	$('#loastBean').css("color", "black");
        	$('#allSearch').css("color", "black");
        	
        	$('#choice1').css("background-color", "white");
        	$('#choice2').css("background-color", "#006633");
        	$('#choice3').css("background-color", "white");
        	$('#choice4').css("background-color", "white");
        	$('#allchoice').css("background-color", "white");
        });
        
        $('#product').click(function() {
        	$('#coffee_search').css("display", "none");
        	$('#food_search').css("display", "none");
        	$('#product_search').css("display", "block");
        	$('#loastBean_search').css("display", "none");
        	
        	$('#coffee').css("color", "black");
        	$('#food').css("color", "black");
        	$('#product').css("color", "white");
        	$('#loastBean').css("color", "black");
        	$('#allSearch').css("color", "black");
        	
        	$('#choice1').css("background-color", "white");
        	$('#choice2').css("background-color", "white");
        	$('#choice3').css("background-color", "#006633");
        	$('#choice4').css("background-color", "white");
        	$('#allchoice').css("background-color", "white");
        });
        
        $('#loastBean').click(function() {
        	$('#coffee_search').css("display", "none");
        	$('#food_search').css("display", "none");
        	$('#product_search').css("display", "none");
        	$('#loastBean_search').css("display", "block");
        	
        	$('#coffee').css("color", "black");
        	$('#food').css("color", "black");
        	$('#product').css("color", "black");
        	$('#loastBean').css("color", "white");
        	$('#allSearch').css("color", "black");
        	
        	$('#choice1').css("background-color", "white");
        	$('#choice2').css("background-color", "white");
        	$('#choice3').css("background-color", "white");
        	$('#choice4').css("background-color", "#006633");
        	$('#allchoice').css("background-color", "white");
        });
        $('#allSearch').click(function() {
        	$('#coffee_search').css("display", "block");
        	$('#food_search').css("display", "block");
        	$('#product_search').css("display", "block");
        	$('#loastBean_search').css("display", "block");
        	
        	$('#coffee').css("color", "black");
        	$('#food').css("color", "black");
        	$('#product').css("color", "black");
        	$('#loastBean').css("color", "black");
        	$('#allSearch').css("color", "white");
        	
        	$('#choice1').css("background-color", "white");
        	$('#choice2').css("background-color", "white");
        	$('#choice3').css("background-color", "white");
        	$('#choice4').css("background-color", "white");
        	$('#allchoice').css("background-color", "#006633");
        });
        
       
		
	    
    </script>
    
</body>
</html>