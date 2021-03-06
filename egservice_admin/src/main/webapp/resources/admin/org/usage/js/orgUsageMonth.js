$(function(){
	enernet.modules.evt.makeDateYM("monthTarget");
	
	$("#usageSiteMonthSearchBtn").on('click', function(){
		$("#usageSiteMonthForm").submit();
	})
	
	var _ctx = document.getElementById('myChart');
	
	var _myLineChart = new Chart(_ctx, {
	    type: 'line',
	    data: {
	        datasets: _usage_site_month_list,
	        labels: _chartLabels		//
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