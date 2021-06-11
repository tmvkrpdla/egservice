<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>login</title>

	<link href="./resources/sb-admin/css/sb-admin-2.css" rel="stylesheet">
	<link href="./resources/vendor/fontawesome-free/css/all.css" rel="stylesheet">
	
		 
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	
	<script src="./resources/vendor/jquery-easing/jquery.easing.js"></script>
	
	
	<script src="./resources/sb-admin/js/sb-admin-2.js"></script>
	<script src="./resources/admin/common/js/enernet_utils.js"></script>
	<script src="./resources/admin/common/js/enernet_evt.js"></script>
	<script src="./resources/admin/common/js/enernet_common.js"></script>
	<!-- <script src="./resources/admin/login/js/login.js"></script> -->
	
</head>


<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false' class="bg-primary">
	<input type="hidden" value="${result_code}" id="result_code">
	
	<div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center" style="text-align:center;background-color: white;">
                                    	<h3 class="font-weight-light my-4">	
                                    		<img src="./resources/images/enernet_logo.png" style="width:250px;" alt="logo">
                                    	</h3>
                                    </div>
                                    <div class="card-body">
                                        <form id="loginForm" action="<c:url value='./login/proc'/>" method="post">
                                            <div class="form-group">
                                            	<label class="small mb-1" for="adminId">아이디</label>
                                            		<input class="form-control py-4" id="adminId" name="adminId" type="text" placeholder="아이디">
                                            </div>
                                            <div class="form-group">
                                            	<label class="small mb-1" for="adminPwd">비밀번호</label>
                                            	<input class="form-control py-4" id="adminPwd" name="adminPwd" type="password" placeholder="비밀번호">
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                	<!-- <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox"><label class="custom-control-label" for="rememberPasswordCheck">Remember password</label> -->
                                                </div>
                                            </div>
                                            <div class="form-group   justify-content-between mt-4 mb-0">
                                            	<!-- <a class="small" href="password-basic.html">Forgot Password?</a>
                                            	<a class="btn btn-primary" href="index.html">Login</a> -->
                                            	<input type="button" class="btn btn-primary float-right" id="loginBtn" value="Login">
                                            	
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center" style="background-color:white;">
<!--                                         <div class="small"><a href="register-basic.html">Need an account? Sign up!</a></div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <!-- <div id="layoutAuthentication_footer">
                <footer class="footer mt-auto footer-dark">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 small">Copyright © Your Website 2020</div>
                            <div class="col-md-6 text-md-right small">
                                <a href="#!">Privacy Policy</a>
                                ·
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div> -->
        </div>
        
        <!-- Modal -->
		<div id="loginModal" class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="loginModalLabel"></h5>
		                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
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
