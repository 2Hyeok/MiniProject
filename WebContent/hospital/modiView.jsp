<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hospital.LogonDataBean"%>
<%@page import="hospital.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="./hospital/script.js"></script>
<link rel="stylesheet" href="./hospital/gaip.css">
<title>강남비트병원</title>
</head>

<%-- 비밀번호 인증 실패 --%>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		erroralert(passwderror);
		//-->>
	</script>
</c:if>

<%-- 비밀번호 인증 성공 수정 폼 이동 --%>
<c:if test="${result ne 0}">
	<body>
		<div class="gaip">
			<div class="gaip2">
				<div class="logo_click">
					<a href="hospital.do"><img src="./img/logo2.png" width="300"
						height="130"></a>

				</div>
				<form class="gaipform" name="passwdform" action="modiPro.do"
					onsubmit="return modicheck()">
					<input type="hidden" name="usercheck" value="0">
					<div>
						<div>
							<fieldset>
								<div class="buttonconf">
									<p>아이디</p>
									<input class="form_3" type="text" name="user_id"
										value="${dto.user_id}" readonly>
								</div>
								<div>
									<p>비밀번호</p>
									<input class="form_3" type="password" name="user_passwd"
										maxlength="30">
								</div>
								<div>
									<p>비밀번호 재입력</p>
									<input class="form_3" type="password" name="user_repasswd"
										maxlength="30">
								</div>
								<div>
									<p>이름</p>
									<input class="form_3" type="text" name="user_name"
										value="${dto.getUser_name()}" readonly>
								</div>
								<div class="form_34">
									<p>휴대폰 번호</p>
									<div class="form_45">
										<select class="form_4" name="user_tel1" onkeyup="nexttel1()">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										<c:if test="${dto.user_tel == null or dto.user_tel == ''}">
											<input class="form_5" type="text" name="user_tel2"
												maxlength="4" onkeyup="pnexttel2()">
											<input class="form_5" type="text" name="user_tel3"
												maxlength="4" onkeyup="pnexttel3()">
										</c:if>
										<c:if test="${dto.user_tel != null and dto.user_tel != ''}">
											<c:set var="t" value="${fn:split(dto.user_tel, '-')}" />
											<input class="form_5" type="text" name="user_tel2"
												maxlength="4" onkeyup="pnexttel2()" value="${t[1]}"
												oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
											<input class="form_5" type="text" name="user_tel3"
												maxlength="4" onkeyup="pnexttel3()" value="${t[2]}"
												oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
										</c:if>
									</div>
									<div class="sax">
										<p>성별</p>
										<div>
											<select class="sax2" name="user_gender">
												<option value="">성별</option>
												<option value="남">남</option>
												<option value="여">여</option>
											</select>
										</div>
									</div>
									<div>
										<p>기저질환</p>
										<input class="form_3" type="text" name="user_dis"
											value="${dto.getUser_dis()}" maxlength="30">
									</div>
									<div>
										<p>보호자 이름</p>
										<input class="form_3" type="text" name="user_p_name"
											value="${dto.getUser_p_name()}" maxlength="30">
									</div>
									<div>
										<p>보호자 전화번호</p>
										<div class="form_45">
										<c:if test="${dto.user_p_tel == null or dto.user_p_tel == ''}">
											<select class="form_4" name="user_p_tel1" onkeyup="pnexttel1()">
												<option value="">선택</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
											<input class="form_5" type="text" name="user_p_tel2"
												maxlength="4" onkeyup="pnexttel2()">
											<input class="form_5" type="text" name="user_p_tel3"
												maxlength="4" onkeyup="pnexttel3()">
										</c:if>
										<c:if test="${dto.user_p_tel != null and dto.user_p_tel != ''}">
											<input class="form_4_1" name="user_p_tel1" value="${t[0]}" maxlength="3" readonly>
											<c:set var="t" value="${fn:split(dto.user_p_tel, '-')}" />
											<input class="form_5" type="text" name="user_p_tel2"
												maxlength="4" onkeyup="pnexttel2()" value="${t[1]}"
												oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
											<input class="form_5" type="text" name="user_p_tel3"
												maxlength="4" onkeyup="pnexttel3()" value="${t[2]}"
												oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
										</c:if>
										</div>
									</div>
								</div>
						</div>
						</fieldset>
					</div>

					<div>
						<div class="gaga">
							<ul>
								<li><input class="inputbutton" type="submit" value="수정"></li>
								<li><input class="inputbutton" type="button" value="취소"
									onclick="location='hospital.do'"></li>
								<!--reset으로 넣어얗하나? -->
							</ul>
						</div>
						<br>
						<br>
						<br>
					</div>
				</form>
			</div>
		</div>

	</body>
</c:if>