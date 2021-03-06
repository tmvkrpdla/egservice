<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>login</title>

<link href="./resources/vendor/fontawesome-free/css/all.css" rel="stylesheet">

<!-- matrix-admin-bt4로 로그인 폼 가운데 정렬 -->
<link href="./resources/matrix-admin-bt4/css/style.css" rel="stylesheet">
<link href="./resources/matrix-admin-bt4/css/style-custom.css" rel="stylesheet">
<link href="./resources/sb-admin/css/sb-admin-2.css" rel="stylesheet">

<script src="./resources/vendor/jquery/jquery.min.js"></script>
<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="./resources/vendor/jquery-easing/jquery.easing.js"></script>
<script src="./resources/sb-admin/js/sb-admin-2.js"></script>
<script src="./resources/admin/common/js/enernet_utils.js"></script>
<script src="./resources/admin/common/js/enernet_common.js"></script>
<!-- <script src="./resources/common/js/common.js"></script> -->

<script type="text/javascript">
	$(function() {
		var _login_code = '${result_code}';
		console.log("_login_code = ", _login_code);
		if (_login_code == '0') {
			$("#loginModalLabel").html("로그인에 실패하였습니다. <br> 아이디와 비밀번호를 확인해주시기 바랍니다.");
			$("#loginModal").modal('show');
		}

	})
</script>

<link rel="icon" type="image/png" sizes="16x16" href="./resources/images/favicon-green.png"> <!-- 파비콘 -->
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">

</head>


<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<input type="hidden" value="${ISLOGIN}" id="ISLOGIN">

	<div class="main-wrapper">

		<!-- <div class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-dark"> -->
		<div class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-blue">
			<!-- <div class="auth-box bg-dark border-top border-secondary"> -->
			<div class="auth-box border-top bg-blue">

				<!-- Form -->

				<div class="row p-b-30">
					<div class="col-12">
						<div class="justify-content-center card-head-center">
							<h3 class="font-weight-light my-4">
								<img src="./resources/images/geumcheongu_logo.png" style="width: 250px;" alt="logo">
							</h3>
						</div>

						<br>
						<form id="loginForm" action="<c:url value='./login/proc'/>" method="post">
							<div class="form-group">
								<label class="small mb-1" for="adminId">아이디</label> 
								<input class="form-control" id="adminId" name="adminId" type="text" placeholder="아이디" style="height: 50px;">
							</div>
							<div class="form-group">
								<label class="small mb-1" for="adminPwd">비밀번호</label> 
								<input class="form-control" id="adminPwd" name="adminPwd" type="password" placeholder="비밀번호" style="height: 50px;">
							</div>
							<div class="form-group">
								<div class="custom-control custom-checkbox">
									<!-- <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox"><label class="custom-control-label" for="rememberPasswordCheck">Remember password</label> -->
								</div>
							</div>
							
							<div class="form-group   justify-content-between mt-4 mb-0">
								<!-- <a class="small" href="password-basic.html">Forgot Password?</a>
	                                       	<a class="btn btn-primary" href="index.html">Login</a> -->
								<div class="card-footer text-center" style="background-color: white;">
									<!--  <div class="small"><a href="register-basic.html">Need an account? Sign up!</a></div> -->
								</div>
								<input type="button" class="btn btn-primary float-right" id="loginBtn" value="Login">
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>

	</div>

	<!-- Modal -->
	<div id="loginModal" class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel"></h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<!-- <div class="modal-body">...
	            </div> -->
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
					<!-- <button class="btn btn-primary" type="button">Understood</button> -->
				</div>
			</div>
		</div>
	</div>

</body>

</html>
