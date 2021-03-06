$(function(){
	enernet.modules.evt.makeDateYMD("dateFrom");
	enernet.modules.evt.makeDateYMD("dateTo");
	
	//	전체 사용량
	var _tntUsageChart = null;
	
	//	전체 요금
	var _tntWonChart = null;
	
	//	계측기별
	var _midUsageChart = null;
	var _midWonChart = null;
	
	//	조회된 데이터가 있는지 확인
	var _isSearch = false;
	
	//	조회버튼
	$("#searchBtn").on('click', function(){
		
		$('div.wrap-loading').removeClass('display-none');
		
		try{
		
			stdViewRemove();
			
			getData();
			
			_isSearch = true;
			
		}catch(e){
			console.log(e)
			stdViewRemove();
			
		}finally{
		
			$('.wrap-loading').addClass('display-none');
		}
		
		
	});
	
	
	$("#refSaveBtn").on('click', function(){
		
		if(confirm('저장하시겠습니까?')){
			if(!_isSearch){
				return alert('기간 설정 조회 후 진행 할 수 있습니다');
			}
			
			if($("#refName").val().trim() == ''){
				return alert('절감 기준 명칭을 작성 해주시기 바랍니다.');
			}
			
			try{
				$('div.wrap-loading').removeClass('display-none');
				
				var _res = enernet.modules.api.createSaveRef($("#seqSite").val()
						, $("#refName").val(), $("#refComment").val(), $("#searchDateFrom").val(), $("#searchDateTo").val()
						, Number($("#kwhSum").val()).toFixed(2)
						, Number($("#kwh1").val()).toFixed(2)
						, Number($("#kwh2").val()).toFixed(2)
						, Number($("#kwh3").val()).toFixed(2)
						, Number($("#wonSum").val()).toFixed(2)
						, Number($("#won1").val()).toFixed(2)
						, Number($("#won2").val()).toFixed(2)
						, Number($("#won3").val()).toFixed(2)
						);
				
				//console.log(_res);
				
				if(_res.result_code==1){
					opener.window.location.reload();
					alert('저장에 성공하였습니다');
					window.close();
				}else{
					alert('저장에 실패하였습니다.')
				};
				
			}catch(e){
				console.log(e)
			}finally{
				$('.wrap-loading').addClass('display-none');
			}
			
			
		}
	});
	
	
	
	function getData(){
		var _seqSite = $("#seqSite").val();
		var _dateFrom = $("#dateFrom").val();
		var _dateTo = $("#dateTo").val();
		
		if(_dateFrom.trim()==''){
			return alert('기간 설정 시작일을 입력해주시기 바랍니다.');
		}
		
		if(_dateTo.trim()==''){
			return alert('기간 설정 종료일을 입력해주시기 바랍니다');
		}
		
		if(_dateFrom.replace(/-/g, '') > _dateTo.replace(/-/g, '')){
			
			return alert('기간 설정 시작일은 종료일 보다 작아야 합니다');
		}
		
		var _res =  enernet.modules.api.calculateSaveRefData(_seqSite, _dateFrom.replace(/-/g, ''), _dateTo.replace(/-/g, ''));
		
		//
		//console.log(_res)
		
		//	차트 라벨
		var _chartLabel = enernet.modules.utils.getTimeChartLabel();
		
		//
		var _tntUsage = [];
		var _tntWon = [];
		for (var i=0; i< _res.list_unit_for_all_meter.length; i++){
			var v = _res.list_unit_for_all_meter[i];
			_tntUsage.push(v.kwh.toFixed(2));
			_tntWon.push(v.won.toFixed(2));
		}
		
		//console.log(_tntUsage.length)
		//console.log(_tntWon.length)
		
		var _tntUsageObj = {};
		_tntUsageObj.label = '전체 계측기';
		_tntUsageObj.data = _tntUsage;
		_tntUsageObj.borderWidth = 2;
		_tntUsageObj.backgroundColor = _chartColors[0];
    	_tntUsageObj.borderColor = _chartColors[0];
		_tntUsageObj.fill = false;
    	
		var _tntUsageData = [];
		_tntUsageData.push(_tntUsageObj)
		
		var _tntWonObj = {};
		_tntWonObj.label = '전체 계측기';
		_tntWonObj.data = _tntWon;
		_tntWonObj.borderWidth = 2;
		_tntWonObj.backgroundColor = _chartColors[1];
		_tntWonObj.borderColor = _chartColors[1];
		_tntWonObj.fill = false;
		
		var _tntWonData = [];
		_tntWonData.push(_tntWonObj)
		
		_tntUsageChart = drawKwhChart(document.getElementById('tntUsageChart'), _tntUsageData, _chartLabel);
		_tntWonChart = drawWonChart(document.getElementById('tntWonChart'), _tntWonData, _chartLabel);
		//
				
		//	table
		var _trTag = "<tr class='removeTr'><td>전체 계측기</td>";
		_trTag += "<td>" + _res.sum_kwh_for_all_meter.toFixed(2) + "</td>";		//	kwhSum
		_trTag += "<td>" + _res.sum_kwh_for_all_meter_1.toFixed(2) + "</td>";	//	kwh1
		_trTag += "<td>" + _res.sum_kwh_for_all_meter_2.toFixed(2) + "</td>";	//	kwh2
		_trTag += "<td>" + _res.sum_kwh_for_all_meter_3.toFixed(2) + "</td>";	//	kwh3
		
		_trTag += "<td>" + _res.sum_won_for_all_meter.toFixed(2) + "</td>";		//	wonSum
		_trTag += "<td>" + _res.sum_won_for_all_meter_1.toFixed(2) + "</td>";	//	won1
		_trTag += "<td>" + _res.sum_won_for_all_meter_2.toFixed(2) + "</td>";	//	won2
		_trTag += "<td>" + _res.sum_won_for_all_meter_3.toFixed(2) + "</td>";	//	won3
		_trTag += "</tr>";
		
		$("#kwhSum").val(_res.sum_kwh_for_all_meter);
		$("#kwh1").val(_res.sum_kwh_for_all_meter_1);
		$("#kwh2").val(_res.sum_kwh_for_all_meter_2);
		$("#kwh3").val(_res.sum_kwh_for_all_meter_3);
		
		$("#wonSum").val(_res.sum_won_for_all_meter);
		$("#won1").val(_res.sum_won_for_all_meter_1);
		$("#won2").val(_res.sum_won_for_all_meter_2);
		$("#won3").val(_res.sum_won_for_all_meter_3);
		$("#searchDateFrom").val(_dateFrom.replace(/-/g, ''));
		$("#searchDateTo").val(_dateTo.replace(/-/g, ''));
		
		var _midUsageData = [];
		var _midWonData = [];
		
		for(var i=0; i<_res.list_meter.length; i++){
			
			var _listMeter = _res.list_meter[i];
						
			_trTag += "<tr class='removeTr'><td>"+ _listMeter.meter_descr + "</td>";
			_trTag += "<td>" + _listMeter.sum_kwh.toFixed(2) + "</td>";
			_trTag += "<td>" + _listMeter.sum_kwh_1.toFixed(2) + "</td>";
			_trTag += "<td>" + _listMeter.sum_kwh_2.toFixed(2) + "</td>";
			_trTag += "<td>" + _listMeter.sum_kwh_3.toFixed(2) + "</td>";
			                   
			_trTag += "<td>" + _listMeter.sum_won.toFixed(2) + "</td>";
			_trTag += "<td>" + _listMeter.sum_won_1.toFixed(2) + "</td>";
			_trTag += "<td>" + _listMeter.sum_won_2.toFixed(2) + "</td>";
			_trTag += "<td>" + _listMeter.sum_won_3.toFixed(2) + "</td>";
			_trTag += "</tr>";
			
			var _midUsageObj = {};
			_midUsageObj.label = _listMeter.meter_descr,
            _midUsageObj.data = []
            _midUsageObj.borderWidth = 2,
            _midUsageObj.backgroundColor = _chartColors[i%10];
        	_midUsageObj.borderColor = _chartColors[i%10];
            _midUsageObj.order = 1;
            _midUsageObj.fill = false;
			
            var _midWonObj = {};
			_midWonObj.label = _listMeter.meter_descr,
            _midWonObj.data = []
            _midWonObj.borderWidth = 2,
            _midWonObj.backgroundColor = _chartColors[i%10];
        	_midWonObj.borderColor = _chartColors[i%10];
            _midWonObj.order = 1;
            _midWonObj.fill = false;
            
            for(var j=0; j<_listMeter.list_unit.length; j++){
            	var _listUnit = _listMeter.list_unit[j];
            	//console.log(_listUnit)
            	_midUsageObj.data.push(_listUnit.kwh.toFixed(2));
            	_midWonObj.data.push(_listUnit.won.toFixed(2));
            }
			
			_midUsageData.push(_midUsageObj);
			_midWonData.push(_midWonObj);
		}		
		
		
		_midUsageChart = drawKwhChart(document.getElementById('midUsageChart'), _midUsageData, _chartLabel);
		_midWonChart = drawWonChart(document.getElementById('midWonChart'), _midWonData, _chartLabel);
		
		
		$("#dataTable").append(_trTag);	
			
		$("#hiddenTable").attr('style', 'display');
		$("#hiddenChart1").attr('style', 'display');
		$("#hiddenChart2").attr('style', 'display');
		$("#hiddenChart3").attr('style', 'display');
		$("#hiddenChart4").attr('style', 'display');
	}
	
	function stdViewRemove(){
		if(document.getElementsByClassName('removeTr').length != 0){
			$(".removeTr").remove();
		}
		_isSearch = false;
		
		//console.log(_tntUsageChart)
		
		//	전체 사용량
		if(_tntUsageChart != null){
			_tntUsageChart.destroy()
			
		}
		
		if(_tntWonChart != null){
			_tntWonChart.destroy()
		}
		if(_midUsageChart != null){
			_midUsageChart.destroy()
		}
		
		if(_midWonChart != null){
			_midWonChart.destroy()
		}
		
		$("#kwhSum").val('');
		$("#kwh1").val('');
		$("#kwh2").val('');
		$("#kwh3").val('');
		
		$("#wonSum").val('');
		$("#won1").val('');
		$("#won2").val('');
		$("#won3").val('');
		
		$("#searchDateFrom").val('');
		$("#searchDateTo").val('');
		
		$("#hiddenTable").attr('style', 'display:none');
		$("#hiddenChart1").attr('style', 'display:none');
		$("#hiddenChart2").attr('style', 'display:none');
		$("#hiddenChart3").attr('style', 'display:none');
		$("#hiddenChart4").attr('style', 'display:none');
		
	}
	
	
	function drawKwhChart(target, chartData, chartLabel){
				
		var _myLineChart = new Chart(target, {
		    type: 'line',
		    data: {
		        datasets: chartData,
		        labels: chartLabel
		    },
		    options: {
		    	legend: {
		    		position: 'right'
		    	},
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
		return _myLineChart;
	}
	
	
	function drawWonChart(target, chartData, chartLabel){
		var _myLineChart = new Chart(target, {
		    type: 'line',
		    data: {
		        datasets: chartData,
		        labels: chartLabel
		    },
		    options: {
		    	legend: {
		    		position: 'right'
		    	},
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
		    				labelString: '원',
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
		return _myLineChart
	}//
	
	
});