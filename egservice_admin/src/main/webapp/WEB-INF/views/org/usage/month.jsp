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
	<title>시설별 사용량 분석 - 날짜별 분석</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">
	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/org/common/js/orgSideBar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/org/usage/js/orgUsageMonth.js"></script>
	
<script>
//	chart에 사용할 data
var _usage_site_month_list = [];

//	chart에 사용할 라벨
var _chartLabels = [];


<c:forEach var="LIST_USAGE" items="${USAGE_SITE_MONTH_LIST[0].list_usage}">

	_chartLabels.push("${LIST_USAGE.unit}" + "일");

</c:forEach>

<c:forEach items="${USAGE_SITE_MONTH_LIST}" var="USAGE_SITE_MONTH_LIST" varStatus="STATUS">

	var _siteObj = {};
	_siteObj.seq_site = "${USAGE_SITE_MONTH_LIST.seq_site}";
	_siteObj.label = "${USAGE_SITE_MONTH_LIST.site_name}";
	_siteObj.borderWidth = 2;
	_siteObj.backgroundColor = _chartColors[${STATUS.index}%10];
    _siteObj.borderColor = _chartColors[${STATUS.index}%10];
    _siteObj.fill = false;
	_siteObj.data = [];
	
	<c:forEach var="LIST_USAGE" items="${USAGE_SITE_MONTH_LIST.list_usage}">
		

		<c:if test="${LIST_USAGE.round_usage eq null}">
			_siteObj.data.push(null);
		</c:if>
		
		<c:if test="${LIST_USAGE.round_usage ne null}">
			_siteObj.data.push("${LIST_USAGE.round_usage}");
		</c:if>
		
		
		
		
		
	</c:forEach>
	
	_usage_site_month_list.push(_siteObj);

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
							<span class="mb-0 text-gray-800 page-heading-title">날짜별 분석</span> 
								
							&nbsp; &nbsp; &nbsp;
								
								
							<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 시설별 사용량 분석 > 날짜별 분석</span> 
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
										<form id="usageSiteMonthForm" name="" method="get" action="<c:url value='../org/usageMonth'/>">
											<div style="width:100px;float:left;">
												<span style="display: inline-block;height: 21px;"></span>월 선택
											</div>
											
											<div style="width:200px;float:left;">
												<input class="custom-date custom-date-sm" id="monthTarget" name="monthTarget" type="text" style="width:95%;" value="${MONTHTARGET}">
											</div>
											
											<div style="width:15%;float:left;">
												<input type="button" id="usageSiteMonthSearchBtn" class="btn btn-outline-primary btn-sm" value="조회">	
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
					<!-- 검색, text 끝-->
					
					
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
									
									<!-- text -->
									<hr />
									<div>
										
										* 범례의 항목을 클릭하면 해당 항목이 OFF 됩니다. <br>
										<!-- * 휴무일은 붉은 색으로 표시 됩니다. -->
									</div>
									<!--  -->
									
									<!-- table -->
									<hr />
									
						<!-- text -->	
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<!-- <div class="card-header py-3">
                  					<h6 class="m-0 font-weight-bold">
                  						
                  					</h6>
                				</div> -->
								<div class="card-body">
									<div class="lightbulb-img-style">
										<i class="far fa-lightbulb"></i>
									</div>
									
									<div class="lightbulb-text-style">
										- <span style="text-decoration: underline;">날씨와 온도의 변화</span>에 따른 아파트와 복지관 전기 사용 패턴의 차이를 비교해 보세요! <br>  
										- 근무일과 휴무일의 전기 사용 패턴을 비교해 보세요! <br>
										- 전기 사용 패턴과 날씨의 관계를 비교해서 <span style="text-decoration: underline;">전기 사용량 절약 아이디어</span>를 제안해 보세요! <br>
									</div>
									
								</div>
							</div>
						</div>
						
									<div>
																				
										<c:if test="${fn:length(WEATHERMONTH.list_weather) eq 0 }">
										
										<table class="table-hover org-table-bordered org-table-style">
											<tr>
												<td> 데이터가 없습니다. </td>
											</tr>
										</table>
										</c:if>
										
										<!-- 1~15 / index 14 -->
										<c:if test="${fn:length(WEATHERMONTH.list_weather) ne 0 }">
										
										<table class="table-hover org-table-bordered org-table-style">
										
											<tr class="org-table-title-usage">
												<td style="width:10%;" class=""></td>		
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index <= 14 }">
													<c:if test="${LIST_WEATHER.is_holiday eq 1 }">
														<td style="color:palevioletred;">${LIST_WEATHER.unit}일</td>		
													</c:if> 
												
													<c:if test="${LIST_WEATHER.is_holiday eq 0 }">
														<td>${LIST_WEATHER.unit}일</td>
													</c:if>
												</c:if>
												</c:forEach>
											</tr>	
											
											<tr>
												<td class="">요일</td>
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index <= 14 }">
													
													<td>${LIST_WEATHER.text_day_of_week }</td>
													
												</c:if>
												</c:forEach>
											</tr>
											
											<tr>
												<td class="">날씨</td>
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index <= 14 }">
												<td>
													<c:if test="${LIST_WEATHER.text_weather_code ne '' }">
														<img src="${pageContext.request.contextPath}/${LIST_WEATHER.text_weather_code}" style="width:20px;">
													</c:if>
													
													<c:if test="${LIST_WEATHER.text_weather_code eq '' }">
														-
													</c:if>
												</td>
												</c:if>
												</c:forEach>
											</tr>
											
											<tr>
												<td class="">최고기온 (°C)</td>
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index <= 14 }">
												<td>
													<c:if test="${LIST_WEATHER.temp_max < 0}">
														-
													</c:if>
													
													<c:if test="${LIST_WEATHER.temp_max > 0}">
														${LIST_WEATHER.temp_max}
													</c:if>
												</td>
												</c:if>
												</c:forEach>
											</tr>
											
											<tr>
												<td class="">최저기온 (°C)</td>
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index <= 14}">
												<td>
													<c:if test="${LIST_WEATHER.temp_min < 0}">
														-
													</c:if>
													
													<c:if test="${LIST_WEATHER.temp_min > 0}">
														${LIST_WEATHER.temp_min}
													</c:if>
												</td>
												</c:if>
												</c:forEach>
											</tr>
											
											<tr>
												<td class="">평균기온 (°C)</td>
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index <= 14 }">
												<td>
													<c:if test="${LIST_WEATHER.temp_avg  < 0 }">
														-
													</c:if>
													
													<c:if test="${LIST_WEATHER.temp_avg  > 0 }">
														${LIST_WEATHER.temp_avg}
													</c:if>
												</td>
												</c:if>
												</c:forEach>
											</tr>
											
											
											<c:forEach var="USAGE_SITE_MONTH_LIST" items="${USAGE_SITE_MONTH_LIST}">
											<tr>
												<td  class="">${USAGE_SITE_MONTH_LIST.site_name} (kWh)</td>
												<c:forEach items="${USAGE_SITE_MONTH_LIST.list_usage}" var="LIST_USAGE" varStatus="STATUS">
													
													<c:if test="${STATUS.index <= 14 }">
													
													<td>
														
														<c:if test="${LIST_USAGE.text_usage eq null}">
															-
														</c:if>
														
														<c:if test="${LIST_USAGE.text_usage ne null}">
															${LIST_USAGE.text_usage}
														</c:if>
														
													</td>
													
													</c:if>
													
												</c:forEach>
											</tr>	
											</c:forEach>
											
										
										</table>
										</c:if>
										
										<br>
										
										<!-- 16~ index15 -->
										<c:if test="${fn:length(WEATHERMONTH.list_weather) >= 15 }">
										
										<table class="table-hover org-table-bordered org-table-style">
											<tr  class="org-table-title-usage">
												<td style="width:10%;"></td>	
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index > 14 }">
													<c:if test="${LIST_WEATHER.is_holiday eq 1 }">
														<td style="color:palevioletred;">${LIST_WEATHER.unit}일</td>		
													</c:if> 
												
													<c:if test="${LIST_WEATHER.is_holiday eq 0 }">
														<td>${LIST_WEATHER.unit}일</td>
													</c:if>
												</c:if>
												</c:forEach>
											</tr>
											
											<tr>
												<td class="">요일</td>
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index > 14 }">
												<td>${LIST_WEATHER.text_day_of_week }</td>
												</c:if>
												</c:forEach>
											</tr>
											
											<tr>
												<td  class="">날씨</td>
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index > 14 }">
												<td>
													<c:if test="${LIST_WEATHER.text_weather_code ne '' }">
														<img src="${pageContext.request.contextPath}/${LIST_WEATHER.text_weather_code}" style="width:20px;">
													</c:if>
													
													<c:if test="${LIST_WEATHER.text_weather_code eq '' }">
														-
													</c:if>
												</td>
												</c:if>
												</c:forEach>
											</tr>
											
											<tr>
												<td  class="">최고기온 (°C)</td>
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index > 14 }">
												<td>
													<c:if test="${LIST_WEATHER.temp_max < 0}">
														-
													</c:if>
													
													<c:if test="${LIST_WEATHER.temp_max > 0}">
														${LIST_WEATHER.temp_max}
													</c:if>
												</td>
												</c:if>
												</c:forEach>
											</tr>	
											
											<tr>
												<td  class="">최저기온 (°C)</td>
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index > 14 }">
												<td>
													<c:if test="${LIST_WEATHER.temp_min < 0}">
														-
													</c:if>
													
													<c:if test="${LIST_WEATHER.temp_min > 0}">
														${LIST_WEATHER.temp_min}
													</c:if>
												</td>
												</c:if>
												</c:forEach>
											</tr>
											
											<tr>
												<td  class="">평균기온 (°C)</td>
												<c:forEach var="LIST_WEATHER" items="${WEATHERMONTH.list_weather}" varStatus="STATUS">
												<c:if test="${STATUS.index > 14 }">
												<td>
													<c:if test="${LIST_WEATHER.temp_avg  < 0 }">
														-
													</c:if>
													
													<c:if test="${LIST_WEATHER.temp_avg  > 0 }">
														${LIST_WEATHER.temp_avg}
													</c:if>
												</td>
												</c:if>
												</c:forEach>
											</tr>
											
											<c:forEach var="USAGE_SITE_MONTH_LIST" items="${USAGE_SITE_MONTH_LIST}">
											<tr>
												<td  class="">${USAGE_SITE_MONTH_LIST.site_name} (kWh)</td>
												<c:forEach items="${USAGE_SITE_MONTH_LIST.list_usage}" var="LIST_USAGE" varStatus="STATUS">
													
													<c:if test="${STATUS.index > 14 }">
													
													<td>
													
														<c:if test="${LIST_USAGE.text_usage eq null}">
															-
														</c:if>
														
														<c:if test="${LIST_USAGE.text_usage ne null}">
															${LIST_USAGE.text_usage}
														</c:if>
														
													</td>
													
													</c:if>
													
												</c:forEach>
											</tr>	
											</c:forEach>
										
										</table>
										</c:if>
										
									</div>
									<!--  -->
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
