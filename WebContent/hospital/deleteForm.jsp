<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="${project}/hospital/script.js"></script>
<link rel="stylesheet" href="./hospital/confirm.css">
<script>
	// 자동으로 창이 닫히게 하는 함수
	function popupClose(form) {
		// target은 부모로 설정
		form.target = opener.name;
		
		form.submit();
		
		if(opener != null) {
			opener.userdeleteForm = null;
			
			self.close();
		}
	}
</script>
</head>

<html>
<body>
	<div class="re_form_re">
		<form class="re_form_form" name="passwdform" method="post"
			action="deletePro.do" onsubmit="return passwdcheck()" target="hospital.do">
			<div>
				<div class="box1">
					<p>비밀번호 입력</p>
					<input class="input" type="password" name="passwd" maxlength="30"
						autofocus>
				</div>
				<div>
					<div>
						<input class="inputbutton1" type="submit" value="탈퇴하기" onclick="window.close()">
						<input class="inputbutton1" type="button" value="취소"
							onclick="window.close()">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
