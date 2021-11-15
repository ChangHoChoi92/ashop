<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<style>
		
	#bg1{padding-top:100px; padding-bottom:0px;}
	
	#btn1{ width:121px; border:2px solid #fff; border-radius:3px; height:34px; line-height:34px; position:absolute; left:763px; top:283px;}
	#btn1 a{color:#fff; display:block; height:100%; text-align:center; width:100%; -webkit-transition:background-color .7s, color .7s; transition:background-color .7s, color .7s; text-decoration-line: none;}    
    #btn1 a:hover{ background:#fff; color:#222; }
    
    #btn2{width:121px; border:2px solid #222; border-radius:3px; height:34px; line-height:34px; position:absolute; left:1px; top:260px;}
    #btn2 a{color:#222; display:block; height:100%; text-align:center; width:100%; -webkit-transition:background-color .7s, color .7s; transition:background-color .7s, color .7s; text-decoration-line: none;}
    #btn2 a:hover { background:#222; color:#fff; }
    
    #btn3{width:121px; border:2px solid #fff; border-radius:3px; height:34px; line-height:34px; position:absolute; left:761px; top:262px;}
    #btn3 a{color:#fff; display:block; height:100%; text-align:center; width:100%; -webkit-transition:background-color .7s, color .7s; transition:background-color .7s, color .7s; text-decoration-line: none;}
    #btn3 a:hover { background:#fff; color:#222; }
    
    #btn4 { width:121px; border:2px solid #222; border-radius:3px; height:34px; line-height:34px; position:absolute; left:-1px; top:280px; }
    #btn4 a { color:#222; display:block; height:100%; text-align:center; width:100%; -webkit-transition:background-color .7s, color .7s; transition:background-color .7s, color .7s;text-decoration-line: none;}
    #btn4 a:hover { background:#222; color:#fff; }
    
    #menu_drink_section{ width:100%; height:430px; background:url("${pageContext.request.contextPath}/resources/img/main/main_1.png") 20% 50% no-repeat; position:relative; background-size:cover;}
    #menu_food_section{ width:100%; height:430px; background:url("${pageContext.request.contextPath}/resources/img/main/main_2.png") 80% 50% no-repeat; background-size:cover; position:relative; }
    #menu_product_section{ width:100%; height:430px; background:url("${pageContext.request.contextPath}/resources/img/main/main_3.png") 20% 50% no-repeat; background-size:cover; position:relative; }
    #menu_card_section{ width:100%; height:430px; background:url("${pageContext.request.contextPath}/resources/img/main/main_4.png") 80% 50% no-repeat; background-size:cover; position:relative; }
    #menu_section_inner{ width:1100px; margin:0 auto; position:relative; }
    
    ol, ul {list-style: none;}
    
    .notice{height:50px; overflow:hidden; width:70%; margin:auto; 
    		background-image:url(${pageContext.request.contextPath}/resources/img/main/notice_ttl.png); 
    		background-repeat:no-repeat; background-position: 20% 50%;}
  	.rolling{position:relative; width:100%; height:auto;}
	.rolling li{width:100%; height:50px; line-height:50px; text-align: center; }
	.rolling li a{color:#fff; text-decoration-line: none;}
	
	#reward_bg1{width:100%; height:250px; background-color:#1e3932;}
	#reward_bg2{width:70%;height:250px; margin:auto; display:flex; display:table; }
	#reward_text h2,p{color:#ffffff;}
	#reward_text{ display:table-cell; vertical-align:middle; width:500px;}
	#reward_logo{ display:table-cell; vertical-align:middle;}
	#reward_logo img{margin:0 0 0 200px;}
	#login_bt{display:table-cell; vertical-align:middle; padding-left:100px; padding-right:100px;  }
	#login_bt a{box-sizing: border-box; height: 38px; line-height: 36px; padding:10px; font-size: 14px; color: #fff;}
	#login_bt a:hover{text-decoration:underline;}
	#login_bt .btn-signin_join{background-color: #00704a; border: 2px solid #00704a; text-decoration-line: none;}
	#login_bt .btn-signin_login{margin-left: 9px; background-color: transparent; border: 2px solid #fff; text-decoration-line: none;}
	
	#reward_bg3{width:100%; height:250px; background-color:#1e3932;}
	#reward_bg4{width:70%;height:250px; margin:auto; display:flex; display:table; }
	#reward_onid{display:table-cell; vertical-align:middle; width:500px;padding-left:20px;}
	#reward_onid p span{font-size: 25px; font-weight: bold;}
	#cuplogo{padding-left:250px; margin: 30px 0 0 0;}
	#nocard_logo{padding-left:80px;}
	#nocard_text{display:table-cell; vertical-align:middle; width:300px; padding-right:200px; padding-left:20px;}
	
	#reward_bg5{width:100%; height:250px; background-color:#1e3932;}
	#reward_bg6{width:70%;height:250px; margin:auto; display:flex; display:table; }
	#oncard_text{display:table-cell; vertical-align:middle; width:340px; padding-right:20px;}
	#oncard_text p span{font-size: 25px; font-weight: bold;}
	#oncard_img{display:table-cell; vertical-align:middle; width:200px; padding-left:50px;}
	#oncard_price{display:table-cell; vertical-align:middle; width:300px;}
	#starlogo{display:table-cell; vertical-align:middle; padding-left:200px;}
	#other_bt{ border:1px solid #fff; border-radius:3px; float:left; height:24px; line-height:24px; margin:5px 0 0 10px; width:100px; }
	#other_bt a { color:#fff; display:block; font-size:12px; height:100%; text-align:center; width:100%; -webkit-transition:background-color .7s, color .7s; transition:background-color .7s, color .7s; }
	#other_bt a:hover { background:#fff; color:black; font-weight:bold; }
	
	
	#scrollbg2{position:fixed; bottom:100px; left:60%; width:140px; margin-left:485px; z-index:999;}
	#scrollbg2 a {display:block; width:100%; height:100%;}
	#scrollbg2 img{display:block; width:100%; border-radius:10%; background-color:#f6f5ef;}
	
	
</style>
</head>
<body>
<%@ include file="../dbconn.jsp"%>
<%@ include file="header.jsp" %>
	
		
	
	<sql:query var="name" dataSource="${conn}">
		select * 
		from board 
		order by board_subject desc
		limit 5
	</sql:query>
		
		
		<script>
			$(document).ready(function(){
				var height =  $(".notice").height();
				var num = $(".rolling li").length;
				var max = height * num;
				var move = 0;
				function noticeRolling(){
					move += height;
					$(".rolling").animate({"top":-move},1500,function(){
						if( move >= max ){
							$(this).css("top",0);
							move = 0;
						};
					});
				};
				noticeRollingOff = setInterval(noticeRolling,3000);
				$(".rolling").append($(".rolling li").first().clone());
			
			});		
		</script>
		
		<%-- <div id="scrollbg">
			<a href="#"><img src="${pageContext.request.contextPath}/resources/img/main/halloween.jpg"></a>
		</div> --%>
		<div id="scrollbg2">
			<a href="${pageContext.request.contextPath}/chatbot/chat.jsp" target="blank"><img src="${pageContext.request.contextPath}/resources/img/main/chat.png"></a>
		</div>
			
		<div id="bg1">
			
		<div id="menu_food_section">	
			<div id="menu_section_inner">
				
				<div id="btn2">
					<a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp">자세히 보기</a>
				</div>
			</div>
		</div>
		
		<div style="background:#111111;">
			
			<div class="notice">
				
				<ul class="rolling">
					
					<c:forEach var="num1" items="${name.rows}" varStatus="board_name">
					<li>  
						<a href="http://localhost:8080/boardDetail.bo?board_num=${num1.board_num}&page=1">
							${num1.board_subject}
						</a>
					</li>	
					
					</c:forEach>
					
				</ul>
			</div>
		</div>
		
		<!-- 로그인 리워드 구역 -->
		
		<!-- 로그인 하지 않았을 때 -->
	<c:if test="${sessionId == null}">
		<div id="reward_bg1">
			<div id="reward_bg2">
				<div id="reward_logo">
					<img src="${pageContext.request.contextPath}/resources/img/header/logo.png" alt="스타벅스 로고" style="width:200px; height:200px;" >
				</div>
				<div id="reward_text">
					<h2 >
						스타벅스만의 특별한 혜택, <strong>스타벅스 리워드</strong>	
					</h2>
					<p >
						<strong>스타벅스 회원이세요?</strong> 로그인을 통해 나만의 리워드를 확인해보세요.<br>
						<strong>스타벅스 회원이 아니세요?</strong> 가입을 통해 리워드 혜택을 즐기세요.
					</p>
				</div>
				<div id="login_bt">
					<a href="${pageContext.request.contextPath}/member/joinCheck.jsp" class="btn-signin_join">회원가입</a>
					<a href="${pageContext.request.contextPath}/member/loginForm.jsp" class="btn-signin_login">로그인</a>
				</div>
			</div>
		</div>
	</c:if>
		
		<!-- 로그인하고 카드가 없을 때 -->
		
	<c:if test="${sessionId != null }">
		<%-- 로그인한 id 정보 불러오기 --%>
		<sql:query var="rs" dataSource="${conn}">
			select * 
			from member 
			where id = ?
			<sql:param value="${sessionId}"/>
		</sql:query>
		
		<c:forEach var="row" items="${rs.rows}">
			<%-- 카드가 없을 때 --%>
			<c:if test="${row.cardName == null }">
			
				<div id="reward_bg3">
					<div id="reward_bg4" >
						<div id="cuplogo" >
							<img src="${pageContext.request.contextPath}/resources/img/main/cuplogo.png" alt="스타벅스 로고" >
						</div>
						<div id="reward_onid">
							<c:if test="${row.nickname eq '' }">
								<p>
									<span>${row.id }</span> 님 안녕하세요<br>
									혜택에 편리함까지 더한 스타벅스 리워드를<br>
									즐겨보세요.
								</p>
							</c:if>
							<c:if test="${row.nickname ne '' }">
								<p>
									<span>${row.nickname }</span> 님 안녕하세요<br>
									혜택에 편리함까지 더한 스타벅스 리워드를<br>
									즐겨보세요.
								</p>
							</c:if>
						</div>
						
						<div id="nocard_logo" >
							<a href="${pageContext.request.contextPath}/m_card/cardListForm.jsp">
								<img src="${pageContext.request.contextPath}/resources/img/main/nocardlogo.png" alt="스타벅스 로고" >
							</a>
						</div>
						<div id="nocard_text">
							<p>
								<strong>스타벅스카드등록</strong><br>
								등록된카드가 없습니다.<br>
								새로운 카드를 등록하세요.
							</p>
						</div>
					</div>
				</div>
				
			</c:if>
			
			<%-- 카드가 있을 때 --%>
			<c:if test="${row.cardName != null }">
			
				<div id="reward_bg5">
					<div id="reward_bg6">
						<div id="starlogo">
							<img src="${pageContext.request.contextPath}/resources/img/main/main_star.png" alt="스타벅스 별그림" >
						</div>
						<div id="oncard_text">
							<c:if test="${row.nickname eq '' }">
								<p>
									<span>${row.id }</span> 님 안녕하세요<br>
									혜택에 편리함까지 더한 스타벅스 리워드를<br>
									즐겨보세요.
								</p>
							</c:if>
							<c:if test="${row.nickname ne '' }">
								<p>
									<span>${row.nickname }</span> 님 안녕하세요<br>
									혜택에 편리함까지 더한 스타벅스 리워드를<br>
									즐겨보세요.
								</p>
							</c:if>
						</div>
						
						<div id="oncard_img">
							<a href="${pageContext.request.contextPath}/main/myMenu_card.jsp?id=${sessionId}"><img src="${pageContext.request.contextPath}/resources/img/card/<c:out value='${row.cardImg }'/>" style="width:150px; height:90px;"></a>
						</div>
						<div id="oncard_price">
							<p style="width:150px; font-size:19.5px;" >
								잔액 : <strong><fmt:formatNumber value="${row.cardPrice }" pattern="#,###"/></strong>원
							</p>
							<p id="other_bt">
								<a href="${pageContext.request.contextPath}/m_card/cardListForm.jsp">다른카드보기</a>
							</p>
						</div>
						
					</div>
				</div>
			</c:if>
			
		</c:forEach>

	</c:if>
	
		
		<div id="menu_drink_section">
			<div id="menu_section_inner">
				
				<div id="btn1">
					<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">자세히 보기</a>
				</div>
			</div>
		</div>
		
		<div id="menu_card_section">	
			<div id="menu_section_inner">
				
				<div id="btn4">
					<a href="${pageContext.request.contextPath}/m_card/cardListForm.jsp">자세히 보기</a>
				</div>
			</div>
		</div>	
		
		<div id="menu_product_section">	
			<div id="menu_section_inner">
				
				<div id="btn3" style="background:#37363c;">
					<a href="${pageContext.request.contextPath}/m_product/productListForm.jsp">자세히 보기</a>
				</div>
			</div>
		</div>
		
		
	</div>	
	
<%@include file="footer.jsp" %>

</body>
</html>