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
	<title>기간별 절감 성과</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">	
	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecDate.js"></script>
	
<script type="text/javascript">

var _kwh_ref = "${SAVE_RESULT.kwh_ref_for_all_meter}";
var _kwh_plan = "${SAVE_RESULT.kwh_plan_for_all_meter}";
var _won_ref = "${SAVE_RESULT.won_ref_for_all_meter}";
var _won_plan = "${SAVE_RESULT.won_plan_for_all_meter}";

_kwh_ref  = Number(_kwh_ref).toFixed(2); 
_kwh_plan = Number(_kwh_plan).toFixed(2);
_won_ref  = Number(_won_ref).toFixed(2);
_won_plan = Number(_won_plan).toFixed(2);

//	기준 사용량
var _kwhRefObj = {};
_kwhRefObj.label = "절감 기준";
_kwhRefObj.borderWidth = 2;
_kwhRefObj.backgroundColor = ['rgb(116, 116, 116)'];
_kwhRefObj.borderColor = ['rgb(116, 116, 116)'];
_kwhRefObj.fill = false;
_kwhRefObj.type = 'line';
_kwhRefObj.data = [];

//	목표 사용량
var _kwhPlanObj = {};
_kwhPlanObj.label = "절감 목표";
_kwhPlanObj.borderWidth = 2;
_kwhPlanObj.backgroundColor = _chartColors[0%10];
_kwhPlanObj.borderColor = _chartColors[0%10];
_kwhPlanObj.fill = false;
_kwhPlanObj.type = 'line';
_kwhPlanObj.data = [];

//	실제 사용량
var _kwhUsageObj = {};
_kwhUsageObj.label = "실제 사용량";
_kwhUsageObj.borderWidth = 2;
_kwhUsageObj.backgroundColor = 'rgb(0, 183, 0)'; //'#00ff00';
_kwhUsageObj.borderColor = 'rgb(0, 183, 0)';
_kwhUsageObj.fill = true;
_kwhUsageObj.type = 'bar';
_kwhUsageObj.data = [];

//	기준 사용 요금
var _wonRefObj = {};
_wonRefObj.label = "절감 기준";
_wonRefObj.borderWidth = 2;
_wonRefObj.backgroundColor = ['rgb(116, 116, 116)'];
_wonRefObj.borderColor = ['rgb(116, 116, 116)'];
_wonRefObj.fill = false;
_wonRefObj.type = 'line';
_wonRefObj.data = [];

//	목표 사용 요금
var _wonPlanObj = {};
_wonPlanObj.label = "절감 목표";
_wonPlanObj.borderWidth = 2;
_wonPlanObj.backgroundColor = _chartColors[0%10];
_wonPlanObj.borderColor = _chartColors[0%10];
_wonPlanObj.fill = false;
_wonPlanObj.type = 'line';
_wonPlanObj.data = [];

//	실제 사용 요금
var _wonUsageObj = {};
_wonUsageObj.label = "실제 사용 요금";
_wonUsageObj.borderWidth = 2;
_wonUsageObj.backgroundColor = 'rgb(0, 183, 0)';
_wonUsageObj.borderColor = 'rgb(0, 183, 0)';
_wonUsageObj.fill = true;
_wonUsageObj.type = 'bar';
_wonUsageObj.data = [];

var _chartLabel = [];

<c:forEach items="${SAVE_RESULT.list_usage_for_all_meter}" var="METER">
	var _kwh_usage = "${METER.kwh}";
	var _won_usage = "${METER.won}";
	
	_kwhRefObj.data.push( _kwh_ref );
	_kwhPlanObj.data.push( _kwh_plan );
	_kwhUsageObj.data.push( Number(_kwh_usage).toFixed(2) );
	
	_wonRefObj.data.push( _won_ref );
	_wonPlanObj.data.push( _won_plan );
	_wonUsageObj.data.push( Number(_won_usage).toFixed(2) );
	
	_chartLabel.push("${METER.month}" + "/" + "${METER.day}");
	
</c:forEach>

var _kwhChartData = [];
_kwhChartData.push( _kwhRefObj );
_kwhChartData.push( _kwhPlanObj );
_kwhChartData.push( _kwhUsageObj );

var _wonChartData = [];
_wonChartData.push( _wonRefObj );
_wonChartData.push( _wonPlanObj );
_wonChartData.push( _wonUsageObj );


