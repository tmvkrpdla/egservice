$(function(){

	// 절감 수정 저장 버튼
   $("#actModBtn").on('click', function modAct(){
	   
      if($("#actContent").val().trim() == ''){
         return alert('절감 조치를 작성 해주시기 바랍니다.');
      }
      var _modObj = {};
      _modObj._SeqSaveAct = $("#seq_save_act").val();
      _modObj._content =$("#actContent").val();
      
      var _resmod = enernet.modules.api.modifySaveAct(_modObj._SeqSaveAct, _modObj._content);
      
      if(_resmod.result_code==0){
           return alert('수정에 실패하였습니다(해당 절감조치가 없습니다.)');
           
      }else{
    	  alert('수정에 성공하였습니다.');
    	  opener.window.getData();
    	  window.close();
    	  
            
         }
      
   }); //modAct end	
   
});