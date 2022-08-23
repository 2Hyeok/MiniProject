<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./hospital/hospital.css">
<link rel="stylesheet" href="./hospital/gesipan.css">
<link rel="stylesheet" href="./hospital/rere.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyCvdz5EmNzdYjdD3LKTVPXlPicbkLYPwSE"></script>
	
 <script type="text/javascript">
 	// window.name="부모창 이름"
	function noticedeleteForm() {
		window.name = "notice.do";
		
		// window.open("자식창 이름", "자식창의 닉네임", "팝업창 옵션")
		window.open("noticedeleteForm.do?not_no=${nto.not_no}&pageNum=${pageNum}", "noticedeleteFrom", "width=600, height=400, top=100, left=200, location=no"); 
	  }
  </script>

<title>강남비트병원</title>
</head>
<%@ include file="setting.jsp"%>

<%-- 의사 로그인 상태 --%>
<c:if test="${sessionScope.docId ne null}">
	<body>
		<div class="wrap">
			<div class="head1">
				<div class="login">
					<li class="login2"><a href="drlogout.do">로그아웃</a></li>
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
						<div class="h3_font">
							<h3>공지 게시판</h3>
						</div>
						<div class="form_box">

							<table>
								<colgroup>
									<col style="width: 300px;">
									<col>
									<col style="width: 300px;">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th colspan="4">
											<div class="input_field">
												<span style="font-size: 30px;">${nto.not_title} </span>
											</div>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="input_field" style="border:1px solid #2c59b4; border-radius: 4px;">작성자</th>
										<td class="input_field" style="border:1px solid #2c59b4; border-radius: 4px; text-align:center;">${nto.fk_dr_id2}</td>
										<th class="input_field" style="border:1px solid #2c59b4; border-radius: 4px;">작성 일</th>
										<td class="input_field" style="border:1px solid #2c59b4; border-radius: 4px; text-align:center;"><fmt:formatDate value="${nto.not_reg_date}" pattern="yyyy-MM-dd HH:mm" /></td>
									</tr>
									<tr>
										<th class="input_field" style="border:1px solid #2c59b4; border-radius: 4px;">조회수</th>
										<th class="input_field" style="border:1px solid #2c59b4; border-radius: 4px;">${nto.readcount}
									</tr>
									<tr>
										<td colspan="4">
											<div class="board_text" style="height:600px; border:1px solid #2c59b4; border-radius: 4px;">
												<div style="margin:5px; overflow:hidden;">
													${nto.not_write}
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<hr>
								<c:if test="${docId eq nto.fk_dr_id2}">
									<input class="inputbutton" type="button" value="삭제"
									onclick="noticedeleteForm()">
									<input class="inputbutton" type="button" value="목록보기"
										onclick="location='notice.do?pageNum=${pageNum}'">
								</c:if>
								<c:if test="${docId ne nto.fk_dr_id2}">
									<input class="inputbutton" type="button" value="목록보기"
											onclick="location='notice.do?pageNum=${pageNum}'">
								</c:if>
						</div>
					</article>
				</section>
			</div>
		</div>
	</body>
	<br>
	<br>
	<br>
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
                    <select name="family_link" onchange="if(this.value) location.href=(this.value);">
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
	<script src="./hospital/hostpital.js"></script>
	</body>
</c:if>

<%-- 유저 로그인 상태 --%>
<c:if test="${sessionScope.memId ne null}">
	<body>
		<div class="wrap">
			<div class="head1">
				<div class="login">
					<li class="login2"><a href="logout.do">로그아웃</a></li>
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
						<div class="h3_font">
							<h3>공지 게시판</h3>
						</div>
						<div class="form_box">

							<table>
								<colgroup>
									<col style="width: 300px;">
									<col>
									<col style="width: 300px;">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th colspan="4">
											<div class="input_field">
												<span style="font-size: 30px;">${nto.not_title} </span>
											</div>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="input_field" style="border:1px solid #2c59b4; border-radius: 4px;">작성자</th>
										<td class="input_field" style="border:1px solid #2c59b4; border-radius: 4px; text-align:center;">${nto.fk_dr_id2}</td>
										<th class="input_field" style="border:1px solid #2c59b4; border-radius: 4px;">작성 일</th>
										<td class="input_field" style="border:1px solid #2c59b4; border-radius: 4px; text-align:center;"><fmt:formatDate value="${nto.not_reg_date}" pattern="yyyy-MM-dd HH:mm" /></td>
									</tr>
									<tr>
										<th class="input_field" style="border:1px solid #2c59b4; border-radius: 4px;">조회수</th>
										<th class="input_field" style="border:1px solid #2c59b4; border-radius: 4px;">${nto.readcount}
									</tr>
									<tr>
										<td colspan="4">
											<div class="board_text" style="height:600px; border:1px solid #2c59b4; border-radius: 4px;">
												<div style="margin:5px; overflow:hidden;">
													${nto.not_write}
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<hr>
								<input class="inputbutton" type="button" value="목록보기"
									onclick="location='notice.do?pageNum=${pageNum}'">
						</div>
					</article>
				</section>
			</div>
		</div>
	</body>
	<br>
	<br>
	<br>
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
                    <select name="family_link" onchange="if(this.value) location.href=(this.value);">
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
	<script src="./hospital/hostpital.js"></script>
	</body>
</c:if>

<%-- 비로그인 상태 --%>
<c:if test="${sessionScope.memId eq null && sessionScope.docId eq null}">
	<body>
		<div class="wrap">
			<div class="head1">
				<div class="login">
					<li class="login"><a href="gaip.do">회원가입</a></li>
					<li class="login"><a href="login.do">로그인</a></li>
					<li class="login"><a href="drlogin.do">의사 로그인</a></li>
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
							<li class="menu_bar_li"><a href="" onclick="alert('로그인 후 이용해 주세요')">예약</a></li>
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
						<div class="h3_font">
							<h3>공지 게시판</h3>
						</div>
						<div class="form_box">
								<table>
									<colgroup>
										<col style="width: 300px;">
										<col>
										<col style="width: 300px;">
										<col>
									</colgroup>
									<thead>
									<tr>
										<th colspan="4">
											<div class="input_field">
												<span style="font-size: 30px;"> ${nto.not_title} </span>
											</div>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="input_field" style="border:1px solid #2c59b4; border-radius: 4px;">작성자</th>
										<td class="input_field" style="border:1px solid #2c59b4; border-radius: 4px; text-align:center;">${nto.fk_dr_id2}</td>
										<th class="input_field" style="border:1px solid #2c59b4; border-radius: 4px;">작성 일</th>
										<td class="input_field" style="border:1px solid #2c59b4; border-radius: 4px; text-align:center;"><fmt:formatDate value="${nto.not_reg_date}" pattern="yyyy-MM-dd HH:mm" /></td>
									</tr>
									<tr>
										<th class="input_field">조회수</th>
										<th class="input_field">${nto.readcount}
									</tr>
									<tr>
										<td colspan="4">
											<div class="board_text" style="height:600px; border:1px solid #2c59b4; border-radius: 4px;">
												<div style="margin:5px; overflow:hidden;">
													${nto.not_write}
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
								<input class="inputbutton" type="button" value="목록"
									onclick="location='notice.do?pageNum=${pageNum}'">
						</div>
					</article>
				</section>
			</div>
		</div>
	</body>
	<br>
	<br>
	<br>
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
                    <select name="family_link" onchange="if(this.value) location.href=(this.value);">
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
	<script src="./hospital/hostpital.js"></script>
	</body>
</c:if>
</html>