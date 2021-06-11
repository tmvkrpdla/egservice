// 절감 기준에 데이터를 넣어줌.
function _setStdItem(obj) {

	$("#seq_save_ref").val(obj.seq_save_ref);
	$("#save_ref_name").val(obj.save_ref_name);
	$("#refName").val(obj.save_ref_name);

	// 절감 기준 선택 데이터를 받으면 + 버튼 활성화
	$("#addPlanBtn").removeClass('addPlanBtnReadonly');
	$("#addPlanBtn").addClass('btn');
	$("#addPlanBtn").addClass('btn-outline-primary');

	// 절감계획 시행 버튼 활성화
	$("#planRefBtn").removeClass('planRefBtnReadonly');
	$("#planRefBtn").addClass('btn');
	$("#planRefBtn").addClass('btn-outline-danger');

	var _result = enernet.modules.api.setSavePlanNameAndRef($("#seq_save_plan").val(), $("#planName").val(), $("#seq_save_ref").val());

	if ($(".delTrEvt").length != 0) {
		var _d = $(".delTrEvt");
		for (var i = 0; i < _d.length; i++) {

			var _l = $(_d[i]).find('.delTdHidden').val();
			enernet.modules.api.deleteSavePlanElem(_l);

		}
	}

	_removeData();
	_removeActData();
} // _setStdItem end

function _removeData() {
	// 절감 목표 목록 삭제
	$('.delTrEvt').remove();

	// 절감 조치행 삭제
	$('.actTrDis').remove();

	// 절감 조치리스트행 삭제
	$('.actTrEvt').remove();

	// 절감예상요약
	$("#save_kwh_total_from_elem").text('-');
	$("#save_won_total_from_elem").text('-');
	$("#save_kwh_month").text('-');
	$("#save_won_month").text('-');

	// 계측기별 절감 예상 삭제
	$('.delMeterTr').remove();

	//   
	$('#kwhChartContainer').hide();
	$('#wonChartContainer').hide();

	// 계측기별 차트 삭제
	$("#container-fluid").find('.delChartAera').remove();
} // _removeData end

function _removeActData() {
	// 절감 조치리스트 삭제
	$('.delTrActEvt').remove();
}
	   

