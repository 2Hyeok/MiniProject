<%@page import="hospital.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="HospitalWeb/hospital/script.js"></script>

<h2>${page_modify}</h2>

<c:if test="${result == 0}">
		<script type="text/javascript">
			<!--
			alert(modifyerror);
			//-->
		</script>
		<meta http-equiv="refresh" content="0; url=board.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="board.do?pageNum=${pageNum}"/>
</c:if>