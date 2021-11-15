<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<style>
	#bg1{
      padding-top:120px;
      padding-bottom: 30px;
      height:100%;
    }
   
    #bg2{
      margin:auto;
      width:70%;
    }
   table{
   width:100%; height:100%; border-collapse: collapse;
   border-right:none;

border-left:none;

border-top:none;

border-bottom:none;
   }
	table >td,th {
		padding:10px;
	}
	table textarea{
		padding:3px 6px; width:100%;
	}
	table input[type="text"] {
		height:30px; padding:3px 6px; width: 100%;
	}
	table input[type="radio"] {
		padding:3px 6px;
	}
	table input[type="file"] {
		float: left;
	}
	table tr th > label {
		font-size: 20px; font-weight: bold; float: left;
	}
	
	
	
</style>
</head>
<body>

	<%@ include file="../dbconn.jsp"%>
	
	<%@ include file="../main/header.jsp" %>
	
	<% pageContext.setAttribute("lf", "\n"); %>
	
	<div style="height : 100px;"></div>


	<sql:query var="rs" dataSource="${conn}">
		select * from menu where name = ?
		<sql:param value="${param.name}"/>
	</sql:query>

	<c:forEach var="row" items="${rs.rows}">
	<div id="bg1">
	<div id="bg2">
	<h1 style="padding-bottom:5px;">메뉴 수정 페이지</h1>
		<form name="Update" 
		      action="coffeeFoodUpdateProcess.jsp" method="post">
		      	
	 		<table >
	 			<tr>
						<th>
							<label for="name">메뉴 이름</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="name" id="name" value="<c:out value='${row.name }'/>" readonly>
						</td>
					</tr>
					<tr>
						<th>
							<label for="ename">영어이름</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="ename" id="ename" value="<c:out value='${row.ename }'/>" readonly>
						</td>
					</tr>
					<tr>
						<th>
							<label for="kcal">칼로리</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="kcal" id="kcal" value="<c:out value='${row.kcal }'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="sugars">당류</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="sugars" id="sugars" value="<c:out value='${row.sugars }'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="protein">단백질</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="protein" id="protein" value="<c:out value='${row.protein }'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="salt">나트륨</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="salt" id="salt" value="<c:out value='${row.salt }'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="saturatedfat">포화지방</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="saturatedfat" id="saturatedfat" value="<c:out value='${row.saturatedfat }'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="caffeine">카페인</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="caffeine" id="caffeine" value="<c:out value='${row.caffeine }'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="info">설명</label>
						</th>
					</tr>
					<tr>
						<td><textarea name="info" id="info" rows=15;><c:out value='${row.info }'/></textarea></td>
					</tr>
					<tr>
						<th>
							<label for="img">이미지&nbsp;&nbsp;&nbsp;</label><input type="file" name="img" id="img">
						</th>
					</tr>
					<tr>
						<th>
							<label for="size">사이즈</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="size" id="size" value="<c:out value='${row.size }'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="allergy">알러지 유발 음식</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="allergy" id="allergy" value="<c:out value='${row.allergy }'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="price">가격</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="price" id="price" value="<c:out value='${row.price }'/>">
						</td>
					</tr>
					<tr>
						<th>
							<label for="category">카테고리</label>
						</th>
					</tr>
					<tr>
						<td id="category">
							<p style="font-weight: bold; font-size: 16px; color: #007bff;">음료</p>
							<input type="radio" name="category" value="cold_brew" id="category1" <c:if test="${row.category == 'cold_brew' }">checked</c:if>/>콜드 브루
							<input type="radio" name="category" value="espresso" id="category2" <c:if test="${row.category == 'espresso' }">checked</c:if>/>에스프레소
							<input type="radio" name="category" value="frappuccino" id="category3" <c:if test="${row.category == 'frappuccino' }">checked</c:if>/>프라푸치노
							<input type="radio" name="category" value="blended" id="category4" <c:if test="${row.category == 'blended' }">checked</c:if>/>블렌디드
							
							<input type="radio" name="category" value="tea" id="category5" <c:if test="${row.category == 'tea' }">checked</c:if>/>티(티바나)
							<input type="radio" name="category" value="signatue" id="category6" <c:if test="${row.category == 'signatue' }">checked</c:if>/>기타 제조 음료
							<input type="radio" name="category" value="bottle" id="category7" <c:if test="${row.category == 'bottle' }">checked</c:if>/>스타벅스 주스(병음료)
							<p style="font-weight: bold; font-size: 16px; color: #007bff;">푸드</p>
							<input type="radio" name="category" value="bread" id="category7" <c:if test="${row.category == 'bread' }">checked</c:if>/>브레드
							<input type="radio" name="category" value="cake" id="category8" <c:if test="${row.category == 'cake' }">checked</c:if>/>케이크
							<input type="radio" name="category" value="salad" id="category9" <c:if test="${row.category == 'salad' }">checked</c:if>/>샌드위치 & 샐러드
							<input type="radio" name="category" value="soup" id="category10" <c:if test="${row.category == 'soup' }">checked</c:if>/>따뜻한 푸드
							
							<input type="radio" name="category" value="fruit" id="category11" <c:if test="${row.category == 'fruit' }">checked</c:if>/>과일 & 요거트
							<input type="radio" name="category" value="snack" id="category12" <c:if test="${row.category == 'snack' }">checked</c:if>/>스낵 & 미니 디저트
							<input type="radio" name="category" value="icecream" id="category13" <c:if test="${row.category == 'icecream' }">checked</c:if>/>아이스크림
						</td>
					</tr> 
					
					<tr>
						<td colspan="2">
							<a href="javascript:Update.submit()">
								수정
							</a>&nbsp;&nbsp;&nbsp;
							
							<%
								if(session.getAttribute("sessionId").equals("manager")) {
								
							%>
							<a href="coffeeListForm.jsp">커피 리스트</a>&nbsp;&nbsp;&nbsp;
							<a href="foodListForm.jsp">푸드 리스트</a>
							<%
								}
							%>
						</td>
	 				</tr>
	 	 		</table>
	 	</form>
	 	</div>
	 	</div>
	</c:forEach>
	
	<%@include file="../main/footer.jsp" %>
</body>
</html>