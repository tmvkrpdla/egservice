$(function(){
	
	//	토글
	$('#isTopBtn').bootstrapToggle({
		size : 'small'
	});	
	
	//	목록
	$("#noticeListBtn").on('click', function(){
		location.href = '../apt/ntcList?nowPage='+$("#nowPage").val();
	});
	
	//	수정
	$("#noticeModBtn").on('click', function(){
		$("#noticeModForm").attr('action', '../apt/ntcMod').submit();
	});
	
	
	//	삭제
	$("#noticeDelBtn").on('click', function(){
		if(confirm("삭제하시겠습니까?")){
			
			var _data = enernet.modules.api.ajaxFormPostAsync("../apt/ntcDelProc", "noticeModForm");
			if(_data.result_code = 1){
				
				$("#ntcDelModal").modal('hide');
				alert('삭제에 성공하였습니다.');
					
				return location.href = '../apt/ntcList?nowPage='+$("#nowPage").val(); 
			}else{
				alert("삭제에 실패하였습니다.")
			}

		}
		
	});
	
	$("#isTopBtn").on('change', function(){
		//console.log($(this).prop('checked'));
		
		var _seqNotice = $("#seqNotice").val();
		var _seqAdmin = $("#seq_admin").val();
		var _noticeTitle = $("#noticeTitle").val();
		var _noticeContent = $("#noticeContent").val();
		
		var _html = null;
		
		if(_noticeContent.includes('<!DOCTYPE html>')){
			//console.log(1)
			_html = _noticeContent;
		}else{
			//console.log(2)
			_html = "<!DOCTYPE html><html lang=ko><head><meta charset=utf-8 /></head>";
			_html += "<body>";
			_html += _noticeContent;
			_html += "</body>";
			_html += "</html>";
			
		}
		
		var _isTop = $(this).prop('checked');
		var _isTopValue = _isTop == true ? 1 : 0;
		
		var _dataResult = enernet.modules.api.modifyNoticeAsyncData(_seqNotice, _seqAdmin, _isTopValue, _noticeTitle, _html)
		
		
		
	});
	
	
});