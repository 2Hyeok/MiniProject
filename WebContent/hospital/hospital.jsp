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
    <link rel="stylesheet" href="./hospital/rere.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript"
        src="http://maps.google.com/maps/api/js?key=AIzaSyCvdz5EmNzdYjdD3LKTVPXlPicbkLYPwSE"></script>
	<script type="text/javascript" src="./hospital/script.js"></script>
	<script>
 		 function usermodifyForm() {
		window.name = "hospital.do";
		
		// window.open("자식창 이름", "자식창의 닉네임", "팝업창 옵션")
		window.open("modiForm.do", "usermodifyForm", "width=600, height=400, top=100, left=200, status=no,scrollbars=no, menubar=no"); 
	  }
  </script>
  <script>
 		 function userdeleteForm() {
		window.name = "hospital.do";
		
		// window.open("자식창 이름", "자식창의 닉네임", "팝업창 옵션")
		window.open("deleteForm.do", "userdeleteForm", "width=600, height=400, top=100, left=200, status=no, scrollbars=no, menubar=no"); 
	  }
  </script>
  
    <style>
        #map_ma {


            width: auto;
            height: 500px;
            clear: both;
            margin: 0 140px;

        }
    </style>
    
    <%-- 홈페이지 메인에 보이는 팝업창 --%>
    <script>
        function showpap() {    

            window.open("pap_up.html","showpap","width=515,height=530,history=no,resizable=no,status=no,scrollbars=yes,menubar=no" )
         
        }
    </script>

    <title>강남비트병원</title>
</head>
<%@ include file = "setting.jsp" %>
<%-- 의사 로그인 --%>
<c:if test="${sessionScope.docId ne null}">
<body onload="javascript:showpap()">
    <div class="wrap">
        <div class="head1">
            <div class="login2">
                <li class="login2">
                    <a href="drlogout.do">로그아웃</a>
                </li>
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
  </div>
  <input class="goupbtn" type="button" value="Top" onclick="clickme()">
  <script>
	function clickme() {
  	window.scrollTo({top:0, left:0, behavior:'smooth'});
	}
</script>
  <div class="body">
      <div class="slide_box">
          <div class="slideshow-container">
              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/nara2.jfif">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/hos1.jpg">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/hos2.jpg">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/hos3.jpg">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/doctors.png">
              </div>

              <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
              <a class="next" onclick="plusSlides(1)">&#10095;</a>
          </div>
          <br>
          <div class="hidden" style="text-align:center">
              <span class="dot" onclick="currentSlide(1)"></span>
              <span class="dot" onclick="currentSlide(2)"></span>
              <span class="dot" onclick="currentSlide(3)"></span>
              <span class="dot" onclick="currentSlide(4)"></span>
              <span class="dot" onclick="currentSlide(5)"></span>
          </div>
      </div>
      <div class="introduce">
          <ul class="introduce_box">
              <li>
                  <div>
                      <div class="noticebtn"></div>
                      <h2>공지</h2>
                      <a href="notice.do">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
              <li>
                  <div>
                      <div class="introbtn"></div>
                      <h2>소개</h2>
                      <a href="hospitalintroduce.do">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
              <li>
                  <div>
                      <div class="reservbtn"></div>
                      <h2>예약</h2>
                      <a href="#" onclick="alert('이용할 수 없습니다')">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
              <li>
                  <div>
                      <div class="boardbtn"></div>
                      <h2>게시판</h2>
                      <a href="board.do">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
          </ul>
      </div>
  </div>
  <div id="map_">
      <div id="map_ma"></div>
      <script type="text/javascript">
          $(document).ready(function () {
              var myLatlng = new google
                  .maps
                  .LatLng(37.494609, 127.0276550); // 위치값 위도 경도
              var Y_point = 37.494609; // Y 좌표
              var X_point = 127.0276550; // X 좌표
              var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
              var markerTitle = "강남비트병원"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
              var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

              // 말풍선 내용
              var contentString = '<div><h2>이곳은 병원</h2><p>안녕하세요. 이곳은 병원입니다.</p></div>';
              var myLatlng = new google
                  .maps
                  .LatLng(Y_point, X_point);
              var mapOptions = {
                  zoom: zoomLevel,
                  center: myLatlng,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
              }
              var map = new google
                  .maps
                  .Map(document.getElementById('map_ma'), mapOptions);
              var marker = new google
                  .maps
                  .Marker({ position: myLatlng, map: map, title: markerTitle });
              var infowindow = new google
                  .maps
                  .InfoWindow({ content: contentString, maxWizzzdth: markerMaxWidth });
              google
                  .maps
                  .event
                  .addListener(marker, 'click', function () {
                      infowindow.open(map, marker);
                  });
          });
      </script>
        <div class="map_info">
            <div class="map_info2">
                <h2>찾아오는 길</h2>
                <p>알아서 잘 찾아오세요</p>
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

