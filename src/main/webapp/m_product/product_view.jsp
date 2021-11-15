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
<style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }
    .container{
        width: 70%;
        padding-top: 100px;
        margin: auto;
        height: 80%;
    }
    .inline{
        display: inline-block;
    }
    #info{
        width: 55%;
    }
    .price {
    	margin-left:80%;
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
        float: right;
    }
    .bkind{
    	background-color: #f4f4f2;
    	margin : 10% 0;
    }
    .bkind img{
    	vertical-align : middle;
    }
    .d2{
    	margin : 20% 0;
    	display : block;
    }
    .bottom{
    	width : 49%;
    	display : inline-block;
    	margin : 10% 0;
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
    .note{
    	overflow : auto;
    	line-height: 1.5;
    	row : 10;
    	color : #777777;
    	padding:30px;
    }
    .cart{
    	width : 30%;
    	margin: 5% auto 0 auto;
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
    .price{
    	text-align: right;
    }
    .zoomimg{
    	width:70%;
    	margin :0 auto;
    }
    .loc  a {
            text-decoration-line: none;
             color : gray;
        }
        .loc{
            margin-bottom : 5%;
            text-align: right;
        }
        .loc  a:hover {
            text-decoration-line: underline;
        }
</style>
<link rel="stylesheet" href="../resources/js/bootstrap.min.css">
</head>
<body>

<%@ include file="../dbconn.jsp"%>
	
<%@ include file="../main/header.jsp" %>
<div style="height : 100px;"></div>
	<%-- 수정하려는 회원정보 가져오기 --%>
	<sql:query var="rs" dataSource="${conn}">
		select * from product where pcode = ?
		<sql:param value="${param.pcode}"/>
	</sql:query>
	<c:forEach var="row" items="${rs.rows}">
	
	<!-- 상세보기에 타이틀 상품이름으로 바꾸기 -->
		<script>
			document.title = "${row.pname} | 상세보기";
		</script>
	<!-- 여기까지 -->
	
<div class="container">
    <div class="d1" style="height: 100%;">
        <h2><c:out value="${row.pkind}"/></h2>
        <div class="loc">
        	<span><a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/loastBean/icon_home.png" alt="홈"></a> > <a href="${pageContext.request.contextPath}/m_product/productListForm.jsp?id=${sessionId}">STORE</a> > <a href="${pageContext.request.contextPath}/m_product/productListForm.jsp?id=${sessionId}">상품</a> > <a href="${pageContext.request.contextPath}/m_product/product_view.jsp?id=${sessionId}"><c:out value="${row.pname}"/></a></span>
		</div>
        <div class="detail">
        <c:if test="${row.pkind == '글라스' || row.pkind == '플라스틱 텀블러' || row.pkind == '스테인리스 텀블러' || row.pkind == '보온병'}">
            <div id="imgArea" class="inline left" style="width: 45%; height:800px; float: left;">
            <div style="width : 100%; height:100px;"></div>
                <div class="bic">
                    <p class="picture">
                    	<img src="${pageContext.request.contextPath}/resources/img/product/<c:out value='${row.img}'/>" class="zoomimg" alt="Image To Zoom">
                    </p>
                </div>
                <div style="width : 100%; height:100px;"></div>
            </div>
         </c:if>
         
         <c:if test="${row.pkind == '머그' || row.pkind == '커피용품' || row.pkind == '악세서리'}">
            <div id="imgArea" class="inline left" style="width: 45%;float: left;">
            <div style="width : 100%;"></div>
                <div class="bic">
                    <p class="picture">
                    	<img src="${pageContext.request.contextPath}/resources/img/product/<c:out value='${row.img}'/>" class="zoomimg" alt="Image To Zoom">
                    </p>
                </div>
                <div style="width : 100%; height:100px;"></div>
            </div>
         </c:if>
         
            <div id="info" class="inline right">
                <div class="left">
                    <h3><c:out value='${row.pname}'/><span><br><c:out value='${row.pname_eng}'/></span></h3>
                </div>
                <div class="right">
                   		<input type="button" id="reg"  value="나만의 상품으로 등록">                
                </div>
                 
                <hr>
                <br>
                <p style="margin : 5% 0;"><c:out value='${row.brief}'/></p>
                <c:if test="${row.pkind eq '글라스'}">
             	<hr>
                <br>
                <hr>
	                <div class="note">
<br>1) 본 제품은 뜨거운 음료 사용 시 화상의 위험이 있으므로 찬 음료 전용으로 사용하시기 바랍니다.
<br>2) 강한 충격 및 급격한 온도 변화에 깨지기 쉬우므로 사용 시 주의 바랍니다.

