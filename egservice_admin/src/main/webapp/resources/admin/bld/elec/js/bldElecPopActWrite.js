$(function(){

	// 절감 조치 저장 버튼
   $("#actSaveBtn").on('click', function saveAct(){
	   
      if($("#actContent").val().trim() == ''){
         return alert('절감 조치를 작성 해주시기 바랍니다.');
      }
      var _planObj = {};
      _planObj._seqSavePlan = $("#seq_save_plan").val();
      _planObj._seqSavePlanElem = $("#seq_plan_elem").val();
      _planObj._content =$("#actContent").val();
      
      var _resact = enernet.modules.api.addSaveAct(_planObj._seqSavePlanElem, _planObj._content);
      
      if(_resact.seq_save_act_inserted==0){
           return alert('저장에 실패하였습니다(해당 절감항목이 없습니다.)');
           
      }else{
    	  alert('저장에 성공하였습니다.');
    	  opener.window.getData();
    	  window.close();
            
         }
      
   }); //saveAct end	
   
});