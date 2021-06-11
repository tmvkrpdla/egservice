$(function(){
	//	데이트 피커
	enernet.modules.evt.makeDateYMD("dateTarget");
	
	//	조회 버튼
	$("#searchBtn").on('click', function(){
		$("#searchForm").submit();
	});
	
	var _sortRadioBtn = document.getElementsByClassName('sortRadio')
	
	for(var i=0; i<_sortRadioBtn.length; i++){
		_sortRadioBtn[i].onclick = function(e){
			
			//var _dateArr = $("#dateTarget").val().split('-');
			
			//var _res = enernet.modules.api.getUsageListOfSiteDay($("#seq_site").val(), _dateArr[0], _dateArr[1], _dateArr[2], $(this).val());  
			//console.log(_res)
			
			location.href = "../pop/aptUsageDay?dateTarget="+$("#dateTarget").val() +"&sort="+ $(this).val(); 
		}
	}
	
	
});