<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "setting.jsp" %>
<link rel="stylesheet" href="./hospital/rere.css">
<link rel="stylesheet" href="./hospital/reserv.css">

<div style="font-size:40px; text-align:center;">
<div>
	<span><a href="hospital.do"> 메인페이지 이동 </a></span>
</div>
<span> 의사 </span>
	<div>
		<div>
			<div>
				<div>
					<div>
						<table class="usertbl" style="text-align:center;">
						<colgroup>
							<col style="width: 200px">
							<col style="width: 200px">
							<col style="width: 200px">
							<col style="width: 200px">
							<col style="width: 200px">
						</colgroup>
							<tr>
								<th>의사 아이디</th>
								<th>의사 비밀번호</th>
								<th>의사 이름</th>
								<th>의사 전화번호</th>
								<th>의사 진료과목</th>
							</tr>
							<c:forEach var="rows" items="${doctorlist}">
							<tr>
								<td>${rows.dr_id}</td>
								<td>${rows.dr_passwd}</td>
								<td>${rows.dr_name}</td>
								<td>${rows.dr_tel}</td>
								<td>${rows.dr_major}</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<div style="font-size:40px;">
		<span> 유저 </span>
		<div>
			<div>
				<div>
					<div style="margin-bottom:40px;">
						<table class="usertbl" style="text-align:center;">
							<colgroup>
								<col style="width: 200px">
								<col style="width: 200px">
								<col style="width: 200px">
								<col style="width: 200px">
								<col style="width: 200px">
								<col style="width: 200px">
								<col style="width: 200px">
								<col style="width: 200px">
							</colgroup>
							<tr>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>성별</th>
								<th>기저질환</th>
								<th>보호자 이름</th>
								<th>보호자 전화번호</th>	
							</tr>
							<c:forEach var="row" items="${userlist}">
							<tr>
								<td>${row.user_id}</td>
								<td>${row.user_passwd}</td>
								<td>${row.user_name}</td>
								<td>${row.user_tel}</td>
								<td>${row.user_gender}</td>
								<td>${row.user_dis}</td>
								<td>${row.user_p_name}</td>
								<td>${row.user_p_tel}</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>