<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>시설별 사용량 분석 - 요일별</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>

	
	<c:if test="${not empty sessionScope}">
	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/org/common/js/orgSideBar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/org/usage/js/orgUsageWeek.js"></script>
	
<script>

//	USAGE_SITE_WEEK_LIST -> LIST_USAGE 의 0번째 라벨
<c:set value="${USAGE_SITE_WEEK_LIST[0].list_usage}" var="LABEL_LIST" />

var _chartLabels = [];
<c:forEach items="${LABEL_LIST}" var="LABEL_LIST">
	_chartLabels.push("${LABEL_LIST.text_unit}");
</c:forEach>


var _usage_site_week_list = [];

	
<c:forEach items="${USAGE_SITE_WEEK_LIST}" var="USAGE_SITE_WEEK_LIST" varStatus="STATUS"> 
	var _siteObj = {};
	_siteObj.seq_site = "${USAGE_SITE_WEEK_LIST.seq_site}";
	_siteObj.label = "${USAGE_SITE_WEEK_LIST.site_name}";
	_siteObj.borderWidth = 2;
	_siteObj.backgroundColor = _chartColors[${STATUS.index}%10];
    _siteObj.borderColor = _chartColors[${STATUS.index}%10];
	_siteObj.fill = false;
	_siteObj.data = [];	
	
	<c:forEach var="LIST_USAGE" items="${USAGE_SITE_WEEK_LIST.list_usage}">

		<c:if test="${LIST_USAGE.round_usage eq null}">
		_siteObj.data.push(null);
		</c:if>
	
		<c:if test="${LIST_USAGE.round_usage ne null}">
		_siteObj.data.push("${LIST_USAGE.round_usage}");
		</c:if>

	</c:forEach>

	_usage_site_week_list.push(_siteObj);
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
					<div class="mb-4 page-heading-div">
						
						<div class="page-heading-title-div">
							<span class="mb-0 text-gray-800 page-heading-title">요일별 분석</span> 
								
							&nbsp &nbsp &nbsp
								
								
							<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 시설별 사용량 분석 > 요일별 분석</span> 
						</div>
							
							
							
						<div class="page-heading-report-div" style="">
							<span class="page-heading-report-helper" style=""></span>
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
						</div>
						
					</div>		
					
														
					<!-- 검색, text -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div style="width:100%;display: inline-block;">
										<form id="usageSiteWeekSearchForm" name="usageSiteWeekSearchForm" method="get" action="<c:url value='../org/usageWeek'/>">
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
											
											
											<div style="width:15%;float:left;">
												<input type="button" id="usageSiteWeekSearchBtn" class="btn btn-outline-primary btn-sm" value="조회" >
													
											</div>
										</form>
									</div>
									
									<div style="width:100%;display: inline-block;">
										<span>
                  							선택한 기간의 평균 온도
                  						</span>	&emsp;
                  						
                  						<span> 
                  							최고 기온 :		
                  										
                  										<c:set value="${WEATHER.avg_temp_max}" var="AVG_TEMP_MAX"/>
                  										
                  										<c:if test="${AVG_TEMP_MAX eq 'NaN' }">
                  											-
                  										</c:if>
                  										<c:if test="${AVG_TEMP_MAX ne 'NaN' }">
                  											<c:if test="${AVG_TEMP_MAX < 0}"> - </c:if>
                  											<c:if test="${AVG_TEMP_MAX > 0}"> <fmt:formatNumber value="${AVG_TEMP_MAX}" pattern="#,###.00"/> ℃ </c:if>
                  										</c:if>
                  										
                  						</span> &emsp;
                  						<span> 
                  							최저 기온 :		
                  										<c:set value="${WEATHER.avg_temp_min}" var="AVG_TEMP_MIN"/>
                  										
                  										<c:if test="${AVG_TEMP_MIN eq 'NaN' }">
                  											-
                  										</c:if>
                  										
                  										<c:if test="${AVG_TEMP_MIN ne 'NaN' }">
                  											<c:if test="${AVG_TEMP_MIN < 0}"> - </c:if>
                  											<c:if test="${AVG_TEMP_MIN > 0}"> <fmt:formatNumber value="${AVG_TEMP_MIN}" pattern="#,###.00"/> ℃</c:if>
                  										</c:if>
                  						</span> &emsp;
                  						<span> 
                  							평균 기온 : 	
                  										<c:set value="${WEATHER.avg_temp_avg}" var="AVG_TEMP_AVG"/>
                  										
                  										<c:if test="${AVG_TEMP_AVG eq 'NaN' }">
                  											-
                  										</c:if>
                  										
                  										<c:if test="${AVG_TEMP_AVG ne 'NaN' }">
                  											<c:if test="${AVG_TEMP_AVG < 0}"> - </c:if>
                  											<c:if test="${AVG_TEMP_AVG > 0}"> <fmt:formatNumber value="${AVG_TEMP_AVG}" pattern="#,###.00"/> ℃ </c:if>
                  										</c:if>
                  						</span> &emsp;
									</div>
									
								</div>
							</div>
						</div>
										

					</div>
					<!-- 검색, text 끝 -->
					
					<!-- 차트 -->
					<div class="row">
						<div class="col-lg-12">
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
						<!-- text -->	
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-body">
									<div class="lightbulb-img-style">
										<i class="far fa-lightbulb"></i>
									</div>
									
									<div class="lightbulb-text-style">
										- 아파트 단지와 복지관의 차이점을 비교해 보세요! <br>  
										- 아파트 단지 사이에도 차이점이 있는지 살펴 보세요! <br>
										- 복지관 사이에도 차이점이 있는지 살펴 보세요! <br>
										- 여름철 변압기 과부하 가능성이 큰 요일과 시설을 찾아보세요! <br>
									</div>
									
								</div>
							</div>
						</div>
									
									<div style="text-align: right;width: 100%;">
											단위 : kWh
									</div>
									
									<!-- table -->
									
									<div>
										<table class="table-hover org-table-bordered org-table-style">
											<tr class="org-table-title-usage">
												<td style="width:23%;"></td>
												<c:set value="${USAGE_SITE_WEEK_LIST[0].list_usage}" var="LABEL_LIST" />
												
												<c:forEach items="${LABEL_LIST}" var="LABEL_LIST">
												<td style="width:11%;">${LABEL_LIST.text_unit}</td>
												</c:forEach>
											</tr>	
											
											<c:forEach items="${USAGE_SITE_WEEK_LIST}" var="USAGE_SITE_WEEK_LIST">
											<tr>
												<td>${USAGE_SITE_WEEK_LIST.site_name}</td>
												
												<c:forEach items="${USAGE_SITE_WEEK_LIST.list_usage}" var="LIST_USAGE">
												<td>
												
													<c:if test="${LIST_USAGE.text_usage eq null}">
														-
													</c:if>
													
													<c:if test="${LIST_USAGE.text_usage ne null}">
														${LIST_USAGE.text_usage}
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
