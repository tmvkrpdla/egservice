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
	<title>계측기별 절감 성과 보기</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">	
	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecMeter.js"></script>
	
<script type="text/javascript">

var _chartLabel = [];


//기준 사용량
var _kwhRefObj = {};
_kwhRefObj.label = "절감 기준";
_kwhRefObj.borderWidth = 2;
_kwhRefObj.backgroundColor = ['rgb(116, 116, 116)'];
_kwhRefObj.borderColor = ['rgb(116, 116, 116)'];
_kwhRefObj.fill = false;
_kwhRefObj.type = 'line';
_kwhRefObj.data = [];

//목표 사용량
var _kwhPlanObj = {};
_kwhPlanObj.label = "절감 목표";
_kwhPlanObj.borderWidth = 2;
_kwhPlanObj.backgroundColor = _chartColors[0%10];
_kwhPlanObj.borderColor = _chartColors[0%10];
_kwhPlanObj.fill = false;
_kwhPlanObj.type = 'line';
_kwhPlanObj.data = [];

//실제 사용량
var _kwhRealObj = {};
_kwhRealObj.label = "실제 사용량";
_kwhRealObj.borderWidth = 2;
_kwhRealObj.backgroundColor = 'rgb(89, 218, 80)';
_kwhRealObj.borderColor = 'rgb(89, 218, 80)';
_kwhRealObj.fill = true;
_kwhRealObj.type = 'bar';
_kwhRealObj.data = [];

//기준 사용 요금
var _wonRefObj = {};
_wonRefObj.label = "절감 기준";
_wonRefObj.borderWidth = 2;
_wonRefObj.backgroundColor = ['rgb(116, 116, 116)'];
_wonRefObj.borderColor = ['rgb(116, 116, 116)'];
_wonRefObj.fill = false;
_wonRefObj.type = 'line';
_wonRefObj.data = [];

//목표 사용 요금
var _wonPlanObj = {};
_wonPlanObj.label = "절감 목표";
_wonPlanObj.borderWidth = 2;
_wonPlanObj.backgroundColor = _chartColors[0%10];
_wonPlanObj.borderColor = _chartColors[0%10];
_wonPlanObj.fill = false;
_wonPlanObj.type = 'line';
_wonPlanObj.data = [];

//실제 사용 요금
var _wonRealObj = {};
_wonRealObj.label = "실제 사용 요금";
_wonRealObj.borderWidth = 2;
_wonRealObj.backgroundColor = 'rgb(89, 218, 80)';
_wonRealObj.borderColor = 'rgb(89, 218, 80)';
_wonRealObj.fill = true;
_wonRealObj.type = 'bar';
_wonRealObj.data = [];


<c:forEach items="${SAVE_RESULT.list_meter_gross}" var="LIST_METER_GROSS">

	_chartLabel.push("${LIST_METER_GROSS.descr}");
	
	var _kwh_ref	=	"${LIST_METER_GROSS.kwh_ref}"; 
	var _kwh_plan	=	"${LIST_METER_GROSS.kwh_plan}";
	var _kwh_real	=	"${LIST_METER_GROSS.kwh_real}";
	var _won_ref	=	"${LIST_METER_GROSS.won_ref}";
	var _won_plan	=	"${LIST_METER_GROSS.won_plan}";
	var _won_real	=	"${LIST_METER_GROSS.won_real}";
	
	_kwhRefObj.data.push(   Number( _kwh_ref   ).toFixed(2) );
	_kwhPlanObj.data.push(  Number( _kwh_plan  ).toFixed(2) );
	_kwhRealObj.data.push(  Number( _kwh_real  ).toFixed(2) );
	
	_wonRefObj.data.push(   Number( _won_ref   ).toFixed(2) );
	_wonPlanObj.data.push(  Number( _won_plan  ).toFixed(2) );
	_wonRealObj.data.push(  Number( _won_real  ).toFixed(2) );
	
	
</c:forEach>


var _kwhChartData = [];
_kwhChartData.push( _kwhRefObj  );
_kwhChartData.push( _kwhPlanObj );
_kwhChartData.push( _kwhRealObj );

var _wonChartData = [];
_wonChartData.push( _wonRefObj  );
_wonChartData.push( _wonPlanObj );
_wonChartData.push( _wonRealObj );



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
									<span class="mb-0 text-gray-800 page-heading-title">계측기별 절감 성과 보기</span> 
									
									&nbsp &nbsp &nbsp
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 전기요금 절감하기 > 계측기별 절감 성과 보기</span>
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
													<form name="searchForm" id="searchForm" method="POST" target="_self" action="../bld/elecMeter">
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
									<h6 class="m-0 font-weight-bold text-primary">사용량</h6>
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
									<h6 class="m-0 font-weight-bold text-primary">사용 요금</h6>
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
	
	
</body>

</html>
