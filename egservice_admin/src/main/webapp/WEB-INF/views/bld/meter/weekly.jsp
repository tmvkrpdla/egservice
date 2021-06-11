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
	<title>계측기간 사용량 비교 - 요일별 비교</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
<c:if test="${not empty sessionScope}">
	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/bld/meter/js/bldMeterWeekly.js"></script>

			
<script type="text/javascript">


var _chartLabels = ["일", "월", "화", "수", "목", "금", "토"];
//var _chartIdx = [0,1,2,3,4,5,6];



var _chartData = [];



<c:forEach var="LIST_USAGE" items="${LIST_USAGE}" varStatus="STATUS">
	var _dataObj = {};
	
	// _dataObj.label = "주 ${LIST_USAGE.week_of_year + 1}"; 
	_dataObj.label = "${LIST_USAGE.text_week_of_year}";
	_dataObj.borderWidth = 2;
	_dataObj.backgroundColor = _chartColors[${STATUS.index}%10];
	_dataObj.borderColor = _chartColors[${STATUS.index}%10];
	_dataObj.fill = false;
	_dataObj.data = [];
	
	
	<c:forEach var="WEEK" items="${LIST_USAGE.week}">
		
		<c:if test="${WEEK.usage eq null}">
			_dataObj.data.push(null);
		</c:if>
		
		<c:if test="${WEEK.usage ne null}">
			//_dataObj.data.push("${WEEK.usage}");
			_dataObj.data.push("${WEEK.round_usage}");
		</c:if>
		
				
	</c:forEach>

	_chartData.push(_dataObj);	
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
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="row">
						<div class="col-xl-12">
							<div class="mb-4a page-heading-div">
						
								<div class="page-heading-title-div">
									<span class="mb-0 text-gray-800 page-heading-title">주간 비교 분석</span> 
									
									&nbsp; &nbsp; &nbsp;
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 계측기별 사용량 분석 > 주간 비교 분석</span>
								</div>
							
								<div class="page-heading-report-div" style="">
									<span class="page-heading-report-helper" style=""></span>
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
								</div>
							</div>			
						</div>
					</div>
					
			
					<!-- row 건물 정보 -->
					<%-- <div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">건물 정보</h6>
									
								</div>
							
								<div class="card-body">
									<!-- 처음로딩될때에는 세션에 담긴 변수를 사용하고, 리프레쉬 버튼을 누를 경우 재호출 한다. -->
									<div class="row">
										<div class="col-lg-3 col-sm-6">
											층수 | <span id="site_floor_info">${SITE_INFO_BLD.floor_info}</span>
										</div>
										<div class="col-lg-3 col-sm-6">
											면적 | <span id="site_area"><fmt:formatNumber type="number" pattern="#,###.00" value="${SITE_INFO_BLD.area}" />㎡  </span>
										</div>
										<div class="col-lg-3 col-sm-6">
											완공일 | <span id="site_built_year">${SITE_INFO_BLD.built_year}</span> - <span id="site_built_month">${SITE_INFO_BLD.built_month}</span>
										</div>
										<div class="col-lg-3 col-sm-6">
											홈페이지 | 
											<span id="site_home_page">
												<a href="${SITE_INFO_BLD.home_page}" target="_blank"> ${SITE_INFO_BLD.home_page} </a>
											</span><a href="${BLD_SITE_INFO.home_page}" target="_blank"> ${BLD_SITE_INFO.home_page} </a>
										</div>
									</div>
									
									
									<div class="row">
										<div class="col-lg-3 col-sm-6">
											전화 | <span id="site_phone"></span>
										</div>
										<div class="col-lg-3 col-sm-6">
											팩스 | <span id="site_fax"></span>
										</div>
										<div class="col-lg-6 col-sm-12">
											주소 | <span id="site_address">${SITE_INFO_BLD.address}</span>
										</div>
									</div>
																											
								</div>
								
							</div>
						</div>
					</div> --%>
					<!-- row 건물 정보 끝 -->
				
									
					<!-- 검색 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div style="width:100%;display: inline-block;">
										<form id="searchForm" name="searchForm" method="get" action="<c:url value='../bld/meterWeekly'/>">
											<div style="width:50%;floart:left;">
												
												<div style="width:100px;float:left;">
													<span style="display: inline-block;height: 21px;"></span>계측기 선택
												</div>
												
												<div style="width:300px;float:left;">
													<select id="mid" name="mid" class="custom-date custom-date-sm" style="width : 200px;">
														<c:forEach items="${sessionScope.SITE_INFO_BLD.meter_list}" var="METER_LIST">
														<c:if test="${METER_LIST.mid eq MID}">
															<option value="${METER_LIST.mid}" selected>${METER_LIST.descr}</option>
														</c:if>
														
														<c:if test="${METER_LIST.mid ne MID}">
															<option value="${METER_LIST.mid}">${METER_LIST.descr}</option>
														</c:if>
														
														
														</c:forEach>
													</select>
												</div>
											</div>
											
											<div style="width:50%;float:left">
												<div style="width:100px;float:left;">
													<span style="display: inline-block;height: 21px;"></span>기간 선택
												</div>
												
												<div style="width:200px;float:left;">
													<input class="custom-date custom-date-sm" id="dateFrom" name="dateFrom" type="text" style="width:95%;" value="${DATEFROM}">
												</div>
												
												<div style="width:52px;float:left;text-align: center">
													<span style="display: inline-block;height: 21px;"></span>~
												</div>
												
												<div style="width:200px;float:left;">
													<input class="custom-date custom-date-sm" id="dateTo" name="dateTo" type="text" style="width:95%;" value="${DATETO}">
												</div>
												
												
												<div style="width:0%;float:left;">
													<input type="button" id="searchBtn" class="btn btn-outline-primary btn-sm" value="조회">	
												</div>
											</div>
										</form>
									</div>
									
									
									
								</div>
							</div>
						</div>
					</div>	
					<!-- 검색 끝 -->
					
					<!-- 내용 -->
					<!-- <div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									
									<div class="lightbulb-img-style">
										<i class="far fa-lightbulb"></i>
									</div>
									
									<div class="lightbulb-text-style">
										
										<div>
											- 특정 요일에 사용량이 많은 계측기를 찾아보세요.
										</div>
										
										<div>
											- 복지관 주간 프로그램과 비교해 보세요.
										</div>
										
										<div>
											- 여름철 변압기 과부하 가능성이 큰 계측기와 조심해야 할 요일을 찾아보세요.
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div> -->
					<!-- 내용 끝 -->
					
					<!-- 차트 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									<!-- 차트 -->
									<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
									<!-- IE 아닌 경우 -->	
									<div style="height:500px; width:100%;display: inline-block;">
										<canvas id="myChart" style="height:500px; width:100%;display: unset;"></canvas>
									</div>
									</c:if>
									
																		
									<c:if test="${sessionScope.BROWSER eq 'MSIE' }">	
									<!-- IE 인 경우 -->
									<div style="height:400px;">
    									<canvas id="myChart" style=""></canvas>
									</div>
									</c:if>
									
									<hr />
									<!-- text -->
									<div>
									* 범례의 항목을 클릭하면 해당 항목이 OFF 됩니다.
									</div>
																		
									<hr />
									
									<div style="text-align: right;width: 100%;">
											단위 : kWh
									</div>
									
									
									<div>
										<table class="table-hover org-table-bordered org-table-style">
											<tr class="org-table-title-usage">
												<td style="width:23%;"> 주차 </td>
												<c:set value="${LIST_USAGE[0]}" var="LABEL_LIST" />
												
												<c:forEach items="${LABEL_LIST.week}" var="WEEK">
												<td style="width:11%;">${WEEK.text_day_of_week}</td>
												</c:forEach>
											</tr>	
											
											<c:forEach items="${LIST_USAGE}" var="LIST_USAGE">
											<tr>
												<td>${LIST_USAGE.text_week_of_year} </td>
												
												<c:forEach items="${LIST_USAGE.week}" var="WEEK">
												<td>
												
													<c:if test="${WEEK.text_usage eq null}">
														-
													</c:if>
													
													<c:if test="${WEEK.text_usage ne null}">
														${WEEK.text_usage}
													</c:if>
													
												</td>
												</c:forEach>
												
											</tr>
											</c:forEach>
										</table>
									</div>
									
								</div>
								
							</div>
						</div>										
					</div>
					<!-- 차트 끝 -->
					
				
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