<br>3) 전자레인지, 냉동실, 가스레인지, 오븐, 식기세척기 등에 보관 및 사용이 불가합니다.

<br>4) 본 제품은 완전 밀폐가 되지 않으므로 음료를 넣은 채로 가방 등에 휴대할 경우 쏟아질 위험이 있습니다.(뚜껑이 있는 제품의 경우에만 해당)

<br>5) 세척 및 사용 시 강한 자극은 인쇄 부분을 손상시킬 수 있으니 주의 바랍니다.

<br>6) 인쇄 부분은 산성 및 알칼리성 성분에 취약하여 변색의 우려가 있으니 주의 바랍니다.

<br>7) 강한 충격 시에는 제품이 파손될 수 있으며, 사용 중 파손된 제품에 대해서는 교환 또는 환불이 되지 않습니다.(제품 자체의 결함으로 인한 교환 시 동일 상품이 없는 경우 유사한 제품으로 교환해 드립니다.)

<br>8) 본 글라스를 이용하여 얼음이 들어간 음료를 드실 경우에는 얼음에 의한 충격으로 글라스가 파손될 수 있으니 음료를 먼저 부은 다음 얼음을 넣어 주시기 바랍니다.

<br>9) 금속 재질의 머들러 혹은 스푼의 사용은 피해 주시기 바랍니다.

<br>10) 살균, 소독을 목적으로 끓는 물에 삶거나 열탕 시에는 제품 파손 등 안전성의 문제가 발생할 수 있으니 주의하시기 바랍니다.

   <div style="display: none;">
   11) 뚜껑은 고객이 구매하신 제품에 맞게 제작이 되어 있으며, 다른 제품에 사용 시 뚜껑이 맞지 않아 음료가 샐 수 있습니다.(뚜껑이 있는 제품의 경우에만 해당)

<br>12) 탄산 혹은 발효 음료/음식을 담지 마세요. 내압이 상승하여 마개가 닫히지 않거나 강하게 튀어 올라 다칠 위험이 있습니다.(뚜껑이 있는 제품의 경우에만 해당)

<br>13) 교환 또는 환불 시 무료 음료 쿠폰과 영수증을 지참하시기 바랍니다.

<br>14) 스타벅스 커피 코리아 고객 상담실: (02) 1522-3232</div>
     <input type="button" style="width : 100%;" onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '닫기';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '더보기';}"/>
    
	                </div>
                </c:if>
                <c:if test="${row.pkind eq '플라스틱 텀블러'}">
	                <hr>
	                <h4 style="margin : 5% 0;">플라스틱 텀블러 사용시 유의사항</h4>
	                <hr>
	   		           <div class="note">
<br>1) 구입하신 텀블러는 뚜껑이 없는 머그 제품보다 보온, 보냉 효과는 있으나, 완전 밀폐가 되는 보온병이 아니므로 한 시간 이상 보온 보냉이 지속되지 않습니다.
<br>2) 너무 많은 음료를 담지 마세요. 뜨거운 음료가 새어 나와 화상을 입을 수 있습니다.

<br>3) 탄산 혹은 발효 음료/음식을 담지 마세요. 내압이 상승하여 마개가 닫히지 않거나 강하게 튀어 올라 다칠 위험이 있습니다.

<br>4) 뜨거운 음료가 담겨있을 경우, 어린아이의 손에 닿지 않는 곳에 보관하세요.

<br>5) 드시는 음료가 매우 뜨거울 수 있으니 조심하세요. 사용 중 파손된 제품에 대해서는 교환 또는 환불이 되지 않습니다. (제품 자체의 결함으로 인한 교환 시 동일상품이 없는 경우 유사한 제품으로 교환해 드립니다.

<br>6) 음료를 드시기 전에 항상 뚜껑이 잘 잠겨 있는지 확인하세요.

