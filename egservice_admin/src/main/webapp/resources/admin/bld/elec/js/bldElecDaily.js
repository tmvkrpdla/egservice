$(function(){
	//	데이트 피커
	enernet.modules.evt.makeDateYMDFromTo("dateTarget", $("#TIME_CREATED").val(), $("#END_CREATED").val());
	
	//	조회 버튼
	$("#searchBtn").on('click', function(){
		$("#searchForm").submit();
	});
	
	
	
	//console.log(_usageChart)
	
	drawUsageChart($("#usageChart"), 1, _chartUsageArr, _chartLabel);
	drawUsageChart($("#wonChart"), 2, _chartWonArr, _chartLabel);
	
	//	var _t = $("#cloneDiv").children().clone();
	//	$("#container-fluid").find('div#rowBefore').before(_t)
	//	$("#container-fluid").find('.delChartAera');
			
	var _chartIdx = 0;
	
	for(var i=0; i<_meterChartArr.length; i++){
		var _meterArr = _meterChartArr[i];
		
		var _kwhChartIdx = cloneChart();
		var _wonChartIdx = cloneChart();
		
		var _kwhChartTitle = _meterArr.meter_descr + " (사용량)";
		var _wonChartTitle = _meterArr.meter_descr + " (사용 요금)";
		
		
		drawUsageChart($("#container-fluid").find('.chart_aera')[_kwhChartIdx], 1, _meterArr.kwh, _chartLabel);
		drawUsageChart($("#container-fluid").find('.chart_aera')[_wonChartIdx], 2, _meterArr.won, _chartLabel);
		
		$("#container-fluid").find('.delChartAera').find('.chart_title')[_kwhChartIdx].innerText = _kwhChartTitle;
		$("#container-fluid").find('.delChartAera').find('.chart_title')[_wonChartIdx].innerText = _wonChartTitle;
	}
	
	function cloneChart(){
		var _c = _chartIdx;
		var _t = $("#cloneDiv").children().clone();
		$("#container-fluid").find('div#rowBefore').before(_t);
		
		_chartIdx++;
		
		return _c;
	}
	
	
	//	전체 사용량 차트를 그림
	function drawUsageChart(target, type , chartData, chartLabel){
		var _labelString = type == 1 ? "kwh" : "원";
		
		var _chart = new Chart(target, {
		    type: 'bar',
		    data: {
		        datasets: chartData,
		        labels: chartLabel 
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
		    				labelString: _labelString,
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
		
		//return _chart;
	}//
	
	
	
});