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
		
			<form name="joinform" action="beanInsertProcess.jsp" method="post">
				<table id="table">
					<tr>
						<th>
							<label for="bcode">코드</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="bcode" id="bcode">
						</td>
					</tr>
					<tr>
						<th>
							<label for="bkind">원두 로스팅 종류</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="bkind" id="bkind">
						</td>
					</tr>
					<!-- <tr>
						<td>
							<input type="radio" name="bkind" value="blondLoast" id="bkind1"/>블론드 로스트
							<input type="radio" name="bkind" value="mediunLoast" id="bkind2"/>미디엄 로스트
							<input type="radio" name="bkind" value="darkLoast" id="bkind3"/>다크로스트
							<input type="radio" name="bkind" value="flavor" id="bkind4"/>플레이버
							<input type="radio" name="bkind" value="reserve" id="bkind5"/>스타벅스 리저브™
							
							<p style="font-weight: bold; font-size: 16px; color: #007bff;">상품</p>
							<input type="radio" name="category" value="mug" id="category7"/>머그
							<input type="radio" name="category" value="glass" id="category8"/>글라스
							<input type="radio" name="category" value="plastic" id="category9"/>플라스틱 텀블러
							<input type="radio" name="category" value="stainless" id="category10"/>스테인리스 텀블러
							
							<input type="radio" name="category" value="warmBottle" id="category11"/>보온병
							<input type="radio" name="category" value="accessory" id="category12"/>악세서리
							<input type="radio" name="category" value="" id="coffeeTool"/>커피용품
						</td> -->
					</tr>
					
					<tr>
						<th>
							<label for="bname">원두 이름</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="bname" id="bname">
						</td>
					</tr>
					<tr>
						<th>
							<label for="bname_eng">원두 영어 이름</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="bname_eng" id="bname_eng">
						</td>
					</tr>
					<tr>
						<th>
							<label for="img">이미지&nbsp;&nbsp;&nbsp;</label>
							<input type="file" name="img" id="img">
						</th>
					</tr>
					<tr>
						<th>
							<label for="brief">원두 소개</label>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="brief" id="brief" rows=5;></textarea>
						</td>
					</tr>
					<tr>
						<th>
							<label for="expl">원두 상세 설명</label>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="expl" id="expl" rows=15;></textarea>
						</td>
					</tr>
				
					
					<tr>
						<th>
							<label for="bprice">가격</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="bprice" id="bprice">
						</td>
					</tr>
					<tr>
						<th>
							<label for="dStory">디자인 스토리</label>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="dStory" id="dStory" rows=15;></textarea>
						</td>
					</tr>
					<tr>
						<th>
							<label for="ctNote">커피 테이스팅 노트</label>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="ctNote" id="ctNote" rows=15;></textarea>
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