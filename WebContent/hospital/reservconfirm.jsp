<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="${project}/hospital/script.js"></script>
<link rel="stylesheet" href="./hospital/confirm.css">
</head>

<html>
<body>
	<c:if test="${result eq 0}">
		<div class="re_form_re">
			<form class="re_form_form" method="post" name="reservconfirmform"
				action="reservPro.do" onsubmit="return reservconfirmcheck()">
				<div class="confirmid">
					<div>
						<div class="box">
							<span>예약이 가능합니다.</span><br> <span>예약을 진행하시겠습니까?</span>
						</div>
						<div>
							<input type="hidden" name="re_num" value="${re_num}">
							<input
								type="hidden" name="dr_id" value="${dr_id}"> 
								<input type="hidden" name="user_id" value="${user_id}">
								<input type="hidden" name="re_date" value="${re_date}">
								<input type="hidden" name="re_time" value="${re_time}"> 
								<input type="hidden" name="re_col" value="${re_col}" maxlength="200"> 
								<input class="inputbutton1" type="submit" value="확인"> 
								<input class="inputbutton1" type="button" value="취소"
								onclick="location='reserv.do'">
						</div>
					</div>
				</div>
			</form>
		</div>
	</c:if>

	<%-- 아이디가 있을경우, 이 아이디 사용 불가 --%>
	<c:if test="${result ne 0}">
		<div class="re_form_re">
			<form class="re_form_form" name="cancleform">
				<div class="box">
					<span>이미 예약이 완료 되어있습니다</span><br>
					<span>예약을 취소하신 후 다시 이용해 주시기 바랍니다.</span>
				</div>
				<div></div>
				<div>
					<input class="inputbutton1" type="button" value="확인"
						onclick="location='reserv.do'">
				</div>
			</form>
		</div>
	</c:if>
</body>
</html>