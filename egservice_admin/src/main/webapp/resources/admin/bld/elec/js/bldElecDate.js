$(function(){
	
	$("#searchBtn").on('click', function(){
		$("#searchForm").submit();
	});
	
	enernet.modules.evt.makeDateYMDFromTo("dateTarget", $("#DATE_CREATED").val(), $("#DATE_ENDED").val());
	
	
	
	drawUsageChart($("#kwhChart"), 1, _kwhChartData, _chartLabel);
	drawUsageChart($("#wonChart"), 2, _wonChartData, _chartLabel);
	
	function drawUsageChart(target, type , chartData, chartLabel){
		var _labelString = type == 1 ? "kwh" : "원";
		
		var _chart = new Chart(target, {
		    type: 'bar',
		    data: {
		        datasets: chartData,
		        labels: chartLabel 
		    },
		    options: {
		    	legend: {
		    		position: 'top'
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
		

	}//
	
	var _chartIdx = 0;
	
	for(var i=0; i<_chartArr.length; i++){
		var _meterArr = _chartArr[i];
		
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
		$("#container-fluid").append(_t);
		
		_chartIdx++;
		
		return _c;
	}
	
});