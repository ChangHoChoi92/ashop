<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }
    .container{
        width: 70%;
        padding-top: 120px;
        margin: auto;
    }
    .inline{
        display: inline-block;
    }
    .detail {
    	margin-top: 30px;
    }
    #imgArea{
        width: 45%;
        float: left;
    }
    #imgArea img {
    	width: 80%;
    }
    #info{
        width: 55%;
    }
    #route a {
    	color: gray;
    	text-decoration-line: none;
    }
    
    #route a:hover {
    	text-decoration-line: underline;
    }
    .inline right{
        float: right;
    }
    .tmi{
        display: none;
    }
    .small{
        vertical-align: bottom;
    }
    .sns{
        text-align: right;
    }
    .bkind{
    	background-color: #f4f4f2;
    	margin : 10% 0;
    }
    .bkind img{
    	vertical-align : middle;
    }
    
    .d2{
    	margin : 10% 0;
    }

    .note{
    	overflow : auto;
    	line-height: 1.5;
    	row : 10;
    	color : #777777;
    }
    .note > table {
    	width: 100%;
    }
    .note > table tr td {
    	padding-bottom: 10px;
    }
    .note > table tr td:nth-child(1) {
    	border-right: 1px dotted grey;
    	width: 50%;
    }
    .note > table tr td:nth-child(2) {
    	padding-left: 5px;
    }
    
    /* 장바구니 */
    .cart {
        width: 100%;
        margin: 0 auto;
        border: 1px solid #222222;
        border-radius: 5px;
        display: none;
		margin-bottom: 30px;
    }
    
    .down {
    	width: 100%;
    }

    #reg {
        height: 30px;
        background-color: #046241;
        color: white;
        vertical-align: middle;
        border-radius: 5px;

    }

    .name {
        background-color: #8c8279;
        padding: 3%;
		width: 94%;
    }
    
    .eng {
    	color: gray;
    }

    .upside {
        vertical-align: middle;
    }

    .cleft {
        width: 40%;
        display: inline;
    }

    .cright {
        display: inline;
        width: 58%;
        float: right;
        text-align: center;
    }
    
    .cright table {
    	margin: auto;
    	font-size: 24px;
    }

    .breg {
        width: 50%;
        background-color: #006633;
        border-radius: 3px;
        color: white;
        padding: 2%;
    }

    .cancel {
        width: 50%;
        float: right;
        border-radius: 3px;
        background-color: black;
        color: white;
        padding: 2%;
    }
