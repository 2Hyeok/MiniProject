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

<title>강남비트병원</title>
<%@ include file="setting.jsp"%>
</head>

<c:if test="${sessionScope.docId ne null}">
	<body id="top">
		<div class="wrap">
			<div class="head1">
				<div class="login">
					<li class="login2"><a href="drlogout.do">로그아웃</a></li>&nbsp;&nbsp;
					<li class="login2"><span>${sessionScope.docId}</span>${msg_welcome}
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
							<li class="menu_bar_li"><a href="" onclick="alert('이용할 수 없습니다.')">예약</a></li>
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
			<br>
			<br>
				<c:if test="${sessionScope.docId eq 'doctor'}">
					<table class="reservtbl" style="text-align: center;">
						<tr>
							<th>예약 번호</th>
							<th>유저 아이디</th>
							<th>유저 이름</th>
							<th>예약 날짜</th>
							<th>예약 시간</th>
							<th>예약일</th>
							<th>진료 목적</th>
							<th>의사 이름</th>
							<th>의사 진료과목</th>
						</tr>
						<c:forEach var="row" items="${select}">
							<tr>
								<td>${row.re_num}</td>
								<td>${row.user_id}</td>
								<td>${row.user_name}</td>
								<td>${row.re_date}</td>
								<td>${row.re_time}</td>
								<td><fmt:formatDate value="${row.re_reg_date}" pattern="yyyy-MM-dd HH:mm"/></td>
								<td>${row.re_col}</td>
								<td>${row.dr_name}</td>
								<td>${row.dr_major}</td>
						</c:forEach>
					</table>
					</c:if>
					<c:if test="${sessionScope.docId eq 'doctor1'}">
						<table class="reservtbl" style="text-align: center;">
							<tr>
								<th>예약 번호</th>
								<th>유저 아이디</th>
								<th>유저 이름</th>
								<th>예약 날짜</th>
								<th>예약 시간</th>
								<th>예약일</th>
								<th>진료 목적</th>
								<th>의사 이름</th>
								<th>의사 진료과목</th>
							</tr>
							<c:forEach var="row" items="${select2}">
								<tr>
									<td>${row.re_num}</td>
									<td>${row.user_id}</td>
									<td>${row.user_name}</td>
									<td>${row.re_date}</td>
									<td>${row.re_time}</td>
									<td><fmt:formatDate value="${row.re_reg_date}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td>${row.re_col}</td>
									<td>${row.dr_name}</td>
									<td>${row.dr_major}</td>
							</c:forEach>
						</table>
					</c:if>
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