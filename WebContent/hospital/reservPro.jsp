<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		erroralert(inputerror);
		//-->
	</script>
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="hospital.do"/>
</c:if>