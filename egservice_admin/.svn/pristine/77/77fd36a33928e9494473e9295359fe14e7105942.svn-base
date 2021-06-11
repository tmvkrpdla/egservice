$(function(){
	//	데이트 피커
	enernet.modules.evt.makeDateYMD("dateTarget");
	
	//	조회 버튼
	$("#usageDaySearchBtn").on('click', function(){
		$("#usageDaySearchForm").submit();
	});
	
	
	
	var _ctx = document.getElementById('myChart');
	
	var _myLineChart = new Chart(_ctx, {
	    type: 'line',
	    data: {
	        datasets: _usage_site_day_list,
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