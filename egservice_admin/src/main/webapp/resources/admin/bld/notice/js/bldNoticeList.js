$(function() {

	var _noticeListEvt = document.getElementsByClassName('noticeListEvt');

	for (var i = 0; i < _noticeListEvt.length; i++) {
		_noticeListEvt[i].onclick = function(e) {
			var _form = $(this).find('form');
			_form.attr('action', '../bld/noticeView').submit();
		}
	};
	
	
	var _pageLink = document.getElementsByClassName('page-link');
	
	if(_pageLink.length != 0){
		var _nowPage = $("#nowPage").val();
		
		for(var i=0; i<_pageLink.length; i++){
			if(_pageLink[i].outerText == _nowPage){
				document.getElementsByClassName('page-link')[i].style.backgroundColor = '#4e73df';
				document.getElementsByClassName('page-link')[i].style.color = 'white';
				document.getElementsByClassName('page-link')[i].style.borderRadius = '5px';
			}
		}
	}//end of if _pageLink

});