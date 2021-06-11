<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>계측기간 사용량 비교 - 시간대별 비교</title>
<jsp:include page="../../common/common.jsp"></jsp:include>

<c:if test="${not empty sessionScope}">

	<script
		src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/bld/comp/js/bldCompDay.js"></script>

	<script type="text/javascript">

var _chartLabels = [];

<c:forEach var="LIST_USAGE" items="${USAGE_METER_DAY_LIST[0].list_usage}">

	_chartLabels.push("${LIST_USAGE.unit + 1}" + "시");
	
</c:forEach>

var _chartData = [];

<c:forEach var="USAGE_METER_DAY_LIST" items="${USAGE_METER_DAY_LIST}" varStatus="STATUS">
	var _dataObj = {};
	
	_dataObj.label = "${USAGE_METER_DAY_LIST.descr}";
	_dataObj.borderWidth = 2;
	_dataObj.backgroundColor = _chartColors[${STATUS.index}%10]; // index: 0부터, count: 1부터
	_dataObj.borderColor = _chartColors[${STATUS.index}%10];
	_dataObj.fill = false;
	_dataObj.data = [];
	
	<c:forEach var="LIST_USAGE" items="${USAGE_METER_DAY_LIST.list_usage}">
		
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

<body id="page-top" oncontextmenu='return false'
	onselectstart='return false' ondragstart='return false'>
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
										<span class="mb-0 text-gray-800 page-heading-title">시간대별
											비교</span> &nbsp &nbsp &nbsp <span class="page-heading-navi-span"><i
											class="fas fa-fw fa-home"></i> > 계측기간 사용량 비교 > 시간대별 비교</span>
									</div>

									<div class="page-heading-report-div" style="">
										<span class="page-heading-report-helper" style=""></span> <input
											type="button" id="" class="btn btn-outline-primary btn-sm"
											value="레포트 미리보기"> <input type="button" id=""
											class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
									</div>
								</div>
							</div>
						</div>





						<!-- 검색 -->
						<div class="row">
							<div class="col-xl-12">
								<div class="card shadow mb-4">
									<div class="card-body">
										<div style="width: 100%; display: inline-block;">
											<form id="searchForm" name="searchForm" method="get"
												action="<c:url value='../bld/compDay'/>">
												<div style="width: 100px; float: left;">
													<span style="display: inline-block; height: 21px;"></span>날짜
													선택
												</div>

												<div style="width: 200px; float: left;">
													<input class="custom-date custom-date-sm" id="dateTarget"
														name="dateTarget" type="text" style="width: 95%;"
														value="${DATETARGET}">
												</div>

												<div style="width: 15%; float: left;">
													<input type="button" id="searchBtn"
														class="btn btn-outline-primary btn-sm" value="조회">
												</div>
											</form>
										</div>

										<div class="width:100%;display: inline-block;">
											<span> ${DATETARGET} ${WEATHERDAY.text_day_of_week}

												(${WEATHERDAY.text_is_holiday}) </span> &emsp; <span> 날씨 : <c:if
													test="${WEATHERDAY.weather_code < 0}"> - </c:if> <c:if
													test="${WEATHERDAY.weather_code > 0}">
													<img
														src="${pageContext.request.contextPath}/${WEATHERDAY.text_weather_code}"
														style="width: 20px;">
												</c:if>
											</span> &emsp; <span> 최고 기온 : <c:if
													test="${WEATHERDAY.temp_max < 0}"> - </c:if> <c:if
													test="${WEATHERDAY.temp_max > 0}"> ${WEATHERDAY.temp_max} ℃ </c:if>
											</span> &emsp; <span> 최저 기온 : <c:if
													test="${WEATHERDAY.temp_min < 0}"> - </c:if> <c:if
													test="${WEATHERDAY.temp_min > 0}"> ${WEATHERDAY.temp_min} ℃ </c:if>
											</span> &emsp; <span> 평균 기온 : <c:if
													test="${WEATHERDAY.temp_avg < 0}"> - </c:if> <c:if
													test="${WEATHERDAY.temp_avg > 0}"> ${WEATHERDAY.temp_avg} ℃ </c:if>
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
										<!-- 차트 -->
										<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
											<!-- IE 아닌 경우 -->
											<div
												style="height: 500px; width: 100%; display: inline-block;">
												<canvas id="myChart"
													style="height: 500px; width: 100%; display: unset;"></canvas>
											</div>
										</c:if>


										<c:if test="${sessionScope.BROWSER eq 'MSIE' }">
											<!-- IE 인 경우 -->
											<div style="height: 400px;">
												<canvas id="myChart" style=""></canvas>
											</div>
										</c:if>
										<hr />

										<!-- text -->
										<div>* 범례의 항목을 클릭하면 해당 항목이 OFF 됩니다.</div>

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
																- 시간대 별로 가장 많은 전기를 사용하는 계측기를 찾아보세요!

																<!-- <div style="width:50%;float:right; text-align: right;">  
												<span> 2020-06-11 18:32:45 </span> 
												<span> <i class="fas fa-redo"></i> </span>
											</div> -->
															</div>

															<div>- 휴일에도 전기를 많이 사용하는 계측기를 찾아보세요!</div>


														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 내용 끝 -->

										<div style="text-align: right; width: 100%;">단위 : kWh</div>
										<!-- table -->
										<c:forEach items="${USAGE_METER_DAY_LIST}"
											var="USAGE_METER_DAY_LIST">
											<table class="table-hover org-table-bordered org-table-style">
												<tr>
													<td colspan='13' class="org-table-title-usage" style="">
														${USAGE_METER_DAY_LIST.descr}</td>
												</tr>

												<c:if
													test="${fn:length(USAGE_METER_DAY_LIST.list_usage) eq 0 }">
													<tr>
														<td colspan="13">데이터가 없습니다</td>

													</tr>
												</c:if>

												<!-- AM -->
												<tr>
													<td style="width: calc(100%/ 13)" rowspan="2">AM</td>
													<c:forEach items="${USAGE_METER_DAY_LIST.list_usage}"
														var="LIST_USAGE" varStatus="STATUS">
														<c:if test="${STATUS.index <12 }">
															<td style="width: calc(100%/ 13); font-weight: bold;">${LIST_USAGE.unit + 1}
																시</td>
														</c:if>
													</c:forEach>
												</tr>

												<tr>
													<c:forEach items="${USAGE_METER_DAY_LIST.list_usage}"
														var="LIST_USAGE" varStatus="STATUS">

														<c:if test="${STATUS.index <12 }">
															<td style="width: calc(100%/ 13)"><c:if
																	test="${LIST_USAGE.text_usage eq null}">
													-
												</c:if> <c:if test="${LIST_USAGE.text_usage ne null}">

																	<c:if
																		test="${LIST_USAGE.round_usage == USAGE_METER_DAY_LIST.max_round_usage}">
																		<c:if test="${LIST_USAGE.round_usage == 0.00}">
																${LIST_USAGE.text_usage}
														</c:if>

																		<c:if test="${LIST_USAGE.round_usage != 0.00}">
																			<span style="color: red;">${LIST_USAGE.text_usage}</span>
																		</c:if>
																	</c:if>

																	<c:if
																		test="${LIST_USAGE.round_usage != USAGE_METER_DAY_LIST.max_round_usage}">
														${LIST_USAGE.text_usage}
													</c:if>

																</c:if></td>
														</c:if>
													</c:forEach>
												</tr>

												<!-- PM -->
												<tr>
													<td style="width: calc(100%/ 13)" rowspan="2">PM</td>
													<c:forEach items="${USAGE_METER_DAY_LIST.list_usage}"
														var="LIST_USAGE" varStatus="STATUS">
														<c:if test="${STATUS.index >=12 }">
															<td style="width: calc(100%/ 13); font-weight: bold;">${LIST_USAGE.unit + 1}
																시</td>
														</c:if>
													</c:forEach>
												</tr>

												<tr>
													<c:forEach items="${USAGE_METER_DAY_LIST.list_usage}"
														var="LIST_USAGE" varStatus="STATUS">

														<c:if test="${STATUS.index >=12 }">
															<td style="width: calc(100%/ 13)"><c:if
																	test="${LIST_USAGE.text_usage eq null}">
															-
														</c:if> <c:if test="${LIST_USAGE.text_usage ne null}">

																	<c:if
																		test="${LIST_USAGE.round_usage == USAGE_METER_DAY_LIST.max_round_usage}">
																		<c:if test="${LIST_USAGE.round_usage == 0.00}">
																	${LIST_USAGE.text_usage}
																</c:if>

																		<c:if test="${LIST_USAGE.round_usage != 0.00}">
																			<span style="color: red;">${LIST_USAGE.text_usage}</span>
																		</c:if>
																	</c:if>

																	<c:if
																		test="${LIST_USAGE.round_usage != USAGE_METER_DAY_LIST.max_round_usage}">
																${LIST_USAGE.text_usage}
															</c:if>

																</c:if></td>
														</c:if>
													</c:forEach>
												</tr>

											</table>

											<br>
										</c:forEach>

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
