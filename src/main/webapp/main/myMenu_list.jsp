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
        
        
        /*??? ?????? CSS*/
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
        
        /* ????????? ?????? ????????? ?????? */
        #list_choice {
        	width: 68%;
        	padding: 10px 0;
        }
        
        #list_choice table {
        	width: 100%;
        }
        
        #list_choice table td {
        	width: 49.5%;
        	height: 50px;
        	border: 1px solid gray;
        	text-align: center;
        }       
        
        #list_choice table td a {
        	display: block;
        }
        
        #myCoffee {
        	color: white;
        }
        
        #myFood {
        	color: black;
        }
        
        #mySangpum {
        	color: black;
        }
        
        #choice1 {
        	background-color: darkgreen;
        }
        
          
        
        /* ??????????????? ?????? ????????? */
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
        }
        
        #myFood_list, #mySangpum_list {
        	display: none;
        }
        
        
        #goList {
        	width: 100%;
        	height: 100px;
        	background-color: #f4f4f1;
        	margin-bottom: 30px;
        	font-size: 20px;
        }
        
        #goList p {
        	padding-top: 15px;
        }
        
        #goList p span {
        	padding-left: 10px;
        	font-size: 15px;
        }
        
        #goList a {
        	width: 100px;
        	height: 25px;
        	background-color: #006400;
        	display: inline-block;
        	color: white;
        	border-radius: 5px;
        }
        
        #goList input[type=button] {
        	background-color: #006400;
        	color: white;
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

	<div style="height: 100px;"></div>
	
    <div id="sub_bg">
        <div id="sub_title">
            <img src="${pageContext.request.contextPath}/resources/img/myStarbucks/my_menu.png" alt="?????? ??????">
            <span><a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/myStarbucks/icon_home.png" alt="???"></a> > <a href="${pageContext.request.contextPath}/main/myMenu.jsp?id=${sessionId}">My Starbucks</a> > <a href="${pageContext.request.contextPath}/main/myMenu_list.jsp?id=${sessionId}">My Menu</a></span>
        </div>
    </div>
    
    <div id="content_bg">
        <div id="content">
           
            <div id="bar">
                <ul id="bar_main">
                    <li class="main1"><a href="${pageContext.request.contextPath}/main/myMenu_card.jsp?id=${sessionId}">My ???????????? ??????</a></li>
                    <li class="main2"><a href="${pageContext.request.contextPath}/main/cartList.jsp?id=${param.id}">My ????????????</a></li>
                    <li class="main3"><a href="${pageContext.request.contextPath}/main/myMenu_list.jsp?id=${sessionId}">My ??????</a></li>
                    <li class="main4"><a href="#">??????????????????<span><img id="main4_img" src="${pageContext.request.contextPath}/resources/img/myStarbucks/down.png"></span></a></li>
                       <ul id="bar_sub4" class="sub">
                           <li><a href="${pageContext.request.contextPath}/member/memberUpdate.jsp?id=${sessionId}">?? ?????????????????? ??? ??????</a></li>
                           <li><a href="${pageContext.request.contextPath}/member/memberDelete.jsp?id=${sessionId}">?? ?????? ??????</a></li>
                       </ul>
                </ul>
            </div>
           
            <div style="background-color: #f4f4f1; width: 68%; height: 130px;"></div>
            
            <div id="list_choice">
            	<table>
            		<tr>
            			<td id="choice1"><a href="#" id="myCoffee">????????? ??????</a></td>
            			<td id="choice2"><a href="#" id="myFood">????????? ??????</a></td>
            		</tr>
            	</table>
            </div>
            
            
	        <div id="myCoffee_list" class="mylist">
	            
	            <table>
	            	<colgroup>
	            		<col width="8%">
	            		<col width="8%">
	            		<col width="27%">
	            		<col width="42%">
	            		<col width="15%">
	            	</colgroup>
	            	<tr>
	            		<th>
	            			<input type="checkbox" class="chkAll1" name="chk1">
	            		</th>
	            		<th>
	            			<strong>No</strong>
	            		</th>
	            		<th>
	            			<strong>?????????</strong>
	            		</th>
	            		<th>
	            			<strong>??????</strong>
	            		</th>
	            		<th>
	            			<strong>?????????</strong>
	            		</th>
	            	</tr>
	            		
	            	<%-- ????????? ?????? ????????? ???????????? --%>
	            	<sql:query var="rs" dataSource="${conn}">
						select * 
						from mymenu 
						where id = ? and category = 'coffee'
						order by regdate desc
						<sql:param value="${param.id}"/>
					</sql:query>
					
					<form action="myMenu_list_delete.jsp" method="post">
		            	<%-- ???????????? ?????? ?????? ????????? ?????? ????????? ?????? --%>
		            	<c:forEach var="row" items="${rs.rows}" varStatus = "num">
		            		<tr>
		            			<td><input type="checkbox" name="chk1" value="${row.pk }"></td>
								<td><c:out value="${fn:length(rs.rows) - num.index }"/></td>
								<td><c:out value="${row.jname }"/></td>
								<td><c:out value="${row.options }"/></td>
								<td><c:out value="${row.regdate }"/></td>
		            		</tr>
		            	</c:forEach>
		            		
		            	<%-- ???????????? ?????? ?????? '???????????? ????????????.' ?????? --%>
						<c:if test="${empty rs.rows }">
							<tr>
			            		<td colspan="5" style="color: gray; ">???????????? ????????????.</td>
			            	<tr>
						</c:if>
							
	            </table>
	            	
	            <p style="padding-top: 5px;">
		            <input type="submit" value="????????????" id="d_bt">
	            </p>
	            
	            	</form>
	            	
	        </div>
	            
	        <div id="myFood_list" class="mylist">
	            <table>
	            	<colgroup>
	            		<col width="8%">
	            		<col width="8%">
	            		<col width="27%">
	            		<col width="42%">
	            		<col width="15%">
	            	</colgroup>
	            	<tr>
	            		<th>
	            			<input type="checkbox" class="chkAll2" name="chk2">
	            		</th>
	            		<th>
	            			<strong>No</strong>
	            		</th>
	            		<th>
	            			<strong>?????????</strong>
	            		</th>
	            		<th>
	            			<strong>??????</strong>
	            		</th>
	            		<th>
	            			<strong>?????????</strong>
	            		</th>
	            	</tr>
	            		           		
	            	<%-- ????????? ?????? ????????? ???????????? --%>
	            	<sql:query var="rs" dataSource="${conn}">
						select * 
						from mymenu
						where id = ? and category = 'food'
						order by regdate desc
						<sql:param value="${param.id}"/>
					</sql:query>
	            		 
	            		
	            <%-- ???????????? ?????? ?????? ????????? ?????? ????????? ?????? --%>
	            <form action="myMenu_list_delete.jsp" method="post">
	            	<c:forEach var="row" items="${rs.rows}" varStatus = "num">
	            		<tr>
	            		<td><input type="checkbox" name="chk2" value="${row.pk }"></td>
						<td><c:out value="${fn:length(rs.rows) - num.index }"/></td>
						<td><c:out value="${row.jname }"/></td>
						<td><c:out value="${row.options }"/></td>
						<td><c:out value="${row.regdate }"/></td>
	            	</tr>
	            </c:forEach>
	            		
	            <%-- ???????????? ?????? ?????? '???????????? ????????????.' ?????? --%>
				<c:if test="${empty rs.rows }">
					<tr>
		            	<td colspan="5" style="color: gray; ">???????????? ????????????.</td>
		            <tr>
				</c:if>
	            		
	            </table>
	            	
	            <p style="padding-top: 5px;">
		            <input type="submit"  value="????????????" id="d_bt">
	            </p>
	            </form>
	        </div>
	        
	        <div id="goList">
	        	<p>?? ????????? ?????? ???????????? ?????? <span><a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">?????? ????????????</a></span></p>
	        	<p>?? ????????? ?????? ???????????? ?????? <span><a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp">?????? ????????????</a></span></p>
	        </div>
	        
			
        </div>
    </div>
    
    
    <%@ include file="footer.jsp" %>
    
    
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    
    <script>
    	<!--?????? ????????? + ??????-->
        $('#bar_main > .main4').click(function() {
            if($('#bar_sub4').is(":visible")) {
                $('#bar_sub4').css("display", "none");
                $('#main4_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/down.png");
            }else {
                $('#bar_sub4').css("display", "block");
                $('#main4_img').attr("src", "${pageContext.request.contextPath}/resources/img/myStarbucks/up.png");
            }
        });
        
        
        
        <!-- ????????? ?????? ????????? ???????????? ???????????? -->
        $('#myCoffee').click(function() {
        	$('#myCoffee_list').css("display", "block");
        	$('#myFood_list').css("display", "none");
        	$('#mySangpum_list').css("display", "none");
        	
        	$('#myCoffee').css("color", "white");
        	$('#myFood').css("color", "black");
        	$('#mySangpum').css("color", "black");
        	
        	$('#choice1').css("background-color", "#006633");
        	$('#choice2').css("background-color", "white");
        	$('#choice3').css("background-color", "white");
        });
        
        $('#myFood').click(function() {
        	$('#myCoffee_list').css("display", "none");
        	$('#myFood_list').css("display", "block");
        	$('#mySangpum_list').css("display", "none");
        	
        	$('#myCoffee').css("color", "black");
        	$('#myFood').css("color", "white");
        	$('#mySangpum').css("color", "black");
        	
        	$('#choice1').css("background-color", "white");
        	$('#choice2').css("background-color", "#006633");
        	$('#choice3').css("background-color", "white");
        });
        
        $('#mySangpum').click(function() {
        	$('#myCoffee_list').css("display", "none");
        	$('#myFood_list').css("display", "none");
        	$('#mySangpum_list').css("display", "block");
        	
        	$('#myCoffee').css("color", "black");
        	$('#myFood').css("color", "black");
        	$('#mySangpum').css("color", "white");
        	
        	$('#choice1').css("background-color", "white");
        	$('#choice2').css("background-color", "white");
        	$('#choice3').css("background-color", "#006633");
        });
        
        
        
        
        <!-- ????????? ??????, ?????? ???????????? -->
		$(function() {
			
			$("[type=checkbox][name=chk1]").on("change", function() {
				
				var check = $(this).prop("checked");
				
				//?????? ?????? ????????? ?????? ??????
				if($(this).hasClass("chkAll1")) {
					$("[type=checkbox][name=chk1]").prop("checked", check);
					
				//?????? ?????? ????????? ?????? ??????, ???????????? ????????? ?????? ?????? ????????? ??????
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
		
		
		$(function() {
			
			$("[type=checkbox][name=chk2]").on("change", function() {
				
				var check = $(this).prop("checked");
				
				//?????? ?????? ????????? ?????? ??????
				if($(this).hasClass("chkAll2")) {
					$("[type=checkbox][name=chk2]").prop("checked", check);
					
				//?????? ?????? ????????? ?????? ??????, ???????????? ????????? ?????? ?????? ????????? ??????
				}else {
					var all = $("[type=checkbox][name=chk2].chkAll2");
					var allcheck = all.prop("checked")
					
					if(check != allcheck) {
						var len = $("[type=checkbox][name=chk2]").not(".chkAll2").length;
						var ckLen = $("[type=checkbox][name=chk2]:checked").not(".chkAll2").length;
						
						if(len === ckLen) {
							all.prop("checked", true);
						}else {
							all.prop("checked", false);
						}
					}
				}
			 }); 
		  });

		
		
	    
    </script>
    
    
</body>
</html>