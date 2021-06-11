$(function(){
	
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
	
	var _className = document.getElementsByClassName('bldElecPlanViewBtn');
	if(_className.length != 0){
		
		for(var i=0; i<_className.length; i++){
			_className[i].onclick = function(){
				
				var _popForm = $(this).parent().children('form');
				
				var _outerWidth =  window.outerWidth * 0.95;
				var _outerHeight = window.outerHeight * 0.90;
					
				var _popupX = (window.screen.width / 2) - ( _outerWidth / 2);
				var _popupY= (window.screen.height / 2) - ( _outerHeight / 2);

				window.open("", 'bldElecPlanView', 'height=' + _outerHeight
							+ ', width=' + _outerWidth + ', left=' + _popupX + ', top=' + _popupY);
				
				_popForm[0].target = 'bldElecPlanView';
				_popForm[0].submit();

			}
		}
	}
	
});