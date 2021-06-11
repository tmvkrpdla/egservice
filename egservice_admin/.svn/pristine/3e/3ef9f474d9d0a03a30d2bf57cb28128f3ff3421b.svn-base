$(document).ready(function(){
		
	
	getHomeData($('#seq_site').val());
	
	//	사용량, 작년대비, 온실가스 데이터를 설정
	function setHomeLeftTop(data){
		//console.log(data)
//		data.total_kwh_from_week;
		//	오늘 사용량
		var text1 = data.site_kwh_from_day;	//	text1
		//	이번달 사용량		
		var text2 = data.site_kwh_from_month;	//	text2
		//	이번년도 사용량
		var text3 = data.site_kwh_from_year;	//	text3

		
		
		var prevYearTotal = data.site_kwh_from_year_prev_year;
		var prevMonthTotal = data.site_kwh_from_month_prev_year;
		//data.total_kwh_from_week_prev_year;
		var prevDayTotal = data.site_kwh_from_day_prev_year;
		
		
		//	작년대비
		//	오늘 사용량 - 작년 오늘 사용량
		var text4 = text1 - prevDayTotal;		//	text4
		//	이번달 사용량 - 작년달 사용량
		var text6 = text2 - prevMonthTotal;		//	text6
		//	이번년도 사용량 - 작년도 사용량
		var text8 = text3 - prevYearTotal;		//	text8
		
		
		//	작년대비 증가 표시
		var text5 = "";	//	작년 대비 오늘 사용량 증감
		var text7 = "";	//	작년 대비 이번달 사용량 증감
		var text9 = "";	//	작년 대비 이번년도 사용량 증감
		
		//	온실가스 증감 표시
		var text11=""; 			//	온실가스 오늘 증감 표시
		var text13="";			//	온실가스 달 증감 표시		
		var text15="";			//	온실가스 년 증감 표시

		
		var upArrow = "<img src= '../resources/images/UpArrow.png' width = '23'  alt = 'UpArrow' class = 'arrow'>";
		var downArrow = "<img src= '../resources/images/DownArrow.png' width = '23'  alt = 'DownArrow' class = 'arrow'>";
		
		if(text4>0){
			text5 = upArrow;
			text11 = upArrow;
		}else if(text4 == 0){
			text5 = "-";
			text11 = "-";
		}else{
			text5 = downArrow;
			text11 = downArrow;
		}
		
		
		if(text6>0){
			text7 = upArrow;
			text13 = upArrow;
		}else if(text6 == 0){
			text7= "-";
			text13= "-";
		}else{
			text7 = downArrow;
			text13 = downArrow;
		}
		
		if(text8>0){
			text9 = upArrow;
			text15 = upArrow;
		}else if(text6 == 0){
			text9 = "-";
			text15 = "-";
		}else{
			text9 = downArrow;
			text15 = downArrow;
		}
		
		
		var _gas = 0.46625;
		//	온실가스	소수점 2자리 반올림
		//	오늘 가스
		var text10 = ( text4 * _gas)			//	text10	
		//	달 가스
		var text12 = ( text6 * _gas / 1000 )	//	text12
		//	년도 가스
		var text14 = ( text8 * _gas / 1000)		//	text14
		
		
		
		
		$("#text1").html(enernet.modules.utils.commaStr(text1.toFixed(2)) + " kWh");	//	오늘 사용량
		$("#text2").html(enernet.modules.utils.commaStr(text2.toFixed(2)) + " kWh");
		$("#text3").html(enernet.modules.utils.commaStr((text3/1000).toFixed(2)) + " MWh");	//	연간 사용량
		$("#text4").html(enernet.modules.utils.commaStr(Math.abs(text4).toFixed(2)) + " kWh");	//	작년대비 일 증가량
		$("#text5").html(text5);
		$("#text6").html(enernet.modules.utils.commaStr(Math.abs(text6).toFixed(2)) + " kWh");	//	작년대비 달 증가량
		$("#text7").html(text7);
		$("#text8").html(enernet.modules.utils.commaStr((Math.abs(text8)/1000).toFixed(2)) + " MWh");	//	작년대비 연간
		$("#text9").html(text9);
		$("#text10").html(enernet.modules.utils.commaStr(Math.abs(text10).toFixed(2)) + " kg");
		$("#text11").html(text11);
		$("#text12").html(enernet.modules.utils.commaStr(Math.abs(text12).toFixed(2)) + " ton");
		$("#text13").html(text13);
		$("#text14").html(enernet.modules.utils.commaStr(Math.abs(text14).toFixed(2)) + " ton");
		$("#text15").html(text15);

	}
	
	//	건물 관리자 리스트
	function setTeamAdminList(data){
		var _tableTagStart = "<table class=bldAdminTable>";
		var _contentTr="";
		var _tableTagEnd = "</table>";
		
		_contentTr += '<tr class=bldAdminTableTitleTr>';
		_contentTr += '<td>이름</td>';
		_contentTr += '<td>전화번호</td>';
		_contentTr += '<td>최근 로그인</td>';
		_contentTr += '</tr>';
		
		for(var i=0; i<data.admin_list.length; i++){
			//var _data = data[i];
			
			var _adminLastLogin = data.admin_list[i].admin_last_login;
			
			if(_adminLastLogin == null || _adminLastLogin == ''){
				_adminLastLogin = '';
			}else{
				_adminLastLogin = _adminLastLogin.replace('T', ' ').replace('Z', '')
			}
			
			var _phone = data.admin_list[i].admin_phone;
			
			if(_phone == null || _phone == ''){
				_phone = '';
			}else{
				_phone = enernet.modules.utils.phoneFormat(_phone);
			}
			
			_contentTr += '<tr>';
			_contentTr += '<td>' + data.admin_list[i].admin_name  + '</td>';
			_contentTr += '<td>' + _phone + '</td>';
			_contentTr += '<td>' + _adminLastLogin + '</td>';
			_contentTr += '</tr>';
		}
		
		
		$("#bldAdminTableDiv").html(_tableTagStart + _contentTr + _tableTagEnd);
	};


	
	function getHomeData(seqSite){
		//	왼쪽 상단
		
		var _adminUsageCurrentData = enernet.modules.api.getAdminUsageCurrentAsyncData($("#seq_admin").val());
		
		var _leftTopData = null;
		
		for(var i=0; i<_adminUsageCurrentData.site_list.length; i++){
			if(seqSite == _adminUsageCurrentData.site_list[i].seq_site){
				_leftTopData = _adminUsageCurrentData.site_list[i];
			}
		}
		//	사용량 호출
		setHomeLeftTop(_leftTopData);
		
		//	
		setTeamAdminList(enernet.modules.api.getTeamAdminListrAsyncData(seqSite));
		
		//	왼쪽 하단
		var _getSiteInfoBld = enernet.modules.api.getSiteInfoBldAsyncData(seqSite);
		
		var _siteName 		= _getSiteInfoBld.name;
		//console.log(_siteName)
		
		var infoHomePage	= _getSiteInfoBld.home_page;		//	홈페이지
		var infoArea 		= _getSiteInfoBld.area;				//	건물 면적
		var infoAddr 		= _getSiteInfoBld.address;			//	주소	
		var builtYear 		= _getSiteInfoBld.built_year;		//	완공년도
		var builtMonth 		= _getSiteInfoBld.built_month;		//	완공 달
		var infoFloor 		= _getSiteInfoBld.floor_info.replace(/,/, " / ");	//	층
		
		if(builtMonth<10){
			builtMonth = "0" + builtMonth
		}
		
		
		
		$("#infoHomePage").html(infoHomePage);
		$("#infoArea").html(infoArea + " ㎡");
		$("#infoFloor").html(infoFloor);
		$("#infoBuilt").html(builtYear +"-"+builtMonth);
		$("#infoAddr").html(infoAddr);
		
		//	오른쪽 
		//**	한 행의 계측기가 몇개인지 알면, 한 행의 몇개의 td가 필요한지 알 수 있다
		var _homeTableDivData = '';
		
		var tableTagStart = "<table class=homeTable>";
		var contentTr="";
		var tableTagEnd = "</table>";
		
		if(_getSiteInfoBld.meter_list.length !=0 ){
			
			//	층별로 계측기가 몇개 있는지 변수 | 계측기 
			var meterArr = {};
			for(var i=0; i<_getSiteInfoBld.meter_list.length; i++){
				var arr = _getSiteInfoBld.meter_list[i];
				
				if(!meterArr.hasOwnProperty(arr.floor_installed.toString())){
					
					meterArr[arr.floor_installed.toString()] = 1;
					
				}else{
					var meterArrData = meterArr[arr.floor_installed.toString()];
					meterArr[arr.floor_installed.toString()] = ++meterArrData;
					
				}
				
			}//
			
			var keys = Object.keys(meterArr);
			var maxTd = 0;	//	계측기 갯수를 구하고	td의 갯수를 구한다
			
			for(var i=0; i<keys.length; i++){
				var temp = meterArr[keys[i]];
				if(temp>maxTd){
					maxTdkeys = keys[i];
					maxTd = temp;
				}
				
			}//
			
			//	테이블 td 넓이 설정
			var tdWidth = 100/maxTd;
			
			
			
			//	현재 플로어를 지정할 변수
			var _floor = '';	//	for문의 제어하는 변수		td태그를 그림
			for(var i= _getSiteInfoBld.meter_list.length-1; i>=0; i--){
				//console.log(i);
				var arr = _getSiteInfoBld.meter_list[i];
				
				if(i == _getSiteInfoBld.meter_list.length-1){	//	처음 시작
					
					_floor = arr.floor_installed;
					contentTr += "<tr><td class='homeTableLeft'>" +  checkFloor(arr.floor_installed) + "</td><td>";
					contentTr += "<div class=tdOuterDiv style=width:" +tdWidth+ "%>";
					contentTr += "<div class=tdInnerDiv1>" + arr.meter_name + "</div>" ;	
					contentTr += "<div class=tdInnerDiv2>" + arr.descr + "</div>";	//	계측기
					contentTr += "<div class=tdInnerDiv2>" + arr.mid + "</div>";
					contentTr += "</div>";
				}else{
					if(_floor == arr.floor_installed){	//	층이 같다면	현재 층을 표시 하지 않음
						contentTr += "<div class=tdOuterDiv style=width:" +tdWidth+ "%>";
						contentTr += "<div class=tdInnerDiv1>" + arr.meter_name + "</div>" ;	
						contentTr += "<div class=tdInnerDiv2>" + arr.descr + "</div>"; //	계측기
						contentTr += "<div class=tdInnerDiv2>" + arr.mid + "</div>";
						contentTr += "</div>";
					}else{
						_floor = arr.floor_installed;	//	층이 다르다면 층을 _floor 변수에 저장함
						contentTr += "</td> <tr><td class='homeTableLeft'>" +  checkFloor(arr.floor_installed) + "</td><td>";
						contentTr += "<div class=tdOuterDiv style=width:" +tdWidth+ "%>";
						contentTr += "<div class=tdInnerDiv1>" + arr.meter_name + "</div>" ;	
						contentTr += "<div class=tdInnerDiv2>" + arr.descr + "</div>"; //	계측기
						contentTr += "<div class=tdInnerDiv2>" + arr.mid + "</div>";
						contentTr += "</div>";
					}
					
				}
				
			}//	for end
			
			_homeTableDivData = tableTagStart+contentTr + tableTagEnd;
		}else{
			
			_homeTableDivData = tableTagStart+contentTr + tableTagEnd;;
		}
		
		$("#homeTableDiv").html(_homeTableDivData);
		
	};
	
	//	지상 지하 
	function checkFloor(floor_installed){
		var _floor = floor_installed;
		if(_floor<0){
			_floor = "지하 " + Math.abs(_floor) + " 층"
		}else{
			_floor = "지상 " + _floor + " 층"
		}
		
		return _floor;
	}

	
});