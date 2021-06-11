$(document).ready(function(){
	var menuName = $("#menuName").val();
	
	$("#"+menuName).addClass('mn_type1');
	
	//	timeForm 이 없으면 실행 하지 않음
	if(document.getElementById('time') != undefined){
		//	타임	설정
		function getTimeStampHHmm(){
			document.getElementById('time').value = enernet.modules.utils.getTimeStampHHmm(); 
		}
		
		////	최초 실행
		getTimeStampHHmm();
		
		setInterval(getTimeStampHHmm,6000);
	}
	
	//
	
	$("#popBldHomeLink").on('click', function(){
		$("#hiddenForm").attr('action', '../org/popBldHome');
		$("#hiddenForm").attr('method', 'post');
		$("#hiddenForm").submit();
	})
	
	
	$("#popBldUsageLink").on('click', function(){
		$("#hiddenForm").attr('action', '../org/popBldUsage');
		$("#hiddenForm").attr('method', 'post');
		$("#hiddenForm").submit();
	})
	
	
});