</style>
</head>
<body>

	<%@ include file="../dbconn.jsp"%>
	
	<%@ include file="../main/header.jsp" %>
	
	
	<sql:query var="rs" dataSource="${conn}">
		select * from menu where name = ?
		<sql:param value="${param.name}"/>
	</sql:query>
	
	<%-- 조회수 +1 --%>
	<sql:update dataSource="${conn}">
	
		update menu
		   set hit_cnt = hit_cnt + 1
		 where name = ?
			 
		<sql:param value="${param.name}"/>
	</sql:update>
	
	<c:forEach var="row" items="${rs.rows}">
	
	<div class="container">
	    <div class="d1">
	    	<h1>
	    		<!-- 음료 -->
		    	<c:if test="${row.category eq 'cold_brew' }">
		    		콜드 브루
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'espresso' }">
		    		에스프레소
		    	</c:if>
	
		    	<c:if test="${row.category eq 'frappuccino' }">
		    		프라푸치노
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'blended' }">
		    		블렌디드
		    	</c:if>
		    		    	
		    	<c:if test="${row.category eq 'tea' }">
		    		티(티바나)
		    	</c:if>
		    	
		    	
		    	<c:if test="${row.category eq 'signatue' }">
		    		기타 제조 음료
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'bottle' }">
		    		스타벅스 주스(병음료)
		    	</c:if>
		    	
		    	<!-- 푸드 -->
		    	<c:if test="${row.category eq 'bread' }">
		    		브레드
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'cake' }">
		    		케이크
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'salad' }">
		    		샌드위치 & 샐러드
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'soup' }">
		    		따뜻한 푸드
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'fruit' }">
		    		과일 & 요거트
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'snack' }">
		    		스낵 & 미니 디저트
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'icecream' }">
		    		아이스크림
		    	</c:if>
	    	</h1>
	        
	        <!-- 경로 -->
	        <p id="route" style="text-align: right;">
	        	<img src="${pageContext.request.contextPath}/resources/img/myStarbucks/icon_homeblack.png"> > 
	        	
	        	<c:if test="${row.category == 'bread' || row.category == 'cake' || row.category == 'salad' || row.category == 'soup' || row.category == 'fruit' || row.category == 'snack' || row.category == 'icecream' }">
	        		<a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp">Menu</a>
	        	</c:if>
	        	
	        	<c:if test="${row.category == 'cold_brew' || row.category == 'espresso' || row.category == 'frappuccino' || row.category == 'blended' || row.category == 'tea' || row.category == 'sognatue' || row.category == 'bottle' }">
	        		<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">Menu</a>
	        	</c:if>
	        	 > 
	        	<!-- 음료 -->
		    	<c:if test="${row.category eq 'cold_brew' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">콜드 브루</a>
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'espresso' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">에스프레소</a>
		    	</c:if>
	
		    	<c:if test="${row.category eq 'frappuccino' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">프라푸치노</a>
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'blended' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">블렌디드</a>
		    	</c:if>
		    		    	
		    	<c:if test="${row.category eq 'tea' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">티(티바나)</a>
		    	</c:if>
		    	
		    	
		    	<c:if test="${row.category eq 'signatue' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">기타 제조 음료</a>
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'bottle' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">스타벅스 주스(병음료)</a>
		    	</c:if>
		    	
		    	<!-- 푸드 -->
		    	<c:if test="${row.category eq 'bread' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">브레드</a>
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'cake' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/coffeeListForm.jsp">케이크</a>
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'salad' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp">샌드위치 & 샐러드</a>
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'soup' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp">따뜻한 푸드</a>
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'fruit' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp">과일 & 요거트</a>
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'snack' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp">스낵 & 미니 디저트</a>
		    	</c:if>
		    	
		    	<c:if test="${row.category eq 'icecream' }">
		    		<a href="${pageContext.request.contextPath}/m_coffee_food/foodListForm.jsp">아이스크림</a>
		    	</c:if>
		    	> <a href="${pageContext.request.contextPath}/m_coffee_food/coffeeFoodview.jsp?name=${row.name}"><c:out value="${row.name }"/></a>
	        </p>
	        
	        <div class="detail">
	            <div id="imgArea" class="inline left">
	                <div class="bic">
	                    <p class="picture">
	                    	<c:if test="${row.category == 'cold_brew' || row.category == 'espresso' || row.category == 'frappuccino' || row.category == 'blended' || row.category == 'tea' || row.category == 'sognatue' || row.category == 'bottle' }">
	                    		<img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value='${row.img}'/>">	
	                    	</c:if>
	                    	<c:if test="${row.category == 'bread' || row.category == 'cake' || row.category == 'salad' || row.category == 'soup' || row.category == 'fruit' || row.category == 'snack' || row.category == 'icecream' }">
	                    		<img src="${pageContext.request.contextPath}/resources/img/food/<c:out value='${row.img}'/>">
	                    	</c:if>
	                    </p>
	                </div>
	            </div>
	            
	            
	            <div id="info" class="inline right">
	                <div class="upside">
                        <div class="left" style="width: 50%;display: inline-block;">
                            <h2>
                                <c:out value='${row.name}' />
                            </h2>
                            <br>
                            <h3 class="eng">
                                <c:out value='${row.ename}' />
                            </h3>
                        </div>
                        <div class="right" style="float: right; display: inline-block;">
                            <input type="button" id="reg" value="나만의 상품으로 등록">
                        </div>
                    </div>
	                
	                <hr>
	                
	                <br>
	                
	                <pre style="margin : 5% 0; font-size: 16.5px;"><c:out value='${row.info}'/></pre>
	                <hr>
	                
	                <br>
	                
	                <p>제품정보<span style="float: right"><c:out value='${row.size}'/></span></p>
	                
	                <br>
	                
	                <hr>
	                
		            <div class="note">
		            <br>
						<table>
							<tr>
								<td>
									1회 제공량 (kcal)<span style="float: right; padding-right: 5px;"><c:out value='${row.kcal}'/></span>
								</td>
								<td>
									나트륨 (mg)<span style="float: right; padding-right: 5px;"><c:out value='${row.salt}'/></span>
								</td>
							</tr>
							<tr>
								<td>
									포화지방 (g)<span style="float: right; padding-right: 5px;"><c:out value='${row.saturatedfat}'/></span>
								</td>
								<td>
									당류 (g)<span style="float: right; padding-right: 5px;"><c:out value='${row.sugars}'/></span>
								</td>
							</tr>
							<tr>
								<td>
									단백질 (g)<span style="float: right; padding-right: 5px;"><c:out value='${row.protein}'/></span>
								</td>
								<c:if test="${row.category == 'cold_brew' || row.category == 'espresso' || row.category == 'frappuccino' || row.category == 'blended' || row.category == 'tea' || row.category == 'sognatue' || row.category == 'bottle' }">
									<td>
										카페인 (mg)<span style="float: right; padding-right: 5px;"><c:out value='${row.caffeine}'/></span>
									</td>
								</c:if>
							</tr>
						</table>
						
						<br>
						
	     				<!-- 알레르기 유발 요인 -->
	    				<div style="background-color: #f4f4f2; height: 35px; padding: 10px 0 0 5px;">
	    					알레르기 유발요인 : <c:out value="${row.allergy }"/>
	    				</div>
	    				
	    				<br>
	    				
		           	</div>

		           	<div style="text-align : right;">
		           		<h2><fmt:formatNumber value="${row.price }" pattern="#,###"/>원</h2>
		            </div>

	                <div class="sns">
	                    <a href="#"><img src="../resources/img/loastBean/sns_f.png"></a>
	            	</div>
	            	
	            	<hr>
	            	
	            	<div class="cart" id="cart">
                            <form action="${pageContext.request.contextPath}/main/myMenu_list_process.jsp" method="post">
                            	<input type="hidden" value="${sessionId }" name="id">
                            	<input type="hidden" value="${row.img }" name="img">
                            	
                            	<c:if test="${row.category == 'cold_brew' || row.category == 'espresso' || row.category == 'frappuccino' || row.category == 'blended' || row.category == 'tea' || row.category == 'signatue' || row.category == 'bottle' }">
                                	<input type="hidden" value="coffee" name="category">
                                </c:if>
                                
                                <c:if test="${row.category == 'bread' || row.category == 'cake' || row.category == 'salad' || row.category == 'soup' || row.category == 'fruit' || row.category == 'snack' || row.category == 'icecream' }">
                                	<input type="hidden" value="food" name="category">
                                </c:if>
                            	
                                <div class="name">
                                    <h2 style="color : white;">나만의
                                        <c:if test="${row.category == 'cold_brew' || row.category == 'espresso' || row.category == 'frappuccino' || row.category == 'blended' || row.category == 'tea' || row.category == 'signatue' || row.category == 'bottle' }">
                                            커피
                                        </c:if>
                                        <c:if test="${row.category == 'bread' || row.category == 'cake' || row.category == 'salad' || row.category == 'soup' || row.category == 'fruit' || row.category == 'snack' || row.category == 'icecream' }">
                                            푸드
                                        </c:if>
                                    </h2>
                                </div>


                                <div class="down" style="padding: 5%;">
                                    <div class="cleft">
                                        <c:if test="${row.category == 'cold_brew' || row.category == 'espresso' || row.category == 'frappuccino' || row.category == 'blended' || row.category == 'tea' || row.category == 'sognatue' || row.category == 'bottle' }">
		                                    <img src="${pageContext.request.contextPath}/resources/img/coffee/<c:out value='${row.img}'/>">
		                                </c:if>
		                                <c:if test="${row.category == 'bread' || row.category == 'cake' || row.category == 'salad' || row.category == 'soup' || row.category == 'fruit' || row.category == 'snack' || row.category == 'icecream' }">
		                                    <img src="${pageContext.request.contextPath}/resources/img/food/<c:out value='${row.img}'/>">
		                                </c:if>
                                    </div>
                                    <div class="cright">
                                        <h1 style="color: #006633;">
                                            <i><c:out value="${row.name}" /></i>
                                            <input type="hidden" value="${row.name }" name="name">
                                        </h1>
                                        <h2 style="color : darkgray;">
                                            <i><c:out value="${row.ename}" /></i>
                                        </h2>
                                        <!-- 옵션 -->
                                        <c:if test="${row.category == 'cold_brew' || row.category == 'espresso' || row.category == 'frappuccino' || row.category == 'blended' || row.category == 'tea' || row.category == 'signatue' || row.category == 'bottle' }">
                                            <div>
                                                <table>
                                                    <tr>
                                                        <th>
                                                            샷
                                                        </th>
                                                        <td>
                                                            <select name="option1">
                                                                <option value="샷 추가x ">0</option>
                                                                <option value="샷 추가(+1) ">1</option>
                                                                <option value="샷 추가(+2) ">2</option>
                                                                <option value="샷 추가(+3) ">3</option>
                                                                <option value="샷 추가(+4) ">4</option>
                                                                <option value="샷 추가(+5) ">5</option>
                                                                <option value="샷 추가(+6) ">6</option>
                                                                <option value="샷 추가(+7) ">7</option>
                                                                <option value="샷 추가(+8) ">8</option>
                                                                <option value="샷 추가(+9) ">9</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            시럽
                                                        </th>
                                                        <td>
                                                            <select name="option1">
                                                                <option value="/ 시럽 추가x ">선택안함</option>
                                                                <option value="/ 설탕시럽 추가 ">설탕시럽</option>
                                                                <option value="/ 바닐라시럽 추가 ">바닐라시럽</option>
                                                                <option value="/ 헤이즐넛시럽 추가 ">헤이즐넛시럽</option>
                                                                <option value="/ 카라멜시럽 추가 ">카라멜시럽</option>
                                                                <option value="/ 초코시럽 추가 ">초코시럽</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            사이즈
                                                        </th>
                                                        <td>
                                                            <select name="option1">
                                                                <option value="/ Solo(솔로) ">Solo(솔로) / 22ml (0.75 fl oz)</option>
                                                                <option value="/ Short(숏) ">Short(숏) / 237ml (8 fl oz)</option>
                                                                <option value="/ Tall(톨) ">Tall(톨) 355ml (12 fl oz)</option>
                                                                <option value="/ Grande(그란데) ">Grande(그란데) / 473ml (16 fl oz)</option>
                                                                <option value="/ Venti(벤티) ">Venti(벤티) / 591ml (20 fl oz)</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            휘핑
                                                        </th>
                                                        <td>
                                                            <select name="option1">
                                                                <option value="/ 휘핑x ">선택안함</option>
                                                                <option value="/ 휘핑o ">휘핑추가</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            토핑
                                                        </th>
                                                        <td>
                                                            <select name="option1">
                                                                <option value="/ 토핑 추가x ">선택안함</option>
                                                                <option value="/ 자바칩 추가 ">자바칩</option>
                                                                <option value="/ 초코칩 추가 ">초코칩</option>
                                                                <option value="/ 넛츠 추가 ">넛츠</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            카페인
                                                        </th>
                                                        <td>
                                                            <select name="option1">
                                                                <option value="/ 카페인 ">기본</option>
                                                                <option value="/ 디카페인 ">디카페인</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </c:if>
                                        <c:if test="${row.category == 'bread' || row.category == 'cake' || row.category == 'salad' || row.category == 'soup' || row.category == 'fruit' || row.category == 'snack' || row.category == 'icecream' }">
                                            <div>
                                                <table>
                                                    <tr>
                                                        <th>
                                                            휘핑크림
                                                        </th>
                                                        <td>
                                                            <select name="option2">
                                                                <option value="휘핑x ">선택안함</option>
                                                                <option value="휘핑o ">휘핑크림 추가</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            크림치즈
                                                        </th>
                                                        <td>
                                                            <select name="option2">
                                                                <option value="/ 크림치즈x ">선택안함</option>
                                                                <option value="/ 크림치즈 추가 ">크림치즈 추가</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </c:if>
                                    </div>
								</div>
								
								<c:if test="${row.category == 'cold_brew' || row.category == 'espresso' || row.category == 'frappuccino' || row.category == 'blended' || row.category == 'tea' || row.category == 'signatue' || row.category == 'bottle' }">
                                	<input type="submit" class="breg" value="나만의 커피에 등록">
	                            </c:if>
	                            <c:if test="${row.category == 'bread' || row.category == 'cake' || row.category == 'salad' || row.category == 'soup' || row.category == 'fruit' || row.category == 'snack' || row.category == 'icecream' }">
	                                <input type="submit" class="breg" value="나만의 푸드에 등록">
	                            </c:if>
	                            
	                            <input type="button" class="cancel" value="취소">
                            </form>
                            
                            
                        </div>
	            	
	            </div>

	        </div>

	    </div>
	</div>
	</c:forEach>