<br>7) 뚜껑을 열고 잠글 때 반드시 텀블러의 중간 부분을 잡으세요.(손잡이가 있는 텀블러의 경우, 손잡이를 잡고 뚜껑을 열거나 잠그지 마세요. 손잡이 부분에 과도한 힘이 가해지면 파손 될 수 있습니다.)

<br>8) 뚜껑에 있는 마개는 텀블러가 넘어졌을 경우 안에 있는 음료가 쏟아지는 것을 막아주는 역할을 합니다. 이는 음료가 새어 나오는 것을 완전히 막아주지 못하므로 음료가 담긴 텀블러를 가방에 넣지 마세요. (가방에 텀블러를 넣으시는 경우 누수현상이 발생하여 내부가 젖을 수 있습니다.)

<br>9) 뜨거운 음료를 담고 리드를 잠그실 때 플립을 열고 잠근 후 플립을 눌러 주셔야 내부 열과 공기로 인한 팽창현상이 생기지 않습니다.

<br>10) 사용하시기 전에 뚜껑 마개를 열고 세제로 깨끗이 닦으세요.

   <div style="display: none;">
   11) 반드시 손 세척 하시기 바랍니다. 건조 시 에는 윗부분이 아래를 향하게 해 주세요.

<br>12) 전자레인지나, 냉동실에 넣지 마세요.

<br>13) 표백제나 염소가 함유된 세제를 사용하지 마세요.

<br>14) 뚜껑에 있는 마개를 통해 음료가 새어나올 수 있으니, 음료를 드시기 전에 항상 뚜껑이 잘 잠겨있는지 확인하세요.

<br>15) 뚜껑은 고객이 구매하신 텀블러에 맞게 제작되었으며 다른 텀블러에 맞지 않을 수 있습니다.

<br>16) 강한 충격(사용 중 떨어뜨림)을 가할 시 파손되거나 찌그러질 수 있습니다.

<br>17) 교환 또는 환불 시 무료음료 쿠폰과 영수증을 꼭 지참하시기 바랍니다.

<br>18) 콜드컵은 "아이스 음료 전용 사용 상품" 입니다. 뜨거운 음료 사용 시 화상의 위험이 있으니 아이스 음료 음료 전용으로 사용하시기 바랍니다.

<br>19) 스타벅스 커피 코리아 고객 상담실 : (02) 1522-3232
    </div>
     <input type="button" style="width : 100%;" onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '닫기';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '더보기';}"/>
	                </div>
                </c:if>
                <c:if test="${row.pkind eq '스테인리스 텀블러'}">
                <hr>
                <h4 style="margin : 5% 0;">스테인리스 텀블러 사용시 유의사항</h4>
	                <div class="note">
<br>1) 구입하신 텀블러는 뚜껑이 없는 머그 제품보다 보온, 보냉 효과는 있으나, 완전 밀폐가 되는 보온병이 아니므로 한 시간 이상 보온 보냉이 지속되지 않습니다.
<br>2) 너무 많은 음료를 담지 마세요. 뜨거운 음료가 새어 나와 화상을 입을 수 있습니다.

<br>3) 탄산 혹은 발효 음료/음식을 담지 마세요. 내압이 상승하여 마개가 닫히지 않거나 강하게 튀어 올라 다칠 위험이 있습니다.

<br>4) 뜨거운 음료가 담겨있을 경우, 어린아이의 손에 닿지 않는 곳에 보관하세요.

<br>5) 드시는 음료가 매우 뜨거울 수 있으니 조심하세요. 사용 중 파손된 제품에 대해서는 교환 또는 환불이 되지 않습니다. (제품 자체의 결함으로 인한 교환 시 동일상품이 없는 경우 유사한 제품으로 교환해 드립니다.
<div style="display: none;">
6) 음료를 드시기 전에 항상 뚜껑이 잘 잠겨 있는지 확인하세요.

