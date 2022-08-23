<%@page import="hospital.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<script src="${project}/member/script.js"></script>

<%-- 수정실패 메시지 출력 --%>
<c:if test="${result == 0}">
		<script type="text/javascript">
		<!--
		alert(modifyerror);
		//-->
		</script>
		<meta http-equiv="refresh" content="0; url=hospital.do">
</c:if>

<%-- 수정 성공 후 메인으로 이동 --%>
<c:if test="${result != 0}">
	<c:redirect url="hospital.do"/>
</c:if>