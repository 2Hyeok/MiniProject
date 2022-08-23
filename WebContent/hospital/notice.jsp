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


<title>강남비트병원</title>
</head>
<%@ include file="setting.jsp"%>
<%-- 의사 로그인 --%>
<c:if test="${sessionScope.docId ne null}">
	<body>
		<div class="wrap">
			<div class="head1">
				<div class="login">
					<li class="login2"><a href="drlogout.do">로그아웃</a></li>&nbsp;&nbsp;
					<li class="login2"><span>${sessionScope.docId}</span>${msg_welcome}&nbsp;&nbsp;
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
		<div class="board">
			<div class="board2">
				<div>
					<div>
						<h1 class="gongzi">공지 게시판</h1>
					</div>
					<table class="table_3">
						<!-- 콜그룹으로 열의 비율을 맞춤 두번째것은
                        값을 안넣었으니 자동으로 남은 비율을 가진다-->
						<colgroup>
							<col style="width: 100px">
							<col style="width: 800px;">
							<col style="width: 100px;">
							<col style="width: 100px">
							<col style="width: 100px">
						</colgroup>
						<thead>
							<tr style="align: left;">
								<th>글번호</th>
								<th>글 제목</th>
								<th>아이디</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<!-- 상위 공지는 글씨 진하게 위에 고정-->
						<tbody>
							<c:if test="${count == 0}">
								<tr>
									<td colspan="5" style="text-align: center"></td>
								</tr>
							</c:if>
							<c:if test="${count != 0}">
								<c:set var="number" value="${number}" />
								<c:forEach var="nto" items="${ntos}">
									<tr>
										<td style="text-align: center">${number}<c:set
												var="number" value="${number-1}" />
										</td>
										<td style="text-align:;"><c:set var="wid"
												value="${(nto.re_level-1) * 10}" /> <c:if
												test="${nto.re_level gt 1}">
												<img src="${project}/images/level.gif" width="${wid}"
													height="15">
											</c:if> <c:if test="${nto.re_level gt 0}">
												<img src="${project}/images/re.gif" width="15" height="15">
											</c:if> <c:if test="${nto.readcount == -1}">
                        ${nto.not_title}
                     </c:if> <c:if test="${nto.readcount != -1}">
												<a
													href="noticecontent.do?not_no=${nto.not_no}&pageNum=${pageNum}&number=${number+1}">
													${nto.not_title} </a>
											</c:if></td>
										<!-- 여기가 제목부분 디자인 먹는곳 개가튼놈 -->
										<td style="text-align: center">${nto.fk_dr_id2}</td>
										<td style="text-align: center"><fmt:formatDate
												value="${nto.not_reg_date}" pattern="yyyy-MM-dd HH:mm" /></td>
										<td style="text-align: center"><c:if
												test="${nto.readcount == -1}">
                     &nbsp;
               </c:if> <c:if test="${nto.readcount != -1}">
                     ${nto.readcount}
               </c:if></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<div class="">
							<span class="glejacksung"> <a href="noticeinput.do"><h3
										class="glejacksung2">글작성</h3></a>
							</span>
					</div>
					<div class="table_lr">
						<c:if test="${count gt 0}">
							<c:if test="${startPage gt pageBlock}">
								<a href="notice.do?pageNum=${startPage - pageBlock}">[◀]</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<b>[${i}]</b>
								</c:if>
								<c:if test="${i != currentPage}">
									<a href="notice.do?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>
							<c:if test="${pageCount gt endPage}">
								<a href="notice.do?pageNum=${startPage + pageBlock}">[▶]</a>
							</c:if>
						</c:if>
					</div>
				</div>
				<div></div>
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

