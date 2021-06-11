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
	<title>절감기준 보기</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">	
	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPopStdDetail.js"></script>
	
<script type="text/javascript">

var _chartLabel = enernet.modules.utils.getTimeChartLabel();

var _tntUsageArr = [];
var _tntUsageChart = {};
_tntUsageChart.label = "전체 계측기";
_tntUsageChart.borderWidth = 2;
_tntUsageChart.backgroundColor = _chartColors[0%10];
_tntUsageChart.borderColor = _chartColors[0%10];
_tntUsageChart.fill = false;
_tntUsageChart.type = 'line';
_tntUsageChart.order = 1;
_tntUsageChart.data = [];

var _tntWonArr = [];
var _tntWonChart = {};
_tntWonChart.label = "전체 계측기";
_tntWonChart.borderWidth = 2;
_tntWonChart.backgroundColor = _chartColors[1%10];
_tntWonChart.borderColor = _chartColors[1%10];
_tntWonChart.fill = false;
_tntWonChart.type = 'line';
_tntWonChart.order = 1;
_tntWonChart.data = [];


<c:forEach items="${SAVE_REF_INFO.list_unit_for_all_meter}" var="LIST_UNIT_FOR_ALL_METER">
	var _kwh = "${LIST_UNIT_FOR_ALL_METER.kwh}";
	var _won = "${LIST_UNIT_FOR_ALL_METER.won}";
	
	_tntUsageChart.data.push(Number(_kwh).toFixed(2));
	_tntWonChart.data.push(Number(_won).toFixed(2));	
</c:forEach>

_tntUsageArr.push(_tntUsageChart);
_tntWonArr.push(_tntWonChart);

var _midUsageArr = [];
var _midWonArr = [];

