
$(function(){
	var _devMode = true;

	// 
	if(!_devMode){
		$(document).bind('keydown',function(e){
			if (e.keyCode == 123) {
				e.preventDefault();
				e.returnValue = false;
			}
		});
	}

})
 


document.onmousedown=disableclick;
 
function disableclick(event){
     if (event.button==2) {
        // alert("Right click is not available.");
         return false;
     }
}


window.onload = function(){

	document.getElementsByTagName('body')[0].setAttribute('oncontextmenu', 'return false');	// 우클릭방지
	document.getElementsByTagName('body')[0].setAttribute('ondragstart', 'return false');	// 블럭선택방지
	document.getElementsByTagName('body')[0].setAttribute('onselectstart', 'return false');	// 드래그방지

}