<%-- 유저 로그인 --%>
<c:if test="${sessionScope.memId ne null}">
	<body>
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
		<div class="board">
			<div class="board2">
				<div>
					<div>
						<h1 class="gongzi">공지 게시판</h1>
					</div>
					<table class="table_3">
						<!-- 콜그룹으로 열의 비율을 맞춤 두번째것은
                        값을 안넣었으니 자동으로 남은 비율을 가진다-->
						<colgroup>
							<col style="width: 100px">
							<col style="width: 800px;">
							<col style="width: 100px;">
							<col style="width: 100px">
							<col style="width: 100px">
						</colgroup>
						<thead>
							<tr style="align: left;">
								<th>글번호</th>
								<th>글 제목</th>
								<th>아이디</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<!-- 상위 공지는 글씨 진하게 위에 고정-->
						<tbody>
							<c:if test="${count == 0}">
								<tr>
									<td colspan="5" style="text-align: center"></td>
								</tr>
							</c:if>
							<c:if test="${count != 0}">
								<c:set var="number" value="${number}" />
								<c:forEach var="nto" items="${ntos}">
									<tr>
										<td style="text-align: center">${number}<c:set
												var="number" value="${number-1}" />
										</td>
										<td style="text-align:;"><c:set var="wid"
												value="${(nto.re_level-1) * 10}" /> <c:if
												test="${nto.re_level gt 1}">
												<img src="${project}/images/level.gif" width="${wid}"
													height="15">
											</c:if> <c:if test="${nto.re_level gt 0}">
												<img src="${project}/images/re.gif" width="15" height="15">
											</c:if> <c:if test="${nto.readcount == -1}">
                        ${nto.not_title}
                     </c:if> <c:if test="${nto.readcount != -1}">
												<a
													href="noticecontent.do?not_no=${nto.not_no}&pageNum=${pageNum}&number=${number+1}">
													${nto.not_title} </a>
											</c:if></td>
										<!-- 여기가 제목부분 디자인 먹는곳 개가튼놈 -->
										<td style="text-align: center">${nto.fk_dr_id2}</td>
										<td style="text-align: center"><fmt:formatDate
												value="${nto.not_reg_date}" pattern="yyyy-MM-dd HH:mm" /></td>
										<td style="text-align: center"><c:if
												test="${nto.readcount == -1}">
                     &nbsp;
               </c:if> <c:if test="${nto.readcount != -1}">
                     ${nto.readcount}
               </c:if></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<div class="">
							 <span class="glejacksung"> <a href="" onclick="alert('의사만 게시글을 작성할 수 있습니다.')">
							 <h3 class="glejacksung2">글작성</h3></a>
                  </span>
					</div>
					<div class="table_lr">
						<c:if test="${count gt 0}">
							<c:if test="${startPage gt pageBlock}">
								<a href="notice.do?pageNum=${startPage - pageBlock}">[◀]</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<b>[${i}]</b>
								</c:if>
								<c:if test="${i != currentPage}">
									<a href="notice.do?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>
							<c:if test="${pageCount gt endPage}">
								<a href="notice.do?pageNum=${startPage + pageBlock}">[▶]</a>
							</c:if>
						</c:if>
					</div>
				</div>
				<div></div>
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

<%-- 비로그인 --%>
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
		<div class="board">
			<div class="board2">
				<div>
					<div>
						<h1 class="gongzi">공지 게시판</h1>
					</div>
					<table class="table_3">
						<!-- 콜그룹으로 열의 비율을 맞춤 두번째것은
                        값을 안넣었으니 자동으로 남은 비율을 가진다-->
						<colgroup>
							<col style="width: 100px">
							<col style="width: 800px;">
							<col style="width: 100px;">
							<col style="width: 100px">
							<col style="width: 100px">
						</colgroup>
						<thead>
							<tr style="align: left;">
								<th>글 번호</th>
								<th>글 제목</th>
								<th>아이디</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<!-- 상위 공지는 글씨 진하게 위에 고정-->
						<tbody>
							<c:if test="${count == 0}">
								<tr>
									<td colspan="5" style="text-align: center"></td>
								</tr>
							</c:if>
							<c:if test="${count != 0}">
								<c:set var="number" value="${number}" />
								<c:forEach var="nto" items="${ntos}">
									<tr>
										<td style="text-align: center">${number}<c:set
												var="number" value="${number-1}" />
										</td>
										<td style="text-align:;"><c:set var="wid"
												value="${(nto.re_level-1) * 10}" /> <c:if
												test="${nto.re_level gt 1}">
												<img src="${project}/images/level.gif" width="${wid}"
													height="15">
											</c:if> <c:if test="${nto.re_level gt 0}">
												<img src="${project}/images/re.gif" width="15" height="15">
											</c:if> <c:if test="${nto.readcount == -1}">
                        ${nto.not_title}
                     </c:if> <c:if test="${nto.readcount != -1}">
												<a
													href="noticecontent.do?not_no=${nto.not_no}&pageNum=${pageNum}&number=${number+1}">
													${nto.not_title} </a>
											</c:if></td>
										<!-- 여기가 제목부분 디자인 먹는곳 개가튼놈 -->
										<td style="text-align: center">${nto.fk_dr_id2}</td>
										<td style="text-align: center"><fmt:formatDate
												value="${nto.not_reg_date}" pattern="yyyy-MM-dd HH:mm" /></td>
										<td style="text-align: center"><c:if
												test="${nto.readcount == -1}">
                     &nbsp;
               </c:if> <c:if test="${nto.readcount != -1}">
                     ${nto.readcount}
               </c:if></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<div class="">
						<span class="glejacksung"> <a href=""
							onclick="alert('로그인 후 이용해 주세요')"><h3 class="glejacksung2">글작성</h3></a>
						</span>
					</div>
					<div class="table_lr">
						<c:if test="${count gt 0}">
							<c:if test="${startPage gt pageBlock}">
								<a href="notice.do?pageNum=${startPage - pageBlock}">[◀]</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<b>[${i}]</b>
								</c:if>
								<c:if test="${i != currentPage}">
									<a href="notice.do?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>
							<c:if test="${pageCount gt endPage}">
								<a href="notice.do?pageNum=${startPage + pageBlock}">[▶]</a>
							</c:if>
						</c:if>
					</div>
				</div>
				<div></div>
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