<%-- 로그인 상태 --%>
<c:if test="${sessionScope.memId ne null}">
<body onload="javascript:showpap()">
    <div class="wrap">
        <div class="head1">
            <div class="login2">
	           	 <c:if test="${sessionScope.memId eq 'admin' }">
	                <li class="login2">
	                    <a href="logout.do">로그아웃</a>
	                </li>
	                 <li class="login2">
	                    <span name="user_id">${sessionScope.memId}</span>${msg_welcome}&nbsp;
	                </li> 
	                <li class="login2">
	                   <a href="userInterface.do">모든 회원정보 보기</a>
	                </li>
	               </c:if>
	               <c:if test="${sessionScope.memId ne 'admin' }">
	                <li class="login2">
	                    <a href="#" onclick="userdeleteForm()">탈퇴</a>
	                </li>
	                <li class="login2">
	                    <a href="#" onclick="usermodifyForm()">수정</a>
	                </li>
	                <li class="login2">
	                    <a href="logout.do">로그아웃</a>
	                </li>
	                 <li class="login2">
	                    <span name="user_id">${sessionScope.memId}</span>${msg_welcome}&nbsp;
	                </li>
	   				<li class="login2">
	                 	<a href="userreservcheck.do">예약 확인</a>
	    			</li>
	    		</c:if>
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
                          <a href="reserv.do">예약</a>
                      </li>
                      <li class="menu_bar_li">
                          <a href="board.do">게시판</a>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
  </div>
  <input class="goupbtn" type="button" value="Top" onclick="clickme()">
  <script>
	function clickme() {
  	window.scrollTo({top:0, left:0, behavior:'smooth'});
	}
</script>
  <div class="body">
      <div class="slide_box">
          <div class="slideshow-container">
              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/nara2.jfif">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/hos1.jpg">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/hos2.jpg">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/hos3.jpg">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/doctors.png">
              </div>

              <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
              <a class="next" onclick="plusSlides(1)">&#10095;</a>
          </div>
          <br>
          <div class="hidden" style="text-align:center">
              <span class="dot" onclick="currentSlide(1)"></span>
              <span class="dot" onclick="currentSlide(2)"></span>
              <span class="dot" onclick="currentSlide(3)"></span>
              <span class="dot" onclick="currentSlide(4)"></span>
              <span class="dot" onclick="currentSlide(5)"></span>
          </div>
      </div>
      <div class="introduce">
          <ul class="introduce_box">
              <li>
                  <div>
                      <div class="noticebtn"></div>
                      <h2>공지</h2>
                      <a href="notice.do">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
              <li>
                  <div>
                      <div class="introbtn"></div>
                      <h2>소개</h2>
                      <a href="hospitalintroduce.do">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
              <li>
                  <div>
                      <div class="reservbtn"></div>
                      <h2>예약</h2>
                      <a href="reserv.do">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
              <li>
                  <div>
                      <div class="boardbtn"></div>
                      <h2>게시판</h2>
                      <a href="board.do">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>          
          </ul>
      </div>
  </div>
  <div id="map_">
      <div id="map_ma"></div>
      <script type="text/javascript">
          $(document).ready(function () {
              var myLatlng = new google
                  .maps
                  .LatLng(37.494609, 127.0276550); // 위치값 위도 경도
              var Y_point = 37.494609; // Y 좌표
              var X_point = 127.0276550; // X 좌표
              var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
              var markerTitle = "강남비트병원"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
              var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

              // 말풍선 내용
              var contentString = '<div><h2>이곳은 병원</h2><p>안녕하세요. 이곳은 병원입니다.</p></div>';
              var myLatlng = new google
                  .maps
                  .LatLng(Y_point, X_point);
              var mapOptions = {
                  zoom: zoomLevel,
                  center: myLatlng,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
              }
              var map = new google
                  .maps
                  .Map(document.getElementById('map_ma'), mapOptions);
              var marker = new google
                  .maps
                  .Marker({ position: myLatlng, map: map, title: markerTitle });
              var infowindow = new google
                  .maps
                  .InfoWindow({ content: contentString, maxWizzzdth: markerMaxWidth });
              google
                  .maps
                  .event
                  .addListener(marker, 'click', function () {
                      infowindow.open(map, marker);
                  });
          });
      </script>
        <div class="map_info">
            <div class="map_info2">
                <h2>찾아오는 길</h2>
                <p>알아서 잘 찾아오세요</p>
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