<br>7) 뚜껑을 열고 잠글 때 반드시 텀블러의 중간 부분을 잡으세요.(손잡이가 있는 텀블러의 경우, 손잡이를 잡고 뚜껑을 열거나 잠그지 마세요. 손잡이 부분에 과도한 힘이 가해지면 파손 될 수 있습니다.)

<br>8) 뚜껑에 있는 마개는 텀블러가 넘어졌을 경우 안에 있는 음료가 쏟아지는 것을 막아주는 역할을 합니다. 이는 음료가 새어 나오는 것을 완전히 막아주지 못하므로 음료가 담긴 텀블러를 가방에 넣지 마세요. (가방에 텀블러를 넣으시는 경우 누수현상이 발생하여 내부가 젖을 수 있습니다.)

<br>9) 뜨거운 음료를 담고 리드를 잠그실 때 플립을 열고 잠근 후 플립을 눌러 주셔야 내부 열과 공기로 인한 팽창현상이 생기지 않습니다.

<br>10) 사용하시기 전에 뚜껑 마개를 열고 세제로 깨끗이 닦으세요.

<br>11) 반드시 손 세척 하시기 바랍니다. 건조 시 에는 윗부분이 아래를 향하게 해 주세요.

<br>12) 전자레인지나, 냉동실에 넣지 마세요.

<br>13) 표백제나 염소가 함유된 세제를 사용하지 마세요.

<br>14) 뚜껑에 있는 마개를 통해 음료가 새어나올 수 있으니, 음료를 드시기 전에 항상 뚜껑이 잘 잠겨있는지 확인하세요.

<br>15) 뚜껑은 고객이 구매하신 텀블러에 맞게 제작되었으며 다른 텀블러에 맞지 않을 수 있습니다.

<br>16) 강한 충격(사용 중 떨어뜨림)을 가할 시 파손되거나 찌그러질 수 있습니다.

<br>17) 교환 또는 환불 시 무료음료 쿠폰과 영수증을 꼭 지참하시기 바랍니다.

<br>18) 콜드컵은 “아이스 음료 전용 사용 상품” 입니다. 뜨거운 음료 사용 시 화상의 위험이 있으니 아이스 음료 음료 전용으로 사용하시기 바랍니다.

<br>19) 스타벅스 커피 코리아 고객 상담실 : (02) 1522-3232
    </div>
     <input type="button" style="width : 100%;" onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '닫기';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '더보기';}"/>
	                </div>
                </c:if>
                <c:if test="${row.pkind eq '보온병'}">
                	<hr>
                	<h4 style="margin : 5% 0;">보온병 사용시 유의사항</h4>
                	<hr>
	                <div class="note">
<br>1) 어린 아이의 손이 닿는 곳에 두지 마십시오.
<br>2) 뜨거운 음료수를 넣은 경우, 얼굴 등을 가까이 하지 마십시오.

<br>3) 본체를 갑자기 기울이지 마시고 천천히 마셔 주십시오. (화상 등의 원인이 됩니다.)

<br>4) 음료수의 보온/보냉 이외의 용도로 사용하지 마십시오.

<br>5) 스토브나 난로 등의 화기에 가까이 두지 마십시오.

<br>6) 마개 유닛은 2개의 패킹을 올바르게 부착한 후, 확실히 닫아 주십시오.

<br>7) 음료수를 너무 많이 담지 마십시오.

<br>8) 다음과 같은 것은 절대로 넣지 마십시오.
<br>
&nbsp;&nbsp;- 드라이 아이스. 탄산음료
<br>
&nbsp;&nbsp;- 우유, 유제품, 과즙 등 부패하기 쉬운 것
<br>
&nbsp;&nbsp;- 된장국, 수프 등 염분을 포함한 것
<br>
&nbsp;&nbsp;- 찻잎, 과육
<br>
<div style="display: none;">
9) 전자레인지에 넣지 마십시오.

<br>10) 떨어뜨리거나 강한 충격을 주지 마십시오.

<br>11) 커다란 얼음은 무리하게 넣지 말고 작게 부수어 넣어 주십시오.

<br>12) 음료수를 넣은 상태로 오랫동안 방치해 두지 마십시오.

<br>13) 뚜껑을 열어놓은 상태에서 뚜껑을 잡고 흔들지 마십시오.