<%@ include file="../main/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.4.0.min.js" integrity="sha384-JUMjoW8OzDJw4oFpWIB2Bu/c6768ObEthBMVSiIx4ruBIEdyNSUQAjJNFqT5pnJ6" crossorigin="anonymous">
    </script>
    <script src="../resources/js/zoomsl.min.js"></script>
    <script>
        $(function() {
            $(".zoomimg").imagezoomsl();
        });
        $(".zoomimg").imagezoomsl({

            // shows the magnifying glass container
            cursorshade: true,

            // cursor type
            magnifycursor: 'crosshair',

            // background color of the magnifying glass container
            cursorshadecolor: 'black',

            // opacity of the magnifying glass container
            cursorshadeopacity: 0.3,

            // border styles
            cursorshadeborder: '1px solid black',

            // z-index property
            zindex: '',

            // zoom step
            stepzoom: 0.5,

            // zoom range  
            zoomrange: [2, 2],

            // start zoom level
            zoomstart: 2,

            // disables the scrolling of the document with the mouse wheel when the cursor is over the image
            disablewheel: true

        });
        $(".zoomimg").imagezoomsl({

            showstatus: true,
            showstatustime: 2000,
            statusdivborder: '1px solid black',
            statusdivbackground: '#black',
            statusdivpadding: '4px',
            statusdivfont: 'bold 13px Arial',
            statusdivopacity: 0.8,
            textdnbackground: '#fff',
            textdnpadding: '10px',
            textdnfont: '13px/20px cursive'

        });
        $(".zoomimg").imagezoomsl({

            classmagnifier: "magnifier",
            classcursorshade: "cursorshade",
            classstatusdiv: "statusdiv",
            classtextdn: "textdn",
            classtracker: "tracker"

        });
        
        $('#reg').click(function() {
			if(${sessionId == null}) {
				alert("로그인 후 이용해주세요.");
				location.href = "${pageContext.request.contextPath}/member/loginForm.jsp"
			}else {
				if ($('#cart').is(":visible")) {
					
	                $('#cart').css("display", "none");
	            } else {
	                $('#cart').css("display", "block");
	            }
			}
        	
            
        });
        
        $('.cancel').click(function() {
        	if ($('#cart').is(":visible")) {
				
                $('#cart').css("display", "none");
            }
        });
        
        

    </script>
</body>
</html>