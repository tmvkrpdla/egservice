$(document).ready(function(){
	
	//	초기 토글 셋팅
	$('#todayUsageToggle').bootstrapToggle({
		size : 'small'
	});	
	
    $('#monthUsageToggle').bootstrapToggle({
    	size : 'small'
    });
    
    $('#yearUsageToggle').bootstrapToggle({
    	size : 'small'
    });
    
    $('#timeUsage').bootstrapToggle({
    	size : 'small'
    });
 
    $("#todayUsageStr").on('change', function(){
		numberComma(this, "todayUsage");
	});
	
    $("#monthUsageStr").on('change', function(){
		numberComma(this, "monthUsage");
	});
    
    $("#yearUsageStr").on('change', function(){
		numberComma(this, "yearUsage");
	});
    
    
    //	알람 설정
	$("#alarmSetBtn").on('click', function(){
		if(confirm('설정을 저장 하시겠습니까?')){
			var _todayNoti = isCheckedTrue( $("#todayUsageToggle").prop('checked'));	//	오늘 사용량 초과 알림 설정 on/off
			var _monthNoti = isCheckedTrue( $("#monthUsageToggle").prop('checked'));	//	이번달 사용량 초과 알림 on/off
			var _yearNoti  = isCheckedTrue( $("#yearUsageToggle").prop('checked'));		//	이번년도 사용량 초과 알림 on/off
			var _timeNoti  = isCheckedTrue ($("#timeUsage").prop('checked'));			//	정시 사용량 알림
			
			var _notiTypeSelect = $("#notiTypeSelect").val();
			var _notiHourSelect = $("#notiHourSelect").val();
			
			var _todayUsage = $("#todayUsage").val();				//	오늘 사용량 초과 알림
			if(_todayUsage == ''){
				_todayUsage = 0;
				$("#todayUsage").val(0);
			}else{
				if(enernet.modules.utils.isFirstZero(_todayUsage)){
					return alert('오늘 사용량 초과 알림의 첫 번째 숫자가 0입니다.');
				}
				 
			}
			
			var _monthUsage = $("#monthUsage").val();
			if(_monthUsage == ''){
				_monthUsage = 0;
				$("#monthUsage").val(0);
			}else{
				if(enernet.modules.utils.isFirstZero(_monthUsage)){
					return alert('이번달 사용량 초과 알림의 첫 번째 숫자가 0입니다.');
				}
			}
			
			var _yearUsage = $("#yearUsage").val();
			if(_yearUsage == ''){
				_yearUsage = 0;
				$("#yearUsage").val(0);
				
			}else{
				if(enernet.modules.utils.isFirstZero(_yearUsage)){
					return alert('이번년도 사용량 초과 알림의 첫 번째 숫자가 0입니다.');
				}
			}
			
						
			var _result = enernet.modules.api.changeAdminSettingsAsyncData( $("#seq_admin").val(), _todayNoti, 
					_monthNoti, _yearNoti, _timeNoti,  _todayUsage, _monthUsage, _yearUsage, _notiTypeSelect, _notiHourSelect);
			
			if(_result.result_code == 1){
				alert("저장에 성공하였습니다");
				
				location.href = "../bld/setAlarm"; 
					
				
			}else{
				//console.log(_result);
			}
			
		}
	});
    
    
	
	function numberComma(target, hiddenTarget){
		var _temp = $(target).val().replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
		 _temp = _temp.replace(/,/g,'');          // ,값 공백처리
		 
		 /*
		 //맨 앞 0일시 삭제
		 if(_temp.length>1){
			 _temp = _temp.replace(/(^0+)/,"");
		 }
		 */
		 
		 $("#"+hiddenTarget).val(_temp); 
		 
		 $(target).val(_temp.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	
	
	
	//	ture false 확인 하는 함수
	function isCheckedTrue(data){
		var _result = 0;
		if(data == true){
			_result = 1;
		}
		
		return _result;
	}
	
	
	
	
});