<c:forEach items="${SAVE_REF_INFO.list_meter}" var="LIST_METER" varStatus="STATUS">
	var _midUsageObj = {};
	_midUsageObj.label = "${LIST_METER.meter_descr}";
	_midUsageObj.borderWidth = 2;
	_midUsageObj.backgroundColor = _chartColors["${STATUS.index%10}"];
	_midUsageObj.borderColor = _chartColors["${STATUS.index%10}"];
	_midUsageObj.fill = false;
	_midUsageObj.type = 'line';
	_midUsageObj.data = [];
	
	var _midWonObj = {};
	_midWonObj.label = "${LIST_METER.meter_descr}";
	_midWonObj.borderWidth = 2;
	_midWonObj.backgroundColor = _chartColors["${STATUS.index%10}"];
	_midWonObj.borderColor = _chartColors["${STATUS.index%10}"];
	_midWonObj.fill = false;
	_midWonObj.type = 'line';
	_midWonObj.data = [];
	
	<c:forEach items="${LIST_METER.list_unit}" var="LIST_UNIT">
	
		var _kwh = "${LIST_UNIT.kwh}";
		var _won = "${LIST_UNIT.won}";
	
		_midUsageObj.data.push(Number(_kwh).toFixed(2));
		_midWonObj.data.push(Number(_won).toFixed(2));
		
	</c:forEach>
	
	_midUsageArr.push(_midUsageObj)
	_midWonArr.push(_midWonObj);
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


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				

				<!-- Begin Page Content /.container-fluid-->
				<div class="container-fluid">

					<!-- Page Heading -->
					
					
					<!-- blank -->
					<div class="row" style='height:30px'>
						<div class="col-xl-12">
							
						</div>
					</div>
						
					<!-- 절감 기준 만들기 시작 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">절감 기준</h6>
									
								</div>
							
								<div class="card-body">
									
									<div class="row">
										<div class="col-xl-12">
										
											<div style="width:100%;">
												<div style='text-align: right;padding-bottom: 15px;'>
													<!-- <span style='color:red'> * </span> 필수입력 -->
												</div>
												
												<div style="width:100%;">
													<div style='padding-bottom:10px;'> 
														<!-- <span style='color:red'> * </span> 절감 기준 명칭 -->
													</div>
													
													<div style="width:100%;padding-bottom:65px;">
														<div style='width:80%;float:left;'>
															<input type='text' class='form-control' style='height:52px;' id='refName' name='refName' value="${SAVE_REF_INFO.save_ref_name}" readonly>
														</div>
														
														<div style='width:20%;float:left;padding-left: 20px;'>
															<div style="width:100%;text-align: right;">
																<!-- <span class='btn btn-outline-danger btn-sm' style='width:80%;cursor: pointer;height:52px;overflow: hidden;'>
																	일별 사용량 <br>
																	참고하기
																</span> -->
															</div>
														</div>
														
													</div>
												</div>
												
												<div style="width:100%;padding-bottom:20px;">
													<div style='padding-bottom:10px;'>  
														절감 기준 설명
													</div>
													
													<div>
														<textarea style='height:150px;' rows="" cols="" class='form-control' id='refComment' readonly>${SAVE_REF_INFO.save_ref_comment}
														</textarea>
													</div>
												</div>
												
												<!-- <div style="width:100%;">
													<div style='padding-bottom:5px;width: 100%;text-align: right;'>  
														<input type="button" class='btn btn-outline-primary btn-sm' value='저장' id='refSaveBtn'>
													</div>
												</div> -->
												
											</div>
											
										</div>
									</div>
									
									<hr />
									
									<div class='row'>
										<div class="col-xl-12">
											
											<div style="width:100%;height:100%;">
												
												<div style="width: 10%;float: left;display: flex;align-items: center;height: 100%;">
													<div>기간 설정</div>
												</div>
												
												<div style="width:20%;float:left;">
													
													<input class="form-control custom-date custom-date-sm" id="dateFrom" name="dateFrom" type="text" style="width:95%;" value="${SAVE_REF_INFO.date_from}" readonly>
												</div>
												
												<div style="width:5%;float: left;display: flex;align-items: center;height: 100%;justify-content: center;">
													<div>~</div>
												</div>
												
												<div style="width:20%;float:left;">
													
													<input class="form-control custom-date custom-date-sm" id="dateTo" name="dateTo" type="text" style="width:95%;" value="${SAVE_REF_INFO.date_to}" readonly>
												</div>
												
												<div style="float:left;padding-left: 50px;">
													<input type="hidden" class="form-control" readonly value="${SEQ_SAVE_REF}">
													<input type="hidden" class="form-control" readonly value="${sessionScope.ADMIN.list_site[0].seq_site}">
												</div>
												
											</div>
											
										</div>
									</div>
									
																									
								</div>
								
							</div>
						</div>
					</div>
					<!-- 절감 기준 만들기 끝 -->
					
					<!-- 절감 기준 요약 시작 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">절감 기준 요약</h6>
								</div>
							
								<div class="card-body">
									
									<div class="row">
										<div class="col-xl-12">
											<table class="table-hover org-table-bordered org-table-style" id='dataTable'>
												<tr class="org-table-title-usage">
													<th rowspan="2" style=''> 
														계측기
													</th>
													<th colspan='4' style=''>
														사용량 (kWh)
													</th>
													<th colspan='4' style=''>
														사용 요금 (원)
													</th>
												</tr>
												
												<tr class="org-table-title-usage">
													
													<th>
														합계
													</th>
													<th>
														경부하
													</th>
													<th>
														중간부하
													</th>
													<th>
														최대부하
													</th>
													<th>
														합계
													</th>
													<th>
														경부하
													</th>
													<th>
														중간부하
													</th>
													<th>
														최대부하
													</th>
												</tr>
												<tr>
													<td>전체 계측기</td>
													<td>
														<fmt:formatNumber value="${SAVE_REF_INFO.sum_kwh_for_all_meter}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_REF_INFO.sum_kwh_for_all_meter_1}" pattern="#,##0.00"/>
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_REF_INFO.sum_kwh_for_all_meter_2}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_REF_INFO.sum_kwh_for_all_meter_3}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_REF_INFO.sum_won_for_all_meter}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_REF_INFO.sum_won_for_all_meter_1}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_REF_INFO.sum_won_for_all_meter_2}" pattern="#,##0.00" />
													</td>
													<td>
														<fmt:formatNumber value="${SAVE_REF_INFO.sum_won_for_all_meter_3}" pattern="#,##0.00" />
													</td>
												</tr>
												<c:forEach items="${SAVE_REF_INFO.list_meter}" var="LIST_METER">
												<tr>
													<td>${LIST_METER.meter_descr}</td>
													<td>
														<fmt:formatNumber value="${LIST_METER.sum_kwh}" pattern="#,##0.00"/>
													</td>
													<td>
														<fmt:formatNumber value="${LIST_METER.sum_kwh_1}" pattern="#,##0.00"/>
													</td>
													<td>
														<fmt:formatNumber value="${LIST_METER.sum_kwh_2}" pattern="#,##0.00"/>
													</td>
													<td>
														<fmt:formatNumber value="${LIST_METER.sum_kwh_3}" pattern="#,##0.00"/>
													</td>
													<td>
														<fmt:formatNumber value="${LIST_METER.sum_won}" pattern="#,##0.00"/>
													</td>
													<td>
														<fmt:formatNumber value="${LIST_METER.sum_won_1}" pattern="#,##0.00"/>
													</td>
													<td>
														<fmt:formatNumber value="${LIST_METER.sum_won_2}" pattern="#,##0.00"/>
													</td>
													<td>
														<fmt:formatNumber value="${LIST_METER.sum_won_3}" pattern="#,##0.00"/>
													</td>
												</tr>
												</c:forEach>
												
											</table>
										</div>
									</div>
									
									<hr />
									
									
																											
								</div>
								
							</div>
						</div>
					</div>
					<!-- 절감 기준 요약 끝 -->
					
					<!-- 전체 사용량 차트 -->
					<div class="row" style='' id='hiddenChart1'>
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
										<canvas id="tntUsageChart" style="height:500px; width:100%;display: unset;"></canvas>
									</div>
									</c:if>
									
																		
									<c:if test="${sessionScope.BROWSER eq 'MSIE' }">	
									<!-- IE 인 경우 -->
									<div style="height:400px;">
    									<canvas id="tntUsageChart" style=""></canvas>
									</div>
									</c:if>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 전체 사용량 차트 끝-->
					
					<!-- 전체 사용 요금 차트 -->
					<div class="row" style='' id='hiddenChart2'>
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
										<canvas id="tntWonChart" style="height:500px; width:100%;display: unset;"></canvas>
									</div>
									</c:if>
									
																		
									<c:if test="${sessionScope.BROWSER eq 'MSIE' }">	
									<!-- IE 인 경우 -->
									<div style="height:400px;">
    									<canvas id="tntWonChart" style=""></canvas>
									</div>
									</c:if>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 전체 사용 요금 차트 끝 -->
					
					<!-- 계측기별 사용량 차트 -->
					<div class="row" style='' id='hiddenChart3'>
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">계측기별 사용량</h6>
								</div>
							
								<div class="card-body">
									
								
									<!-- 차트 -->
									<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
									<!-- IE 아닌 경우 -->	
									<div style="height:500px; width:100%;display: inline-block;">
										<canvas id="midUsageChart" style="height:500px; width:100%;display: unset;"></canvas>
									</div>
									</c:if>
									
																		
									<c:if test="${sessionScope.BROWSER eq 'MSIE' }">	
									<!-- IE 인 경우 -->
									<div style="height:400px;">
    									<canvas id="midUsageChart" style=""></canvas>
									</div>
									</c:if>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 계측기별 사용량 차트 끝-->
					
					<!-- 계측기별 사용 요금 시작 -->
					<div class="row" style='' id='hiddenChart4'>
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">계측기별 사용 요금</h6>
								</div>
							
								<div class="card-body">
									
								
									<!-- 차트 -->
									<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
									<!-- IE 아닌 경우 -->	
									<div style="height:500px; width:100%;display: inline-block;">
										<canvas id="midWonChart" style="height:500px; width:100%;display: unset;"></canvas>
									</div>
									</c:if>
									
																		
									<c:if test="${sessionScope.BROWSER eq 'MSIE' }">	
									<!-- IE 인 경우 -->
									<div style="height:400px;">
    									<canvas id="midWonChart" style=""></canvas>
									</div>
									</c:if>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 계측기별 사용 요금 끝-->
					

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->


		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<!-- Logout Modal-->
	<%-- util.jsp : logout/scroll top.. --%>
	<jsp:include page="../../common/logout.jsp"></jsp:include>
	</c:if>
</body>

</html>
