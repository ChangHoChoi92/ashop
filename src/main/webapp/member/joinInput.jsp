<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Starbucks Coffee Korea</title>
<style>
    .form-group {
        border: 1px solid gray;
        padding: 3%;
        margin: 0 auto;
    }
    .title{
        font-size : 24px;
        font-weight : bold;
    }
    span{
        color : green;
   }
</style>
<title>Insert title here</title>

<script>
	function loginCheck(){
		//아이디 입력여부 검사
		if(document.joininput.id.value == ""){
			alert("아이디를 입력해주세요.");
			document.joininput.id.focus();
			return false
		}
		//아이디 유효성 검사(영문소문자, 숫자만 허용)
		for (var i = 0; i < document.joininput.id.value.length; i++) {
	        ch = document.joininput.id.value.charAt(i)
	        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
	            alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
	            document.joininput.id.focus();
	            return false;
	        }
	    }
		//아이디 길이 검사 (4~12자)
		if (document.joininput.id.value.length<4 || document.joininput.id.value.length>12) {
	        alert("아이디를 4~12자까지 입력해주세요.")
	        document.joininput.id.focus();
	        return false;
	    }
		//비밀번호 입력 여부 검사
		if(document.joininput.pw.value == ""){
			alert("비밀번호를 입력해주세요.");
			document.joininput.pw.focus();
			return false
		}
		//비밀번호 확인 입력 여부 검사
		if(document.joininput.pwC.value == ""){
			alert("비밀번호 확인란에 입력해주세요.");
			document.joininput.pwC.focus();
			return false
		}
		//비밀번호 확인 일치여부 검사
		if (document.joininput.pw.value != document.joininput.pwC.value) {
	        alert("비밀번호가 일치하지 않습니다.")
	        document.joininput.pw.value = ""
	        document.joininput.pwC.focus();
	        return false;
	    }
		//이름 입력 여부 검사
		if(document.joininput.name.value == ""){
			alert("이름을 입력해주세요.");
			document.joininput.name.focus();
			return false
		}
		//성별 선택 여부 검사
		if($(':radio[name="gender"]:checked').length < 1){
		    alert('성별을 선택해주세요.');
		    return false
		}
		//생년월일 입력 여부 검사
		if(document.joininput.birthday.value == ""){
			alert("생연월일을 입력해주세요.");
			document.joininput.birthday.focus();
			return false
		}
		//휴대폰번호 입력 여부 검사
		if(document.joininput.phone.value == ""){
			alert("휴대폰 번호를 입력해주세요.");
			document.joininput.phone.focus();
			return false
		}
		//이메일 입력 여부 검사
		if(document.joininput.email.value == ""){
			alert("이메일을 입력해주세요.");
			document.joininput.email.focus();
			return false
		}
		//우편번호 입력 여부 검사
		if(document.joininput.postCd.value == ""){
			alert("이메일을 입력해주세요.");
			document.joininput.postCd.focus();
			return false
		}
		//상세주소 입력 여부 검사
		if(document.joininput.addr.value == ""){
			alert("이메일을 입력해주세요.");
			document.joininput.addr.focus();
			return false
		}
	}
	
	
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


