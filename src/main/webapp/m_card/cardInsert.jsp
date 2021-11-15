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
		
			<form name="joinform" action="cardInsertProcess.jsp" method="post">
				<table id="table">
					<tr>
						<th>
							<label for="cname">카드 이름</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="cname" id="cname">
						</td>
					</tr>
					<tr>
						<th>
							<label for="cname_eng">영어이름</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="cname_eng" id="cname_eng">
						</td>
					</tr>
					<tr>
						<th>
							<label for="img">이미지&nbsp;&nbsp;&nbsp;</label><input type="file" name="img" id="img">
						</th>
					</tr>
					<tr>
						<th>
							<label for="rel">출시 년도</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="rel" id="rel" placeholder="xxxx년 x월">
						</td>
					</tr>
					<tr>
						<th>
							<label for="cprice">가격</label>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" name="cprice" id="cprice">
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