var _chartArr = [];
<c:forEach items="${SAVE_RESULT.list_meter}" var="LIST_METER" varStatus="STATUS">
	var _chartObj = {};
	_chartObj.meter_descr = "${LIST_METER.descr}";
	_chartObj.kwh = [];
	_chartObj.won = [];
	
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
	_kwhReal.backgroundColor = 'rgb(0, 183, 0)';
	_kwhReal.borderColor = 'rgb(0, 183, 0)';
	_kwhReal.fill = true;
	_kwhReal.type = 'bar';
	_kwhReal.order = 1;
	_kwhReal.data = [];

	var _wonReal = {};
	_wonReal.label = "실제 사용 요금";
	_wonReal.borderWidth = 2;
	_wonReal.backgroundColor = 'rgb(0, 183, 0)';
	_wonReal.borderColor = 'rgb(0, 183, 0)';
	_wonReal.fill = true;
	_wonReal.type = 'bar';
	_wonReal.order = 1;
	_wonReal.data = [];
	
	var _list_meter_kwh_ref		= "${LIST_METER.kwh_ref}";
	var _list_meter_kwh_plan	= "${LIST_METER.kwh_plan}";
    var _list_meter_won_ref		= "${LIST_METER.won_ref}";
    var _list_meter_won_plan	= "${LIST_METER.won_plan}";
    
    <c:forEach items="${LIST_METER.list_usage}" var="LIST_USAGE">
		var _list_usage_kwh_real		= "${LIST_USAGE.kwh}";
		var _list_usage_won_real		= "${LIST_USAGE.won}";
	
		_kwhRef.data.push(  Number( _list_meter_kwh_ref  ).toFixed(2) );
		_kwhPlan.data.push( Number( _list_meter_kwh_plan ).toFixed(2) ); 	
		_kwhReal.data.push( Number( _list_usage_kwh_real ).toFixed(2) );
		
		_wonRef.data.push(  Number( _list_meter_won_ref  ).toFixed(2) );
		_wonPlan.data.push( Number( _list_meter_won_plan ).toFixed(2) );
		_wonReal.data.push( Number( _list_usage_won_real ).toFixed(2) ); 		
	</c:forEach>
	
	_chartObj.kwh.push(_kwhRef);
	_chartObj.kwh.push(_kwhPlan);
	_chartObj.kwh.push(_kwhReal);
	_chartObj.won.push(_wonRef);
	_chartObj.won.push(_wonPlan);
	_chartObj.won.push(_wonReal);
	_chartArr.push(_chartObj);
	
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
									<span class="mb-0 text-gray-800 page-heading-title">기간별 절감 성과 보기</span> 
									
									&nbsp &nbsp &nbsp
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 전기요금 절감하기 > 기간별 절감 성과 보기</span>
								</div>
							
								
							</div>			
						</div>
					</div>
					
					
								
					<!-- 절감 계획 명칭 시작 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">절감 계획 명칭 : ${SAVE_RESULT.save_plan_name} </h6>
									
								</div>
							
								<div class="card-body">
									
									<div class="row">
										<div style="width:100%;">
											<div>
												<div style="float:left;padding-left: 0.75rem;">
													<span style="display: inline-block;height: 21px;"></span> 생성일 (시작일) :
												</div>
												<div style="float:left;padding-left: 0.75rem;">
													<span style="display: inline-block;height: 21px;"></span> ${DATE_CREATED}
												</div>  
											</div>
											
																						
											<div>
												<div style="float:left;padding-left: 3%;">
													<span style="display: inline-block;height: 21px;"></span> 종료일 :
												</div>
												<div style="float:left;padding-left: 0.75rem;">
													<form name="searchForm" id="searchForm" method="POST" target="_self" action="../bld/elecDate">
														<input class="custom-date custom-date-sm" id="dateTarget" name="dateTarget" type="text" style="width:95%;" value="${DATETARGET}">
														<input type="hidden" readonly id="DATE_CREATED" value="${DATE_CREATED}">
														<input type="hidden" readonly id="DATE_ENDED" value="${DATE_ENDED}">
													</form>
												</div> 
											</div>
											
											<div>
												<div style="float:left; padding-left : 3%;">
													<input type="button" id="searchBtn" class="btn btn-outline-primary btn-sm" value="조회">	
												</div>
											</div>
										</div>		
										
										<div style="width:100%;">
											<div>
												<div style="float:left;padding-left: 0.75rem">
													<span style="display: inline-block;height: 21px;"></span> 절감기준 :  
												</div>
												
												<div style="float:left;padding-left: 0.75rem;">
													<span style="display: inline-block;height: 21px;"></span> ${SAVE_RESULT.save_ref_name}
												</div>  
											</div>
										</div>								
									</div>
									
																						
								</div>
								
							</div>
						</div>
					</div>
					<!-- 절감 계획 명칭 끝 -->	
					
					
					
					<!-- 전체 사용량 차트 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">전체 계측기 사용량</h6>
								</div>
							
								<div class="card-body">
									
								
									<!-- 차트 -->
									<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
									<!-- IE 아닌 경우 -->	
									<div style="height:500px; width:100%;display: inline-block;">
										<canvas id="kwhChart" style="height:500px; width:100%;display: unset;"></canvas>
									</div>
									</c:if>
									
																		
									<c:if test="${sessionScope.BROWSER eq 'MSIE' }">	
									<!-- IE 인 경우 -->
									<div style="height:400px;">
    									<canvas id="kwhChart" style=""></canvas>
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
									<h6 class="m-0 font-weight-bold text-primary">전체 계측기 사용 요금</h6>
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

	<!-- Scroll to Top Button-->
	<!-- Logout Modal-->
	<%-- util.jsp : logout/scroll top.. --%>
	<jsp:include page="../../common/logout.jsp"></jsp:include>
	</c:if>
	
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
</body>

</html>
