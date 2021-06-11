$(function(){
	//	목록
	$("#noticeListBtn").on('click', function(){
		location.href = '../apt/ntcList?nowPage='+$("#nowPage").val();
	});
	
	//	수정 저장
	$("#noticeModProcBtn").on("click", function(){
		
		var _title = $("#noticeTitle").val()
		
		if(_title.trim() == ""){
			return alert("제목을 작성해주세요");
		}
		
		var _content = CKEDITOR.instances.ckeditor.getData();
		
		
		if(_content.trim() == ""){
			
			return alert("내용을 작성해주세요");
		}
		
		
		var _seqNotice = $("#seq_notice").val();
		var _seqAdmin = $("#seq_admin").val();
		
		
		var _html = null;
		
		if(_content.includes('<!DOCTYPE html>')){

			_html = _content;
		}else{

			_html = "<!DOCTYPE html><html lang=ko><head><meta charset=utf-8 /></head>";
			_html += "<body>";
			_html += _content;
			_html += "</body>";
			_html += "</html>";
			
		}
		
		
		var _result = enernet.modules.api.modifyNoticeAsyncData(_seqNotice, _seqAdmin, 0, _title, _html)
		
		if(_result.result_code == 1){
			alert('수정 하였습니다.');
			location.href = '../apt/ntcList?nowPage='+$("#nowPage").val();;
		}
	});
})