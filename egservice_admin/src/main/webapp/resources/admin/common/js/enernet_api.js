/**
 * 2020.04.17
 * v 2.1.1
 */
var enernet = enernet || {};
enernet.namespace = function(ns_string) {
	var parts = ns_string.split('.'), parent = enernet, i;
	if (parts[0] === "enernet") {
		parts = parts.slice(1);
	}
	for (i = 0; i < parts.length; i += 1) {
		if (typeof parent[parts[i]] === "undefined") {
			parent[parts[i]] = {};
		}
		parent = parent[parts[i]];
	}
	return parent;
}

enernet.namespace('enernet.modules.api');
//api === ENERNET.modules.api; // true


enernet.modules.api = function() {
	//	======================================================================	//
	//	private
	//	api url 기본 주소
	var _apiUrl = "https://www.egservice.co.kr:7187";
	
	//	api 요청시 사용 되는 함수
	//	async false 동기	url, data, func, '', '', 'false'		==>	''이것은 false로 간주하기때문에 조심히 사용할것
	//	async true 비동기	url, data, func
	var _apiCallPost = function(url, data, successCallBack, errorCallBack, async){
		
		
		if(async == undefined || async == '') {
			async = true;
		}else{
			if(async == 'false'){
				async = false;
			}else{
				async = true;
			}
		}
		
		
		$.ajax({
			url :url,
			type: 'POST',
			dataType : 'json',
			data : data,
			async : async,
			success : function(data){
				console.log("success : " + url);
				console.log(data);
				if(successCallBack == undefined || successCallBack == ''){
					
					console.log('success callback undefined');
				
				}else{
					successCallBack(data);
				}
				
			},
			error : function(e){
				$('.wrap-loading').addClass('display-none');
				if(errorCallBack == undefined || errCallBack == ''){
					//console.log("error");
					//console.log(data);
					var _obj = {}
					_obj.data = data;
					_obj.status = e.status;
					_obj.statusText = e.statusText;
					_obj.requestUrl = url;
					
					_ajaxCall("../ajax/error", _obj);
					
				}else{
					errorCallBack(e);
				} 
			}
		});
	}; 
	
	
	//	api call	async
	function _apiCallAsyncLoading(_url, _data){
		var _returnData = null;
		
		$.ajax({
			url : _url,
			type: 'POST',
			dataType : 'json',
			data : _data,
			async : false,
			beforeSend : function(){
				$('div.wrap-loading').removeClass('display-none');
			},
			success : function(response){
				_returnData = response;
			},
			complete : function(){
				$('.wrap-loading').addClass('display-none');
			},
			error : function(e){
				$('.wrap-loading').addClass('display-none');
				
				var _obj = {}
				_obj.data = _data;
				_obj.status = e.status;
				_obj.statusText = e.statusText;
				_obj.requestUrl = _url;
				
				_ajaxCall("../ajax/error", _obj);
			}
		});
		
		return _returnData;
	}
	
	//	private	error 로그 처리
	function _ajaxCall(_url, _data){
			
		$.ajax({ 
			 
			url : _url, 
			contentType : 'application/json;charset=utf-8;',
			type : 'POST',
			data : JSON.stringify(_data), 
			success : function(data){ 
			}, 
			error: function(e){ 
				//console.log(e) 
				//alert('서버와 실패하였습니다'); 
			} 
		});
	}
	
	//	======================================================================	//
	
	
	
	
	
	
	//	======================================================================	//

	//	form 전송		url 과 formname 값 필요	
	function _ajaxFormPostAsync( requestUrl, formName){
		var _returnData = null;
		
		var _form = $("form[name="+formName+"]")[0];
		
		var _formData = new FormData(_form)
		
		$.ajax({
			url : requestUrl,
			type: 'post',
			processData: false,
            contentType: false,
			data : _formData,
			async : false,
			beforeSend : function(){
				$('div.wrap-loading').removeClass('display-none');
			},
	    	success : function(response){
	    		//console.log(2)
				_returnData = response;
			},
			complete : function(){
				$('.wrap-loading').addClass('display-none');
			},
			error : function(e){
				//console.log(_form)
				alert('서버 전송에 실패하였습니다');
				var _obj = {}
				_obj.status = e.status;
				_obj.statusText = e.statusText;
				_obj.requestUrl = requestUrl;
				_obj.data = {};
				
				var _formNameData = {};
				
				var _inputNameArr = $(_form).find('input[name]');
				for( var i=0; i<_inputNameArr.length; i++){
					var _inputName = _inputNameArr[i].name;
					
					if($("#"+ _inputName).length == 0){
						continue;
					}else{
						var _inputData = $("#"+ _inputName).val();
						_formNameData[_inputName] = _inputData;
					}
				}
				
				_obj.data = _formNameData;
				
	    		_ajaxCall("../ajax/error", _obj);
	    	}
		});
		
		return _returnData;
	}
	//	======================================================================	//
		
	
	
	//	현재 사용량 - 단지 관련 정보(사용량의 총합, 
	var _getAdminUsageCurrent = function(SeqAdmin, successCallBack, errorCallBack, async){
		var url = _apiUrl + "/api/GetAdminUsageCurrent";
		var data = {};
		data.SeqAdmin = SeqAdmin;
		_apiCallPost(url, data, successCallBack, errorCallBack, async);
	}
	

	//	일간 사용량
	var _getUsageOfOneDay = function(SeqSite, SeqMeter, Year, Month, Day, successCallBack, errorCallBack, async){
		var url = _apiUrl + "/api/GetUsageOfOneDay";
		var data = {};
		data.SeqSite = SeqSite;
		data.SeqMeter = SeqMeter;
		data.Year = Year;
		data.Month = Month;
		data.Day = Day;
		_apiCallPost(url, data, successCallBack, errorCallBack, async);
	}
	
	//	월간 사용량
	var _getUsageOfOneMonth = function(SeqSite, SeqMeter, Year, Month, successCallBack, errorCallBack, async){
		var url = _apiUrl + "/api/GetUsageOfOneMonth";
		var data = {};
		data.SeqSite = SeqSite;
		data.SeqMeter = SeqMeter;
		data.Year = Year;
		data.Month = Month;
		_apiCallPost(url, data, successCallBack, errorCallBack, async);
	} 
	
	//	연간 사용량
	var _getUsageOfOneYear = function(SeqSite, SeqMeter, Year, successCallBack, errorCallBack, async){
		var url = _apiUrl + "/api/GetUsageOfOneYear";
		var data = {};
		data.SeqSite = SeqSite;
		data.SeqMeter = SeqMeter;
		data.Year = Year;
		_apiCallPost(url, data, successCallBack, errorCallBack, async);
	}
	
	//	admin관리자 리스트	-->	홈(bldHome, bldAlarm, popBldHome)
	var _getTeamAdminList = function(SeqSite, successCallBack, errorCallBack, async){
		var url = _apiUrl + "/api/GetTeamAdminList";
		var data = {};
		data.SeqSite = SeqSite;
		_apiCallPost(url, data, successCallBack, errorCallBack, async);
	}
	
	//	건물 관리자 알림 설정 정보 저장
	var _changeAdminSettings = function(SeqAdmin, NotiKwhDaily , NotiKwhMonthly , NotiKwhYearly, NotiUsage , ThresholdKwhDaily ,
			ThresholdKwhMonthly ,ThresholdKwhYearly , UsageNotiType , UsageNotiHour, successCallBack, errorCallBack ,async ){
		var url = _apiUrl + "/api/ChangeAdminSettings";
		var data = {};
		data.SeqAdmin = SeqAdmin;
		data.NotiKwhDaily = NotiKwhDaily;
		data.NotiKwhMonthly = NotiKwhMonthly;
		data.NotiKwhYearly = NotiKwhYearly;
		data.NotiUsage = NotiUsage;
		data.ThresholdKwhDaily = ThresholdKwhDaily;
		data.ThresholdKwhMonthly = ThresholdKwhMonthly;
		data.ThresholdKwhYearly = ThresholdKwhYearly;
		data.UsageNotiType = UsageNotiType;
		data.UsageNotiHour = UsageNotiHour;
		//console.log(data);
		
		_apiCallPost(url, data, successCallBack, errorCallBack, async);
	}
	
	//	공지 사항 생성
	var _createNotice = function (SeqAdmin, Top , WriterType , TargetType, Title , Content , successCallBack, errorCallBack, async ){
		var url = _apiUrl + "/api/CreateNotice";
		var data = {};
		data.SeqAdmin = SeqAdmin;
		data.Top = Top;
		data.WriterType = WriterType;
		data.TargetType = TargetType;
		data.Title = Title;
		data.Content = Content;
		
		_apiCallPost(url, data, successCallBack, errorCallBack, async);
	};
	
	//	건물 관리자 대상 공지사항 목록
	var _getBldNoticeList = function (SeqAdmin, TimeCreatedMax , CountNotice , successCallBack, errorCallBack, async ){
		var url = _apiUrl + "/api/CreateNotice";
		var data = {};
		data.SeqAdmin = SeqAdmin;
		data.TimeCreatedMax = TimeCreatedMax;
		data.CountNotice = CountNotice;
				
		_apiCallPost(url, data, successCallBack, errorCallBack, async);
	}
	
	//	공지사항을 읽은 상태로 저장
	var _setBldNoticeListAsRead = function(SeqAdmin, SeqNoticeList, successCallBack, errorCallBack, async ){
		var url = _apiUrl + "/api/CreateNotice";
		var data = {};
		data.SeqAdmin = SeqAdmin;
		data.SeqNoticeList = SeqNoticeList;
				
		_apiCallPost(url, data, successCallBack, errorCallBack, async);
	}
	
	//	공지사항 수정
	var _modifyNotice = function (SeqNotice, SeqAdmin, Top, Title, Content, successCallBack, errorCallBack, async){
		var url = _apiUrl + "/api/ModifyNotice";
		var data = {};
		data.SeqNotice = SeqNotice;
		data.SeqAdmin = SeqAdmin;
		data.Top = Top;
		data.Title = Title;
		data.Content = Content;
		
				
		_apiCallPost(url, data, successCallBack, errorCallBack, async);
	}
	
	//////////////////////////////////////////////////////////////////////////////
	
	
	
	
	// 현재 사용량 - 단지 관련 정보 AsyncData
	var _getAdminUsageCurrentAsyncData = function(SeqAdmin){
		var _returnData = null;
		
		_getAdminUsageCurrent(SeqAdmin, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData
	}
		
	// 변압기 당일 전기 사용량 AsyncData
	var _getUsageOfOneDayAsyncData = function(SeqSite, SeqMeter, Year, Month, Day){
		var _returnData = null;
		
		_getUsageOfOneDay(SeqSite, SeqMeter, Year, Month, Day, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData
	}
	
	// 변압기 해당 월 전기 사용량 AsyncData
	var _getUsageOfOneMonthAsyncData = function(SeqSite, SeqMeter, Year, Month){
		var _returnData = null;
		
		_getUsageOfOneMonth(SeqSite, SeqMeter, Year, Month, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData
	}
	
	// 변압기 해당 년 전기 사용량 AsyncData
	var _getUsageOfOneYearAsyncData = function(SeqSite, SeqMeter, Year){
		var _returnData = null;
		
		_getUsageOfOneYear(SeqSite, SeqMeter, Year, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData
	}
	
	//	admin관리자 리스트
	var _getTeamAdminListrAsyncData = function(SeqSite){
		var _returnData = null;
		
		_getTeamAdminList(SeqSite, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
	
	//	건물 관리자 알림 설정 정보 저장
	var _changeAdminSettingsAsyncData = function(SeqAdmin, NotiKwhDaily , NotiKwhMonthly , NotiKwhYearly, NotiUsage , ThresholdKwhDaily ,
			ThresholdKwhMonthly ,ThresholdKwhYearly , UsageNotiType , UsageNotiHour){
		var _returnData = null;
		
		_changeAdminSettings(SeqAdmin, NotiKwhDaily , NotiKwhMonthly , NotiKwhYearly, NotiUsage , ThresholdKwhDaily ,
				ThresholdKwhMonthly ,ThresholdKwhYearly , UsageNotiType , UsageNotiHour, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
	
	
	/**
	//	공지사항 생성 : 공지사항 만들기. TargetType 을 조정하여 건물관리자 대상이나 아파트 주민 대상으로 공지사항을 생성
	🡨 SeqAdmin (작성자 Seq), Top (0=일반공지, 1=상단고정 공지), WriterType (작성자구분 : 1=아파트관리실, 2=에너넷, 3=구청관리자),
	 TargetType (수신대상 : 1=아파트주민, 2=아파트관리자, 3=건물관리자, 4=구청관리자), Title (제목), Content (내용)
	🡪
	result_code : 0=실패, 1=성공
	seq_notice_inserted : 생성된 공지사항 Seq 번호 
	
	apt : 아파트 관리자 1 -> 아파트 주민 1
	org : 구청 관리자 3 -> 건물관리자 3
	 */
	var _createNoticeAsyncData = function(SeqAdmin, Top, WriterType, TargetType, Title, Content){
		var _returnData = null;
		
		_createNotice(SeqAdmin, Top , WriterType , TargetType, Title , Content , function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
	
	/**
	//	GetBldNoticeList
	건물관리자 대상 공지사항 목록
	🡨 SeqAdmin (건물관리자 Seq / 공지사항 읽음 여부 판단용), TimeCreatedMax (지정한 시간 이전의 공지사항 예 = 20191013162045), CountNotice (리턴할 공지사항 최대 갯수)
	🡪
	[notice_top_list]
	공지사항 상단 고정 목록
	notice_type : 공지사항 작성자 종류 (1=아파트관리실, 2=에너넷, 3=구청관리자)
	time_read : null 이면 읽지 않은 공지사항
	[notice_list]
	일반 공지사항 목록
	notice_type : 공지사항 작성자 종류 (1=아파트관리실, 2=에너넷, 3=구청관리자)
	time_read : null 이면 읽지 않은 공지사항
	 */
	var _getBldNoticeListAsyncData = function(SeqAdmin, TimeCreatedMax, CountNotice){
		var _returnData = null;
		
		_getBldNoticeList(SeqAdmin, TimeCreatedMax , CountNotice , function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
	
	/**
	[SetBldNoticeListAsRead]
	공지사항 seq 번호로 지정한 공지사항을 읽은 상태로 저장
	🡨 SeqAdmin, SeqNoticeList (콤마로 분리된 seq_notice 목록, 예시 14,16,20)
	🡪
	result_code : 0/1
	 */
	var _setBldNoticeListAsReadAsyncData = function(SeqAdmin, SeqNoticeList){
		var _returnData = null;
		
		_setBldNoticeListAsRead(SeqAdmin, SeqNoticeList, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
	
	
	/**
	[ModifyNotice]
	공지사항 수정하기.
	SeqNotice, SeqAdmin (수정자 Seq), Top (0=일반공지, 1=상단고정 공지), Title (제목), Content (내용)
	result_code : 0=실패, 1=성공
	 */
	var _modifyNoticeAsyncData = function(SeqNotice, SeqAdmin, Top, Title, Content){
		var _returnData = null;
		
		_modifyNotice(SeqNotice, SeqAdmin, Top, Title, Content, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
	

	
	///////////////////////////////////////////////////////////////////	
	//	
	
	
	//	구청용 ->	dashboard	||	Home
	//	오늘 사용량, 30일 평균 사용량, 사용량 비교, CO2 발생량 | 그래프 데이터
	var _getTeamUsageFront = function(SeqTeam, Year, Month, Day){
		var _returnData = null; 
		var _url = _apiUrl+"/api/GetTeamUsageFront";
		
		var _data = {};
		_data.SeqTeam = SeqTeam;
		_data.Year = Year;
		_data.Month = Month;
		_data.Day = Day; 
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
	
	
	//	시설물 목록을 불러오는 함수
	var _getAdminInfo = function(SeqAdmin){
		var _returnData = null;
		var _url = _apiUrl+"/api/GetAdminInfo";
		
		var _data = {}
		_data.SeqAdmin = SeqAdmin;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
		
	//	시설별 사용량을 불러오는 함수
	var _getSiteUsageFront = function(SeqSite, Year, Month, Day){
		var _returnData = null;
		var _url = _apiUrl+"/api/GetSiteUsageFront";
		
		var _data = {}
		_data.SeqSite = SeqSite;
		_data.Year = Year;
		_data.Month = Month;
		_data.Day = Day;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
	

	//	사이트의 정보를 가져옴
	//	seq_site : 단지Seq 번호
	var _getSiteInfoBld = function(SeqSite){
		var _returnData = null;
		var _url = _apiUrl + "/api/GetSiteInfoBld";
		var _data = {};
		_data.SeqSite = SeqSite;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
	
	////////////////////////////////////////////////////////////////////
	//	아파트 apt
	var _getUsageListOfSiteDay = function(SeqSite, Year, Month, Day, Sort){
		var _returnData = null; 
		var _url = _apiUrl+"/api/GetUsageListOfSiteDay";
		
		var _data = {};
		_data.SeqSite = SeqSite;
		_data.Year = Year;
		_data.Month = Month;
		_data.Day = Day; 
		_data.Sort = Sort;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		return _returnData;
	}
	
	//////////////////////////////////
	//	bld
	//	절감 기준 만들기 - 기간 설정 조회
	var _calculateSaveRefData = function(SeqSite, DateFrom, DateTo){
		var _returnData = null;
		var _url = _apiUrl+"/api/CalculateSaveRefData";
		
		var _data = {};
		_data.SeqSite = SeqSite;
		_data.DateFrom = DateFrom;
		_data.DateTo = DateTo;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		//console.log(_returnData);
		return _returnData;
	} 
	
	//	절감 기준 만들기 -절감 기준 만들기
	var _createSaveRef = function(SeqSite, Name, Comment, DateFrom, DateTo, KwhSum, Kwh1, Kwh2, Kwh3, WonSum, Won1, Won2, Won3 ){
		var _returnData = null;
		var _url = _apiUrl+"/api/CreateSaveRef";
		
		var _data = {};
		_data.SeqSite = SeqSite;
		_data.Name = Name;
		_data.Comment = Comment;
		_data.DateFrom = DateFrom;
		_data.DateTo = DateTo;
		_data.KwhSum = KwhSum;
		_data.Kwh1 = Kwh1;
		_data.Kwh2 = Kwh2;
		_data.Kwh3 = Kwh3;
		_data.WonSum = WonSum;
		_data.Won1 = Won1;
		_data.Won2 = Won2;
		_data.Won3 = Won3;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}
	
	//	절감 기준 목록 - 절감 기준 삭제
	var _deleteSaveRef = function(SeqSaveRef){
		var _returnData = null;
		var _url = _apiUrl+"/api/DeleteSaveRef";
		
		var _data = {};
		_data.SeqSaveRef  = SeqSaveRef;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}

	//	절감 계획 시퀀스 생성
	var _createSavePlan = function(SeqSite){
		var _returnData = null;
		var _url = _apiUrl+"/api/CreateSavePlan";
		
		var _data = {};
		_data.SeqSite  = SeqSite;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}
	
	//	절감계획의 명칭과 절감기준의 seq 번호를 설정함
	var _setSavePlanNameAndRef = function(SeqSavePlan, Name, SeqSaveRef){
		var _returnData = null;
		var _url = _apiUrl+"/api/SetSavePlanNameAndRef";
		
		var _data = {};
		_data.SeqSavePlan  = SeqSavePlan;
		_data.Name  = Name;
		_data.SeqSaveRef  = SeqSaveRef;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}
	
	//	절감계획에 절감목표를 추가함
	var _addSavePlanElem = function(SeqSavePlan, SeqMeter, HourFrom, HourTo, PercentToSave){
		var _returnData = null;
		var _url = _apiUrl+"/api/AddSavePlanElem";
		
		var _data = {};
		_data.SeqSavePlan  = SeqSavePlan;
		_data.SeqMeter  = SeqMeter;
		_data.HourFrom  = HourFrom;
		_data.HourTo  = HourTo;
		_data.PercentToSave  = PercentToSave;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}
	
	//	절감 조치 만들기
	var _addSaveAct = function(SeqSavePlanElem, Content){
		var _returnData = null;
		var _url = _apiUrl+"/api/AddSaveAct";
		
		var _data = {};
		_data.SeqSavePlanElem = SeqSavePlanElem;
		_data.Content = Content;
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}
	
	//	절감계획에서 절감 목표를 삭제함
	var _deleteSavePlanElem = function(SeqSavePlanElem){
		var _returnData = null;
		var _url = _apiUrl+"/api/DeleteSavePlanElem";
		
		var _data = {};
		_data.SeqSavePlanElem  = SeqSavePlanElem;
		
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}
	
	//	절감계획에서 절감 조치를 삭제함
	var _deleteSaveAct = function(SeqSaveAct){
		var _returnData = null;
		var _url = _apiUrl+"/api/DeleteSaveAct";
		
		var _data = {};
		_data.SeqSaveAct  = SeqSaveAct;
		
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}
	
	//	절감계획에서 절감 조치를 수정함
	var _modifySaveAct = function(SeqSaveAct, Content){
		var _returnData = null;
		var _url = _apiUrl+"/api/ModifySaveAct";
		
		var _data = {};
		_data.SeqSaveAct  = SeqSaveAct;
		_data.Content  = Content;
		
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}
	
	//	현재 시행중인 절감계획 seq를 리턴함
	var _getActiveSavePlan = function(SeqSite){
		var _returnData = null;
		var _url = _apiUrl+"/api/GetActiveSavePlan";
		
		var _data = {};
		_data.SeqSite  = SeqSite;
		
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}
	
	//	절감계획을 현재 시행중으로 설정함
	var _setActiveSavePlan = function(SeqSite, SeqSavePlan){
		var _returnData = null;
		var _url = _apiUrl+"/api/SetActiveSavePlan";
		
		var _data = {};
		_data.SeqSite = SeqSite;
		_data.SeqSavePlan  = SeqSavePlan;
		
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}	
	
	//	절감계획 정보 조회
	var _getSavePlanInfo = function(SeqSavePlan){
		var _returnData = null;
		var _url = _apiUrl+"/api/GetSavePlanInfo";
		
		var _data = {};
		_data.SeqSavePlan  = SeqSavePlan;
		
		
		_apiCallPost(_url, _data, function(data){
			_returnData = data;
		}, undefined, 'false');
		
		
		return _returnData;
	}	
	//	
	
	return {
		
		getAdminUsageCurrentAsyncData : _getAdminUsageCurrentAsyncData,
		getUsageOfOneDayAsyncData : _getUsageOfOneDayAsyncData,
		getUsageOfOneMonthAsyncData : _getUsageOfOneMonthAsyncData,
		getUsageOfOneYearAsyncData : _getUsageOfOneYearAsyncData,
		getTeamAdminListrAsyncData : _getTeamAdminListrAsyncData,
		changeAdminSettingsAsyncData : _changeAdminSettingsAsyncData,
		createNoticeAsyncData : _createNoticeAsyncData,
		setBldNoticeListAsReadAsyncData : _setBldNoticeListAsReadAsyncData,
		modifyNoticeAsyncData : _modifyNoticeAsyncData,
		getTeamUsageFront : _getTeamUsageFront,
		getAdminInfo : _getAdminInfo,
		getSiteInfoBld : _getSiteInfoBld,
		getSiteUsageFront : _getSiteUsageFront,
		ajaxCall: _ajaxCall,
		ajaxFormPostAsync : _ajaxFormPostAsync,
		getUsageListOfSiteDay : _getUsageListOfSiteDay,
		calculateSaveRefData : _calculateSaveRefData,
		createSaveRef : _createSaveRef,
		deleteSaveRef : _deleteSaveRef,
		createSavePlan : _createSavePlan,
		setSavePlanNameAndRef : _setSavePlanNameAndRef,
		addSavePlanElem : _addSavePlanElem,
		deleteSavePlanElem : _deleteSavePlanElem,
		getActiveSavePlan : _getActiveSavePlan,
		setActiveSavePlan : _setActiveSavePlan,
		getSavePlanInfo : _getSavePlanInfo,
		addSaveAct : _addSaveAct,
		deleteSaveAct : _deleteSaveAct,
		modifySaveAct : _modifySaveAct
	};
}();



