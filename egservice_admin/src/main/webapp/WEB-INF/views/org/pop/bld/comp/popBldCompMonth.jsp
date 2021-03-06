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
	<title>계측기간 사용량 비교 - 날짜별 비교</title>
	<jsp:include page="../../../../common/common.jsp"></jsp:include>
	

	<c:if test="${not empty sessionScope}">		
		<!-- bld common js -->
		<script src="${pageContext.request.contextPath}/resources/admin/org/pop/bld/common/js/popBldSidebar.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
		<script src="${pageContext.request.contextPath}/resources/admin/org/pop/bld/comp/js/popBldCompMonth.js"></script>
	
<script type="text/javascript">
var _chartLabels = [];

<c:forEach var="LIST_USAGE" items="${USAGE_METER_MONTH_LIST[0].list_usage}">

	_chartLabels.push("${LIST_USAGE.unit}" + "일");
	
</c:forEach>

var _chartData = [];

<c:forEach var="USAGE_METER_MONTH_LIST" items="${USAGE_METER_MONTH_LIST}" varStatus="STATUS">
	var _dataObj = {};
	
	_dataObj.label = "${USAGE_METER_MONTH_LIST.descr}";
	_dataObj.borderWidth = 2;
	_dataObj.backgroundColor = _chartColors[${STATUS.index}%10];
	_dataObj.borderColor = _chartColors[${STATUS.index}%10];
	_dataObj.fill = false;
	_dataObj.data = [];
	
	<c:forEach var="LIST_USAGE" items="${USAGE_METER_MONTH_LIST.list_usage}">
		
		<c:if test="${LIST_USAGE.round_usage eq null}">
			_dataObj.data.push(null);
		</c:if>
		
		<c:if test="${LIST_USAGE.round_usage ne null}">
			_dataObj.data.push("${LIST_USAGE.round_usage}");
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
		<jsp:include page="../../../../common/emptySession.jsp"></jsp:include>		
	</c:if>

	<c:if test="${not empty sessionScope.ADMIN}">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="../common/popBldSidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="../common/popBldTopbar.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content /.container-fluid-->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="row">
						<div class="col-xl-12">
							<div class="mb-4 page-heading-div">
						
								<div class="page-heading-title-div">
									<span class="mb-0 text-gray-800 page-heading-title">날짜별 비교</span> 
									
									&nbsp; &nbsp; &nbsp;
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 계측기간 사용량 비교 > 날짜별 비교</span>
								</div>
							
								<div class="page-heading-report-div" style="">
									<span class="page-heading-report-helper" style=""></span>
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
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
										<form id="searchForm" name="searchForm" method="get" action="<c:url value='./bldCompMonth'/>">
											<div style="width:100px;float:left;">
												<span style="display: inline-block;height: 21px;"></span>월 선택
											</div>
											
											<div style="width:200px;float:left;">
												<input class="custom-date custom-date-sm" id="monthTarget" name="monthTarget" type="text" style="width:95%;" value="${MONTHTARGET}">
											</div>
											
											<div style="width:15%;float:left;">
												<input type="button" id="searchBtn" class="btn btn-outline-primary btn-sm" value="조회">	
											</div>
										</form>
										
									
									</div>
									
									<div class="width:100%;display: inline-block;">
										<span>
                  							${MONTHTARGET}
                  									
                  									
                  						</span>	&emsp;
                  						
                  						
                  						<span> 
                  							최고 기온 :		
                  										<c:set value="${WEATHERMONTH.avg_temp_max}" var="AVG_TEMP_MAX"/>
                  										
                  										<%-- <c:if test="${AVG_TEMP_MAX eq 'NaN' }">
                  											-
                  										</c:if>
                  										<c:if test="${AVG_TEMP_MAX ne 'NaN' }"> --%>
                  											<c:if test="${AVG_TEMP_MAX < 0}"> - </c:if>
                  											<c:if test="${AVG_TEMP_MAX > 0}"> <fmt:formatNumber value="${AVG_TEMP_MAX}" pattern="#,###.00"/>  ℃  </c:if>
                  										<%-- </c:if> --%>
                  										
                  						</span> &emsp;
                  						
                  						<span> 
                  							최저 기온 :		
                  										<c:set value="${WEATHERMONTH.avg_temp_min}" var="AVG_TEMP_MIN"/>
                  										
                  										<%-- <c:if test="${AVG_TEMP_MIN eq 'NaN' }">
                  											-
                  										</c:if>
                  										
                  										<c:if test="${AVG_TEMP_MIN ne 'NaN' }"> --%>
                  											<c:if test="${AVG_TEMP_MIN < 0}"> - </c:if>
                  											<c:if test="${AVG_TEMP_MIN > 0}"> <fmt:formatNumber value="${AVG_TEMP_MIN}" pattern="#,###.00"/> ℃ </c:if>
                  										<%-- </c:if> --%>
                  										
                  										
                  						</span> &emsp;
                  						<span> 
                  							평균 기온 : 	
                  										<c:set value="${WEATHERMONTH.avg_temp_avg}" var="AVG_TEMP_AVG"/>
                  										
                  										<%-- <c:if test="${AVG_TEMP_AVG eq 'NaN' }">
                  											-
                  										</c:if>
                  										
                  										<c:if test="${AVG_TEMP_AVG ne 'NaN' }"> --%>
                  											<c:if test="${AVG_TEMP_AVG < 0}"> - </c:if>
                  											<c:if test="${AVG_TEMP_AVG > 0}"> <fmt:formatNumber value="${AVG_TEMP_AVG}" pattern="#,###.00"/> ℃ </c:if>
                  										<%-- </c:if> --%>
                  										
                  						</span> &emsp; 
									
									</div>
									
									
								</div>
							</div>
						</div>
					</div>
					<!-- 검색 끝 -->			
					
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
									
									<!-- text -->
									<hr />
									<div>
										
										* 범례의 항목을 클릭하면 해당 항목이 OFF 됩니다. <br>
										<!-- * 휴무일은 붉은 색으로 표시 됩니다. -->
									</div>
									
									<hr />
									
					<!-- 내용 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									
									<div class="lightbulb-img-style">
										<i class="far fa-lightbulb"></i>
									</div>
									
									<div class="lightbulb-text-style">
										
										<div>
											- 가장 많은 전기 사용량을 어느 계측기에서 발생하는지 찾아봅니다.
										</div>
										
										<div>
											- 휴무일에도 전기 사용량이 많은 계측기가 있는지 찾아봅니다.
										</div>
										
										<div>
											- 상세한 사용량 패턴 분석이 필요한 계측기가 발견되면 "계측기별 사용량 분석" 페이지를 이용합니다.
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 내용 끝 -->
									
																		
								</div>
								
								<%-- <c:set value="${  fn:length(WEATHERMONTH.list_weather) / 2 }" var="weatherSize" />
								 --%>
								
								<c:forEach items="${USAGE_METER_MONTH_LIST}" var="USAGE_METER_MONTH_LIST" varStatus="STATUS">
								<div class="" style="flex: 1 1 auto; padding: 0 1.25rem;">	
									<div style="width:100%;">
										- ${USAGE_METER_MONTH_LIST.descr } 
									</div>	
										
									<div style="width:100%;">
										<div style="width:50%;float:left">
										
											<table class="table-hover org-table-bordered org-table-style" style="width:98%">
												<tr class="org-table-title-usage">
													<td>날짜</td>
													<td>요일</td>
													<td>사용량 <br> (kWh)</td>
													<td>날씨</td>
													<td>최고기온 <br> (°C)</td>
													<td>최저기온 <br> (°C)</td>
													<td>평균기온 <br> (°C)</td>
												</tr>
												
												<c:forEach items="${WEATHERMONTH.list_weather}" var="LIST_WEATHER" varStatus="ST">
												<c:if test="${ST.index <15 }">
												<tr>
													<td>${LIST_WEATHER.unit}일</td>
													<td>${LIST_WEATHER.text_day_of_week}</td>
													<td>
														<c:if test="${USAGE_METER_MONTH_LIST.list_usage[ST.index].text_usage eq null}">
															-
														</c:if>
														
														<c:if test="${USAGE_METER_MONTH_LIST.list_usage[ST.index].text_usage ne null}">
															${USAGE_METER_MONTH_LIST.list_usage[ST.index].text_usage}
														</c:if>
													</td>
													<td>
														<c:if test="${LIST_WEATHER.weather_code < 0}">
															-
														</c:if>
														
														<c:if test="${LIST_WEATHER.weather_code > 0}">
															<img src="${pageContext.request.contextPath}/${LIST_WEATHER.text_weather_code}" style="width:20px;">
														</c:if>
													</td>
													<td>
														<c:if test="${LIST_WEATHER.temp_max < 0}">
															-
														</c:if>
														
														<c:if test="${LIST_WEATHER.temp_max > 0}">
															${LIST_WEATHER.temp_max}
														</c:if>
													</td>
													<td>
														<c:if test="${LIST_WEATHER.temp_min < 0}">
															-
														</c:if>
														
														<c:if test="${LIST_WEATHER.temp_min > 0}">
															${LIST_WEATHER.temp_min}
														</c:if>
													</td>
													<td>
														<c:if test="${LIST_WEATHER.temp_avg < 0}">
															-
														</c:if>
														
														<c:if test="${LIST_WEATHER.temp_avg > 0}">
															${LIST_WEATHER.temp_avg}
														</c:if>
													</td>
												</tr>
												</c:if>
												</c:forEach>
												
											</table>
											
										</div>	
									
										<div style="width:50%;float:left">
											<table class="table-hover org-table-bordered org-table-style" style="width:98%">
												<tr class="org-table-title-usage">
													<td>날짜</td>
													<td>요일</td>
													<td>사용량 <br> (kWh)</td>
													<td>날씨</td>
													<td>최고기온 <br> (°C)</td>
													<td>최저기온 <br> (°C)</td>
													<td>평균기온 <br> (°C)</td>
												</tr>
												
												<c:forEach items="${WEATHERMONTH.list_weather}" var="LIST_WEATHER" varStatus="ST">
												<c:if test="${ST.index >= 15 }">
												<tr>
													<td>${LIST_WEATHER.unit}일</td>
													<td>${LIST_WEATHER.text_day_of_week}</td>
													<td>
														<c:if test="${USAGE_METER_MONTH_LIST.list_usage[ST.index].text_usage eq null}">
															-
														</c:if>
														
														<c:if test="${USAGE_METER_MONTH_LIST.list_usage[ST.index].text_usage ne null}">
															${USAGE_METER_MONTH_LIST.list_usage[ST.index].text_usage}
														</c:if>
													</td>
													<td>
														<c:if test="${LIST_WEATHER.weather_code < 0}">
															-
														</c:if>
														
														<c:if test="${LIST_WEATHER.weather_code > 0}">
															<img src="${pageContext.request.contextPath}/${LIST_WEATHER.text_weather_code}" style="width:20px;">
														</c:if>
													</td>
													<td>
														<c:if test="${LIST_WEATHER.temp_max < 0}">
															-
														</c:if>
														
														<c:if test="${LIST_WEATHER.temp_max > 0}">
															${LIST_WEATHER.temp_max}
														</c:if>
													</td>
													<td>
														<c:if test="${LIST_WEATHER.temp_min < 0}">
															-
														</c:if>
														
														<c:if test="${LIST_WEATHER.temp_min > 0}">
															${LIST_WEATHER.temp_min}
														</c:if>
													</td>
													<td>
														<c:if test="${LIST_WEATHER.temp_avg < 0}">
															-
														</c:if>
														
														<c:if test="${LIST_WEATHER.temp_avg > 0}">
															${LIST_WEATHER.temp_avg}
														</c:if>
													</td>
												</tr>
												</c:if>
												</c:forEach>
											</table>
										</div>	
									</div>	
										
								</div>	
								<br><br>
								</c:forEach>
								
								
							</div>
						</div>
					</div>
					<!-- 차트 끝 -->
					
								
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->

			<jsp:include page="../../../../common/footer.jsp"></jsp:include>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<!-- Logout Modal-->
	<%-- util.jsp : logout/scroll top.. --%>
	<jsp:include page="../../../../common/logout.jsp"></jsp:include>
	</c:if>
</body>

</html>
