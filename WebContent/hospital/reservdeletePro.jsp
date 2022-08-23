<%@page import="reserv.ReservDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="HospitalWeb/hospital/script.js"></script>

<c:if test="${resultCheck == 0}">
   <script type="text/javascript">
      <!--
      erroralert(passwderror);
      //-->
   </script>
</c:if>
<c:if test="${resultCheck != 0}">
      <c:if test="${result == 0}">
         <script type="text/javascript">
         <!--
         alert(deleteerror);
         //-->
         </script>
         <meta http-equiv="refresh" content="0; url=hospital.do">
      </c:if>
   <c:if test="${result != 0}">
      <c:redirect url="userreservcheck.do"/>
   </c:if>
</c:if>
