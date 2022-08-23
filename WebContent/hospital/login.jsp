<%@page import="hospital.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./hospital/hospital.css">
        <script src="./hospital/script.js"></script>
        <link rel="stylesheet" href="./hospital/Idlogin.css">
        <title>강남비트병원</title>
    </head>
<%-- 로그인 폼 --%>
    <body>
        <div class="wrap">
            <div class="log">
                <div class="log_wrap">
                    <a href="hospital.do"><img src="./img/igs_logo.png" width="300" height="100"></a>
                    <div class="line">
                        <div class="log_log">
                            <p>ID 로그인</p>
                        </div>
                        <form id="log_1" name="idlogin" method="post" action="loginPro.do" onsubmit="return logincheck()">
                            <input class="log_size" type="text" name="id" maxlength="30" placeholder="아이디" autofocus><br>
                            <input class="log_size" type="password" name="passwd" maxlength="30" placeholder="비밀번호"><br>
                            <input class="log_size2" value="로그인" type="submit"><br>
                            <br>
                        </form>
                        <div class="log_2">
                            <ul>
                                <li><a href="gaip.do">회원가입</a></li>
                                <li><a href="hospital.do">홈페이지</a></li>
                                
                            </ul>
                        </div>
                        <div class="ganggo">
                        <img src="./img/master.png" width:"500" height:"400">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>