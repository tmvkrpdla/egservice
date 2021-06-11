$(document).ready(function(){
	
	//	일간, 월간, 연간 active
	var _usageType = $("#usageType").val();
	$("#usage-"+ _usageType).addClass('active');
	
	//	조회버튼 이벤트
	$("#usageSearchBtn").on("click", function(){
		$("#usageSearchForm").submit();
	});
	
	//	
		
	//	차트 관련 변수
	var myChart;
		
	//	1. 데이트 피커 날짜 설정
	datePickerFun("usageDate", _usageType);
	
	//	2. 조회 (데이터를 가져온후  차트 작성)			seq_admin	연/월/일=1/2/3	2020/2020-04/2020-04-30		
	getUsageData($("#seq_admin").val(), _usageType, $("#usageDate").val());
	
		
	//	계측기별 사용량 select : 1 연간,2월간,3일간	
	function datePickerFun(selected ,usageType){
		//console.log(selected)
		//console.log(chkValue)
		
		var _date = $("#"+selected).val();
		
		//$("#"+selected).val('');
		
		//$("#"+selected).datepicker( "destroy" );
		
		if(usageType == 'yy'){
			
			
			$("#"+selected).datepicker({
				minViewMode: 'years',
	            changeYear: true,
	            dateFormat: 'yy',
				nextText: '다음년',
				prevText: '이전년',
				currentText: "오늘",
				closeText : "적용",
				buttonText: "선택" ,
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				stepMonths: '12',
				showMonthAfterYear:true,
				showButtonPanel: true,
				minDate: "-30Y",
				maxDate: 0,
				onClose: function(dateText, inst) { 
	                $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
	            }
				}).focus(function () {
				    $(".ui-datepicker-calendar").hide();
				});
			
		} else if(usageType == 'mm'){
			//$("#usageDatePicker" ).datepicker( "destroy" );
			$("#"+selected).datepicker({
				changeMonth: true,
	            changeYear: true,
	            dateFormat: 'yy-mm',
				nextText: '다음달',
				prevText: '이전달',
				currentText: "오늘",
				closeText : "적용",
				buttonText: "선택" ,
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
				showMonthAfterYear:true,
				showButtonPanel: true,
				minDate: "-30Y",
				maxDate: 0,
				onClose: function(dateText, inst) { 
	                $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
	            }
				}).focus(function () {
				    $(".ui-datepicker-calendar").hide();
				});
			
		} else if (usageType == 'dd'){
			//$("#usageDatePicker" ).datepicker( "destroy" );
			
			$("#"+selected).datepicker({
				changeMonth: true,
				changeYear: true,
				showMonthAfterYear:true,
				dateFormat: 'yy-mm-dd',
				nextText: '다음달',
				prevText: '이전달',
				buttonText: "선택" ,
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
				minDate: "-30Y",
				maxDate: 0
				}).focus(function(){
					$(".ui-datepicker-calendar").show();
				});
			
		}//	
		
		$("#"+selected).datepicker("setDate", _date);
	};//	datePickerFun	end
	
	

	//	차트 그리는 함수
	function drawChart(data){
		
		var ctx = document.getElementById('cvsChart').getContext('2d');
		myChart = new Chart(ctx, data);
		
	};
	
	//	메뉴 : 사용량
	function getUsageData(seqAdmin, usageType, date){
		
		var _date = date;
		var _year = null;
		var _month = null;
		var _day = null;
		
		var _tdDateLine = "";
		//var _tdDateLine2 = null;
		
		if(usageType == 'yy'){		//	연간인경우
			_year = date;
			_tdDateLine += "<td>연간 사용량</td>";
			_tdDateLine += "<td>전년 대비</td>";
			
		}else if(usageType == 'mm'){	//	월간

			var _dateArr = date.split('-');
			_year = _dateArr[0];
			_month = _dateArr[1];
			_tdDateLine += "<td>월간 사용량</td>";
			_tdDateLine += "<td>전년 동월대비</td>";
			
		}else{		//	일간
			var _dateArr = date.split('-');
			_year = _dateArr[0];
			_month = _dateArr[1];
			_day = _dateArr[2];
			_tdDateLine += "<td>일간 사용량</td>";
			_tdDateLine += "<td>전년 동일대비</td>";
		}
		
		 
		
		var _getAdminUsageCurrent = enernet.modules.api.getAdminUsageCurrentAsyncData(seqAdmin);
		
		var _seqSite = _getAdminUsageCurrent.site_list[0].seq_site;	//	seq_site
		
		var _getSiteInfoBld = enernet.modules.api.getSiteInfoBldAsyncData(_seqSite);	
		
		var _meterList = _getSiteInfoBld.meter_list;				//	meter_list
		
		var tableStartTag = "<table class='table table-bordered table-hover dataTable bldUsageTableFont'>";
		/*var contentsTag = "<tr class=usageHeaderTr>" +
				"<td>계측기명</td>" +
				"<td>위치</td>" +
				"<td>적용</td>" +
				_tdDateLine +
				"</tr>";*/
		
		var contentsTag = "<tr class='bldUsageTableTitle'>";
		contentsTag += "<td>" + "적용" + "</td>";	//	적용
		contentsTag += "<td>" + "MID" + "</td>"	//	MID
		contentsTag += _tdDateLine;
		contentsTag += "</tr>";
		
		var tableEndTag = "</table>";
		
		var _usageTotal = 0;			//	합계 : -> 연간, 월간, 일일간 총사용량 합계
		var _prevTotal  = 0;			//	합계 : -> 전년대비
		
		
		var _chartData = getChartOption(usageType);
		var _chartColors = getChartColors(); 
		
		//console.log(_chartData)
		for(var i=0; i<_meterList.length; i++){
			var _arr = _meterList[i];
			contentsTag += "<tr>";
			//contentsTag += "<td>" +  _arr.meter_name; + "</td>";	//	계측기명
			
			/*
			var _floor = _arr.floor_installed;
			if(_floor<0){
				_floor = "지하 " + Math.abs(_floor) + " 층"
			}else{
				_floor = "지상 " + _floor + " 층"
			}
			
			contentsTag += "<td>" +  _floor  + "</td>";	//	층
			*/
			contentsTag += "<td>" +  _arr.descr  + "</td>";	//	적용
			contentsTag += "<td>" +  _arr.mid  + "</td>";	//	MID
			
			var _usageData = null;
			
			
			if(usageType == 'yy'){		//	연간인경우
				_usageData = enernet.modules.api.getUsageOfOneYearAsyncData(_seqSite, _arr.seq_meter, _year);			//	연간 조회	seq_site, seq_meter, year
				
			}else if(usageType == 'mm'){	//	월간
				_usageData = enernet.modules.api.getUsageOfOneMonthAsyncData(_seqSite, _arr.seq_meter, _year, _month);	//	월간 조회	seq_site, seq_meter, year, month
				
			}else{		//	일간
				_usageData = enernet.modules.api.getUsageOfOneDayAsyncData(_seqSite, _arr.seq_meter, _year, _month, _day);//일간 조회	seq_site, seq_meter, year, month, day
			}
			
			
			
			var _total_kwh_curr = _usageData.total_kwh_curr;				//	연간, 일간, 월간 사용량
			var _prev_kwh = _total_kwh_curr - _usageData.total_kwh_prev;	//	전년대비
			
			_usageTotal += _total_kwh_curr;	//	합계 : -> 연간, 월간, 일일간 총사용량 합계
			_prevTotal += _prev_kwh;		//	합계 : -> 전년대비  
			
			if(_prev_kwh>0){
				_prev_kwh = "+"+enernet.modules.utils.commaStr(_prev_kwh.toFixed(2));
			}else{
				_prev_kwh = enernet.modules.utils.commaStr(_prev_kwh.toFixed(2));
			}
			
			contentsTag += "<td class='bldUsageRight'>" +  enernet.modules.utils.commaStr(_total_kwh_curr.toFixed(2)) + "</td>";	//	연간 사용량
			contentsTag += "<td class='bldUsageRight'>" +  _prev_kwh + "</td>";	//	전녀 대비
			contentsTag += "</tr>";
			
			
			//	chartData의 연간인지 월간인지 셋팅	_chartData.data.label
			var _listUsage = _usageData.list_usage;
			if(i==0){ 		//	unit	(연 월 인지에 따라서 다름)	0 번일 경우 라벨부터 기초 셋팅
				
				var _labels = [];
				for(var j=0; j<_listUsage.length; j++){
					var _unit = _listUsage[j].unit;
					
					if(usageType == 'yy'){		//	연간인경우
						_labels.push(""+_unit+"월");
					}else if(usageType == 'mm'){	//	월간

						_labels.push(""+_unit+"일");
						
					}else{		//	일간
						_labels.push(""+_unit+"시");
					}
					
				}
				_chartData.data.labels = _labels;
			}
			
			var _chartObj = {};
			_chartObj.label = _arr.descr;			//	라벨 명 - 적용
			_chartObj.backgroundColor = _chartColors[i];	//	백그라운드 칼라
			_chartObj.borderColor =  _chartColors[i];	//	보더 칼라
			_chartObj.fill = false;
			_chartObj.data = [];
			
			for(var k=0; k<_listUsage.length; k++){
				var _kwh_curr = _listUsage[k].kwh_curr;	//	년 월 일의 현재 사용량
				_chartObj.data.push(_kwh_curr);
			}
			
			_chartData.data.datasets.push(_chartObj)
			
			
		}
		
		contentsTag += "<tr class='bldUsageTableBot'>";
		contentsTag += "<td colspan=2>" + "합계" +"</td>";
		contentsTag += "<td>" + enernet.modules.utils.commaStr(_usageTotal.toFixed(2)) +"</td>";
		contentsTag += "<td>" + enernet.modules.utils.commaStr(_prevTotal.toFixed(2)) +"</td>";
		contentsTag += "</tr>";
		
		
		
		console.log(tableStartTag + contentsTag +tableEndTag)
		$("#usageTableDiv").html(tableStartTag + contentsTag +tableEndTag)
		drawChart(_chartData)
		
	}//	function getUsageData end
	
	
	
	//	chart 관련 색상
	function getChartColors(){
		var _chartColors = [
			'rgb(255, 99, 132)',
			'rgb(255, 159, 64)',
			'rgb(255, 205, 86)',
			'rgb(75, 192, 192)',
			'rgb(54, 162, 235)',
			'rgb(153, 102, 255)',
			'rgb(165,42,42)',
			'rgb(250,128,114)',
			'rgb(240,230,140)',
			'rgb(0,128,128)',
			'rgb(0,255,255)',
			'rgb(0,0,128)',
			'rgb(75,0,130)',
			'rgb(216,191,216)',
			'rgb(221,160,221)',
			'rgb(160,82,45)',
			'rgb(210,180,140)',
			'rgb(230,230,250)',
			'rgb(139,0,0)',
			'rgb(255,140,0)',
			'rgb(189,183,107)',
			'rgb(85,107,47)',
			'rgb(47,79,79)',
			'rgb(0,206,209)',
			'rgb(0,0,139)',
			'rgb(148,0,211)',
			'rgb(255,20,147)',
			'rgb(139,69,19)',
			'rgb(255,228,181)',
			'rgb(112,128,144)',
			'rgb(105,105,105)',
			'rgb(178,34,34)',
			'rgb(233,150,122)',
			'rgb(184,134,11)',
			'rgb(128,128,0)',
			'rgb(124,252,0)',
			'rgb(152,251,152)',
			'rgb(102,205,170)',
			'rgb(72,209,204)',
			'rgb(70,130,180)',
			'rgb(135,206,235)',
			'rgb(138,43,226)',
			'rgb(139,0,139)',
			'rgb(255,0,255)',
			'rgb(255,192,203)',
			'rgb(210,105,30)',
			'rgb(192,192,192)',
			'rgb(220,20,60)',
			'rgb(255,69,0)',
			'rgb(127,255,0)',
			'rgb(34,139,34)',
			'rgb(144,238,144)',
			'rgb(46,139,87)',
			'rgb(176,224,230)',
			'rgb(25,25,112)',
			'rgb(106,90,205)',
			'rgb(218,112,214)',
			'rgb(255,228,196)',
			'rgb(244,164,96)',
			'rgb(255,99,71)',
			'rgb(218,165,32)',
			'rgb(107,142,35)',
			'rgb(0,250,154)',
			'rgb(32,178,170)',
			'rgb(127,255,212)',
			'rgb(95,158,160)',
			'rgb(135,206,250)',
			'rgb(25,25,112)',
			'rgb(72,61,139)',
			'rgb(219,112,147)',
			'rgb(255,235,205)',
			'rgb(188,143,143)',
			'rgb(248,248,255)',
			'rgb(255,127,80)',
			'rgb(255,215,0)',
			'rgb(154,205,50)',
			'rgb(102,205,170)',
			'rgb(100,149,237)',
			'rgb(153,50,204)',
			'rgb(255,105,180)',
			'rgb(255,218,185)',
			'rgb(205,92,92)',
			'rgb(107,142,35)',
			'rgb(50,205,50)',
			'rgb(175,238,238)',
			'rgb(30,144,255)',
			'rgb(65,105,225)',
			'rgb(238,130,238)',
			'rgb(139,69,19)',
		];
		return _chartColors;
	}
	
	//	chart 옵션
	function getChartOption(usageType){
	
		
		var _titleText = "";
		var _labelString = "";
		
		if(usageType == 'yy'){		//	연간인경우
			_titleText = "월별 사용량";
			_labelString = "월";
			
		}else if(usageType == 'mm'){	//	월간
			_titleText = "일별 사용량";
			_labelString = "일";
			
		}else{		//	일간
			_titleText = "시간대별 사용량";
			_labelString = "시";
		}
		
		var _chartData = {
				type: 'line',
				data: {
					labels: null,	//['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					datasets: []
				},
				options: {
					responsive: true,
					legend:{
						position: 'bottom',
						labels: {
							fontColor: "black"
						}
					},
					elements:{
						line:{
							tension: 0.000001
						}
					},
					title: {
						display: true,
						fontSize: 20,
						text: _titleText		//	_chartData.options.title.text	연간 사용량, 월간 사용량, 일간사용량
					},
					tooltips: {
						mode: 'point',
						intersect: false
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							ticks:{
								fontSize: 14,
								fontColor: "black"
							},
							display: true,
							scaleLabel: {
								display: false,
								labelString: _labelString	//	_chartData.options.scales.xAees[0].scaleLabel.labelString	월, 일, 시
							}
						}],
						yAxes: [{
							ticks:{
								fontSize: 16,
								fontColor: "black"
							},
							display: true,
							scaleLabel: {
								fontSize: 16,
								display: true,
								labelString: '전기 사용량 (Kwh)'
							}
						}]
					}
				}
			};
		
		return _chartData;
	}
	/////////////////////////////////////////////////////////////////////////////
	//	인쇄
	var _printChart;
	
	function printAreaClear(){
		$("#headerBldTitle").html('');	//	(건물명) 전기사용량 리포트
		$("#headerBldCurr").html('');	//	기준 : 2020/02/26 15:00
		
		$("#printBldInfoSiteName").html('');	//	건물명
		$("#printBldInfoScale").html('');
		
		$("#printContentUsageTitle").html('');
		$("#printChart").html('');				//	print chart
		$("#printContentTableOuter").html('');
	}
	
	
	//	미리보기 
	$("#printViewBtn").on('click', function(){
		printAreaClear();
		printPop('view');
	})

	
	//	print 인쇄하기
	$("#printBtn").on('click', function(){
		
		printAreaClear();
		printPop('print');
	});
	
	function printPop(type){
		
		
		var _getAdminUsageCurrent = enernet.modules.api.getAdminUsageCurrentAsyncData($("#seq_admin").val());
		
		var _seqSite = _getAdminUsageCurrent.site_list[0].seq_site;	//	seq_site
		
		var _getSiteInfoBld = enernet.modules.api.getSiteInfoBldAsyncData(_seqSite);	
		var _meterList = _getSiteInfoBld.meter_list;
		
		var _headerBldTitle = _getAdminUsageCurrent.site_list[0].site_name;
		var _headerBldCurr = _getAdminUsageCurrent.time_curr;
		
		$("#headerBldTitle").html('('+ _headerBldTitle +') ' + '전기 사용량 리포트');	//	(건물명) 전기사용량 리포트
		$("#headerBldCurr").html('기준 : ' + _headerBldCurr);						//	기준 : 2020/02/26 15:00
		
		
		//	건물명 및 현황
		var _printBldInfoSiteName =  _getAdminUsageCurrent.site_list[0].site_name;
		var _siteAddr = _getAdminUsageCurrent.site_list[0].address;
		$("#printBldInfoSiteName").html(_printBldInfoSiteName +'<br>' +"(주소 : " + _siteAddr + ")");	//	건물명
		
		
		var _floorInfo = _getAdminUsageCurrent.site_list[0].floor_info;
		var _area = _getAdminUsageCurrent.site_list[0].area;
		$("#printBldInfoScale").html('규모 : ' + _floorInfo + '<br>' + '건물 : ' + _area + ' m<sup>2</sup>');	//	현황
		
		//	총 전기 사용량 (kWh)
		var _printMonthUsageCurrent = _getAdminUsageCurrent.total_kwh_from_month.toFixed(2);
		
		var _prevMonthUsage = _getAdminUsageCurrent.total_kwh_from_month_prev_year;
		var _printMonthFlucture = _printMonthUsageCurrent - _prevMonthUsage.toFixed(2);
		
		var _printYearUsageCurrent = _getAdminUsageCurrent.total_kwh_from_year.toFixed(2);
		
		var _prevYearUsage = _getAdminUsageCurrent.total_kwh_from_year_prev_year;
		var _printYearFlucture = _printYearUsageCurrent - _prevYearUsage.toFixed(2);
		
		$("#printMonthUsageCurrent").html(enernet.modules.utils.commaStr(_printMonthUsageCurrent));
		$("#printMonthFlucture").html(enernet.modules.utils.commaStr(_printMonthFlucture));
		$("#printYearUsageCurrent").html(enernet.modules.utils.commaStr(_printYearUsageCurrent));
		$("#printYearFlucture").html(enernet.modules.utils.commaStr(_printYearFlucture));
		
		//	에너지 절감 효과
		
		
		//	각 계측기별 추이
		//	일간, 월간, 연간 등 검색
		var _usageType = $("#usageType").val();
		var _usageDatePicker = $("#usageDate").val();
		
		_usageDatePicker = _usageDatePicker.split('-');
		
		var _year = null;
		var _month = null;
		var _day = null;
		
		var _printContentUsageTitle = null;
		
		if(_usageType == 'dd'){		//	일간
			_year = _usageDatePicker[0];
			_month = _usageDatePicker[1];
			_day = _usageDatePicker[2];
			
			_printContentUsageTitle = '각 계측기별 일간 사용량';
		}else if(_usageType == 'mm'){	//	월간
			_year = _usageDatePicker[0];
			_month = _usageDatePicker[1];
			
			_printContentUsageTitle = '각 계측기별 월간 사용량';
		}else{	//	년간
			_year = _usageDatePicker[0];
			
			_printContentUsageTitle = '각 계측기별 연간 사용량';
		}
		
		$("#printContentUsageTitle").html(_printContentUsageTitle);
		
		var _chartColors = getChartColors(); 
		
		var _printTableStart = "<table class='printContentTable'>";
		
		var _printTableEnd = '</table>';
		
		var _printTableContent = '';
		
		
		//	500px; td40px
		
		for(var i=0; i<_meterList.length; i++){
			var _arr = _meterList[i];
			
			
			var _usageData = null;
			
			
			if(_usageType == 'yy'){		//	연간인경우
				
				_usageData = enernet.modules.api.getUsageOfOneYearAsyncData(_seqSite, _arr.seq_meter, _year);			//	연간 조회	seq_site, seq_meter, year
				
			}else if(_usageType =='mm'){	//	월간
				_usageData = enernet.modules.api.getUsageOfOneMonthAsyncData(_seqSite, _arr.seq_meter, _year, _month);	//	월간 조회	seq_site, seq_meter, year, month
				
			}else{		//	일간
				_usageData = enernet.modules.api.getUsageOfOneDayAsyncData(_seqSite, _arr.seq_meter, _year, _month, _day);//일간 조회	seq_site, seq_meter, year, month, day
			}
			
			if(i==0){
				//	table 첫행 1월~12월/
				_printTableContent += "<tr class='printContentTableFirstTr'>";
				_printTableContent += "<td style=width:6%;></td>";
				
				_printTdWidth = (94/_usageData.list_usage.length).toFixed(2);
				
				for(var j=0; j<_usageData.list_usage.length; j++){
					if(_usageType == 'yy'){		//	연간인경우
						
						_printTableContent += "<td style=width:" +_printTdWidth+ "%>" + (j+1) + "</td>";
						
					}else if(_usageType == 'mm'){	//	월간
						
						_printTableContent += "<td style=width:" +_printTdWidth+ "%>" + (j+1) + "</td>";
						
					}else{		//	일간
						
						_printTableContent += "<td style=width:" +_printTdWidth+ "%>" + j + "</td>";
					}
				}				
				_printTableContent += "</tr>";
				
			}
			
			_printTableContent +='<tr>';
			_printTableContent +='<td>' + _arr.meter_name + '</td>';
			
			for(var k=0; k<_usageData.list_usage.length; k++){
				_printTableContent +='<td>' + enernet.modules.utils.commaStr(_usageData.list_usage[k].kwh_curr.toFixed(1)) + '</td>';
			}
			
			_printTableContent +='</tr>';
				

		}//
		
		
		$("#printContentTableOuter").html(_printTableStart+_printTableContent+_printTableEnd)
		
		
		var _canvas = document.getElementById("cvsChart")
		var _printImg = _canvas.toDataURL('image/png');//myChart.toBase64Image();//
		$("#printChart").html("<img style='width:100%;height:100%;' src='" + _printImg + "'/>");		
		
		
		var _outerWidth = '875px';
		var _outerHeight = window.outerHeight * 0.90;
		
		var _printPageOuter = $("#printPageOuter").html();
		
		var popupWindow = window.open("", "_blank", 'height='+_outerHeight+', width='+_outerWidth + ', left=20px, top=10px' );
		popupWindow.document.write("<!DOCTYPE html>");
		popupWindow.document.write("<head>");
		popupWindow.document.write("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />");
		
		popupWindow.document.write("<link rel='stylesheet' type='text/css'  href='../resources/admin/bld/css/popBldUsageReportPrint.css'>");
		
		
		popupWindow.document.write('<title></title>');
		popupWindow.document.write("</head>");
		
		
		popupWindow.document.write("<body>");
		popupWindow.document.write(_printPageOuter);
		
		

		popupWindow.document.write('</body>');
		popupWindow.document.write('</html>');
		popupWindow.document.close();
		setTimeout(function(){
			if(type == 'print'){
				popupWindow.print();
			}
			
			popupWindow.focus();
			
		}, 3000);
	}
});