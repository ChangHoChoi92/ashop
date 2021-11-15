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
   
    #table{width:100%; height:100%; border-collapse: collapse;}
  	#table > td,th{padding:10px;}
  	#table textarea{padding:3px 6px; width:100%;}
	#table input[type="text"] {height:30px; padding:3px 6px; width: 100%;}
	#table input[type="radio"] {padding:3px 6px;}
	#table input[type="file"] {float: left;}
	#table tr th > label {font-size: 20px; font-weight: bold; float: left;}
	
	#category {border: 1px solid gray; padding:10px 10px;}
   
</style>
</head>
<body>
	<%@ include file="/main/header.jsp" %>
	
	<div id="bg1">
		<div id="bg2">
		
			<h1 style="padding-bottom: 5px;">메뉴 등록 페이지</h1>
			<hr>
		
			<form name="joinform" action="coffeeFoodInsertProcess.jsp" method="post">
				<table id="table">
					<tr>
						<th>
							<label for="name">메뉴 이름</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="name" id="name">
						</td>
					</tr>
					<tr>
						<th>
							<label for="ename">영어이름</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="ename" id="ename">
						</td>
					</tr>
					<tr>
						<th>
							<label for="kcal">칼로리</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="kcal" id="kcal">
						</td>
					</tr>
					<tr>
						<th>
							<label for="sugars">당류</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="sugars" id="sugars">
						</td>
					</tr>
					<tr>
						<th>
							<label for="protein">단백질</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="protein" id="protein">
						</td>
					</tr>
					<tr>
						<th>
							<label for="salt">나트륨</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="salt" id="salt">
						</td>
					</tr>
					<tr>
						<th>
							<label for="saturatedfat">포화지방</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="saturatedfat" id="saturatedfat">
						</td>
					</tr>
					<tr>
						<th>
							<label for="caffeine">카페인</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="caffeine" id="caffeine">
						</td>
					</tr>
					<tr>
						<th>
							<label for="info">설명</label>
						</th>
					</tr>
					<tr>
						<td><textarea name="info" id="info" rows=15;></textarea></td>
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
							<input type="text" name="size" id="size">
						</td>
					</tr>
					<tr>
						<th>
							<label for="allergy">알러지 유발 음식</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="allergy" id="allergy">
						</td>
					</tr>
					<tr>
						<th>
							<label for="price">가격</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="price" id="price">
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
							<input type="radio" name="category" value="cold_brew" id="category1"/>콜드 브루
							<input type="radio" name="category" value="espresso" id="category2"/>에스프레소
							<input type="radio" name="category" value="frappuccino" id="category3"/>프라푸치노
							<input type="radio" name="category" value="blended" id="category4"/>블렌디드
							
							<input type="radio" name="category" value="tea" id="category5"/>티(티바나)
							<input type="radio" name="category" value="signatue" id="category6"/>기타 제조 음료
							<input type="radio" name="category" value="bottle" id="category7"/>스타벅스 주스(병음료)
							<p style="font-weight: bold; font-size: 16px; color: #007bff;">푸드</p>
							<input type="radio" name="category" value="bread" id="category7"/>브레드
							<input type="radio" name="category" value="cake" id="category8"/>케이크
							<input type="radio" name="category" value="salad" id="category9"/>샌드위치 & 샐러드
							<input type="radio" name="category" value="soup" id="category10"/>따뜻한 푸드
							
							<input type="radio" name="category" value="fruit" id="category11"/>과일 & 요거트
							<input type="radio" name="category" value="snack" id="category12"/>스낵 & 미니 디저트
							<input type="radio" name="category" value="icecream" id="category13"/>아이스크림
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<a href="javascript:joinform.submit()">등록</a>&nbsp;&nbsp;
							<a href="javascript:joinform.reset()">다시작성</a>
						</th>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
	
	
	
	<%@ include file="/main/footer.jsp" %>
</body>
</html>