</head>
<body>
<%@ include file="../main/header.jsp" %>
<p style="height : 50%;">&nbsp;</p>
<div class="container" style="width: 40%; margin: auto">
        <p style="height : 50%;">&nbsp;</p>
        <div style="font-size: 32px; text-align: center; height : 10px; margin:8%;">
        	회원가입
        </div>
        <div class="form-group">
        	<div style="text-align: center; margin :0 auto;">
	            <span><img src="../resources/img/icon_find_sally.png" alt="셀리"></span>
	            <p style="text-align: center">회원정보를 입력해주세요</p>
            </div>
        </div>
        <form name = "joininput" action="joinProcess.jsp" method="post">
            <div class="form-group" >
                	<input type="text" class="form-control" id="id" name="id" placeholder="아이디"  >
            </div>
            <div class="form-group" >
             	   <input type="password" class="form-control"  id="pw" name="pw" placeholder="비밀번호">
            </div>
            <div class="form-group" >
                <input type="password" class="form-control" id="pwC" name="pwC" placeholder="비밀번호 확인" >
            </div>
            
            <p>&nbsp;</p>
            
            <div class="form-group" border="1">
	            <label class="title"  for="name">이름<span>(필수)</span></label>
	            <div>
	            	<input type="text" id="name" name="name"  class="form-control"placeholder="이름"  style="width: 70%;">
				</div>
				<div class="btn-group btn-group-toggle" data-toggle="buttons" style="width: 20%;vertical-item: center; ">
						<label class="btn btn-secondary">
							<input type="radio" name="gender" id="male" value="남"> 남
						</label>
						<label class="btn btn-secondary">
							<input type="radio" name="gender" id="female" value = "여"> 여
						</label>
				</div>

            </div>
            <div class="form-group">
				<label for="birthday" class="title">생년월일<span>(필수)</span></label>
					<input id="birthday" name="birthday" type="date" class="form-control" placeholder="생년월일8자리" >
					
                <p>회원 가입 완료후 스타벅스 카드를 등록하시면 생일 무료음료 쿠폰이 발행됩니다.</p>
			</div>
           <div class="form-group">
				<label for="phone" class="title">휴대폰<span>(필수)</span></label>
					<input class="form-control" name="phone" type="text" placeholder="0000-0000-0000" >
			</div>
            <div class="form-group" >
                <div class="row">
                    <div class="col">
                    <label class="title">이메일<span>(필수)</span></label>
                        <input type="text" name="email" id="email" class="form-control" placeholder="E-메일을 입력하세요">
                    </div>
                </div>
            </div>
			
            <p>&nbsp;</p>
            
            <div class="form-group">
				<label class="title">우편번호<span>(필수)</span></label>
					<input id="postCd" name="postCd" type="text" 
					       class="form-control" />
					<input type="button" value="우편번호 찾기" onclick="Postcode()"/>       
				
			</div>
			<div class="form-group">
				<label class="title">주소<span>(필수)</span></label>					
				<div class="col-sm-5">
					<input id="addr" name="addr" type="text" readonly="readonly" class="form-control"  />
				</div>				
			</div>
			
			<div class="form-group">
				<label class="title">상세주소<span>(필수)</span></label>					
				<div class="col-sm-5">
					<input id="addr2" name="addr2"  type="text"  class="form-control"/>
				</div>				
			</div>
			
			<p>&nbsp;</p>
			
            <div class="form-group">
                <img src="../resources/img/nicknameSet.jpg" alt="셀리" style="margin: 0 auto; width: 100%">
                <label class="title">닉네임<span>(선택)</span></label>
                <fieldset>
                    <div>
                        선택적 개인정보 수집동의 및 이용약관
                        <input type="checkbox" id="agree">
                    </div>
                    <div>
                        <textarea style="width: 100%" rows="10">
본인은 (주)스타벅스커피코리아(이하 “회사”라 합니다)가 제공하는 콜 마이 네임 서비스(이하 “서비스”라 합니다)를 이용하기 위해, 다음과 같이 “회사”가 본인의 개인정보를 수집·이용하는 것에 동의합니다.

※ 귀하께서는 개인정보 수집·이용에 대한 동의를 거부하실 수 있으나, 동의를 거부하실 경우 서비스 이용을 하실 수 없습니다.

1. 개인정보 항목·목적·보유기간
구분	내역
항목	닉네임
목적	콜 마이 네임 서비스
보유 및
이용기간	회원 탈퇴 시 까지 또는 관계법령에 의한 별도 보존기간 (2. 관계법령에 의한 개인정보 보존기간 참고)
2. 관계법령에 의한 개인정보 보존기간
- 서비스이용기록, 접속로그, 접속IP정보 (통신비밀보호법 : 3개월)
- 표시/광고에 관한 기록 (전자상거래법 : 6개월)
- 계약 또는 청약철회 등에 관한 기록 (전자상거래법 : 5년)
- 대금결제 및 재화 등의 공급에 관한 기록 (전자상거래법 : 5년)
- 소비자의 불만 또는 분쟁처리에 관한 기록 (전자상거래법 : 3년)
3. 서비스 이용과정 및 사업 처리과정에서 수집될 수 있는 개인정보의 범위
서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록

* 쿠키의 경우 구체적인 운영 내역과 설정 거부 방법 등은 본 홈페이지 개인정보처리방침 “개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항”에서 확인하실 수 있습니다.
                        </textarea>
                    </div>
                    
                    <input type="text" class="form-control" id="nickname" name="nickname" placeholder="한글 6자리 내로 입력하세요." maxlength="6">
                	
                </fieldset>
            </div>
            <div>
            	<p style="text-align: center">*선택항목은 입력하지 않거나 동의하지 않아도 회원가입이 가능합니다.</p>
            	<div style="padding : 10px; text-align: center;">
            		<input type="submit" class="btn btn-success"  style="width : 90%;" value="가입하기" onclick="return loginCheck()">
            	</div>
            </div>
        </form>
    </div>
    <%@ include file="../main/footer.jsp" %>
</body>
</html>