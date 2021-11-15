<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Starbucks Coffee Korea</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
    * {
        margin: 0;
        text-align: center;
        padding: 0;
        font-family: NanumBarumGothic.woff;
    }

    .square {
        border: 1px solid gray;
        width: 570px;
        margin : auto;
        padding : 15px;
        padding-bottom: 30px;
        
    }
    
    .square table {
    	width: 100%;
    }
    
    .square table th {
    	width: 30%;
    }
    
    .square table td {
    	width: 70%
    }
    
    .square table td input[type="text"] {
    	width: 100%;
    	margin: 10px 0;
    }

    span {
        font-weight: bold;
        color: green;
        
    }
    #homepage{
        width: 528px;
        height: 170px;
        text-align: justify;
        text-indent : 0;
    }
    .check{
    	float : left;
        font-size: 24px;
    }
</style>
</head>
<body>
	<%@ include file="../main/header.jsp"%>
	
	<sql:query var="rs" dataSource="${conn}">
		select *
		from member
		where id = ?
		<sql:param value="${param.id}"/>
	</sql:query>
	
	<div>
	 	<div>
	 		<p style="height : 50%;">&nbsp;</p>
	        <div style="font-size: 32px; text-align: center; height : 10px; margin:5%;">
	        	비밀번호 재설정
	        </div>
	        <div style="padding-bottom: 50px;">
	        <form name="agreeform" id="agreeform" action="pwUpdateProcess.jsp" > 
	            <div style="margin: auto; " class="square" >
	                <img src="../resources/img/icon_find_sally.png" alt="셀리" style="width: 300px; height: 280px; align-content: center;">
	                <p style="text-align: center;"><strong>비밀번호 재설정</strong></p>
	            </div>
	            
	                
	            <%--휴대폰, 아이핀 인증 단계 삭제 --%>
	            <div class="square">
	                <h4>비밀번호를 입력하세요</h4>
	           		<div style="text-align : center;">
	           			<input type="hidden" value="${param.id }" name="id">
	           			<p>비밀번호<br><input id="pw1" type="password" name="pw1">
	           			<p>비밀번호 확인<br><input id="pw2" type="password" name="pw2">
	           			<span id="fail" style="display: none; color: red">비밀번호가 일치하지 않습니다.</span>
	           			<br>
	           			
	           			<input type="button" value="확인" onclick="pw()" style="margin-top: 15px;">
	           		</div>
	            </div>
	        </form>
	     </div>
	</div>
	</div>
    
    <%@ include file="../main/footer.jsp" %>


<script>
	function pw() {
		var pw1 = document.getElementById('pw1').value;
		var pw2 = document.getElementById('pw2').value;
		
		if(pw1 != pw2) {
        	$('#fail').css("display", "block");
        	
        	history.reload();
		}else {

			agreeform.submit();
		}
	}
</script>
</body>
</html>