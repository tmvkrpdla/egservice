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

	
});