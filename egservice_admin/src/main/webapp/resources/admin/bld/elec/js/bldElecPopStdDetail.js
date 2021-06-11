$(function(){
	
	drawUsageChart($("#tntUsageChart"), 1, _tntUsageArr, _chartLabel);
	drawUsageChart($("#tntWonChart"), 2, _tntWonArr, _chartLabel);
	
	drawUsageChart($("#midUsageChart"), 1, _midUsageArr, _chartLabel);
	drawUsageChart($("#midWonChart"), 2, _midWonArr, _chartLabel);
	
	function drawUsageChart(target, type , chartData, chartLabel){
		var _labelString = type == 1 ? "kwh" : "원";
		
		var _chart = new Chart(target, {
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