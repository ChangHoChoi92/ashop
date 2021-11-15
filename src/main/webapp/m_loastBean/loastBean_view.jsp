<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    .container{
        width: 70%;
        padding-top: 100px;
        margin: auto;
        height: 100%;
    }
    .inline{
        display: inline-block;
    }
    #imgArea{
        width: 45%;
        float: left;
    }
    #info{
        width: 55%;
    }
    .inline right{
        float: right;
        background-color: white;
        display : block;
    }
    .tmi{
        display: none;
    }
    .eng{
        font-size: 14px;
        font-weight : lighter;
        color : gray;
    }
    .small{
        vertical-align: bottom;
    }
    .sns{
        text-align: right;
        margin : 1%;
    }
    .bkind{
    	background-color: #f4f4f2;
    	margin : 10% 0;
    }
    .bkind img{
    	vertical-align : middle;
    }
    .d2{
    	margin: 10% 0;
    }
    .bottom1{
    	width : 49%;
    	float: left;
    }
    .bottom2{
    	width : 49%;
    	display: inline-block;
    	margin-left: 2%;
    }
    .left{
    	width : 78%;
    	display : inline-block;
    }
    .right{
    	width : 22%;
    	display : inline-block;
    	float : right;
    }
    .expl{
    	width: 100%;
    	margin: 5% 0;
    }
    .zoomimg{
    	margin : 0 auto;
    	width : 100%;
    }
    .dsct{
    	line-height: 1.5;
    }
    .cart{
    	width : 30%;
    	margin: 0 auto;
    	border : 1px solid #222222;
    	border-radius : 5px;
    	display : none;
    	
    }
    #reg{
    	height:30px;
    	background-color: #046241; 
    	color : white;
    	vertical-align: middle;
    	border-radius: 5px;
    	
    }
    .name{
    	background-color: #8c8279;
    	padding : 3%;
    	width:94%;
    	
    }
    .upside{
    	vertical-align: middle;
    }
    .cleft{
    	width : 40%;
    	display : inline-block;
    }
    .cright{
    	display : inline-block;
    	width:60%;
    	float : right;
    	text-align: center;
    }
    .creg{
    	width : 50%;
    	background-color: #006633;
    	border-radius : 3px;
    	color : white;
    	padding : 2%;
    }
    .cancel{
    	width : 50%;
    	float:right;
    	border-radius : 3px;
    	background-color: black;
    	 color : white;
    	 padding : 2%;
    }
    .form-select{
    	margin-top : 2%;
    }
    .d1 span {
        float: right;
        color : gray;
    }
    .loc a {
        text-decoration-line: none;
        color : gray;
    }
    .loc{
        margin-bottom : 5%;
    }
    .loc a:hover {
        text-decoration-line: underline;
    }
    .emptyBox{
    	width : 100%;
    	height : 200px;
    }
