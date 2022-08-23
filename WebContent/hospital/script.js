/**
 * 병원 관리
 */
// 에러메시지
var idmsg = "아이디를 입력하세요";
var passwdmsg = "비밀번호를 입력하세요";
var logidmsg = "아이디를 입력하세요";
var logpasswdmsg = "비밀번호를 입력하세요";
var repasswdmsg = "재입력 비밀번호와 일치하지 않습니다.";
var namemsg = "이름을 입력하세요";
var telmsg = "전화번호를 입력하세요";
var ptelmsg = "보호자 전화번호를 입력하세요";
var gendermsg = "성별을 입력하세요";
var confirmmsg = "아이디 중복확인을 해주세요";
var notlogonmsg = "로그인후 이용해주세요";
var loginmsg  = "로그인 후 이용해주세요";
var titlemsg = "제목을 입력해 주세요";
var writemsg = "내용을 입력해 주세요";
var docmsg = "진료 과목을 선택해 주세요";
var datemsg = "진료 날짜를 선택해 주세요";

var inputerror = "회원가입에 실패했습니다. \n 다시 시도해 주세요";
var iderror = "입력하신 아이디가 없습니다. \n 다시 확인하세요";
var passwderror = "입력하신 비밀번호가 다릅니다. \n 다시 확인하세요";
var deleteerror = "회원 탈퇴에 실패했습니다. \n 잠시후 다시 시도해 주세요";
var modifyerror = "회원정보수정에 실패했습니다. \n 잠시후 다시 시도해 주세요";

function erroralert(msg) {
	alert(msg);
	history.back();
}

function login() {
	alert(loginmsg);
}
//회원정보 수정
function modicheck() {
	if (!passwdform.user_passwd.value) { // 비밀번호 입력을 하지않고 수정을 누를시 메시지 출력
		alert(passwdmsg);
		passwdform.user_passwd.focus();
		return false;
	} else if (passwdform.user_passwd.value != passwdform.user_repasswd.value) { // 비밀번호와 재입력 비밀번호가 일치하지 않을경우 메시지 출력
		alert(repasswdmsg);
		passwdform.user_passwd.focus();
		return false;
	}
	if (passwdform.user_tel1.value || passwdform.user_tel2.value // 전화번호를 입력하지 않았을경우
			|| gaipform.user_tel3.value) {
		if (passwdform.user_tel1.value.length < 3 // tel1 이 3자리가 아닐시
				|| passwdform.user_tel2.value.length < 3 // tel2가 3자리 이상이 아닐시
				|| passwdform.user_tel3.value.length < 4) { // tel3가 4자리가 아닐시 메시지출력
			alert(telmsg);
			passwdform.user_tel2.focus();
			return false;
		}
	}
	if (! passwdform.user_gender.value) { // 성별을 입력하지 않은경우
		alert(gendermsg);
		passwdform.user_gender.focus();
		return false;
	}
	if (passwdform.user_p_tel1.value || passwdform.user_p_tel2.value // 보호자의 전화번호를 입력하지 않은경우
			|| passwdform.user_p_tel3.value) { // 단 tel1번자리에 값이 부여되지않은경우는 바로 넘어간다
		if (passwdform.user_p_tel2.value.length < 3
				|| passwdform.user_p_tel3.value.length < 4) {
			alert(ptelmsg);
			passwdform.user_p_tel2.focus();
			return false;
		}
	}
}

// 비밀번호 입력확인
function passwdcheck() {
	if (!passwdform.passwd.value) {
		alert(passwdmsg);
		passwdform.passwd.focus();
		return false;
	}
}

//아이디 중복확인
function confirm() {
	if (!gaipform.user_id.value) {
		alert(idmsg);
		gaipform.user_id.focus();
		return;
	}
	var url = "confirm.do?id=" + gaipform.user_id.value;
	window.open(url, "confirm",
			"menubar=no, scrollbar=no, status=no, width=400, height=300");
}

// 중복 체크
function confirmcheck() {
	if (!confirmform.id.value) {
		alert(idmsg);
		confirmform.id.focus();
		return false;
	}
}

// confirm 창을 닫아주는, 아이디 중복확인에 성공했을때
function setid(id) {
	opener.document.gaipform.usercheck.value = "1";
	opener.document.gaipform.user_id.value = id;
	//window.close;
	//close;
	self.close();
}

