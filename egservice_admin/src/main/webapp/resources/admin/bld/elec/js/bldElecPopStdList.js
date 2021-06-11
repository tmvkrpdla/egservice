$(function(){
	
	var _pageLink = document.getElementsByClassName('page-link');
	
	if(_pageLink.length != 0){
		var _nowPage = $("#nowPage").val();
		
		for(var i=0; i<_pageLink.length; i++){
			if(_pageLink[i].outerText.replace(/(\s*)/g, "")  == _nowPage){
				document.getElementsByClassName('page-link')[i].style.backgroundColor = '#4e73df';
				document.getElementsByClassName('page-link')[i].style.color = 'white';
				document.getElementsByClassName('page-link')[i].style.borderRadius = '5px';
			}
		}
	}//end of if _pageLink
	
	//	라디오 버튼
//	var _radioEvt = document.getElementsByClassName('radioTdEvt');
//	if(_radioEvt.length != 0){
//		for(var i=0; i<_radioEvt.length; i++){
//			_radioEvt[i].onclick = function(e){
//				$(this).find("input[name=refRadio]").attr('checked',true);
//			}
//		}
//	}//
	
	var _trEvt = document.getElementsByClassName('listTrEvt');
	if(_trEvt.length != 0 ){
		
		for(var i=0; i<_trEvt.length; i++){
			_trEvt[i].onclick = function(e){
				
				if(e.target.className == 'radioTdEvt'){
					$(this).find("input[name=refRadio]").attr('checked',true);
				}else if(e.target.className == 'refRadio'){
					
				}else{
					
					
					$(this).find('form').attr('method', 'post').attr('action', './elecPopStdDetail');
					var _detailForm = $(this).find('form')[0];
					
					var _outerWidth = '1280px';//window.outerWidth * 0.95;
					var _outerHeight = '900px'; //window.outerHeight * 0.98;
					
					window.open("", 'popStdDetailForm', 'height='+_outerHeight+', width='+_outerWidth + ', left=20, top=10, scrollbars=1');
					_detailForm.target = 'popStdDetailForm';
					_detailForm.submit();
						
				}
			}
		}
	}
	
	
	//	추가 버튼
	$("#popStdWriteFormBtn").on('click', function(){
		if(document.getElementsByName('popStdWriteFrom').length != 0){
			$("#popStdWriteFrom").remove();
		}
		
		var form = document.createElement("form"); 
		form.setAttribute("id", "popStdWriteFrom") 
		form.setAttribute("name", "popStdWriteFrom") 
		form.setAttribute("charset", "UTF-8"); 
		form.setAttribute("method", "post");
		form.setAttribute("action", "./elecPopStdWrite");
		document.body.appendChild(form); 
		console.log("form = ",form);
		
		var _popStdWriteFrom = document.popStdWriteFrom;
	
		var _outerWidth = '1280px';//window.outerWidth * 0.95;
		var _outerHeight = '900px'; //window.outerHeight * 0.98;
		
		window.open("", 'popStdWriteFrom', 'height='+_outerHeight+', width='+_outerWidth + ', left=20, top=10, scrollbars=1');
		_popStdWriteFrom.target = 'popStdWriteFrom';
		_popStdWriteFrom.submit();
		
	});
	
	//	삭제 버튼
	$("#popStdDelBtn").on('click', function(){
		var _len = $("input[name='refRadio']").length;
		
		
		for(var i=0; i<$("input[name='refRadio']").length ; i++){
			if($("input[name='refRadio']")[i].checked == true){
				
				var _check = confirm('삭제 하시겠습니까?')
				if(_check){
					var _p = $("input[name='refRadio']")[i].parentNode;
					var _seqSaveRef = $(_p).find('form').children('input[name=seq_save_ref]').val();
					
					var _res = enernet.modules.api.deleteSaveRef(_seqSaveRef);
					if(_res.result_code == 1){
						alert('삭제 하였습니다');
						location.reload();
					}
				}
				
			}
		}
	});//
	
	
	
	//	선택하기 버튼
	$("#popStdChoiceBtn").on('click', function(){
		//	절감 기준에 데이터 집어넣기
		var _len = $("input[name='refRadio']").length;
		
		var _checkReturn = false;
		
		for(var i=0; i<$("input[name='refRadio']").length ; i++){
			if($("input[name='refRadio']")[i].checked == true){
				
				var _check = confirm('절감 기준을 선택 하시겠습니까?')
				if(_check){
					var _p = $("input[name='refRadio']")[i].parentNode;
					
					var _refObj = {};
					_refObj.seq_save_ref = $(_p).find('form').children('input[name=seq_save_ref]').val();
					_refObj.save_ref_name = $(_p).find('form').children('input[name=save_ref_name]').val();
					
				
					
					opener.window._setStdItem(_refObj);
					
					//	현재 창 닫기
					window.close();
					
					_checkReturn = true;
				}else{
					return;
				}
				
			}
		}
		
		if(!_checkReturn){
			alert('절감 기준을 선택해주시기 바랍니다');
		}
	});
	
	
	
});