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
<script type="text/javascript" src="./hospital/script.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyCvdz5EmNzdYjdD3LKTVPXlPicbkLYPwSE"></script>
	
<script>
function onTestChange() {
    var key = window.event.keyCode;

    // If the user has pressed enter
    if (key === 13) {
        document.getElementById("#txtArea").value = document.getElementById("#txtArea").value + "\n*";
        return false;
    }
    else {
        return true;
    }
}
</script>

<title>강남비트병원</title>
</head>
<%@ include file="setting.jsp" %>

<%-- 의사 로그인 --%>
<c:if test="${sessionScope.docId ne null}">
<body>
	<div class="wrap">
		<div class="head1">
			<div class="login">
				<li class="login2">
                    <a href="drlogout.do">로그아웃</a>
                </li>
                 <li class="login2">
                    <span>${sessionScope.docId}</span>${msg_welcome}
                </li>
			</div>
			<div class="head">
				<div class="logo">
					<a href="hospital.do"><img src="./img/igs_logo.png" width="100"
						height="70"></a>
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
      	window.scrollTo({top:0, left:0, behavior:'smooth'});
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
						<form name="boardinputform" action="boardinputPro.do" onsubmit="return writecheck()">
							<input type="hidden" name="b_no" value="${b_no}">
							<input type="hidden" name="ref" value="${ref}">
							<input type="hidden" name="re_step" value="${re_step}">
							<input type="hidden" name="re_level" value="${re_level}">
							<input class="input_field" type="text" value="${sessionScope.docId}" name="fk_dr_id1" readonly><br>
							<input class="input_field" type="text" placeholder="제목을 입력해주세요.(최대 50글자)" maxlength="50" name="b_title" autofocus><br>
							<textarea id="txtArea"class="textarea_field" placeholder="내용을 입력해주세요.(최대 500글자)" name="b_write" maxlength="500" style="resize:none;"></textarea>
							<br>
							<button type="submit" class="write_button">게시</button>
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
				<li class="login2">
                    <a href="logout.do">로그아웃</a>
                </li>
                 <li class="login2">
                    <span>${sessionScope.memId}</span>${msg_welcome}&nbsp;&nbsp;&nbsp;
                </li>
			</div>
			<div class="head">
				<div class="logo">
					<a href="hospital.do"><img src="./img/igs_logo.png" width="100"
						height="70"></a>
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
      	window.scrollTo({top:0, left:0, behavior:'smooth'});
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
						<form name="boardinputform" action="boardinputPro.do" onsubmit="return boardinputcheck()">
							<input type="hidden" name="b_no" value="${b_no}">
							<input type="hidden" name="ref" value="${ref}">
							<input type="hidden" name="re_step" value="${re_step}">
							<input type="hidden" name="re_level" value="${re_level}">
							<input class="input_field" type="text" value="${memId}" name="fk_user_id1" readonly><br>
							<input class="input_field" type="text" placeholder="제목을 입력해주세요.(최대 50글자)" name="b_title" autofocus maxlength="50"><br>
							<textarea class="textarea_field" placeholder="내용을 입력해주세요.(최대 500글자)" name="b_write" maxlength="500" style="resize:none;"></textarea>
							<br>
							<button type="submit" class="write_button">게시</button>
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