<br>14) 본체에 음료수를 넣을 때에는 넘어지는 것에 주의해 주십시오.

<br>15) 개조, 분해, 수리는 절대로 하지 마십시오.

<br>16) 손질할 때는 미지근한 물로 희석 시킨 식기용 중성 세제를 사용해 주십시오.

<br>17) 장기간 사용하지 않을 때에는 깨끗이 씻어 때를 제거한 후, 충분히 건조시켜 고온 다습한 곳을 피해 보관해 주십시오.

<br>18) 본체, 마개 유닛은 삶지 마십시오.

<br>19) 식기세척기, 식기 건조기는 사용하지 마십시오.

<br>20) 본체는 물속에 방치하지 마십시오.

<br>21) 시너, 벤젠, 금속 수세미, 연마제, 클렌저, 염소계 표백제를 사용하지 마십시오.

<br>22) 교환 또는 환불 시 무료음료 쿠폰과 영수증을 꼭 지참하시기 바랍니다.

<br>23) 스타벅스 커피 코리아 고객 상담실 : (02) 1522-3232
</div>
<input type="button" style="width : 100%;" onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '닫기';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '더보기';}"/>
	                </div>
                </c:if>
                
                <c:if test="${row.pkind == '글라스' || row.pkind == '플라스틱 텀블러' || row.pkind == '스테인리스 텀블러' || row.pkind == '보온병'}">
	                
		                <div class="price">
		                	<h2><fmt:formatNumber value="${row.pprice }" pattern="#,###"/>원</h2>
		                </div>
		                <div class="sns">
		                    <a href="https://www.facebook.com/starbuckskorea" target="_blank"><img src="../resources/img/loastBean/sns_f.png"></a>
		            	</div>
                </c:if>
                
                <c:if test="${row.pkind == '머그' || row.pkind == '커피용품' || row.pkind == '악세서리'}">
	                <div>
		                <div class="price"  style="height : 300px; "></div>
		                <h2 style="text-align: right;"><fmt:formatNumber value="${row.pprice }" pattern="#,###"/>원</h2>
		                <div class="sns">
			                <a href="https://www.facebook.com/starbuckskorea" target="_blank"><img src="../resources/img/loastBean/sns_f.png"></a>
			            </div>
		            </div>
                </c:if>
            </div>
            <hr style="border:1px solid white;">
            
			      <div class="cart" id="cart">
			    	<form action="${pageContext.request.contextPath}/main/cartProcess.jsp" method="post" name="insert">
    		
		    				<input type="hidden" value="${sessionId }" name="id">
		    				<input type="hidden" value="${row.img }" name="img">
		    				<input type="hidden" value="${row.pname }" name="cname">
		    				<input type="hidden" value="${row.pprice }" name="price">
		    				<input type="hidden" value="product" name="category">
		    				
							<div class="name">
								<h2 style="color : white;">상품 장바구니</h2>
							</div>
							<div class=" down"  style="padding : 5%;">
								<div class="cleft">
									<img src="../resources/img/product/<c:out value="${row.img}"/>"  style="width : 100%;">
								</div>
								<div class="cright">
									<h5><c:out value="${row.pname}"/></h5>
									<h6 style="color : darkgray;"><c:out value="${row.pname_eng}"/></h6>
									
							        <div>
							            <select name="option" class="form-select" aria-label="Default select example">
							                <option value="포장 안함">선택 안함</option>
							                <option value="포장">선물 포장 요청</option>
							            </select>
							        </div>
						        </div>
								<hr>
					
							<input type="button" class="creg"  id="creg" value="장바구니에 등록" onclick="insert.submit()">
						
						<input type="button" class="cancel"  id="cancel" value="취소">
					</div>
				</form>
			</div>
        </div>
    </div>
    <div style="width:100%; height:50px;"></div>
    <div class="d2">
    
    	<div style="width:100%; height:130px;">
    	<hr>
    	</div>
    
    
    	<div>
       		<p style = "line-height: 1.5;"><c:out value='${row.expl}'/></p>
       	</div>
    </div>
</div>
</div>
</c:forEach>
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
<%@ include file="../main/footer.jsp" %>
</body>
</html>