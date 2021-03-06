$(function(){
	
	
	//	목록
	
	$("#noticeListBtn").on('click', function(){
		location.href = '../apt/ntcList?nowPage='+$("#nowPage").val();
	});
	

	//	글저장
	$("#noticeSaveBtn").on('click', function(){
		var _result = confirm('저장하시겠습니까?')
		
		if(!_result){
			return;
		}
		
		var _check = true;
		var _title = $("#noticeTitle").val()
		
		if(_title.trim() == ""){
			alert("제목을 작성해주세요");
			_check = false;
			return;
		}
		
		var _content = CKEDITOR.instances.ckeditor.getData(); 
		if(_content.trim() == ""){
			_check = false;
			return alert("내용을 작성해주세요");
		}
		
		if(_check){
			var _seqAdmin = $("#seq_admin").val();
			
			var _html = "<!DOCTYPE html><html lang=ko><head><meta charset=utf-8 /></head>";
			
			_html += "<body>";
			_html += _content;
			_html += "</body>";
			_html += "</html>";
			
			
			
			var _result = enernet.modules.api.createNoticeAsyncData(_seqAdmin, 0, 1, 1, _title, _html)
			if(_result.result_code == 1){
				alert('공지사항을 작성하였습니다.')
				return location.href = '../apt/ntcList?nowPage='+$("#nowPage").val();
			}
			
		}
		
	});//
})