// 회원가입
function gaipcheck() {
	if (gaipform.usercheck.value == "0") {
		alert(confirmmsg);
		gaipform.user_id.focus();
		return false;
	}
	// 아이디 입력 안했을경우 메시지 출력
	if (!gaipform.user_id.value) {
		alert(idmsg);
		gaipform.user_id.focus();
		return false;
		// 비밀번호 입력 안했을경우 메시지 출력   
	} else if (!gaipform.user_passwd.value) {
		alert(passwdmsg);
		gaipform.user_passwd.focus();
		return false;
		// 비밀번호와 확인 비밀번호가 다를경우 메시지 출력
	} else if (gaipform.user_passwd.value != gaipform.user_repasswd.value) {
		alert(repasswdmsg)
		gaipform.user_passwd.focus();
		return false;
		// 이름 입력 안했을경우 메시지 출력
	} else if (!gaipform.user_name.value) {
		alert(namemsg);
		gaipform.user_name.focus();
		return false;
	}
	// 전화번호 가 재대로 입력 안됬을시 메시지 출력
	if (gaipform.user_tel1.value || gaipform.user_tel2.value
			|| gaipform.user_tel3.value) {
		if (gaipform.user_tel1.value.length < 3
				|| gaipform.user_tel2.value.length < 3
				|| gaipform.user_tel3.value.length < 4) {
			alert(telmsg);
			gaipform.user_tel2.focus();
			return false;
		}
	}
	// 성별 선택 안하면 메시지 출력
	if (!gaipform.user_gender.value) {
		alert(gendermsg);
		gaipform.user_gender.focus();
		return false;
	}
	// 보호자 전화번호를 재대로 입력 안했을시 메시지 출력
	if (gaipform.user_p_tel1.value || gaipform.user_p_tel2.value
			|| gaipform.user_p_tel3.value) {
		if (gaipform.user_p_tel2.value.length < 3
				|| gaipform.user_p_tel3.value.length < 4) {
			alert(ptelmsg);
			gaipform.user_p_tel2.focus();
			return false;
		}
	}
}
// 유저 전화번호 오토 포커스 3글자 이상이면 다음 포커스로 넘어감
function nexttel1() {
	if (gaipform.user_tel1.value.length == 3) {
		gaipform.user_tel2.focus();
	}
}
// 유저 전화번호 오토 포커스 4글자 이상이면 다음 포커스로 넘어감
function nexttel2() {
	if (gaipform.user_tel2.value.length == 4) {
		gaipform.user_tel3.focus();
	}
}
// 보호자의 전화번호 오토 포커스 3글자 이상이면 다음 포커스로 넘어감
function pnexttel1() {
	if (gaipform.user_p_tel1.value.length == 3) {
		gaipform.user_p_tel2.focus();
	}
}
// 보호자의 전화번호 오토 포커스 4글자 이상이면 다음 포커스로 넘어감
function pnexttel2() {
	if (gaipform.user_p_tel2.value.length == 4) {
		gaipform.user_p_tel3.focus();
	}
}


// QnA 글 작성
function boardinputcheck(){
	if(! boardinputform.b_title.value){
		alert(titlemsg);
		boardinputform.b_title.focus();
		return false;
	} else if (! boardinputform.b_write.value) {
		alert(writemsg);
		boardinputform.b_write.focus();
		return false;
	}
}

// QnA 글 수정 확인
function boardmodifycheck(){
	if(! boardmodifyform.b_title.value){
		alert(titlemsg);
		boardmodifyform.b_title.focus();
		return false;
	} else if (! boardmodifyform.b_write.value) {
		alert(writemsg);
		boardmodifyform.b_write.focus();
		return false;
	}
}

// 공지사항 글 작성
function noticeinputcheck(){
	if(! noticeinputform.not_title.value){
		alert(titlemsg);
		noticeinputform.not_title.focus();
		return false;
	} else if (! noticeinputform.not_write.value) {
		alert(writemsg);
		noticeinputform.not_write.focus();
		return false;
	}
}

// 로그인 체크
function logincheck() {
	if (! idlogin.id.value) {
		alert(logidmsg);
		idlogin.id.focus();
		return false;
	} else if (!idlogin.passwd.value) {
		alert(logpasswdmsg);
		idlogin.passwd.focus();
		return false;
	}
}

function reservcheck() {
	   if(! reservform.querySelector('input[name="dr_id"]:checked').value){
	      alert(docmsg);
	      reservform.dr_id.focus();
	      return false;
	   } else if(! reservform.re_date.value) {
	      alert(datemsg);
	      reservform.re_date.focus();
	      return false;
	   }
	}


//QnA 답글 작성
function writecheck(){
	if(! boardinputform.b_title.value){
		alert(titlemsg);
		boardinputform.b_title.focus();
		return false;
	} else if (! boardinputform.b_write.value) {
		alert(writemsg);
		boardinputform.b_write.focus();
		return false;
	}
}

// 정보수정 비밀번호 확인 팝업
/*
 function modiForm() {
 window.open("./modiForm.do", "modiForm.do", "menubar=no, scrollbar=no, status=no, width=400, height=300");
 }

 function modiform(){
 opener.document.modiform.passwdcheck.value="1";
 opener.document.modiform.passwd.value = user_passwd;
 self.close();
 }
 */