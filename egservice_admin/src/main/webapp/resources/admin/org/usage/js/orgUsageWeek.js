$(function(){
	enernet.modules.evt.makeDateYMD("dateFrom");
	enernet.modules.evt.makeDateYMD("dateTo");
	
	$("#usageSiteWeekSearchBtn").on('click', function(){
		var _dateFrom = $("#dateFrom").val().replace(/-/g, '');
		var _dateTo = $("#dateTo").val().replace(/-/g, '');
		
		if("" == _dateFrom){
			return alert("기간 시작일을 입력해주세요");
		}
		
		if("" == _dateTo){
			return alert("기간 마지막일을 입력해주세요");
		}
		
		if(_dateFrom > _dateTo){
			return alert("기간 시작일이 기간 마지막일보다 큽니다");
		}
		
		$("#usageSiteWeekSearchForm").submit();
		
		
	});
	
	
	var _ctx = document.getElementById('myChart');
	
	var _myLineChart = new Chart(_ctx, {
	    type: 'line',
	    data: {
	        datasets: _usage_site_week_list,
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