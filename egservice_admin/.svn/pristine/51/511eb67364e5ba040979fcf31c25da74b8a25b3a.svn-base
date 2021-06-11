$(function(){
	var _teamType = $("#team_type").val();
	var _menuPre = "apt";



	var _mainMenu = $("#mainMenu").val();
	var _subMenu = $("#subMenu").val();

//	console.log(_mainMenu)
	
	if ($(window).width() > 768) {
		$("li."+ _menuPre + "-" + _mainMenu).addClass('active');	//	main active
		
		$("#sub-"+ _subMenu).addClass('active');		//	sub active
		
		$("#"+_menuPre+"-" +_mainMenu).addClass('show');		//	main show
		
	}else{
		$("li."+ _menuPre + "-" + _mainMenu).addClass('active');	//	main active
		$("#sub-"+ _subMenu).addClass('active');		//	sub active
	}
});