</style>
</head>
<body>

	<%@ include file="../dbconn.jsp"%>
	
	<%@ include file="../main/header.jsp" %>
	
	<div style="height : 100px;"></div>
	
	<%-- 수정하려는 회원정보 가져오기 --%>
	<sql:query var="rs" dataSource="${conn}">
		select * from loastbean where bcode = ?
		<sql:param value="${param.bcode}"/>
	</sql:query>
	
	
	<c:forEach var="row" items="${rs.rows}">
	
	<!-- 상세보기에 타이틀 원두이름으로 바꾸기 -->
		<script>
			document.title = "${row.bname} | 상세보기";
		</script>
	<!-- 여기까지 -->
	
		<div class="container">
    		<div class="d1">
        	<h2>스타벅스 원두</h2>
        	
        	<div class="loc">
        		<span><a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/loastBean/icon_home.png" alt="홈"></a> > <a href="${pageContext.request.contextPath}/m_loastBean/loastBeanListForm.jsp?id=${sessionId}">STORE</a> > <a href="${pageContext.request.contextPath}/m_loastBean/loastBeanListForm.jsp?id=${sessionId}">LOAST BEAN</a> > <a href="${pageContext.request.contextPath}/m_loastBean/loastBean_view.jsp?id=${sessionId}"><c:out value="${row.bname}"/></a></span>
			</div>
			
        	<div class="detail">
        
	            <div id="imgArea" class="inline left">
	                <div class="bic">
	                    <p class="picture">
	                    	<img src="../resources/img/loastBean/<c:out value='${row.img}'/>" class="zoomimg" alt="Image To Zoom">
	                    </p>
	                </div>
				</div>
		
        		<div id="info" class="inline right">
        
	        		<div class="upside">
	        	
		            	<div class="left">
		                	<h3><c:out value='${row.bname}'/></h3><br><p class="eng"><c:out value='${row.bname_eng}'/></p>
		            	</div>
		            
		            	<div class="right">
		                 	<input type="button" id="reg"  value="나만의 상품으로 등록">
		            	</div>
		            
	            	</div>
            
	            	<hr style="size: 2;color : black;">
	           	 	<br>
	           	 	
	            	<p style="margin : 5% 0;"><c:out value='${row.brief}'/></p>
	                
	            	<c:if test="${row.bkind eq '블론드 로스트'}">
	               		<div class="bkind"><img src="${pageContext.request.contextPath}/resources/img/loastBean/icon_blond.png"style="margin:1% 2% 1% 3%;"><c:out value="${row.bkind}"/>  |  은은하고 부드러운 맛 Subtle & Mellow </div>
	            	</c:if>
	            	<c:if test="${row.bkind eq '미디엄 로스트'}">
	               		<div class="bkind"><img src="${pageContext.request.contextPath}/resources/img/loastBean/icon_medium.png"style="margin:1% 2% 1% 3%;"><c:out value="${row.bkind}"/>  |  균형잡힌 부드러움 Balance & Mellow </div>
	            	</c:if>
	            	<c:if test="${row.bkind eq '다크 로스트'}">
	               		<div class="bkind"><img src="${pageContext.request.contextPath}/resources/img/loastBean/icon_dark.png"style="margin:1% 2% 1% 3%;"><c:out value="${row.bkind}"/>  |  강렬하고 강인한 맛 Strong & Powerful </div>
	            	</c:if>
                	<c:if test="${row.bkind == '플레이버' || row.bkind == '스타벅스 리저브™'}">
                		<div class="emptyBox">
                			&nbsp;
                		</div>
                	</c:if>
			        <div style="text-align : right; margin 3%;">
			        	<h2><fmt:formatNumber value="${row.bprice }" pattern="#,###"/>원</h2>
			        </div>
		           
		            <div class="sns">
		                <a href="#"><img src="../resources/img/loastBean/sns_f.png" ></a>
		            </div>
            
        		</div>
            
        		<div style="height : 100px"></div>
        
	        	<div class="tmi">
	            	<div>
	                	starbucks coffee line up
	            	</div>
	            	<ul>
	                	<li><a href="#"><p><img src="../resources/img/loastBean/attr.jpg"></p></a></li>
	                	<li><a href="#"><p><img src="../resources/img/loastBean/extrac.jpg"></p></a></li>
	            	</ul>
	        	</div>
        
        	</div>
    	</div>
    
    	<div class="cart" id="cart">
    		<form action="${pageContext.request.contextPath}/main/cartProcess.jsp" method="post" name="insert">
    		
    				<input type="hidden" value="${sessionId }" name="id">
    				<input type="hidden" value="${row.img }" name="img">
    				<input type="hidden" value="${row.bname }" name="cname">
    				<input type="hidden" value="${row.bprice }" name="price">
    				<input type="hidden" value="loastBean" name="category">
    		
					<div class="name">
						<h2 style="color : white;">나만의 원두</h2>
					</div>
					
					<div class=" down"  style="padding : 5%;">
						<div class="cleft">
							<img src="../resources/img/loastBean/<c:out value="${row.img}"/>" style="width : 100%;">
						</div>
						
						<div class="cright">
							<h5><c:out value="${row.bname}"/></h5>
							<h6 style="color : darkgray;"><c:out value="${row.bname_eng}"/></h6>
							<c:set var = "testStr" value = "<c:out value='${row.bname}'/>"/>
						
							<c:if  test = "${fn:contains (testStr, '250g')}">
								<div>
							        <select name="option" class="form-select" aria-label="Default select example">
							            <option value="선택안함 ">선택안함</option>
							            <option value="에스프레소용 ">에스프레소용</option>
							            <option value="커피메이커용 ">커피메이커용</option>
							            <option value="핸드드립용 ">핸드드립용</option>
							            <option value="모카포트용 ">모카포트용</option>
							            <option value="커피프레스용 ">커피프레스용</option>
							        </select>
					        	</div>
				        	</c:if>
					        <div>
					            <select name="option" class="form-select" aria-label="Default select example">
					                <option value="/ 포장 안함">선택 안함</option>
					                <option value="/ 포장">선물 포장 요청</option>
					            </select>
					        </div>
			        	</div>
						<hr>
					
						<input type="button" class="creg" id="creg" value="나만의 원두에 등록" onclick="insert.submit()">
						
						<input type="button" class="cancel"  id="cancel" value="취소">
					</div>
				</form>
			</div>
			
    		<div>&nbsp;</div>
    	
    		<div class="d2">
    			<div>&nbsp;</div>
    			<hr>
    			
		    	<div class="expl">
		        	<p style="line-height: 1.5"><c:out value='${row.expl}'/></p>
		        </div>
		        
		        <div class="bottom1">
		        	<p>
		        		<img src="../resources/img/loastBean/ds.jpg" style="width : 100%;">
		        	</p>
		        	<h3 class="dsct">디자인스토리</h3>
		        	<c:out value="${row.dStory}"/>
		        </div>
		        
		        <div class="bottom2">
		        	<p>
		        		<img src="../resources/img/loastBean/ctn.jpg" style="width : 100%;">
		        	</p>
		        	<h3 class="dsct">커피 테이스팅 노트</h3>
		        	<c:out value="${row.ctNote}"/>
		        </div>
    		</div>
    	
    	</div>
	</c:forEach>
	
	<%@ include file="/main/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.4.0.min.js" 
        integrity="sha384-JUMjoW8OzDJw4oFpWIB2Bu/c6768ObEthBMVSiIx4ruBIEdyNSUQAjJNFqT5pnJ6" 
        crossorigin="anonymous">
</script>

<script src="../resources/js/zoomsl.min.js"></script>

<script>
    $(function(){
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
                $('#cart').css("display", "flex");
            }
		}
    	
        
    });
    $('#cancel').click(function(){
	    	if($('#cart').is(":visible")){
	    		$('#cart').css("display","none");
	    	}
	    });
</script>
</body>
</html>