$(function(){
	//	데이트 피커
	enernet.modules.evt.makeDateYM("monthTarget");
	
	//	조회 버튼
	$("#searchBtn").on('click', function(){
		$("#searchForm").submit();
	});
	
	var _sortRadioBtn = document.getElementsByClassName('sortRadio')
	
	for(var i=0; i<_sortRadioBtn.length; i++){
		_sortRadioBtn[i].onclick = function(e){
			
			
			location.href = "../apt/usageMonth?monthTarget="+$("#monthTarget").val() +"&sort="+ $(this).val(); 
		}
	}
	
	
});