$(function(){
	//	api data 변수
	var _apiData = null;

	//chart 변수
	var _ctx = null;
	var _mixedChart = null;
	
	init('loding');
	
	function init(type){
		$('div.wrap-loading').removeClass('display-none');
		
		setTimeout(function(){
			try{
				removeAll(type);
				
				if(type=='refresh'){
					getSiteInfoBld();
				}
				
				getSiteUsageDay();
				drawChart();
				
				getListUsageTable();
				
			}catch(e){
				console.log(e)
				var _data = {};
				_data.url = location.href;
				_data.errorLog = e.toString();
				
				enernet.modules.api.ajaxCall("../../ajax/error", _data);
				
				alert('처리하는데 문제가 생겼습니다.');
				
			}finally{
				$('.wrap-loading').addClass('display-none');
			}
			
			
		}, 100);
		
		
	}
	
	
	//	새로 고침 버튼
	$("#refreshBtn").on('click', function(){
		init('refresh'); 
	})
	
	
	
	//	전체 삭제
	function removeAll(type){
		_apiData = null;
		
		$("#get_api_time").text("");	//	content-body 데이터 불러온 시간
		
		if(type=='refresh'){
			removeSiteInfo();	//	건물정보 삭제
		}
		
		removeUsage();		//	오늘사용량 삭제	
		
		removeChart();

		$("#list_usage_table1").find('tr.list_usage_tr').remove();
		$("#list_usage_table2").find('tr.list_usage_tr').remove()
	}
	
	
	//	건물정보 삭제
	function removeSiteInfo(){
		$("#site_floor_info").text("");
		$("#site_area").text("");
		$("#site_built_year").text("");
		$("#site_built_month").text("");
		$("#site_home_page").html("");
		$("#site_phone").text("");
		$("#site_fax").text("");
		$("#site_address").text("");
	}
	
	
	//오늘 사용량,휴가/근무일 삭제
	function removeUsage(){
		$("#sum").text("");			//	오늘 사용량
		$("#sum_avg").text("");		//	30일 평균 사용량
		$("#delta_sum").text("");		//	사용량 비교
		$("#delta_sum_img").html("");
		$("#delta_carbon").text("");
		$("#delta_carbon_img").html("");
	}
	
	
	//차트 삭제
	function removeChart(){
		if(_mixedChart != undefined){
			
			_mixedChart.destroy();
		}
	}

	
	//	건물정보 가져오기
	function getSiteInfoBld(){
		var _getSiteInfoBld = enernet.modules.api.getSiteInfoBld($("#seq_site").val());
		
		$("#site_floor_info").text(_getSiteInfoBld.floor_info);
		$("#site_area").text(enernet.modules.utils.commaStr(_getSiteInfoBld.area.toFixed(2)) + "㎡ ");
		$("#site_built_year").text(_getSiteInfoBld.built_year);
		$("#site_built_month").text(_getSiteInfoBld.built_month);
		$("#site_home_page").html("<a target='_blank' href="+ _getSiteInfoBld.home_page +">" + _getSiteInfoBld.home_page +"</a>");
		$("#site_phone").text("");
		$("#site_fax").text("");
		$("#site_address").text(_getSiteInfoBld.address);
	}
	
	
	//	사용량 정보 가져오기
	function getSiteUsageDay(){
		
		var _today = enernet.modules.utils.getYYMMDD().split("-");
		var _yy = _today[0];
		var _mm = _today[1];
		var _dd = _today[2];
	
		_apiData = enernet.modules.api.getSiteUsageFront($("#seq_site").val(), _yy, _mm, _dd);
		var _get_api_time = enernet.modules.utils.getTimeStamp();
		
		//var _isHolidayText = "";
		
		//	오늘 사용량
		var _sum = _apiData.sum;
		//	30일 평균 사용량
		var _sum_avg = null;
		
		if(_apiData.is_holiday == 0){	//	근무일이면
			_sum_avg = _apiData.sum_avg_workday;
		
			
		}else{					//	휴무일이면
			_sum_avg = _apiData.sum_avg_holiday;
			
		}
			
		//	사용량 비교
		var _delta_sum = _apiData.delta_sum;
		var _delta_sum_img = null;
		if(_delta_sum < 0){
			_delta_sum = Math.abs(_delta_sum);
			_delta_sum_img = "<i class='fas fa-caret-down' style='color:blue;font-size: 22px;'></i>";
		}else{
			_delta_sum_img = "<i class='fas fa-caret-up' style='color:red;font-size: 22px;'></i>";
		}
		
		//	CO2 발생량
		var _delta_carbon = _apiData.delta_carbon;
		var _delta_carbon_img = null;
		if(_delta_carbon < 0){
			_delta_carbon = Math.abs(_delta_carbon)
			_delta_carbon_img = "<i class='fas fa-caret-down' style='color:blue;font-size: 22px;'></i>";
		}else{
			_delta_carbon_img = "<i class='fas fa-caret-up' style='color:red;font-size: 22px;'></i>"; 
		}
		
		$("#sum").text(enernet.modules.utils.commaStr(_sum.toFixed(2)));			//	오늘 사용량
		$("#sum_avg").text(enernet.modules.utils.commaStr(_sum_avg.toFixed(2)));	//	30일 평균 사용량
		$("#delta_sum").text(enernet.modules.utils.commaStr(_delta_sum.toFixed(2)));	//	사용량 비교
		$("#delta_sum_img").html(_delta_sum_img);
		$("#delta_carbon").text(enernet.modules.utils.commaStr(_delta_carbon.toFixed(2)));
		$("#delta_carbon_img").html(_delta_carbon_img);
		
	
		
		
		$("#get_api_time").text(_get_api_time);
		
	}// 사용량 정보 가져오기 끝
	

	//	차트
	function drawChart(){
		
		// 차트 데이터 생성
		var _list_usage = _apiData.list_usage;
		
			
		var	_bar_data = [];
		var	_line_data_workday = [];
		var _line_data_holiday = [];
		var	_chart_label = [];
		
		
		
		for(var i=0; i<_list_usage.length; i++){
			_bar_data.push(_list_usage[i].usage);
			
			//	근무일이면
			_line_data_workday.push(_list_usage[i].usage_avg_workday);
			//	휴무일이면
			_line_data_holiday.push(_list_usage[i].usage_avg_holiday);
			
			
			//	라벨
			if( _list_usage[i].hhmm.indexOf(":15")>0 || _list_usage[i].hhmm.indexOf(":30")>0 || _list_usage[i].hhmm.indexOf(":45")>0 ){
				_chart_label.push("");	//	15분, 30분, 45분
				
			}else{
				if(_list_usage[i].hhmm.indexOf("00:00")>0){
					_chart_label.push("");	//	00:00 분
				}else{
					var _hhmm = _list_usage[i].hhmm.replace(":00", "");
					
					_chart_label.push(_hhmm + "시");
				}
				
			}
			
		}
		
		
		_ctx = document.getElementById('myChart');
		
		_mixedChart = new Chart(_ctx, {
		    type: 'bar',
		    data: {
		        datasets: [
		        	{
			            label: '오늘 사용량',
			            data: _bar_data,	//	bar chart
			            borderWidth: 2,
			            backgroundColor: 'rgba(255, 0, 0, 0.5)',
			            // this dataset is drawn below
			            order: 1
			        }, 
			        {
			            label: '30일 평균(근무일)',
			            data: _line_data_workday,	//	line chart
			            type: 'line',
			            borderColor: 'rgba(0, 0, 255, 0.5)',
			            fill: false,
			            order: 2
			        },
			        {
			            label: '30일 평균(휴무일)',
			            data: _line_data_holiday,	//	line chart
			            type: 'line',
			            borderColor: 'rgba(0, 180, 180, 0.5)',
			            fill: false,
			            order: 3
			        }
			        ],
		        labels: _chart_label //['January', 'February', 'March', 'April']
		    },
		    options: {
		    	scales:{
		    		xAxes: [{
		    			gridLines: {
		                    display:false
		                },
		    			ticks: {
		    				autoSkip: false,
		    				maxRotation: 0,
		    				fontSize: 12
		    			}
		    		}],
		    		yAxes: [{
		    			ticks: {
		    				suggestedMax: 20,
		    				fontSize: 14
		    			},
		    			scaleLabel: {
		    				display: true,
		    				labelString: 'kWh',
		    				fontSize: 14
		    			}
		    		}]
		    	},
				responsive: true,
				maintainAspectRatio: false,
			    elements: {
		            point:{
		                radius: 0
		            },
		            line: {
		            	tension: 0
		            }
		        }
			}
		});
	}//	차트 끝
	
	
	//	30일 평균 사용량 테이블
	function getListUsageTable(){
		
		var _arr1 = _apiData.list_usage.slice(0,48);
		var _arr2 = _apiData.list_usage.slice(48);
		
		var _listUsageTable1 = createTag(_arr1);
		var _listUsageTable2 = createTag(_arr2);
		
		$("#list_usage_table1").append(_listUsageTable1);
		$("#list_usage_table2").append(_listUsageTable2);
	}

	function createTag(arr){
		var _tag = null;
		
		for(var i=0; i<arr.length; i++){
			_tag += "<tr class='list_usage_tr'>";
			_tag += "<td>" + arr[i].hhmm + "</td>";	//	시간
			
			if(arr[i].usage == null){
				_tag += "<td>" + "-" + "</td>";	//	사용량
			}else{
				_tag += "<td>" +  enernet.modules.utils.commaStr(arr[i].usage.toFixed(2)) + "</td>";	//	사용량	
			}
			_tag += "<td>" +  enernet.modules.utils.commaStr(arr[i].usage_avg_workday.toFixed(2)) + "</td>";	//	근무일
			
			_tag += "<td>" +  enernet.modules.utils.commaStr(arr[i].usage_avg_holiday.toFixed(2)) + "</td>";		//	휴무일
			
			
			if(arr[i].delta_usage == null){
				_tag += "<td>" + "-" + "</td>";
			}else{
				if(arr[i].delta_usage>0){
					_tag += "<td>" + "+" + enernet.modules.utils.commaStr(arr[i].delta_usage.toFixed(2)) + "</td>";
				}else{
					_tag += "<td>"  + enernet.modules.utils.commaStr(arr[i].delta_usage.toFixed(2)) + "</td>";
				}
			}
			
			
			if(arr[i].delta_carbon == null){
				_tag += "<td>" + "-" + "</td>";
			}else{
				
				if(arr[i].delta_carbon>0){
					_tag += "<td>" +  "+" + enernet.modules.utils.commaStr(arr[i].delta_carbon.toFixed(2)) + "</td>";
				}else{
					_tag += "<td>" +  enernet.modules.utils.commaStr(arr[i].delta_carbon.toFixed(2)) + "</td>";
				}
				
			}
			
			_tag += "</tr>";
		}
		
		return _tag;
	}
	
});