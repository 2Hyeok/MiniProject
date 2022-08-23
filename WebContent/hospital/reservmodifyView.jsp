<%@page import="hospital.LogonDataBean"%>
<%@page import="hospital.LogonDBBean"%>
<%@page import="hospital.DoctorDataBean"%>
<%@page import="hospital.DoctorDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./hospital/hospital.css">
    <link rel="stylesheet" href="./hospital/rere.css">
		<script src="https://kit.fontawesome.com/d0bb6518aa.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCvdz5EmNzdYjdD3LKTVPXlPicbkLYPwSE"></script>
<script type="text/javascript" src="./hospital/script.js"></script>
<%@ include file = "setting.jsp" %>


<title>강남비트병원</title>
</head>
<c:if test="${sessionScope.memId ne null}">
<body id="top">
	<div class="wrap">
		<div class="head1">
			<div class="login">
               <li class="login2"><a href="logout.do">로그아웃</a></li>&nbsp;&nbsp;
               <li class="login2"><span>${sessionScope.memId}</span>${msg_welcome}&nbsp;&nbsp;&nbsp;&nbsp;
               </li>
			</div>
			<div class="head">
				<div class="logo">
					<a href="hospital.do"><img src="./img/igs_logo.png"
						width="100" height="70"></a>
					<h1>
						<a href="hospital.do">이곳은병원</a>
					</h1>
				</div>
				<div class="menu-bar">
					<ul>
						<li class="menu_bar_li"><a href="notice.do">공지사항</a></li>
						<li class="menu_bar_li"><a href="hospitalintroduce.do">소개</a></li>
						<li class="menu_bar_li"><a href="reserv.do">예약</a></li>
						<li class="menu_bar_li"><a href="board.do">게시판</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- -->
	<input class="goupbtn" type="button" value="Top" onclick="clickme()">
	<form action="reservmodifyPro.do">
	<input type="hidden" name="re_num" value="${re_num}">
	<input type="hidden" name="user_id" value="${memId}">
    <div class="body">
        <div class="rebox">
            <div class="yeyacform">
                <ol class="user_yeyac">
                    <li id="step0_user_yeyac_li" id="li_d">
                        <p class="yeyac_step0">
                            <span>Patient</span><br>
                            <strong>환자정보</strong>
                        </p>
                        <div class="step0_intro">
                            <div>    
                                <div>
                                    <h3>
                                    <div style="font-size:20px;">
	                                    <div><span>아이디 : </span>${memId}</div>
	                                    <div><span>이름 : </span>${rto.user_name}</div>
                                    </div>
                                    </h3>
                                </div>   
                            </div>
                        </div>                  
                    </li>
                    <li class="user_yeyac_li" id="li_d">
                        <p class="yeyac_step1">
                            <span>STEP1</span><br>
                            <strong>진료과 및 의료진 선택</strong>
                        </p>
                        <div class="step1_intro">
                            <div style="font-size:30px;">
                            	<div style="margin-top : 150px;">
	                            	<div>
	                            		<input type="hidden" name="dr_id" value="${rto.dr_id}">
	                            		<c:if test="${rto.dr_id eq 'doctor'}">
	                            			<div>
	                            				<img class="doctor_img_size" src="./img/kimlogo.png">
	                            			</div>
	                            		</c:if>
	                            		<c:if test="${rto.dr_id eq 'doctor1'}">
	                            			<div>
	                            				<img class="doctor_img_size" src="./img/hamlogo.png">
	                            			</div>
	                            		</c:if>
	                            	</div>
	                            	<div style="margin-top : 50px;"><p>[진료의]</p></div>
	                                <div>${rto.getDr_name()}</div>
	                                <br>
	                                <div><p>[진료과목]</p></div>
	                                <div>${rto.getDr_major()}</div>
                                </div>
                            </div>
                        </div>                  
                    </li>
                    <li id="li_d">
                        <p class="yeyac_step2">
                            <span class="step_stepfont">STEP2</span>
                            <br>
                            <strong>날짜 선택</strong>
                        </p>
                        <div class="dateselect">
                           <p>예약하실 날짜를 선택해주세요</p>
                           <p>(아래 선택창에 달력그림 클릭)</p>
                           <span></span><span class="dateselect_point">↓</span>
                           <br>
                        <label for="appt-time">
                        <input type="date" name="re_date" id="Date" value="${rto.re_date}">
                        <script type="text/javascript">
                           var now_utc = Date.now() // 자금 날짜를 밀리초로
                           // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 변환
                           var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
                           // new Date(now_utc-timeOff).toISOString()은 '2022-05-11 T18:09:38.1342'를 반환
                           // timeoff 로 이곳기준 기준시간을 구함
                           // T를 기준으로 split 하면 -> dkvqnqnsdl '2022-05-11' 이 됨
                           var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
                           // today에 저장하고 max를 주면 날짜 이후가 선택 안되고
                           // min을 주면 이전 날짜 선택 안됨
                           document.getElementById("Date").setAttribute("min", today);
                        </script> 
                              </label>
                        </div>
                    </li>
                    <li id="li_d">
                        <p class="yeyac_step3">
						<span>STEP3</span> <br> <strong>시간선택 및 예약하기</strong></p>
                         <div class="step4_form">
                     <div>
                        <div class="time_size">                        
                           <label for="appt-time">이용 시간 (09:00 to 18:00):<br><br>
                              <div style="font-size:13px"><p>아래 시간을 선택해주세요<br>예약은 30분 단위로 가능합니다 </p></div>
                                        <input class="time" type="time" name="re_time" min="09:00" max="18:00" step="1800" required="required" value="${rto.re_time}">
                                <span></span>
								<div class="appt-check">
                                <br>
                                   <p style="color:blue;">( '✓' : 예약 가능 )</p>
                                   <p style="color:red;">( '✖' : 예약 불가능 )</p>
                                </div>
                                </label>
                                </div>
                                <div>
                                    <p>
                                        <strong class="zinro_sau">진료예약사유</strong>
                                        <span>(30자이내)</span>
                                    </p>
                                    <div class="textarea_mom">
                                        <textarea id="textarea" cols="50" rows="2" display="block"
                                         maxlength="30" name="re_col">${rto.re_col}</textarea>
                                    </div>
                                </div>
                                <div class="button_mom">
                                    <input type="submit" class="button_on" value="예약하기">
                                    <a href="" class="button_reset">다시선택</a>
                                </div>
                                <div class="button_mom">
                                    <a href="reservstatus.do" class="button_on2">전체 예약 현황 확인</a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    </form>
    <div class="footer">
        <div class="footer_wrap">
            <div class="footer_top">
                <ul class="footer_top_ser">
                    <li>환자권리장전</li>
                    <li>개인정보처리방침</li>
                    <li>이용약관</li>
                    <li>이메일주소수집거부</li>
                    <li>고객서비스 현장</li>
                    <li>원격지원</li>
                    <li>비급여진료비</li>
                </ul>
            </div>
            <div class="footer_site">
                <div class="footer_top_site">
					<select name="family_link"
						onchange="if(this.value) location.href=(this.value);">
						<option value="https://www.snubh.org/index.do">분당서울대학병원</option>
						<option value="http://www.snuh.org/intro.do">서울대학교병원</option>
						<option value="https://healthcare.snuh.org/home.do">서울대학교병원 강남센터</option>
						<option value="https://www.cmcseoul.or.kr/page/main">가톨릭대학교 성모병원</option>
						<option value="https://www.brmh.org/main/main.do">서울 보라매병원</option>
					</select>
                </div>
            </div>
            <div class="footer_bottom">
                <address>
                    <p>강남대학교병원운영 서울특별시이곳은병원</p><br>
                    <p>대표자:임두혁</p><br>
                    <p>진료예약 : 1577-0012</p><br>
                    <p>병원안내 : 02-870-2112</p><br>
                </address>
            </div>
        </div>
    </div>
</body>
</c:if>
</html>