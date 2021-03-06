/*!
 * Start Bootstrap - SB Admin 2 v4.0.7 (https://startbootstrap.com/template-overviews/sb-admin-2)
 * Copyright 2013-2019 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap-sb-admin-2/blob/master/LICENSE)
 */

/*!
 * Bootstrap v4.3.1 (https://getbootstrap.com/)
 * Copyright 2011-2019 The Bootstrap Authors
 * Copyright 2011-2019 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 */
$(function(){
	
	var _browser = $("#BROWSER").val();
	
	var _logoSmall = null;
	
	var _logoBig = null;
	
	
	_logoSmall = location.pathname.indexOf('pop')>0 || location.pathname.indexOf('dashboard')>0 ? "url('../../resources/images/geumcheongu_logo_small.jpg')" : "url('../resources/images/geumcheongu_logo_small.jpg')";
	if(_browser == 'MSIE'){
	
		//_logoSmall = location.pathname.indexOf('pop')>0 || location.pathname.indexOf('dashboard')>0 ? "url('../../resources/images/geumcheongu_logo_small.jpg')" : "url('../resources/images/geumcheongu_logo_small.jpg')";
		_logoBig = location.pathname.indexOf('pop')>0 || location.pathname.indexOf('dashboard')>0 ? "url('../../resources/images/geumcheongu_logo_ie.jpg')" : "url('../resources/images/geumcheongu_logo_ie.jpg')";
	}else{
		//_logoSmall = location.pathname.indexOf('pop')>0 || location.pathname.indexOf('dashboard')>0 ? "url('../../resources/images/geumcheongu_logo_small.jpg')" : "url('../resources/images/geumcheongu_logo_small.jpg')";
		_logoBig = location.pathname.indexOf('pop')>0 || location.pathname.indexOf('dashboard')>0 ? "url('../../resources/images/geumcheongu_logo.jpg')" : "url('../resources/images/geumcheongu_logo.jpg')";
	}
	
	   
	

	  // Toggle the side navigation
	$("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
		$("body").toggleClass("sidebar-toggled");
		$(".sidebar").toggleClass("toggled");
		if ($(".sidebar").hasClass("toggled")) {
			$('.sidebar .collapse').collapse('hide');
			
			$("#logo").css('background-image', _logoSmall)
			
			$("#logo").css('background-size', '104px')
		}else{
			//console.log($(window).width())
			if ($(window).width() < 768) {
				$('.sidebar .collapse').collapse('hide');
								
				$("#logo").css('background-image', _logoSmall)
				$("#logo").css('background-size', '104px')
				

			}else{
					
				$("#logo").css('background-image', _logoBig)
				$("#logo").css('background-size', '224px')
			}
		}
		;
	});
	
	

	// Close any open menu accordions when window is resized below 768px
	$(window).resize(function() {
		if ($(window).width() < 768) {
			
			$('.sidebar .collapse').collapse('hide');
			
			if($("#accordionSidebar").css('width').replace('px', '') <= '104'){
				$("#logo").css('background-image', _logoSmall)
				$("#logo").css('background-size', '104px')
			}else{
				$("#logo").css('background-image', _logoBig)
				$("#logo").css('background-size', '224px')
			}
			


		}else{

			$("#logo").css('background-image', _logoBig)
			$("#logo").css('background-size', '224px')
		}
		;
	});

	// Prevent the content wrapper from scrolling when the fixed side navigation hovered over
	$('body.fixed-nav .sidebar').on(
			'mousewheel DOMMouseScroll wheel',
			function(e) {
				if ($(window).width() > 768) {
					var e0 = e.originalEvent, delta = e0.wheelDelta
							|| -e0.detail;
					this.scrollTop += (delta < 0 ? 1 : -1) * 30;
					e.preventDefault();
				}
			});

	// Scroll to top button appear
	$(document).on('scroll', function() {
		var scrollDistance = $(this).scrollTop();
		if (scrollDistance > 100) {
			$('.scroll-to-top').fadeIn();
		} else {
			$('.scroll-to-top').fadeOut();
		}
	});

	// Smooth scrolling using jQuery easing
	$(document).on('click', 'a.scroll-to-top', function(e) {
		var $anchor = $(this);
		$('html, body').stop().animate({
			scrollTop : ($($anchor.attr('href')).offset().top)
		}, 1000, 'easeInOutExpo');
		e.preventDefault();
	});
	
	///////////////////////////////////////////////////////
	/*	???	???	*/
	var _teamType = $("#team_type").val();
	var _menuPre = null;
	
	if(_teamType == '3'){
		_menuPre = "apt";
	}else if(_teamType == '4'){
		_menuPre = "bld";
	}else if(_teamType == '2'){
		_menuPre = "org"
			
	}
	
	
	var _mainMenu = $("#mainMenu").val();
	var _subMenu = $("#subMenu").val();
	
	if ($(window).width() > 768) {
		$("li."+ _menuPre + "-" + _mainMenu).addClass('active');	//	main active
		
		$("#sub-"+ _subMenu).addClass('active');		//	sub active
		
		$("#"+_menuPre+"-" +_mainMenu).addClass('show');		//	main show
		
	}else{
		$("li."+ _menuPre + "-" + _mainMenu).addClass('active');	//	main active
		$("#sub-"+ _subMenu).addClass('active');		//	sub active
	}
	
	//////////////////////////////////////////////////
	
	/*	??? ??? ??? ???	*/
	$(".logoutBtn").on('click', function(){
	 	$("#logoutModal").modal('show');
	})
	
	/*	??? ??? ???	*/
	$("#loginBtn").on('click', function(){
		if(enernet.modules.utils.isNullById("adminId")){
			
			$("#loginModalLabel").text("???????????? ?????????????????? ????????????");
			$("#loginModal").modal('show');
			return $("#adminId").focus();
		}
		
		if(enernet.modules.utils.isNullById("adminPwd")){
			//alert('??????????????? ?????????????????? ????????????');
			$("#loginModalLabel").text("??????????????? ?????????????????? ????????????");
			$("#loginModal").modal('show');
			return $("#adminPwd").focus();
		}
		
		$("#loginForm").submit();
		
	});
	
	
	if(document.getElementById("adminId") != null){
		$("#adminId").on('keyup', function(e){
			if(e.keyCode == 13){
				if(enernet.modules.utils.isNullById("adminId")){
					
					$("#loginModalLabel").text("???????????? ?????????????????? ????????????");
					$("#loginModal").modal('show');
					return $("#adminId").focus();
				}else{
					$("#adminPwd").focus();
				}
			}
		});
		
		$("#adminPwd").on('keyup', function(e){
			if(e.keyCode == 13){
				if(enernet.modules.utils.isNullById("adminPwd")){
					//alert('??????????????? ?????????????????? ????????????');
					$("#loginModalLabel").text("??????????????? ?????????????????? ????????????");
					$("#loginModal").modal('show');
					return $("#adminPwd").focus();
				}else{
					$("#loginBtn").click();
				}
			}
		});
		
		if($("#result_code").val() == "0"){
			$("#loginModalLabel").html("???????????? ?????????????????????. <br> ???????????? ??????????????? ?????????????????? ????????????.");
			$("#loginModal").modal('show');
		}
	}
	
	
	
	if(document.getElementById('time-span') != undefined){
		//	??????	??????
		////	?????? ??????
		getTimeStampHHmm();
		
		setInterval(getTimeStampHHmm,6000);
	}

	function getTimeStampHHmm(){
		$("#time-span").text(enernet.modules.utils.getTimeStampHHmm()); 
	}
	
	
	
	//	tooltip
	$('[data-toggle="tooltip"]').tooltip();

	// Enable Bootstrap popovers via data-attributes globally
	$('[data-toggle="popover"]').popover();

	$(".popover-dismiss").popover({
	  trigger: "focus"
	});
	
});




