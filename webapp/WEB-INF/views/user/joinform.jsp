<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/assets/css/user.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script>
$(function() {
	$("input[type='button']").click(function() {
		var email = $("#email").val();
		
		if (email == "") {
			return;
		} 
		
		$.ajax({
			url: "${pageContext.request.contextPath }/user/api/checkemail?email="+email,
			type: "get",
			dataType: "json",
			data: "",
			success: function(response) {
				if (response.result == "fail") {
					console.error(response.message);
					return;
				}
				
				if (response.data == false) {
					alert("사용중");
					$("#email").val("");
					$("#email").focus();
					return;
				}
			},
			error: function(jqXHR, status, error) {
				console.log(status+":"+error);
			}
		});
	});
})
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
		<div id="content">
			<div id="user">

				<form:form modelAttribute ="userVo" id="join-form" name="joinForm" method="post"
					action="${pageContext.request.contextPath }/user/join">
					<label class="block-label" for="name">이름</label> <input id="name"
						name="name" type="text" value="">
						<p style="text-align:left;color:red;" >
					<form:errors path="name" />
					</p>

					<label class="block-label" for="email">이메일</label> <input
						id="email" name="email" type="text" value=""> <input
						type="button" value="id 중복체크"> <label class="block-label">패스워드</label>
					<form:errors path="name" />
					<input name="password" type="password" value="">

					<fieldset>
						<legend>성별</legend>
						<label>여</label> <input type="radio" name="gender" value="FEMALE"
							checked="checked"> <label>남</label> <input type="radio"
							name="gender" value="MALE">
					</fieldset>

					<fieldset>
						<legend>약관동의</legend>
						<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
						<label>서비스 약관에 동의합니다.</label>
					</fieldset>

					<input type="submit" value="가입하기">

				</form:form>
			</div>
		</div>
		<div id="navigation">
			<ul>
				<li><a href="">안대혁</a></li>
				<li><a href="">방명록</a></li>
				<li><a href="">게시판</a></li>
			</ul>
		</div>
		<div id="footer">
			<p>(c)opyright 2015</p>
		</div>
	</div>
</body>
</html>