function getData() {
	$('div.wrap-loading').removeClass('display-none');
	try {
		var _seqSavePlan = $("#seq_save_plan").val();
		
		_removeData();
		_removeActData();

		// //// 절감항목 목록 테이블
		var _result = enernet.modules.api.getSavePlanInfo(_seqSavePlan);

		var _list_plan_elem = _result.save_plan_info.list_plan_elem;
		var _list_act = _result.save_plan_info.list_plan_elem.list_act;
		
		for (var i = 0; i < _list_plan_elem.length; i++) {
			
			var _tag = "<tr class='delTrEvt'>";
			_tag += "<td>" + _list_plan_elem[i].meter_descr + '(' + _list_plan_elem[i].seq_meter + ')'
					+ "<input type='hidden' name='delTdHidden' class='delTdHidden' value=" + _list_plan_elem[i].seq_plan_elem + ">";
					+ "</td>";
			_tag += "<td>" + _list_plan_elem[i].hour_from + '시' + ' ~ ' + _list_plan_elem[i].hour_to + '시' + "</td>";
			_tag += "<td>" + _list_plan_elem[i].percent_to_save + '%' + "</td>";
			_tag += "<td>" + _list_plan_elem[i].save_kwh.toFixed(2) + "</td>";
			_tag += "<td>" + _list_plan_elem[i].save_won.toFixed(2) + "</td>";
			_tag += "<td>";
			_tag += "<input type=button class='btn btn-outline-success btn-sm delTrBtn' value='삭제'>";	
			_tag += "</td>";
			_tag += "</tr>";
			_tag += "<tr class='actTrEvt'>";
            _tag += "<td class='actTdEvt table-bordered'>" + '절감 조치' 
                    + "<form name='actpopForm' class='actpopForm'>"
                    + "<input type='hidden' name='checkAdd' class='seq_plan_elem checkAdd' value=" + _list_plan_elem[i].seq_plan_elem + ">"
                    + "</form>" + "</td>";
            _tag += "<td>";
            _tag += "<input type='button' class='btn btn-outline-primary popAddActBtn' value='+'>"
            _tag += "</td>";
            _tag += "</tr>";
            
            var _list_act = _list_plan_elem[i].list_act;
            for(var j=0; j<_list_act.length; j++) {
               _tag += "<tr class='actTrDis delTrActEvt'>";        
               _tag += "<td colspan='4' class='actClass table-bordered'>"
            	    + "<form name='actModForm' class='actModForm' method='post' action='elecPopActMod' target='popActModForm'>"
                    + "<input type='hidden' name='seq_act' class='seq_act' value=" + _list_act[j].seq_act + ">"
                    + "<input type='text' name='actContent' class='actContent' style='border: 0px; color: #858796;' size='110' readonly value='"+_list_act[j].act_content+"'>"
               		+ "</form>" + "</td>";
               _tag += "<td class='actTdClass'>";
               _tag += "<input type=button name='actInput' class='btn btn-outline-success btn-sm modActBtn' value='수정'>";
               _tag += "</td>";
               _tag += "<td>";
               _tag += "<input type=button class='btn btn-outline-success btn-sm delActBtn' value='삭제'>";
               _tag += "</td>";
               _tag += "</tr>";
            } // j for문 끝	
            $('#planTable').append(_tag);
		} // i for문 끝

		// 절감 항목(목록) 삭제버튼
		function addEvt() {
			var _evt = document.getElementsByClassName('delTrBtn');
			for (var i = 0; i < _evt.length; i++) {
				_evt[i].onclick = function() {

					$(this).parents('tr.delTrEvt').remove()
					var _elem = $(this).parents('tr.delTrEvt').find('.delTdHidden').val();
					var reselem = enernet.modules.api.deleteSavePlanElem(_elem);
					if (document.getElementsByClassName('delTrEvt').length == 0) {
						_removeData();
					} else {
						getData();
					}

				}
			}

		}; // addEvt()끝

				
		// 절감조치 추가버튼 (라디오 선택 후 팝업창)
		function addAct(cn) {
			var _trEvt = document.getElementsByClassName('actTrEvt');
			if (_trEvt.length != 0) {

				for (var i = 0; i < _trEvt.length; i++) {
					_trEvt[i].onclick = function(e) {

						if (document.getElementsByName('cn').length != 0) {
							$("#cn").remove();
						}

						if (e.target.className == 'actTdEvt') {
							$(this).find("input[name=checkAdd]")

						} else if (e.target.className == 'checkAdd') {

						} else {
							$(this).find('form').attr('method', 'post').attr('action', './elecPopActWrite');
							var _actWriteForm = $(this).find('form')[0];
							var inputValue = $(_actWriteForm).find("input[name='checkAdd']").val();

							var input = document.createElement("input");
							input.setAttribute("id", "cn");
							input.setAttribute("class", "cn");
							input.setAttribute("name", "cn");
							input.setAttribute("type", "text");
							input.setAttribute("value", inputValue);
							document.body.appendChild(input);

							var _outerWidth = window.outerWidth * 0.4;
							var _outerHeight = window.outerHeight * 0.5;
							window.open("", 'popActWriteForm', 'height=' + _outerHeight + ', width=' + _outerWidth
										+ ', left=20, top=10, scrollbars=1');
							
							_actWriteForm.target = 'popActWriteForm';
							_actWriteForm.submit();
						} // else 끝
					} // onclick = function(e) 끝
				} // for 문 끝
			} // if 끝
		}; // addAct 끝

		// 절감 조치 삭제
		function delAct() {
			var _delActEvt = document.getElementsByClassName('delActBtn');

			for (var i = 0; i < _delActEvt.length; i++) {
				_delActEvt[i].onclick = function() {
					$(this).parents('tr.delTrActEvt').remove()
					var _act = $(this).parents('tr.delTrActEvt').find('.seq_act').val();
					var _resDelAct = enernet.modules.api.deleteSaveAct(_act);
					if (document.getElementsByClassName('delTrActEvt').length == 0) {
						_removeActData();
					} else {
						getData();
					}
				} // .onclick = function() 끝
			} // for 끝
		}; // delAct 끝

		// 절감조치 수정버튼 (라디오 선택 후 팝업창)
		function modAct() {
			var _trMod = document.getElementsByClassName('actTrDis');
			if (_trMod.length != 0) {

				for (var i = 0; i < _trMod.length; i++) {
					_trMod[i].onclick = function(e) {

						if (document.getElementsByName('mod').length != 0) {
							$(".mod").remove();
						}

						if (document.getElementsByName('modCon').length != 0) {
							$(".modCon").remove();
						}

						/*
						 * if (document.getElementsByName('cn').length != 0) {
						 * $("#cn").remove(); }
						 */

						/*
						 * $("선택자").hasClass("클래스이름"); reutrn;
						 */
						if ($(e.target).hasClass('modActBtn')) {
							var _actModForm = $(this).find('form')[0];
							//var _actModForm2 = $(this).find('form')[0];
							var _mod = $(_actModForm).find("input[name='seq_act']").val();
							var _modCon = $(_actModForm).find("input[name='actContent']").val();
							
							var modinput = document.createElement("input");
							modinput.setAttribute("id", "mod");
							modinput.setAttribute("class", "mod");
							modinput.setAttribute("name", "mod");
							modinput.setAttribute("type", "text");
							modinput.setAttribute("value", _mod);
							document.body.appendChild(modinput);

							var modConinput = document.createElement("input");
							modConinput.setAttribute("id", "modCon");
							modConinput.setAttribute("class", "modCon");
							modConinput.setAttribute("name", "modCon");
							modConinput.setAttribute("type", "text");
							modConinput.setAttribute("value", _modCon);
							document.body.appendChild(modConinput);

							var _modinput = document.modinput;
							var _modConinput = document.modConinput;

							var _outerWidth = window.outerWidth * 0.4;
							var _outerHeight = window.outerHeight * 0.5;
							window.open("elecPopActMod",'popActModForm','height=' + _outerHeight + ', width=' + _outerWidth
													+ ', left=20, top=10, scrollbars=1');

							// _actModForm.target = 'popActModForm';
							_actModForm.submit();
						} // if 끝
					} // onclick = function(e) 끝
				} // for 문 끝
			} // if 끝
		}; // modAct 끝

		addEvt(); // 목표삭제 이벤트 추가
		addAct(); // 절감조치추가 이벤트 추가
		delAct(); // 절감 조치 삭제버튼
		modAct(); // 절감 조치 수정 삭제버튼
 	
    
		// 절감예상요약
		var _kwh = _result.save_plan_info.save_kwh_total_from_elem.toFixed(2)
		var _won = _result.save_plan_info.save_won_total_from_elem.toFixed(2)
		$("#save_kwh_total_from_elem").text(_kwh);
		$("#save_won_total_from_elem").text(_won);
		$("#save_kwh_month").text(_kwh * 23);
		$("#save_won_month").text(_won * 23);
    

		    // //// 계측기별 절감 예상
		var _list_meter = _result.save_plan_info.list_meter;
		var _meterTrTag = "";
		for (var i = 0; i < _list_meter.length; i++) {

			var _listMeter = _list_meter[i];
			_meterTrTag += "<tr class='delMeterTr'>";
			_meterTrTag += "<td>" + _listMeter.meter_descr + "</td>";
			_meterTrTag += "<td>" + _listMeter.save_kwh_all.toFixed(2) + "</td>";
			_meterTrTag += "<td>" + _listMeter.save_kwh_1.toFixed(2) + "</td>";
			_meterTrTag += "<td>" + _listMeter.save_kwh_2.toFixed(2) + "</td>";
			_meterTrTag += "<td>" + _listMeter.save_kwh_3.toFixed(2) + "</td>";
			_meterTrTag += "<td>" + _listMeter.save_won_all.toFixed(2) + "</td>";
			_meterTrTag += "<td>" + _listMeter.save_won_1.toFixed(2) + "</td>";
			_meterTrTag += "<td>" + _listMeter.save_won_2.toFixed(2) + "</td>";
			_meterTrTag += "<td>" + _listMeter.save_won_3.toFixed(2) + "</td>";
			_meterTrTag += "</tr>"

		}
		_meterTrTag += "<tr class='delMeterTr'>";
		_meterTrTag += "<td>" + '전체 계측기' + "</td>";
		_meterTrTag += "<td>" + _result.save_plan_info.save_kwh_for_all_meter_all.toFixed(2) + "</td>";
		_meterTrTag += "<td>" + _result.save_plan_info.save_kwh_for_all_meter_1.toFixed(2) + "</td>";
		_meterTrTag += "<td>" + _result.save_plan_info.save_kwh_for_all_meter_2.toFixed(2) + "</td>";
		_meterTrTag += "<td>" + _result.save_plan_info.save_kwh_for_all_meter_3.toFixed(2) + "</td>";
		_meterTrTag += "<td>" + _result.save_plan_info.save_won_for_all_meter_all.toFixed(2) + "</td>";
		_meterTrTag += "<td>" + _result.save_plan_info.save_won_for_all_meter_1.toFixed(2) + "</td>";
		_meterTrTag += "<td>" + _result.save_plan_info.save_won_for_all_meter_2.toFixed(2) + "</td>";
		_meterTrTag += "<td>" + _result.save_plan_info.save_won_for_all_meter_3.toFixed(2) + "</td>";
		_meterTrTag += "</tr>";

		$("#meter_plan").append(_meterTrTag);
    

		// 전체계측기 (사용량) 전체 계측기 (사용 요금)
		// 차트라벨
		var _chart_label = [];
		var _plan_for_all_meter = _result.save_plan_info.list_unit_plan_for_all_meter;

		var _kwh_plan = []; // 사용량 절감목표
		var _kwh_ref = []; // 사용량 절감기준

		var _won_plan = []; // 사용요금 절감목표
		var _won_ref = []; // 사용요금 절감기준

		for (var i = 0; i < _plan_for_all_meter.length; i++) {
			// _plan_for_all_meter[i]

			if (_plan_for_all_meter[i].hhmm.indexOf(":15") > 0
					|| _plan_for_all_meter[i].hhmm.indexOf(":30") > 0
					|| _plan_for_all_meter[i].hhmm.indexOf(":45") > 0) {
				_chart_label.push(""); // 15분, 30분, 45분

			} else {
				if (_plan_for_all_meter[i].hhmm.indexOf("00:00") > 0) {
					_chart_label.push(""); // 00:00 분
				} else {
					var _hhmm = _plan_for_all_meter[i].hhmm.replace(":00", "");

					_chart_label.push(_hhmm + "시");
				}

			}

			_kwh_plan.push(_plan_for_all_meter[i].kwh_plan.toFixed(2));
			_kwh_ref.push(_plan_for_all_meter[i].kwh_ref.toFixed(2));
			_won_plan.push(_plan_for_all_meter[i].won_plan.toFixed(2));
			_won_ref.push(_plan_for_all_meter[i].won_ref.toFixed(2));
		}
    

		    // 전체 계측기의 사용량 / 요금 차트 그리기
		makeChart(1, 'kwhChartContainer', 'kwhChart', _chart_label, _kwh_plan, _kwh_ref);
		makeChart(2, 'wonChartContainer', 'wonChart', _chart_label, _won_plan, _won_ref);

		// 계측기 별로 차트 그리기
		var _list_meter = _result.save_plan_info.list_meter;
		var _chart_data_obj = [];

		for (var i = 0; i < _list_meter.length; i++) {
			var _list_unit_plan = _list_meter[i].list_unit_plan;

			var _kwhTitle = _list_meter[i].meter_descr + " (사용량) ";
			var _wonTitle = _list_meter[i].meter_descr + " (사용요금) ";

			// // 사용량
			var _kwhRefObj = {};
			_kwhRefObj.label = "절감 기준";
			_kwhRefObj.borderWidth = 2;
			_kwhRefObj.backgroundColor = _chartColors[1 % 10];
			_kwhRefObj.borderColor = _chartColors[1 % 10];
			_kwhRefObj.fill = false;
			_kwhRefObj.data = [];

			var _kwhPlanObj = {};
			_kwhPlanObj.label = "절감 목표";
			_kwhPlanObj.borderWidth = 2;
			_kwhPlanObj.backgroundColor = _chartColors[2 % 10];
			_kwhPlanObj.borderColor = _chartColors[2 % 10];
			_kwhPlanObj.fill = false;
			_kwhPlanObj.data = [];

			// // 사용요금
			var _wonRefObj = {};
			_wonRefObj.label = "절감 기준";
			_wonRefObj.borderWidth = 2;
			_wonRefObj.backgroundColor = _chartColors[3 % 10];
			_wonRefObj.borderColor = _chartColors[3 % 10];
			_wonRefObj.fill = false;
			_wonRefObj.data = [];

			var _wonPlanObj = {};
			_wonPlanObj.label = "절감 목표";
			_wonPlanObj.borderWidth = 2;
			_wonPlanObj.backgroundColor = _chartColors[4 % 10];
			_wonPlanObj.borderColor = _chartColors[4 % 10];
			_wonPlanObj.fill = false;
			_wonPlanObj.data = [];

			for (var j = 0; j < _list_unit_plan.length; j++) {
				_kwhRefObj.data.push(_list_unit_plan[j].kwh_ref.toFixed(2)); // 기준
				_kwhPlanObj.data.push(_list_unit_plan[j].kwh_plan.toFixed(2)); // 목표
				_wonRefObj.data.push(_list_unit_plan[j].won_ref.toFixed(2)); // 기준
				_wonPlanObj.data.push(_list_unit_plan[j].won_plan.toFixed(2)); // 목표
			}

			var _kObj = {};
			_kObj.title = _kwhTitle;
			_kObj.chartData = [ _kwhRefObj, _kwhPlanObj ];
			_kObj.type = 1;

			var _wObj = {};
			_wObj.title = _wonTitle;
			_wObj.chartData = [ _wonRefObj, _wonPlanObj ];
			_wObj.type = 2;

			_chart_data_obj.push(_kObj);
			_chart_data_obj.push(_wObj);
		}

		// 차트 크리기
		for (var i = 0; i < _chart_data_obj.length; i++) {
			meterMakeChart(_chart_label, _chart_data_obj[i], i);
		}

		function meterMakeChart(chart_label, chart_data, idx) {
			var _clone = $("#cloneDiv").children().clone();
			$("#container-fluid").append(_clone);

			var _labelString = chart_data.type == 1 ? 'kWh' : '원';

			var _chart = new Chart(
					$("#container-fluid").find('.chart_aera')[idx], {
						type : 'line',
						data : {
							datasets : chart_data.chartData,
							labels : chart_label
						},
						options : {
							legend : {
								position : 'top'
							},
							responsive : true,
							maintainAspectRatio : false,
							elements : {
								point : {
									radius : 0
								},
								line : {
									tension : 0
								}
							},
							scales : {
								xAxes : [ {
									gridLines : {
										display : false
									},
									ticks : {
										autoSkip : false,
										maxRotation : 0,
										fontSize : 12
									}
								} ],
								yAxes : [ {
									ticks : {
										suggestedMax : 20,
										fontSize : 14
									},
									scaleLabel : {
										display : true,
										labelString : _labelString,
										fontSize : 14
									}
								} ]
							}
						}
					});

			$("#container-fluid").find('.chart_title')[idx].innerText = chart_data.title;

		} // meterMakeChart end
	
    
		// 라벨스트링, containerId , chartId , 차트 라벨, 목표, 기준;
		function makeChart(type, targetContainer, targetChart, chartLabel, planArr, refArr) {
			var _labelString = type == 1 ? 'kWh' : '원';

			var _refObj = {};

			_refObj.label = "절감 기준";
			_refObj.borderWidth = 2;
			_refObj.backgroundColor = _chartColors[1 % 10];
			_refObj.borderColor = _chartColors[1 % 10];
			_refObj.fill = false;
			_refObj.data = refArr;

			var _planObj = {};
			_planObj.label = "절감 목표";
			_planObj.borderWidth = 2;
			_planObj.backgroundColor = _chartColors[2 % 10];
			_planObj.borderColor = _chartColors[2 % 10];
			_planObj.fill = false;
			_planObj.data = planArr;

			var chartData = [];
			chartData.push(_refObj);
			chartData.push(_planObj);

			var _chart = new Chart(document.getElementById(targetChart), {
				type : 'line',
				data : {
					datasets : chartData,
					labels : chartLabel
				},
				options : {
					legend : {
						position : 'top'
					},
					responsive : true,
					maintainAspectRatio : false,
					elements : {
						point : {
							radius : 0
						},
						line : {
							tension : 0
						}
					},
					scales : {
						xAxes : [ {
							gridLines : {
								display : false
							},
							ticks : {
								autoSkip : false,
								maxRotation : 0,
								fontSize : 12
							}
						} ],
						yAxes : [ {
							ticks : {
								suggestedMax : 20,
								fontSize : 14
							},
							scaleLabel : {
								display : true,
								labelString : _labelString,
								fontSize : 14
							}
						} ]
					} // scales end
				} // options end
			}); // var _chart end

			$("#" + targetContainer).show();
		} // makeChart end

	} catch (e) {
		console.log('error');
		console.log(e)
	} finally {
		$('.wrap-loading').addClass('display-none');
	}

} // getData end

