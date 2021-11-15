<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/header/logo.png">
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
	<style>
        * {
            margin: 0;
            padding: 0;
        }
        
        #body {
            width: 100%;
            height: 850px;
            background-image: url('${pageContext.request.contextPath}/resources/img/login/login_bg.jpg');
            display: flex;
        }
        
        #body #login_area {
            width: 70%;
            height: 500px;
            margin: auto;
            padding-top: 5%;
        }
        
        #body #login_area #login_title {
            text-align: center;
            font-size: 30px;
            color: white;
            margin-bottom: 30px;
        }
        
        #body #login_area fieldset {
            height: 450px;
            width: 50%;
            background-color: white;
            margin: auto;
        }
        
        #body #login_area fieldset #form_title {
            font-size: 20px;
            text-align: center;
            height: 50px;
            margin-top: 3%;
        }
        
        #body #login_area fieldset #login_input input {
            width: 90%;
            height: 40px;
            display: flex;
            position: relative;
            top: 15px;
            left: 30px;
        }
        
        #body #login_area fieldset #login_save {
            font-size: 20px;
            position: relative;
            top: 20px;
            left: 30px;
        }
        
        #body #login_area fieldset #login_bt {
            padding-top: 15px;
            display: block;
            width: 90%;
            height: 60px;
            text-align: center;
            text-decoration-line: none;
            color: white;
            font-weight: bold;
            font-size: 25px;
            background-color: darkgreen;
            position: relative;
            top: 13px;
            left: 30px;
            
        }
        #body #login_area fieldset #login_bt:hover {
            text-decoration-line: underline;
        }
        #body #login_area fieldset #login_bt span {
            vertical-align: middle;
        }
        #body #login_area fieldset #login_info {
            color: green;
            position: relative;
            top: 45px;
            left: 30px;
            font-size: 10px;
        }
        #body #login_area fieldset #login_a {
            margin: auto;
            width: 90%;
            text-align: center;
            position: relative;
            top: 60px;
            display: flex;
            justify-content: flex-start;
            font-size: 25px;
        }
        #body #login_area fieldset #login_a a {
            text-decoration-line: none;
            color: #787878;

        }
        #body #login_area fieldset #login_a a:hover {
            text-decoration-line: underline;
        }
        
        #body #login_area fieldset #login_a1 {
            width: 30%;
        }
        #body #login_area fieldset #login_a2 {
            width: 33%;
        }
        #body #login_area fieldset #login_a3 {
            width: 33%;
        }
    </style>
</head>
<body>
	<%-- 헤더 호출 --%>
	<%@ include file="/dbconn.jsp"%>
    <%@ include file="../main/header.jsp" %>
	
	<%-- 아이디 저장 쿠키 생성 --%>
	<%
		//쿠키를 전부 가져오기
		Cookie [] cookies = request.getCookies();
	
		//아이디와 체크박스에 출력할 문자열 변수
		String id = "";
		String check = "";
		//쿠기가 1개라도 있다면
		if(cookies != null) {
			//쿠키를 순회하면서 쿠키의 이름이 id인 것을 찾습니다.
			for(Cookie cookie : cookies) {
				//쿠키의 이름이 id라면 그 때 값을 id변수에 저장
				//check에 체크박스 체크 여부를 저장
				if(cookie.getName().equals("id")) {
					id = cookie.getValue();
					check = "checked='checked'";
					break;
				}
			}
		}
	%>

    <div id="body">
        <div id="login_area">
            <p id="login_title"><strong>로그인</strong></p>
            <form name="loginform" action="loginProcess.jsp" method="post">
                <fieldset>
                    <div id="form_title"><span style="color: darkgreen;">Welcome!</span> 스타벅스커피 코리아에 오신 것을 환영합니다.</div>
                    <hr>
                    <div id="login_input">
                        <input type="text" name="id" id="id" value='<%=id %>' placeholder="아이디를 입력해 주세요.">
                        <br>
                        <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해 주세요.">
                    </div>
                    <div id="login_save">
                        <input type="checkbox" name="login_id_save" id="login_id_save" value="login_id_save" <%=check %>>
                        <label for="login_id_save">아이디 저장</label>
                    </div>
                    <br>
                    <a id="login_bt" href="javascript:loginform.submit()"><span>로그인</span></a>
                    <div id="login_info">
                        * 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 정기적인 비밀번호 변경을 해주시길 바랍니다.
                        <br><br>
                        * 스타벅스 커피 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상, Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.
                    </div>
                    <div id="login_a">
                        <a id="login_a1" href="joinCheck.jsp">회원가입</a>
                        <a id="login_a2" href="idSearch.jsp">아이디 찾기</a>
                        <a id="login_a3" href="pwSearch.jsp">비밀번호 찾기</a>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    
    
    <%-- 푸터 호출 --%>
    <%@ include file="../main/footer.jsp" %>
</body>
</html>