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
<link rel="stylesheet" href="./hospital/yeyac_huackin.css">
<link rel="stylesheet" href="./hospital/reserv.css">
<script src="https://kit.fontawesome.com/d0bb6518aa.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyCvdz5EmNzdYjdD3LKTVPXlPicbkLYPwSE"></script>
	
 <script type="text/javascript">
 	// window.name="부모창 이름"
	function reservdeleteForm() {
		window.name = "userreservcheck.do";
		
		// window.open("자식창 이름", "자식창의 닉네임", "팝업창 옵션")
		window.open("reservdeleteForm.do", "reservdeleteFrom", "width=600, height=400, top=100, left=200, location=no"); 
	  }
  </script>
   <script type="text/javascript">
 	// window.name="부모창 이름"
	function reservmodifyForm() {
		window.name = "userreservcheck.do";
		
		// window.open("자식창 이름", "자식창의 닉네임", "팝업창 옵션")
		window.open("reservmodifyForm.do", "reservmodifyFrom", "width=600, height=400, top=100, left=200, location=no"); 
	  }
  </script>
<title>강남비트병원</title>
</head>
<%@ include file="setting.jsp"%>
<c:if test="${sessionScope.memId ne null}">
	<body id="top">
		<div class="wrap">
			<div class="head1">
				<div class="login">
					<li class="login2"><a href="logout.do">로그아웃</a></li>&nbsp;&nbsp;
					<li class="login2"><span>${sessionScope.memId}</span>${msg_welcome}&nbsp;&nbsp;&nbsp;&nbsp;
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
		<div class="body">
			<div class="rebox">
				<div class="y0">
					<div class="y1">
					<c:if test="${null ne rto.user_id}">
						<div class="y3">
						<span style="font-size:40px;">${rto.user_name} 님의 진료 예약 현황 입니다</span>
						<hr>
						<br>
						<br>
						<input type="hidden" name="dr_id" value="${rto.dr_id}">
							<div class="y3_0">
								<table class="reservtbl">
									<tr>
										<td>예약 번호</td>
										<td>아이디</td>
										<td>이름</td>
										<td>예약 날짜</td>
										<td>예약 시간</td>
										<td>의사 이름</td>
										<td>진료 과목</td>
										<td>진료 목적</td>
									</tr>
									<tr>
										<td>${rto.re_num}</td>
										<td>${rto.user_id}</td>
										<td>${rto.user_name}</td>
										<td>${rto.re_date}</td>
										<td>${rto.re_time}</td>
										<td>${rto.dr_name}</td>
										<td>${rto.dr_major}</td>
										<td>${rto.re_col}</td>
									</tr>
								</table>
							</div>
							<div>
								<ul class="y4">
									<li><a href="#" onclick="reservmodifyForm()">수정</a></li>
									<li><a href="#" onclick="reservdeleteForm()">예약 취소</a></li>
								</ul>
							</div>
							<div class="y5">
								<a href="hospital.do">취소</a>
							</div>
						</div>
						</c:if>
						<div class="y3">
							<c:if test="${null eq rto.user_id}">
							<span style="font-size:40px;">예약하신 진료가 없습니다</span>
						<br>
							<div class="y3_0">
							</div>
							<div>
								<ul class="y4">
								</ul>
							</div>
							<div class="y5">
								<a href="hospital.do">취소</a>
							</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
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
						<p>강남대학교병원운영 서울특별시이곳은병원</p>
						<br>
						<p>대표자:임두혁</p>
						<br>
						<p>진료예약 : 1577-0012</p>
						<br>
						<p>병원안내 : 02-870-2112</p>
						<br>
					</address>
				</div>
			</div>
		</div>
		<script src="hostpital.js"></script>
	</body>
</c:if>
</html>