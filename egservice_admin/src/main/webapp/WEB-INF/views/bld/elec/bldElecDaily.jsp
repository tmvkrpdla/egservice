<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>일간 절감 성과 보기</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">	
	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecDaily.js"></script>
	
<script type="text/javascript">
var _chartUsageArr = [];
var _chartWonArr = [];
var _chartLabel = enernet.modules.utils.getTimeChartLabel();

/**
	kwh_ref : 기준 사용량
	won_ref : 기준 사용요금
	kwh_plan : 절감목표 사용량
	won_plan : 절감목표 사용요금
	kwh_real : 실제 사용량
	won_real : 실제 사용 요금

 */

var _chartData = {};
_chartData.kwh_ref = {};
_chartData.kwh_ref.label = "절감 기준";
_chartData.kwh_ref.borderWidth = 2;
_chartData.kwh_ref.backgroundColor = ['rgb(116, 116, 116)'];
_chartData.kwh_ref.borderColor = ['rgb(116, 116, 116)'];
_chartData.kwh_ref.fill = false;
_chartData.kwh_ref.type = 'line';
_chartData.kwh_ref.order = 2;
_chartData.kwh_ref.data = [];

_chartData.won_ref = {};
_chartData.won_ref.label = "절감 기준";
_chartData.won_ref.borderWidth = 2;
_chartData.won_ref.backgroundColor = ['rgb(116, 116, 116)'];
_chartData.won_ref.borderColor = ['rgb(116, 116, 116)'];
_chartData.won_ref.fill = false;
_chartData.won_ref.type = 'line';
_chartData.won_ref.order = 2;
_chartData.won_ref.data = [];

_chartData.kwh_plan = {};
_chartData.kwh_plan.label = "절감 목표";
_chartData.kwh_plan.borderWidth = 2;
_chartData.kwh_plan.backgroundColor = _chartColors[0%10];
_chartData.kwh_plan.borderColor = _chartColors[0%10];
_chartData.kwh_plan.fill = false;
_chartData.kwh_plan.type = 'line';
_chartData.kwh_plan.order = 3;
_chartData.kwh_plan.data = [];

_chartData.won_plan = {};
_chartData.won_plan.label = "절감 목표";
_chartData.won_plan.borderWidth = 2;
_chartData.won_plan.backgroundColor = _chartColors[0%10];
_chartData.won_plan.borderColor = _chartColors[0%10];
_chartData.won_plan.fill = false;
_chartData.won_plan.type = 'line';
_chartData.won_plan.order = 3;
_chartData.won_plan.data = [];


_chartData.kwh_real = {};
_chartData.kwh_real.label = "실제 사용량";
_chartData.kwh_real.borderWidth = 2;
_chartData.kwh_real.backgroundColor = _chartColors[2%10];
_chartData.kwh_real.borderColor = _chartColors[2%10];
_chartData.kwh_real.fill = true;
_chartData.kwh_real.type = 'bar';
_chartData.kwh_real.order = 1;
_chartData.kwh_real.data = [];

_chartData.won_real = {};
_chartData.won_real.label = "실제 사용 요금";
_chartData.won_real.borderWidth = 2;
_chartData.won_real.backgroundColor = _chartColors[2%10];
_chartData.won_real.borderColor = _chartColors[2%10];
_chartData.won_real.fill = true;
_chartData.won_real.type = 'bar';
_chartData.won_real.order = 1;
_chartData.won_real.data = [];

<c:forEach items="${SAVE_RESULT_DAILY.list_unit_plan_for_all_meter}" var="LIST_UNIT_PLAN_FOR_ALL_METER">
	var _kwh_ref   = "${LIST_UNIT_PLAN_FOR_ALL_METER.kwh_ref}"; 
	var _won_ref   = "${LIST_UNIT_PLAN_FOR_ALL_METER.won_ref}";
	var _kwh_plan  = "${LIST_UNIT_PLAN_FOR_ALL_METER.kwh_plan}";
	var _won_plan  = "${LIST_UNIT_PLAN_FOR_ALL_METER.won_plan}";
	var _kwh_real  = "${LIST_UNIT_PLAN_FOR_ALL_METER.kwh_real}";
	var _won_real  = "${LIST_UNIT_PLAN_FOR_ALL_METER.won_real}";


	
	_chartData.kwh_ref.data.push( Number(_kwh_ref).toFixed(2));
	_chartData.won_ref.data.push(  Number(_won_ref).toFixed(2));
	_chartData.kwh_plan.data.push( Number(_kwh_plan).toFixed(2));
	_chartData.won_plan.data.push( Number(_won_plan).toFixed(2));
	_chartData.kwh_real.data.push( Number(_kwh_real).toFixed(2));
	_chartData.won_real.data.push( Number(_won_real).toFixed(2));
	
