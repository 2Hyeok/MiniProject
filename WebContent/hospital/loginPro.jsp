<%@page import="hospital.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="./hospital/script.js"></script>

<%-- 아이디가 저장된 값이 없을경우 메시지출력 --%>
<c:if test="${result eq -1}">
     <script type="text/javascript">
        <!--
        erroralert( iderror )
        //-->
     </script>
</c:if>

<%-- 비밀번호가 저장된 값과 일치하지 않을경우 메시지출력 --%>
<c:if test="${result eq 0}">
	<script type="text/javascript">
	<!--
	erroralert( passwderror )
	//-->
	</script>
</c:if>

<%-- 아이디와 비밀번호가 일치할 시 성공후 메인페이지 이동후 세션에 아이디값 저장 --%>
<c:if test="${result eq 1}">
	${sessionScope.memId = id}
	<c:redirect url="hospital.do"/>
</c:if>