<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>melon Chart</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="js/all.min.js"></script>
</head>
<body>
	<hr style="border-style: solid; border-width: 3px; border-color: limegreen;" />

	<div class="container ">
		<div class="row text-center align-items-center" style="height: 50vh;">
			<div class="col">
				<div style="padding-bottom: 10px; padding-top: 50px">
					<a href="/" title="Melon 메인"> <img src="https://cdnimg.melon.co.kr/resource/image/web/member/img_logo206x56.png" width="206" height="56" />
					</a>
				</div>
				<div style="border-style: solid; border-width: 1px; border-color: silver;" class="p-5 m-5">
					<form class="was-validated">
						<div class="form-group">
							<label class="float-left">아이디:</label> <input type="text" class="form-control" onkeyup="keyCount('username')" id="username" placeholder="Enter ID" required="required" maxlength="15" /> 
							<span id="usernamecount">0/15</span>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="form-group">
							<label class="float-left">비밀번호:</label> <input type="password" class="form-control" placeholder="Enter Password" id="password" required="required" maxlength="20" />
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="form-group">
							<label class="float-left">이름:</label> <input type="text" class="form-control" placeholder="Enter Name" id="name" required="required" maxlength="10" />
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="form-group">
							<label class="float-left">이메일:</label> <input type="email" class="form-control" placeholder="Enter Email" id="email" required="required" maxlength="20" />
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
					</form>

					<div>
						<button id="join--submit" class="btn" style="background-color: limegreen; width: 390px; height: 60px;">
							<span style="color: white; font-size: 18px">회원가입</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#join--submit').on('click', function() {

			var data = {
				username : $('#username').val(),
				password : $('#password').val(),
				name : $('#name').val(),
				email : $('#email').val()
			};

			$.ajax({
				type : 'POST',
				url : '/user/join',
				data : JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				dataType : 'json'
			}).done(function(r) {
				if (r.statusCode == 200) {
					alert('회원가입 성공');
					location.href = '/user/login';
				} else {
					if (r.msg == '아이디중복') {
						alert('아이디가 중복되었습니다.');
					}
					alert('회원가입 실패');
				}
			}).fail(function(r) {
				alert('회원가입 실패');
			});
		});
		function keyCount(field) {
			let strLength = $('#' + field).val().length;
			let maxlength = $('#' + field).attr('maxlength');
			field+="count";
			console.log(field);
			$('#'+field).innerHTML = strLength + '/' + maxlength;
		}
	</script>