</c:forEach>

_chartUsageArr.push(_chartData.kwh_ref);
_chartUsageArr.push(_chartData.kwh_plan);
_chartUsageArr.push(_chartData.kwh_real);

_chartWonArr.push(_chartData.won_ref);
_chartWonArr.push(_chartData.won_plan);
_chartWonArr.push(_chartData.won_real);


_meterChartArr = [];
<c:forEach items="${SAVE_RESULT_DAILY.list_meter}" var="LIST_METER" varStatus="STATUS">
	var _meterObj = {};
	_meterObj.meter_descr = "${LIST_METER.meter_descr}";
	_meterObj.kwh = [];
	_meterObj.won = [];
	
	var _kwhRef = {};
	_kwhRef.label = "절감 기준";
	_kwhRef.borderWidth = 2;
	_kwhRef.backgroundColor = ['rgb(116, 116, 116)'];
	_kwhRef.borderColor = ['rgb(116, 116, 116)'];
	_kwhRef.fill = false;
	_kwhRef.type = 'line';
	_kwhRef.order = 2;
	_kwhRef.data = [];

	var _wonRef = {};
	_wonRef.label = "절감 기준";
	_wonRef.borderWidth = 2;
	_wonRef.backgroundColor = ['rgb(116, 116, 116)'];
	_wonRef.borderColor = ['rgb(116, 116, 116)'];
	_wonRef.fill = false;
	_wonRef.type = 'line';
	_wonRef.order = 2;
	_wonRef.data = [];

	var _kwhPlan = {};
	_kwhPlan.label = "절감 목표";
	_kwhPlan.borderWidth = 2;
	_kwhPlan.backgroundColor = _chartColors[0%10];
	_kwhPlan.borderColor = _chartColors[0%10];
	_kwhPlan.fill = false;
	_kwhPlan.type = 'line';
	_kwhPlan.order = 3;
	_kwhPlan.data = [];

	var _wonPlan = {};
	_wonPlan.label = "절감 목표";
	_wonPlan.borderWidth = 2;
	_wonPlan.backgroundColor = _chartColors[0%10];
	_wonPlan.borderColor = _chartColors[0%10];
	_wonPlan.fill = false;
	_wonPlan.type = 'line';
	_wonPlan.order = 3;
	_wonPlan.data = [];


	var _kwhReal = {};
	_kwhReal.label = "실제 사용량";
	_kwhReal.borderWidth = 2;
	_kwhReal.backgroundColor = _chartColors[2%10];
	_kwhReal.borderColor = _chartColors[2%10];
	_kwhReal.fill = true;
	_kwhReal.type = 'bar';
	_kwhReal.order = 1;
	_kwhReal.data = [];

	var _wonReal = {};
	_wonReal.label = "실제 사용 요금";
	_wonReal.borderWidth = 2;
	_wonReal.backgroundColor = _chartColors[2%10];
	_wonReal.borderColor = _chartColors[2%10];
	_wonReal.fill = true;
	_wonReal.type = 'bar';
	_wonReal.order = 1;
	_wonReal.data = [];
	
	<c:forEach items="${LIST_METER.list_unit_plan}" var="LIST_UNIT_PLAN"> 
		var _kwh_ref  = "${LIST_UNIT_PLAN.kwh_ref}";
		var _won_ref  = "${LIST_UNIT_PLAN.won_ref}";
        var _kwh_plan = "${LIST_UNIT_PLAN.kwh_plan}";
        var _won_plan = "${LIST_UNIT_PLAN.won_plan}";
        var _kwh_real = "${LIST_UNIT_PLAN.kwh_real}";
        var _won_real = "${LIST_UNIT_PLAN.won_real}";
        
		_kwhRef.data.push(Number(_kwh_ref).toFixed(2));
		_wonRef.data.push(Number(_won_ref).toFixed(2));
		_kwhPlan.data.push(Number(_kwh_plan).toFixed(2));
		_wonPlan.data.push(Number(_won_plan).toFixed(2));
		_kwhReal.data.push(Number(_kwh_real).toFixed(2));
		_wonReal.data.push(Number(_won_real).toFixed(2));
	</c:forEach>
	
	_meterObj.kwh.push(_kwhRef);
	_meterObj.kwh.push(_kwhPlan);
	_meterObj.kwh.push(_kwhReal);
	_meterObj.won.push(_wonRef);
	_meterObj.won.push(_wonPlan);
	_meterObj.won.push(_wonReal);
	_meterChartArr.push(_meterObj);
</c:forEach>



</script>
	
	</c:if>
	
</head>

