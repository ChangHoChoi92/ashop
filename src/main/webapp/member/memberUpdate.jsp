<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<script>
	$(document).ready(function () {
	   $(function () {
		   		/* 전화번호를 입력시 하이폰 추가 */
	            $('.phone').keydown(function (event) {
	             var key = event.charCode || event.keyCode || 0;
	             $text = $(this); 
	             if (key !== 8 && key !== 9) {
	                 if ($text.val().length === 3) {
	                     $text.val($text.val() + '-');
	                 }
	                 if ($text.val().length === 8) {
	                     $text.val($text.val() + '-');
	                 }
	             }
	
	             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
				 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
				 // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
	         })
	   });
	});
</script>

<script>
	$(function(){
		$("#birthday").datepicker({
			changeMonth:true,
			changeYear:true,
			dateFormat:"yy-mm-dd",
			prevText:"이전 달",
			nextText:"다음 달",
			monthNames:['1월','2월','3월','4월',
						'5월','6월','7월','8월',
						'9월','10월','11월','12월'
				       ],
			monthNamesShort:['1월','2월','3월','4월',
							'5월','6월','7월','8월',
							'9월','10월','11월','12월'
					       ],
			dayNames:['일','월','화','수','목','금','토'],
			dayNamesShort:['일','월','화','수','목','금','토'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			showMonthAfterYear:true,
			yearSuffix:'년'
		});
	});
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function Postcode() {
	     new daum.Postcode({
	         oncomplete: function(data) {
	         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	       var addr = ''; // 주소 변수
	       var extraAddr = ''; // 참고항목 변수

	      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	       if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	          addr = data.roadAddress;
	      } else { // 사용자가 지번 주소를 선택했을 경우(J)
	          addr = data.jibunAddress;
	      }

	     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	      if(data.userSelectedType === 'R'){
	     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	         extraAddr += data.bname;
	     }
	    // 건물명이 있고, 공동주택일 경우 추가한다.
	    if(data.buildingName !== '' && data.apartment === 'Y'){
	         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	    }
	   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	   if(extraAddr !== ''){
	        extraAddr = ' (' + extraAddr + ')';
	   }
	  // 조합된 참고항목을 해당 필드에 넣는다. 						상세주소  !!!!바꿀 부분!!!!
	  document.getElementById("addr2").value = extraAddr;
	                
	 } else {
	      document.getElementById("addr2").value = '';
	  }

	     // 우편번호와 주소 정보를 해당 필드에 넣는다.
	     //										!!!!바꿀 부분!!!!!
	     document.getElementById('postCd').value = data.zonecode;
	                
	      //									!!!!바꿀 부분!!!!!	
	      document.getElementById("addr").value = addr;
	      // 커서를 상세주소 필드로 이동한다.
	      document.getElementById("postCd").focus();
	  }
	}).open();
	    }
</script>
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
	
	
	table {
		width:100%; 
		height:100%; 
		border-collapse: collapse;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
	}
	
	table a {
		text-decoration-line: none;
		color: black;
		s
	}
	
	table a:hover {
		text-decoration-line: underline;
	}
	table >td,th {
		padding:10px;
	}
/* 	table input {
		font-size: 20px;
	} */
	
	table input[type=text] {
		height:30px; 
		padding:3px 6px; 
		width: 100%;
	}
	
	table input[type=password] {
		height:30px; 
		padding:3px 6px; 
		width: 100%;
	}
	table input[type="radio"] {
		padding:3px 6px;
	}
	table tr th > label {
		font-size: 20px; font-weight: bold; float: left;
	}
	/* .td_title {
		font-weight: bold;
		font-size: x-large;
	} */
