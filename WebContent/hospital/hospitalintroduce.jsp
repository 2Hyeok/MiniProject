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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <title>강남비트병원</title>
</head>
<%@ include file = "setting.jsp" %>
<c:if test="${sessionScope.docId ne null}">
<body onload="javascript:showpap()">
    <div class="wrap">
        <div class="head1">
            <div class="login2">
                <li class="login2">
                    <a href="drlogout.do">로그아웃</a>
                </li> &nbsp;&nbsp;&nbsp;&nbsp;
                 <li class="login2">
                    <span>${sessionScope.docId}</span>${msg_welcome}
                </li>
                <li class="login2">
                    <a href="userreservAll.do">유저의 예약 확인</a>
                </li>
            </div>
            <div class="head">
                <div class="logo">
                    <a href="hospital.do"><img src="./img/igs_logo.png" width="100" height="70"></a>
                    <h1>
                        <a href="hospital.do">이곳은병원</a>
                    </h1>
                </div>
                <div class="menu-bar">
                    <ul>
                        <li class="menu_bar_li">
                            <a href="notice.do">공지사항</a>
                      </li>
                      <li class="menu_bar_li"><a href="hospitalintroduce.do">소개</a></li>
                      <li class="menu_bar_li">
                          <a href="" onclick="alert('이용할 수 없습니다.')">예약</a>
                      </li>
                      <li class="menu_bar_li">
                          <a href="board.do">게시판</a>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
      <div>
        <div style="text-align:center;" id="clickPointer">
        	<img class="introduce_img"src="./img/introdoctors.png">
        </div>
        <script>
            // id 를 btn에 담음
            const btn = document.getElementById('clickPointer')
            // onClick 이라는 click 이벤트를 생성
            const onClick = e >= {
              //가로 여백,가로 길이 , 세로 여백,세로 길이 를 구하기 위해 getBoundingClientRect() 함수를 사용
              const { x, y, width, height} = btn.getBoundingClientRect()
              //after 가상 요소 원의 반지름을 구한다
              const radius = Math.sqrt(width * width + height * height)
              //css property를 사용하여 반지름 데이터를 동적으로 전달한다.
              btn.style.setProperty('--diameter', radius * 2 + 'px')
              const { clientX, clientY } = e
              const left = (clientX - x - radius) / width * 100 + '%'
              const top = (clientY - y - radius) / height * 100 + '%'
      
              btn.style.setProperty('--left', left)
              btn.style.setProperty('--top', top)
              btn.style.setProperty('--a', '')
              setTimeout(() => {
                btn.style.setProperty('--a', 'ripple-effect 500ms linear')
              }, 5)
            }
            //클릭 이벤트 실행
            btn.addEventListener('click', onClick)
          </script>
      </div>
  </div>
  <input class="goupbtn" type="button" value="Top" onclick="clickme()">
  <script>
	function clickme() {
  	window.scrollTo({top:0, left:0, behavior:'smooth'});
	}
    </script>   
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
                    <p>강남대학교병원운영 서울특별시이곳은병원</p><br>
                    <p>대표자:임두혁</p><br>
                    <p>진료예약 : 1577-0012</p><br>
                    <p>병원안내 : 02-870-2112</p><br>
                </address>
            </div>
        </div>
    </div>
    <script src="./hospital/hostpital.js"></script>
</body>
</c:if>

<c:if test="${sessionScope.memId ne null}">
<body onload="javascript:showpap()">
    <div class="wrap">
        <div class="head1">
            <div class="login2">
                <li class="login2">
                    <a href="logout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                 <li class="login2">
                    <span>${sessionScope.memId}</span>${msg_welcome}
                </li>
            </div>
            <br>
            <div class="head">
                <div class="logo">
                    <a href="hospital.do"><img src="./img/igs_logo.png" width="100" height="70"></a>
                    <h1>
                        <a href="hospital.do">이곳은병원</a>
                    </h1>
                </div>
                <div class="menu-bar">
                    <ul>
                        <li class="menu_bar_li">
                            <a href="notice.do">공지사항</a>
                      </li>
                      <li class="menu_bar_li"><a href="hospitalintroduce.do">소개</a></li>
                      <li class="menu_bar_li">
                          <a href="reserv.do">예약</a>
                      </li>
                      <li class="menu_bar_li">
                          <a href="board.do">게시판</a>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
      <div>
        <div style="text-align:center;">
            <img class="introduce_img"src="./img/introdoctors.png">
        </div>
      </div>
  </div>
  <input class="goupbtn" type="button" value="Top" onclick="clickme()">
  <script>
	function clickme() {
  	window.scrollTo({top:0, left:0, behavior:'smooth'});
	}
    </script>   
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
                    <p>강남대학교병원운영 서울특별시이곳은병원</p><br>
                    <p>대표자:임두혁</p><br>
                    <p>진료예약 : 1577-0012</p><br>
                    <p>병원안내 : 02-870-2112</p><br>
                </address>
            </div>
        </div>
    </div>
    <script src="./hospital/hostpital.js"></script>
</body>
</c:if>

<c:if test="${sessionScope.memId eq null && sessionScope.docId eq null}">
<body onload="javascript:showpap()">
    <div class="wrap">
        <div class="head1">
            <div class="login2">
                <li class="login">
                    <a href="gaip.do">회원가입</a>
                </li>
                <li class="login">
                    <a href="login.do">로그인</a>
                </li>
                <li class="login"><a href="drlogin.do">의사 로그인</a></li>
            </div>
            <div class="head">
                <div class="logo">
                    <a href="hospital.do"><img src="./img/igs_logo.png" width="100" height="70"></a>
                    <h1>
                        <a href="hospital.do">이곳은병원</a>
                    </h1>
                </div>
                <div class="menu-bar">
                    <ul>
                        <li class="menu_bar_li">
                            <a href="notice.do">공지사항</a>
                      </li>
                      <li class="menu_bar_li"><a href="hospitalintroduce.do">소개</a></li>
                      <li class="menu_bar_li">
                          <a href="" onclick="alert('로그인 후 이용해 주세요')">예약</a>
                      </li>
                      <li class="menu_bar_li">
                          <a href="board.do">게시판</a>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
      <div>
        <div style="text-align:center;">
           <img class="introduce_img"src="./img/introdoctors.png">
           
        </div>
      </div>
  </div>
  <input class="goupbtn" type="button" value="Top" onclick="clickme()">
  <script>
	function clickme() {
  	window.scrollTo({top:0, left:0, behavior:'smooth'});
	}
    </script>   
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
                    <p>강남대학교병원운영 서울특별시이곳은병원</p><br>
                    <p>대표자:임두혁</p><br>
                    <p>진료예약 : 1577-0012</p><br>
                    <p>병원안내 : 02-870-2112</p><br>
                </address>
            </div>
        </div>
    </div>
    <script src="./hospital/hostpital.js"></script>
</body>
</c:if>
</html>