$(document).ready(
		function() {
			// $(function(){

			var _h = window.outerHeight * 0.9;
			var _w = window.outerWidth * 0.9;
			var _op = "scrollbars=yes,resizable=yes,top=50,left=50";
			_op += ',width=' + _w;
			_op += ',height=' + _h;

			// helpful 메뉴얼 열기
			// window.open('../bld/elecPopHelpful', '_blank', _op);

			$("#planName").focus();

			// 절감계획 시행 버튼
			$("#planRefBtn").on('click', function() {

				if ($("#planRefBtn").hasClass('planRefBtnReadonly')) {
					return;
				}

				if ($('.delTrEvt').length == 0) {
					return alert('절감 목표 목록을 등록 해주시기 바랍니다');
				}

				var _site = $("#seq_site").val();
				var _plan = $("#seq_save_plan").val();

				var _res = enernet.modules.api.setActiveSavePlan(_site, _plan);
				if (_res.result_code == 1) {

					alert('저장에 성공하였습니다');

					location.href = '../bld/elecPlanWrite';

				} else {
					alert('저장에 실패하였습니다');
				}
			});
   
			
			// 절감 기준 선택 버튼
			$("#popStdListBtn").click(
					function() {
						var _planName = $("#planName").val();
						if (_planName.trim() == '') {
							return alert('절감 계획 명칭을 작성 해주시기 바랍니다');
						}

						// $("#seq_save_ref").val('');
						// $("#save_ref_name").val('');
						// $("#refName").val('');

						if (document.getElementsByName('popForm').length != 0) {
							$("#popForm").remove();
						}

						var form = document.createElement("form");
						form.setAttribute("id", "popForm")
						form.setAttribute("name", "popForm")
						form.setAttribute("charset", "UTF-8");
						form.setAttribute("method", "post");
						form.setAttribute("action", "./elecPopStdList");
						document.body.appendChild(form);

						var _popForm = document.popForm;

						var _outerWidth = window.outerWidth * 0.95;
						var _outerHeight = window.outerHeight * 0.8;

						window.open("", 'popForm', 'height=' + _outerHeight + ', width=' + _outerWidth + ', left=20, top=10, scrollbars=1');
						_popForm.target = 'popForm';
						_popForm.submit();

					});
   
			// 절감 목표 추가 버튼
			$("#addPlanBtn").on('click',
					function() {

						if ($("#addPlanBtn").hasClass('addPlanBtnReadonly')) {
							return;
						}

						var _seqSaveRef = $("#seq_save_ref").val();
						if (_seqSaveRef == '') {
							return alert('절감 기준을 선택 해주시기 바랍니다');
						}

						if ($("#hourFrom").val() > $("#hourTo").val()) {
							return alert('절감 시작 시간은 절감 종료 시간보다 작아야합니다');
						}

						var _seqSavePlan = $("#seq_save_plan").val();
						var _seqMeter = $("#seqMeter").find('option:selected').attr('data-id');
						var _descr = $("#seqMeter").val();

						var _hourFrom = $("#hourFrom").val();
						var _hourTo = $("#hourTo").val();
						var _percentToSave = $("#percentToSave").val();

						var _res = enernet.modules.api.addSavePlanElem(_seqSavePlan, _seqMeter, _hourFrom, _hourTo,_percentToSave);
						if (_res.result_code == 2) {
							return alert(_res.result_name);
						}
						getData();
					});
   
});