<%-- 비 로그인 상태 --%>
<c:if test="${sessionScope.memId eq null && sessionScope.docId eq null}">
<body onload="javascript:showpap()">
    <div class="wrap">
        <div class="head1">
            <div class="login">
                <li class="login">
                    <a href="gaip.do">회원가입</a>
                </li>
                <li class="login">
                    <a href="login.do">로그인</a>
                </li>
                <li class="login">
                    <a href="drlogin.do">의사 로그인</a>
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
                          <a href="" onclick="alert('로그인 후 이용해 주세요')">예약</a>
                      </li>
                      <li class="menu_bar_li">
                          <a href="board.do">게시판</a>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
  </div>
  <input class="goupbtn" type="button" value="Top" onclick="clickme()">
  <script>
  	function clickme() {
      	window.scrollTo({top:0, left:0, behavior:'smooth'});
    	}
  </script>
  <div class="body">
      <div class="slide_box">
          <div class="slideshow-container">
              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/nara2.jfif">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/hos1.jpg">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/hos2.jpg">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/hos3.jpg">
              </div>

              <div class="mySlides fade">
                  <div class="numbertext"></div>
                  <img src="./img/doctors.png">
              </div>

              <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
              <a class="next" onclick="plusSlides(1)">&#10095;</a>
          </div>
          <br>
          <div class="hidden" style="text-align:center">
              <span class="dot" onclick="currentSlide(1)"></span>
              <span class="dot" onclick="currentSlide(2)"></span>
              <span class="dot" onclick="currentSlide(3)"></span>
              <span class="dot" onclick="currentSlide(4)"></span>
              <span class="dot" onclick="currentSlide(5)"></span>
          </div>
      </div>
      <div class="introduce">
          <ul class="introduce_box">
               <li>
                  <div>
                      <div class="noticebtn"></div>
                      <h2>공지</h2>
                      <a href="notice.do">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
              <li>
                  <div>
                      <div class="introbtn"></div>
                      <h2>소개</h2>
                      <a href="hospitalintroduce.do">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
              <li>
                  <div>
                      <div class="reservbtn"></div>
                      <h2>예약</h2>
                      <a href="#" onclick="alert('로그인 후 이용해 주세요.')">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
              <li>
                  <div>
                      <div class="boardbtn"></div>
                      <h2>게시판</h2>
                      <a href="board.do">
                          <p>자세히 보기</p>
                      </a>
                  </div>
              </li>
          </ul>
      </div>
  </div>
  <div id="map_">
      <div id="map_ma"></div>
      <script type="text/javascript">
          $(document).ready(function () {
              var myLatlng = new google
                  .maps
                  .LatLng(37.494609, 127.0276550); // 위치값 위도 경도
              var Y_point = 37.494609; // Y 좌표
              var X_point = 127.0276550; // X 좌표
              var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
              var markerTitle = "강남비트병원"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
              var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

              // 말풍선 내용
              var contentString = '<div><h2>이곳은병원</h2><p>안녕하세요. 이곳은 병원입니다..</p></div>';
              var myLatlng = new google
                  .maps
                  .LatLng(Y_point, X_point);
              var mapOptions = {
                  zoom: zoomLevel,
                  center: myLatlng,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
              }
              var map = new google
                  .maps
                  .Map(document.getElementById('map_ma'), mapOptions);
              var marker = new google
                  .maps
                  .Marker({ position: myLatlng, map: map, title: markerTitle });
              var infowindow = new google
                  .maps
                  .InfoWindow({ content: contentString, maxWizzzdth: markerMaxWidth });
              google
                  .maps
                  .event
                  .addListener(marker, 'click', function () {
                      infowindow.open(map, marker);
                  });
          });
      </script>
        <div class="map_info">
            <div class="map_info2">
                <h2>찾아오는 길</h2>
                <p>알아서 잘 찾아오세요</p>
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