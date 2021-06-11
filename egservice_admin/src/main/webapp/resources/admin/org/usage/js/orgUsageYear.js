$(function(){
	enernet.modules.evt.makeDateY("dateTarget");
	
	$("#usageSiteYearSearchBtn").on('click', function(){
		$("#usageSiteYearSearchForm").submit();
	});
	
	var _ctx = document.getElementById('myChart');
	
	
	var _myLineChart = new Chart(_ctx, {
	    type: 'line',
	    data: {
	        datasets: _usage_site_year_list,
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
	
	

	//label 여러 개
	/*var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"];
	
	for(var i=1; i<=12; i++){
		
		var _label = [];
		_label.push( i + "월");
		_label.push( alphabet[i-1]);
		
		_labels.push( _label);
	}*/
	
	
	
	/*var _myLineChart = new Chart(_ctx, {
	    type: 'line',
	    data: {
	        datasets: _usage_site_year_list,
	        labels: _chartLabels
	    },
	    options: {
	    	legend: {
	    		position: 'right'
	    	},
			responsive: true,
		    elements: {
	            point:{
	                radius: 0
	            }
	        },
	    	scales: {
				xAxes: [{
					gridLines: {
					      color: ['#F00', '#0F0', '#F00', '#F00']
					    },
					ticks:{
						fontColor : 'rgba(0, 0, 255, 1)'
					}
				}]
			}
		}
	});*/
		
});