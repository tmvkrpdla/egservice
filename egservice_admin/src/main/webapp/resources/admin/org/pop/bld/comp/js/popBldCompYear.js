$(function(){
	enernet.modules.evt.makeDateY("dateTarget");
	
	$("#searchBtn").on('click', function(){
		$("#searchForm").submit();
	});
	
	var _ctx = document.getElementById('myChart');
	
	
	var _myLineChart = new Chart(_ctx, {
	    type: 'line',
	    data: {
	        datasets: _chartData,
	        labels: _chartLabels
	    },
	    options: {
	    	legend: {
	    		position: 'right'
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
	        },
	        scales: {
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
			}
		}
	});
	
	
});