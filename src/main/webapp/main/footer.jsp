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
        
        footer {
            background-color: #2c2a29;
            position: relative;
            bottom: 0;
            width: 100%;
            height: 200px;
            z-index: 100;
        }
        
        footer #footer {
            width: 70%;
            height: 200px;
            margin: auto;
        }
        
        footer #footer #copyright {
            text-align: center;
            color: #999999;
            padding-top: 15px;
            width : 100%;
        }
        
        footer #footer #copyright p {
            padding-top: 10px;
        }
        
        footer #footer #snsLink {
            width: 100%;
            height: 50px;
            text-align: center;
            padding-top: 15px;
        }

        footer #footer #snsLink a img {
            max-width: 30px;
            max-height: 30px;
            display: inline-block;
            padding-left: 10px;
            
        }
    </style>
</head>
<body>
	<footer>
        <div id="footer">
            <%-- COPYRIGHT 영역 --%>
            <div id="copyright">
                <address>사업자등록번호 : 201-81-21515&nbsp; (주)스타벅스커피 코리아 대표이사 : 송 데이비드 호섭&nbsp; TEL : 1522-3232&nbsp; 개인정보 책임자 : 하익성</address>
                <p>&copy; 2021 Starbucks Coffee Company. All Rights Reserved.</p>
            </div>
            
            <%-- 온라인 커뮤니티 영역 --%>
            <div id="snsLink">
                <a href="https://www.facebook.com/starbuckskorea" target="_blank"><img src="${pageContext.request.contextPath}/resources/img/footer/facebook.png" alt="페이스북"></a>
                <a href="https://twitter.com/StarbucksKorea" target="_blank"><img src="${pageContext.request.contextPath}/resources/img/footer/twitter.png" alt="트위터"></a>
                <a href="https://www.youtube.com/user/starbuckskorea" target="_blank"><img src="${pageContext.request.contextPath}/resources/img/footer/youtube.png"  alt="유튜브"></a>
                <a href="https://www.instagram.com/starbuckskorea/" target="_blank"><img src="${pageContext.request.contextPath}/resources/img/footer/instagram.png" alt="인스타그램"></a>
            </div>
        </div>
    </footer>
</body>
</html>