<body id="page-top" oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	
	<%-- session이 없는 경우 --%>
	<c:if test="${empty sessionScope.ADMIN}">
		<jsp:include page="../../common/emptySession.jsp"></jsp:include>		
	</c:if>

	
	<c:if test="${not empty sessionScope.ADMIN}">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="../../common/sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="../../common/topbar.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content /.container-fluid-->
				<div class="container-fluid" id="container-fluid">

					
					
					<!-- Page Heading -->
					<div class="row">
						<div class="col-xl-12">
							<div class="mb-4a page-heading-div">
						
								<div class="page-heading-title-div">
									<span class="mb-0 text-gray-800 page-heading-title">일간 절감 성과 보기</span> 
									
									&nbsp &nbsp &nbsp
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 전기요금 절감하기 > 일간 절감 성과 보기</span>
								</div>
							
								
							</div>			
						</div>
					</div>
					
					
					
					<!-- 검색 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									
									
									<div style="width:100%;display: inline-block;">													
										<form id="searchForm" name="searchForm" method="get" action="<c:url value='../bld/elecDaily'/>">
											<div style="width:100px;float:left;">
												<span style="display: inline-block;height: 21px;"></span>날짜 선택
											</div>
											
											<div style="width:200px;float:left;">
												<input class="custom-date custom-date-sm" id="dateTarget" name="dateTarget" type="text" style="width:95%;" value="${DATETARGET}">
												<input type="hidden" readonly id="TIME_CREATED" value="${TIME_CREATED}">
												<input type="hidden" readonly id="END_CREATED" value="${END_CREATED}">
											</div>
											
											<div style="width:15%;float:left;">
												<input type="button" id="searchBtn" class="btn btn-outline-primary btn-sm" value="조회">	
											</div>
										</form>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 검색 끝 -->
					
					
															
					<!-- 전체 사용량 차트 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">전체 사용량</h6>
								</div>
							
								<div class="card-body">
									
								
									<!-- 차트 -->
									<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
									<!-- IE 아닌 경우 -->	
									<div style="height:500px; width:100%;display: inline-block;">
										<canvas id="usageChart" style="height:500px; width:100%;display: unset;"></canvas>
									</div>
									</c:if>
									
																		
									<c:if test="${sessionScope.BROWSER eq 'MSIE' }">	
									<!-- IE 인 경우 -->
									<div style="height:400px;">
    									<canvas id="usageChart" style=""></canvas>
									</div>
									</c:if>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 전체 사용량 차트 끝-->
					
					
					<!-- 전체 사용 요금 차트 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">전체 사용 요금</h6>
								</div>
							
								<div class="card-body">
									
								
									<!-- 차트 -->
									<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
									<!-- IE 아닌 경우 -->	
									<div style="height:500px; width:100%;display: inline-block;">
										<canvas id="wonChart" style="height:500px; width:100%;display: unset;"></canvas>
									</div>
									</c:if>
									
																		
									<c:if test="${sessionScope.BROWSER eq 'MSIE' }">	
									<!-- IE 인 경우 -->
									<div style="height:400px;">
    									<canvas id="wonChart" style=""></canvas>
									</div>
									</c:if>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 전체 사용 요금 차트 끝 -->
					
					<!-- 절감 목표 목록 -->
					<div class="row"  id="rowBefore">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">절감 목표 목록</h6>
								</div>
							
								<div class="card-body">
								
									<div class="row">
										<div class="col-xl-12">
											<table class="table-hover org-table-bordered org-table-style" id="dataTable">
												<tr class="org-table-title-usage">
													<td style="width:20%;"> 계측기 </td>
													<td style="width:20%;"> 절감 시간 </td>
													<td style="width:20%;"> 절감 목표 </td>
													<td style="width:20%;"> 예상 절감량 </td>
													<td style="width:20%;"> 예상 절감 요금 </td>
												</tr>
												
												<c:forEach items="${SAVE_RESULT_DAILY.list_plan_elem}" var="LIST_PLAN_ELEM">
												<tr>
													<td>
														${LIST_PLAN_ELEM.meter_descr}
													</td>
													<td>
														${LIST_PLAN_ELEM.hour_from}시 ~ ${LIST_PLAN_ELEM.hour_to}시 
													</td>
													<td>
														${LIST_PLAN_ELEM.percent_to_save} %	
													</td>
													<td>
														<fmt:formatNumber value="${LIST_PLAN_ELEM.save_kwh}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value="${LIST_PLAN_ELEM.save_won}" pattern="#,##0.00" />
													</td>
												</tr>
												</c:forEach>
													
													
											</table>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>					
					<!-- 절감 목표 목록 끝 -->
					
					
					
					<!-- 일간 절감 성과 테이블 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">일간 절감 성과</h6>
								</div>
							
								<div class="card-body">
									
									<div class="row">
										<div class="col-xl-12">
											<table class="table-hover org-table-bordered org-table-style" id="dataTable">
												<tr class="org-table-title-usage">
													<th rowspan="2" style=""> 
														계측기
													</th>
													<th colspan="4" style="">
														사용량 (kWh)
													</th>
													<th colspan="4" style="">
														사용 요금 (원)
													</th>
												</tr>
												
												<tr class="org-table-title-usage">
													
													<th>
														기준
													</th>
													<th>
														목표
													</th>
													<th>
														실제
													</th>
													<th>
														절감
													</th>
													<th>
														기준
													</th>
													<th>
														목표
													</th>
													<th>
														실제
													</th>
													<th>
														절감
													</th>
												</tr>
												
												<c:forEach items="${SAVE_RESULT_DAILY.list_meter}" var="LIST_METER">
													<fmt:formatNumber value='${LIST_METER.kwh_ref}' pattern='#,##0.00' var="kwh_ref"/>
													<fmt:formatNumber value='${LIST_METER.kwh_plan}' pattern='#,##0.00' var="kwh_plan"/>
													<fmt:formatNumber value='${LIST_METER.kwh_real}' pattern='#,##0.00' var="kwh_real"/>
													<fmt:formatNumber value='${LIST_METER.kwh_real - LIST_METER.kwh_ref}' pattern='#,##0.00' var="kwh_save"/>
													
													<fmt:formatNumber value='${LIST_METER.won_ref}' pattern='#,##0.00'  var="won_ref"/>
													<fmt:formatNumber value='${LIST_METER.won_plan}' pattern='#,##0.00' var="won_plan"/>
													<fmt:formatNumber value='${LIST_METER.won_real}' pattern='#,##0.00' var="won_real"/>
													<fmt:formatNumber value='${LIST_METER.won_real - LIST_METER.won_ref}' pattern='#,##0.00' var="won_save"/>
													
												<tr>
													<td style="width:12%;">
														${LIST_METER.meter_descr}
													</td>
													<td style="width:11%;">
														<c:out value="${kwh_ref}" />	
													</td>
													<td style="width:11%;">
														<c:out value="${kwh_plan}" />
													</td>
													<td style="width:11%;">
														<c:out value="${kwh_real}" />
													</td>
													<td style="width:11%;">
														<c:out value="${kwh_save}" />
													</td>
													<td style="width:11%;">
														<c:out value="${won_ref}" />	
													</td>
													<td style="width:11%;">
														<c:out value="${won_plan}" />
													</td>
													<td style="width:11%;">
														<c:out value="${won_real}" />
													</td>
													<td style="width:11%;">
														<c:out value="${won_save}" />
													</td>
												</tr>
												</c:forEach>
												<tr>
													<td>
														전체 계측기
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_RESULT_DAILY.kwh_ref_for_all_meter}" pattern="#,##0.00" /> 
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_RESULT_DAILY.kwh_plan_for_all_meter}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_RESULT_DAILY.kwh_real_for_all_meter}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value='${SAVE_RESULT_DAILY.kwh_real_for_all_meter - SAVE_RESULT_DAILY.kwh_ref_for_all_meter}' pattern='#,##0.00' />
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_RESULT_DAILY.won_ref_for_all_meter}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_RESULT_DAILY.won_plan_for_all_meter}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_RESULT_DAILY.won_real_for_all_meter}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value='${SAVE_RESULT_DAILY.won_real_for_all_meter - SAVE_RESULT_DAILY.won_ref_for_all_meter}' pattern='#,##0.00' />
													</td>
												</tr>
											</table>
										</div>
									</div>
									
									<hr>														
								</div>
								
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->

			<jsp:include page="../../common/footer.jsp"></jsp:include>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->
	
		<!-- 차트 복제용 -->
	<div id="cloneDiv" style="display: none;">
		<div class="row delChartAera">
			<div class="col-xl-12">
				<div class="card shadow mb-4">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary chart_title"></h6>
					</div>
					<div class="card-body">
						
						<!-- 차트 -->
						<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
						<!-- IE 아닌 경우 -->	
						<div style="height:500px; width:100%;display: inline-block;">
							<canvas class="chart_aera" style="height:500px; width:100%;display: unset;"></canvas>
						</div>
						</c:if>
						
															
						<c:if test="${sessionScope.BROWSER eq 'MSIE' }">	
						<!-- IE 인 경우 -->
						<div style="height:400px;">
    						<canvas class="chart_aera" style=""></canvas>
						</div>
						</c:if>
															
					</div>
				</div>
			</div>
		</div>	
	</div>	

	<!-- Scroll to Top Button-->
	<!-- Logout Modal-->
	<%-- util.jsp : logout/scroll top.. --%>
	<jsp:include page="../../common/logout.jsp"></jsp:include>
	</c:if>
</body>

</html>