</style>
</head>
<body>
	<%@ include file="../dbconn.jsp" %>
	<%@ include file="../main/header.jsp" %>
	
	<%-- 수정하려는 회원정보 가져오기 --%>
	<sql:query var="rs" dataSource="${conn}">
		select * from member where id = ?
		<sql:param value="${param.id}"/>
	</sql:query>
	
	<div id="body">
		<div id="content">
			<%-- 가져온 회원정보를 화면에 출력 --%>
			<%-- items : select문을 수행한 후 가져온 데이터를 사지고 있는 배열구조 --%>
			<%-- var에 지정한 row 변수에 리턴된 행을 대입 --%>
			<c:forEach var="row" items="${rs.rows}">
			<div id = "bg1">
			<div id = "bg2">
			<h1 style = "padding-bottom:5px;">회원 수정 페이지</h1>
				<form name="updateForm" action="memberUpdateProcess.jsp" method="post">
					<table >
						
						<tr>
							<th>
								<label for="id">아이디</label>
							</th>
						</tr>
						<tr>
							<td>
								<input type="text" name="id" id="id" value="<c:out value='${row.id}'/>" readonly/>
							</td>
						</tr>
						<tr>
							<th>
								<label for="pw">비밀번호</label>
							</th>
						</tr>
						<tr>
							<td>
								<input type="password" name="pw" id="pw" value="<c:out value='${row.password}'/>"/>
							</td>
						</tr>
						<tr>
							<th>
								<label for="name">이름</label>
							</th>
						</tr>
						<tr>
							<td>
								<input type="text" name="name" id="name" value="<c:out value='${row.name}'/>"/>
							</td>
						</tr>
						
						<tr>
							<th>
								<label for="gender">성별</label>
							</th>
						</tr>
						<tr>
							<td>
								<input type="radio" name="gender" id="male" value="남" 
								<c:if test="${row.gender == '남'}">
									checked
								</c:if>/>남자
								<input type="radio" name="gender" id="female" value="여" 
								<c:if test="${row.gender == '여'}">
									checked
								</c:if>/>여자
							</td>
						</tr>
						
						<tr>
							<th>
								<label for="birthday">생년월일</label>
							</th>
						</tr>
						<tr>
							<td>
								<input type="date" name="birthday" id="birthday" value="<c:out value='${row.birthday}'/>"/>
							</td>
						</tr>
						
						
						<tr>
							<th>
								<label for="phone">휴대폰 번호</label>
							</th>
						</tr>
						<tr>
							<td>
								<input name="phone" type="text" value="<c:out value='${row.phone}'/>">
							</td>
						</tr>
						
						<tr>
							<th>
								<label for="email">이메일</label>
							</th>
						</tr>
						<tr>
							<td>
								<input type="text" name="email" id="email" value="<c:out value='${row.email}'/>" >
							</td>
						</tr>
						<tr>
							<th>
								<label for="postCdstyle="width:100px;" >우편번호</label>
							</th>	
						</tr>
						<tr>	
							<td>	
								<input type="button" value="우편번호 찾기" onclick="Postcode()" style="margin-bottom:10px;margind-left:0;"/>
							</td>
						</tr>
						
						<tr>
							<td>
								<input id="postCd" name="postCd" type="text" value="<c:out value='${row.postCd} ' />" style="width : 70%"/>
								
								
							</td>
						</tr>
						<tr>
							<th>
								<label for="addr">주소</label>
							</th>
						</tr>
						<tr>
							<td>
								<input id="addr" name="addr" type="text" readonly="readonly"  value="<c:out value='${row.addr}'/>"/>
							</td>
						</tr>
						<tr>
							<th>
								<label for="addr2">상세주소</label>
							</th>
						</tr>
						<tr>
							<td>
								<input id="addr2" name="addr2"  type="text" value="<c:out value='${row.addr2}'/>">
							</td>
						</tr>
						<tr>
							<th>
								<label for="nickname">닉네임</label>
							</th>
						</tr>
						<tr>
							<td>
								<input type="text" name="nickname" id="nickname" value="<c:out value='${row.nickname}'/>"/>
							</td>
						</tr>
						<tr>
							<td  >
								<a href="javascript:updateForm.submit()">수정</a>&nbsp;&nbsp;&nbsp;
								<a href="../main/main.jsp">메뉴로 가기</a>
								<%
									//${sessionScope.sessionId} ?
									//session.setAttribute() 메서드로 생성한 sessionId 값이 admin이면 회원리스트 a태그를 보여준다.
									if(session.getAttribute("sessionId").equals("manager")) {
								%>
										&nbsp;&nbsp;&nbsp;<a href="memberList.jsp">회원리스트</a>
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
		</div>
	</div>
	
	
	
	
	
	
	<%@ include file="../main/footer.jsp" %>
</body>
</html>