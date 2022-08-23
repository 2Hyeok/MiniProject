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
			opener.boarddeleteForm = null;
			
			self.close();
		}
	}
</script>
</head>
<%-- 정보수정을위한 비밀번호 입력 폼 --%>
<html>
<body>
	<div class="re_form_re">
		<form class="re_form_form" name="passwdform" method="post" action="boarddeletePro.do"
			onsubmit="return passwdcheck()" target="board.do">
			<input type="hidden" name="b_no" value="${b_no}">
			<input type="hidden" name="id" value="${memId}">
			<input type="hidden" name="id1" value="${docId}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<div>
				<div class="box1">
					<p>삭제 하시겠습니까?</p>
				</div>
				<div>
					<div>
						<input class="inputbutton" type="submit" value="삭제하기" onclick="window.close()">
						<input class="inputbutton" type="button" value="취소"
							onclick="window.close()">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>