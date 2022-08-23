<%@page import="hospital.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file = "setting.jsp" %>
<script src="./hospital/script.js"></script>

<c:if test="${result eq 0}"> <%-- 회원가입 실패 --%>
	<script type="text/javascript">
	<!-- 
	erroralert(inputerror);	
	-->
	</script>
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="hospital.do"/>
</c:if>