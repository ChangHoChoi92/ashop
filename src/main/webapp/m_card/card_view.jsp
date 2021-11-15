<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }
    .container{
        width: 60%;
        padding-top: 100px;
        margin: auto;
        height: 850px;
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
    }
    .tmi{
        display: none;
    }
    span{
        font-size: 12px;
        font-weight : lighter;
    }
    .small{
        vertical-align: bottom;
    }
    .sns{
        text-align: right;
    }
    .btn{
    	background-color: #f6f5ef;
    	color : white;
    }
    .note{
    	line-height: 1.5;
    }
    .left{
    	width : 80%;
    	display : inline-block;
    }
    .right{
    	width : 20%;
    	display : inline-block;
    	float : right;
    }
    .release{
    	background-color: #f4f4f2;
    	margin : 10% 0;
    	padding : 3%;
    }
    .bic{
    	width : 100%;
    }
    .cardleft{
    	width : 78%;
    	display : inline-block;
    }
    .cardright{
    	width : 22%;
    	display : inline-block;
    	float : right;
    }
    #reg{
    	height:30px;
    	background-color: #046241; 
    	color : white;
    	vertical-align: middle;
    	border-radius: 5px;
    	width : 100px;
    }
    
    .priceChoice{
    	margin : 4%;
    	width : 92%;
    	height : 200px;
    	border :3px solid #046241;
    	border-radius:15px;
    	display:none;
    }
    
    .choice{
    	height : 25px;
    	width : 100%;
    	margin : 4%;
    }
    
    .cright{
    	text-align: center;
    	width : 100%;
    	height : 80px;
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
    
    .name{
    	background-color: #046241;
    	padding : 3%;
    	width : 546px;
    }
    
</style>
</head>
<body>

	<%@ include file="../dbconn.jsp"%>
	
<%@ include file="../main/header.jsp" %>

<div style="height : 100px;"></div>
	<%-- 수정하려는 회원정보 가져오기 --%>
	<sql:query var="rs" dataSource="${conn}">
		select * from card where ccode = ?
		<sql:param value="${param.ccode}"/>
	</sql:query>
	<c:forEach var="row" items="${rs.rows}">
<div class="container">
    <div class="d1">
        <h2>카드</h2>
        <div class="detail">
            <div id="imgArea" class="inline left">
                <div class="bic">
                    <p class="picture">
                    	<div style="width: 100%; height:100px;"></div>
                    	<img src="../resources/img/card/<c:out value='${row.img}'/>" class="zoomimg" > 
                    </p>
                </div>
            </div>
            <div id="info" class="inline right">
                <div class="cardleft">
                    <h3><c:out value='${row.cname}'/><span><br><c:out value='${row.cname_eng}'/></span></h3>
                </div>
                <div class="cardright">
                   		<input type="button" id="reg"  value="카드 등록">                
                </div>
                 
                <hr>
                <br>
                <div class="release">스타벅스 카드 출시 년도 : <c:out value="${row.rel}"/></div>
              
	                <div class="note">
						<hr>
							<div class="left">스타벅스 카드 안내 및 특징</div> 
	           				<hr>
	           				<div class="cnote">
		           				1. 본 카드는 국내에서만 사용이 가능합니다.<br>
2. 스타벅스 카드로 결제 시 스타벅스의 모든 제품 및 상품을 다양한 혜택과 함께 편리하게 구입할 수 있습니다.<br>
3. 언제든지 재충전이 가능합니다.
	           				</div>
	           				<hr>
				           <div class="priceChoice" id="priceChoice">
						    	<form action="${pageContext.request.contextPath}/m_card/cardRegistProcess.jsp" method="post" name="insert">
			    		
					    				<input type="hidden" value="${sessionId }" name="id">
					    				<input type="hidden" value="${row.img}" name="img">
					    				<input type="hidden" value="${row.cname}" name="cname">
					    				
										<div class="name">
											<h2 style="color : white;">카드 금액 선택</h2>
										</div>
										<div class=" down" >
											<div class="cright">
										            <select name="price" class="choice" aria-label="Default select example">
										                <option value="0">선택 안함</option>
										                <option value="10000">₩ 10,000</option>
										                <option value="30000">₩ 30,000</option>
										                <option value="50000">₩ 50,000</option>
										                <option value="100000">₩ 100,000</option>
										            </select>
									        </div>
											<hr>
									<div style="width:100%;margin : 0 2%; ">
										<input type="button" class="creg"  id="creg" value="카드 등록" onclick="insert.submit()">
									
										<input type="button" class="cancel"  id="cancel" value="취소">
									</div>
								</div>
							</form>
						</div>
		                <div class="sns">
		                    <a href="https://www.facebook.com/starbuckskorea"><img src="../resources/img/loastBean/sns_f.png"></a>
		           		</div>
            		</div>
            <hr>
            
        </div>
    </div>
</div>
</div>
</c:forEach>
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
				if ($('#priceChoice').is(":visible")) {
					
	                $('#priceChoice').css("display", "none");
	            } else {
	                $('#priceChoice').css("display", "flex");
	            }
			}
	    });
	    $('#cancel').click(function(){
	    	if($('#priceChoice').is(":visible")){
	    		$('#priceChoice').css("display","none");
	    	}
	    });
</script>
<%@ include file="/main/footer.jsp" %>
</body>
</html>