<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="./hospital/script.js"></script>
    <link rel="stylesheet" href="./hospital/gaip.css">
    <title>강남비트병원</title>
</head>

<%-- 회원가입시 회원가입 정보를 입력해주는 폼 --%>
<body>
    <div class="gaip">
        <div class="gaip2">
            <div class="logo_click">
                <a href="hospital.do"><img src="./img/logo2.png" width="300" height="130"></a>
                
            </div>
            <form class="gaipform" name="gaipform" action="gaipPro.do" onsubmit="return gaipcheck()">
                <input type="hidden" name="usercheck" value="0">
                <div>
                    <div>
                        <fieldset> 
                            <div class="buttonconf">
                                <p>아이디<em style="color:red;">*</em></p>
                                <input class="form_3"  type="text" name="user_id" maxlength="30" autofocus>
                                <input class="button" type="button" value="중복확인" onclick="confirm()"> 
                            </div>
                            <div>
                                <p>비밀번호<em style="color:red;">*</em></p>
                                <input class="form_3" type="password" name="user_passwd" maxlength="30">
                            </div>
                            <div>
                            	<p>비밀번호 재입력<em style="color:red;">*</em></p>
                                <input class="form_3" type="password" name="user_repasswd" maxlength="30">
                            </div>
                            <div>
                                <p>이름<em style="color:red;">*</em></p>
                                <input class="form_3" type="text" name="user_name" maxlength="30">
                            </div>
                             <div class="form_34">
                                <p>휴대폰 번호<em style="color:red;">*</em></p>
                                <div class="form_45">
                                    <select class="form_4"  name="user_tel1" onkeyup="nexttel1()">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                    </select>
                                    <input class="form_5" type="text" name="user_tel2" maxlength="4" onkeyup="nexttel2()"
                                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                    <input class="form_5" type="text" name="user_tel3" maxlength="4" onkeyup="nexttel3()"
                                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                </div>
                           		<div class="sax">
                                <p>성별<em style="color:red;">*</em></p>
                                <div>
                                    <select class="sax2" name="user_gender">
                                        <option value="">성별</option>
                                        <option value="남">남</option>
                                        <option value="여">여</option>
                                    </select>
                                </div>   
                            </div>
                                <div>
                                	<p>기저질환</p>
                                	<input class="form_3" type="text" name="user_dis" maxlength="30">
                            	</div>
                            	<div>
                                	<p>보호자 이름</p>
                                	<input class="form_3" type="text" name="user_p_name" maxlength="30">
                            	</div>
                            	<div>
                                	<p>보호자 전화번호</p>
                                	<div class="form_45">
                                    	<select class="form_4" name="user_p_tel1" onkeyup="pnexttel1()">
                                    	<option value="">선택</option>
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                    	</select>
                                		<input class="form_5" type="text" name="user_p_tel2" maxlength="4" onkeyup="pnexttel2()"
                                		oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                    	<input class="form_5" type="text" name="user_p_tel3" maxlength="4" onkeyup="pnexttel3()"
                                    	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">	
                                    </div>
                            	</div>
                            </div>
                    </div>
                    </fieldset>
                </div>

                <div>
                    <div class="gaga">
                        <ul>
                            <li><input class="inputbutton" type="submit" value="가입"></li>
                            <li><input class="inputbutton" type="button" value="취소" onclick="location='hospital.do'"></li> <!--reset으로 넣어얗하나? -->
                        </ul>
                    </div><br><br><br>
                </div>
            </form>
        </div>
    </div>

</body>

</html>