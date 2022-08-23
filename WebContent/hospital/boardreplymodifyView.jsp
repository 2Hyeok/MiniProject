<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="hospital.BoardDataBean"%>
<%@page import="hospital.BoardDBBean"%>

<%@ include file="setting.jsp"%>
<script type="text/javascript" src="./hospital/script.js"></script>
<link rel="stylesheet" href="./hospital/hospital.css">
<link rel="stylesheet" href="./hospital/gesipan.css">
<link rel="stylesheet" href="./hospital/rere.css">

<c:if test="${result == 0}">
	<script type="text/javascript">
	<!--
		erroralert(passwderror);
	//-->
	</script>
</c:if>
<c:if test="${result !=0}">
	<body>
		<div class="wrap">
			<div class="head1">
				<div class="login">
					<li class="login2"><a href="logout.do">로그아웃</a></li>
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
							<li class="menu_bar_li"><a onclick="alert('이용할 수 없습니다.')">예약</a></li>
							<li class="menu_bar_li"><a href="board.do">게시판</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	<body>
		<input class="goupbtn" type="button" value="Top" onclick="clickme()">
		<script>
			function clickme() {
				window.scrollTo({
					top : 0,
					left : 0,
					behavior : 'smooth'
				});
			}
		</script>
		<div>
			<div class="content_section">
				<section>
					<article>
						<div class="form_box">
							<div class="h3_font">
								<h3>QnA 게시판</h3>
							</div>
							<form name="boardmodifyform" method="post"
								action="boardreplymodifyPro.do"
								onsubmit="return boardmodifycheck()">
								<input type="hidden" name="b_no" value="${b_no}"> 
								<input type="hidden" name="pageNum" value="${pageNum}"> 
								<input class="input_field" type="text" value="${docId}" name="fk_user_id1" readonly><br> 
								<input class="input_field" type="text" value="${bto.b_title}" name="b_title" maxlength="50" autofocus><br>
								<textarea class="textarea_field" name="b_write" maxlength="500">${fn:replace(bto.b_write, replaceChar,"<br />")}</textarea>
								<br> 
								<input class="inputbutton" type="submit" value="수정">
								<input class="inputbutton" type="reset" value="다시"> 
								<input class="inputbutton" type="button" value="수정 취소"
									onclick="location='board.do?pageNum=${pageNum}'">
							</form>
						</div>
					</article>
				</section>
			</div>
		</div>
	</body>
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
						<option value="https://healthcare.snuh.org/home.do">서울대학교병원
							강남센터</option>
						<option value="https://www.cmcseoul.or.kr/page/main">가톨릭대학교
							성모병원</option>
						<option value="https://www.brmh.org/main/main.do">서울
							보라매병원</option>
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
	<script src="./hospital/hostpital.js"></script>
	</body>
</c:if>