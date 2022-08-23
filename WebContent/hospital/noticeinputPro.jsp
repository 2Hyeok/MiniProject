<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
        alert( inserterror );
        //-->
	</script>
	<meta http-equiv="refresh" content="0; url=notice.do">
</c:if>
<c:if test="${result != 0}">
		<c:redirect url="notice.do"/>
</c:if>