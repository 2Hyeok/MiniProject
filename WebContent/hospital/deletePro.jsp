<%@page import="hospital.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}/hospital/script.js"></script>

<%-- 비밀번호 틀렸을시 인증 실패 --%>
<c:if test="${resultCheck eq 0}">
	<script type="text/javascript">
	<!--
	erroralert(passwderror);
	//-->
	</script>
</c:if>

<%-- 회원 탈퇴 실패시 메시지 출력 --%>
<c:if test="${resultCheck ne 0}">
	<c:if test="${result eq 0}">
		<script type="text/javascript">
		<!--
		 alert(deleteerror);
		//-->
		</script>
		<meta http-equiv="refresh" content="0; url=hospital.do"/>
	</c:if>
	
	<%-- 비밀번호 인증 성공 회원탈퇴 진행 --%>
	<c:if test="${result ne 0}">
		<!-- ${sessionScope.memId=null}  -->
		<c:remove var="memId" scope="session"/> 
		<c:redirect url="hospital.do"/>
	</c:if>
</c:if>
