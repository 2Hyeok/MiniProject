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
			opener.reservdeleteFrom = null;
			
			self.close();
		}
	}
</script>

</head>
<html>
<body>
   <div class="re_form_re">
		<form name="passwdform" method="post" action="reservdeletePro.do"
			onsubmit="return passwdcheck()" target="userreservcheck.do">
			<input type="hidden" name="re_num" value="${re_num}">
			<input type="hidden" name="user_id" value="${memId}">
			<div>
				<div class="box1">
					<p>취소 하시겠습니까?</p>
				</div>
				<div>
					<div>
						<input class="inputbutton" type="submit" value="예약취소" onclick="window.close()">
						<input class="inputbutton" type="button" value="취소"
							onclick="window.close()">
					</div>
				</div>
			</div>
		</form>
   </div>
</body>
</html>