<%@page import="hospital.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}/hospital/script.js"></script>
<link rel="stylesheet" href="./hospital/confirm.css">

<%--아이디가 없을경우 이 아이디 사용가능 --%>
<c:if test="${result eq 0}">
	<div class="confirmid">
		<div>
			<div class="box">
				<span>${id}</span>${msg_confirm_o}	
			</div>
			<div>
				<input class="inputbutton" type="button" value="확인" onclick="setid('${id}')">
			</div>
		</div>
	</div>
</c:if>

<%-- 아이디가 있을경우, 이 아이디 사용 불가 --%>
<c:if test="${result ne 0}">
	<form method="post" name="confirmform" action="confirm.do" onsubmit="return confirmcheck()">
	<div class="confirmid">
		<div>
			<div class="box">
				<span>${id}</span>${msg_confirm_x}	
			</div>
			<div>
				<input class="input" type="text" name="id" autofocus placeholder="아이디 재입력">
			</div>
			<div>
				<input class="inputbutton1" type="submit" value="확인">
				<input class="inputbutton1" type="button" value="취소"
					onclick="window.close()">
			</div>
		</div>
	</div>
	</form>
</c:if>