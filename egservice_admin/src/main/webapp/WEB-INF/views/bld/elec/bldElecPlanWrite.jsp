<%@page import="java.util.ArrayList"%>
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
<title>계측기간 사용량 비교 - 시간대별 비교</title>
<jsp:include page="../../common/common.jsp"></jsp:include>

<style>
.elecInputWidth100 {
	width: 100%;
	height: 38px;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #6e707e;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #d1d3e2;
	border-radius: 0.35rem;
}

.elecInputWidth80 {
	width: 80%;
	height: 38px;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #6e707e;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #d1d3e2;
	border-radius: 0.35rem;
}

.elecInputWidth100:focus {
	color: #6e707e;
	background-color: #fff;
	border-color: #bac8f3;
	outline: 0;
	box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
}

.elecStdBtn {
	height: 38px;
	float: right;
}

.elecMeterSelect {
	height: 38px;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #6e707e;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #d1d3e2;
	border-radius: 0.35rem;
	width: 100%;
}

.elecSelect80 {
	height: 38px;
	width: 80%;
}

.elecSelect90 {
	height: 38px;
	width: 90%;
}

.electReadonly {
	background-color: #d1d3e2;
	border-color: #d1d3e2;
}

.elecPlusBtn {
	height: 38px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	border-radius: 0.2rem;
}

.planRefBtn {
	cursor: pointer;
	width: 100%;
	height: 100%;
	justify-content: center;
	align-items: center;
	display: flex;
	padding: 0.25rem 0.5rem;
	font-size: 0.875rem;
	line-height: 1.5;
	border-radius: 0.2rem;
}

.planRefBtnReadonly {
	background-color: #d1d3e2;
	border-color: #d1d3e2;
}

.planRefBtnReadonly:hover {
	cursor: default;
	background-color: #d1d3e2;
	border-color: #d1d3e2;
}

.addPlanBtnReadonly {
	background-color: #d1d3e2;
	border-color: #d1d3e2;
}

.addPlanBtnReadonly:hover {
	cursor: default;
	background-color: #d1d3e2;
	border-color: #d1d3e2;
}
</style>

<c:if test="${not empty sessionScope}">

	<script
		src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPlanWrite.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPopStdWrite.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPlanList.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPopActWrite.js"></script>

	<script type="text/javascript">
	
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
					<div class="container-fluid" id="container-fluid">

						<!-- Page Heading -->
						<div class="row">
							<div class="col-xl-12">
								<div class="mb-4 page-heading-div">

									<div class="page-heading-title-div">
										<span class="mb-0 text-gray-800 page-heading-title">절감
											계획 새로 만들기</span> &nbsp &nbsp &nbsp <span
											class="page-heading-navi-span"><i
											class="fas fa-fw fa-home"></i> > 전기요금 절감하기 > 절감 계획 새로 만들기</span>
									</div>

								</div>
							</div>
						</div>

						<!-- 절감 계획 만들기 시작 -->
						<div class="row">
							<div class="col-xl-12">
								<div class="card shadow mb-4">
									<div
										class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">절감 계획 작성</h6>
									</div>

									<div class="card-body">
										<div class="row"
											style='padding-right: 0.75rem; padding-left: 0.75rem;'>
											<form name="planWriteForm" id="planWriteForm">
												<input type="hidden" name="seq_save_ref" id="seq_save_ref"
													value="" readonly>
												<!-- 절감 기준 -->
												<input type="hidden" name="save_ref_name" id="save_ref_name"
													value="" readonly> <input type="hidden"
													name="seq_save_plan" id="seq_save_plan"
													value="${seq_save_plan}" readonly>
												<!-- 절감 계획 -->
											</form>

											<div style="width: 100%;">

												<div style="width: 80%; float: left;">
													<div
														style="width: 100%; display: flex; align-items: center; height: 100%;">
														<div
															style="width: 20%; float: left; padding-bottom: 20px;">
															절감 계획 명칭</div>
														<div
															style="width: 80%; float: left; padding-bottom: 20px;">
															<input type="text" class="elecInputWidth100"
																id="planName">
														</div>
													</div>

													<div
														style="width: 100%; display: flex; align-items: center; height: 100%;">
														<div
															style="width: 20%; float: left; padding-bottom: 20px;">
															절감기준</div>

														<div
															style="width: 80%; float: left; padding-bottom: 20px;">
															<input type="text" class="elecInputWidth80 electReadonly"
																disabled id="refName"> <input type="button"
																value="절감 기준 선택"
																class='btn btn-outline-primary btn-sm elecStdBtn'
																id='popStdListBtn'>
														</div>
													</div>
												</div>

												<div
													style="width: 20%; float: right; display: flex; justify-content: center; align-items: center; height: 100%; padding-bottom: 20px; padding-left: 1.5em; padding-right: 0.5em;">

													<span class='planRefBtn planRefBtnReadonly' id="planRefBtn">
														절감계획 시행 </span>

												</div>

											</div>

											<div
												style="width: 100%; padding-bottom: 20px; display: flex; align-items: center;">
												<div style="width: 16%; float: left;">절감 목표 추가하기</div>
												<div style="width: 84%; float: left;">

													<div
														style="width: 100%; height: 100%; display: flex; align-items: center;">
														<div style="float: left; text-align: center; width: 10%;">
															계측기</div>
														<div style="float: left; width: 30%;">
															<select class='custom-select elecSelect80' id="seqMeter">
																<c:forEach
																	items="${sessionScope.SITE_INFO_BLD.meter_list}"
																	var="METER_LIST">
																	<option value='${METER_LIST.descr}'
																		data-id="${METER_LIST.seq_meter}">${METER_LIST.descr}</option>
																</c:forEach>
															</select>
														</div>

														<div style="float: left; width: 50%; height: 100%;">
															<div style="width: 32%; float: left">
																<select class='custom-select elecSelect90' style=""
																	id="hourFrom">
																	<c:forEach items="${selectTimeList}"
																		var="SELECTTIMELIST">
																		<option value="${SELECTTIMELIST.time}">${SELECTTIMELIST.time_str}</option>
																	</c:forEach>
																</select>
															</div>

															<div
																style='width: 4%; float: left; display: flex; align-items: center; height: 38px;'>
																<div>~</div>
															</div>

															<div style="width: 32%; float: left">
																<select class='custom-select elecSelect90' style=""
																	id="hourTo">
																	<c:forEach items="${selectTimeList}"
																		var="SELECTTIMELIST">
																		<option value="${SELECTTIMELIST.time}">${SELECTTIMELIST.time_str}</option>
																	</c:forEach>
																</select>
															</div>

															<div style='width: 32%; float: left'>
																<select class='custom-select elecSelect80' style=""
																	id="percentToSave">
																	<c:forEach items="${selectPerList}" var="SELECTPERLIST">
																		<option value="${SELECTPERLIST.per}">${SELECTPERLIST.per_str}</option>
																	</c:forEach>
																</select>
															</div>

														</div>

														<div
															style='float: left; width: 10%; padding-right: 0.5em;'>
															<span id='addPlanBtn'
																class='elecPlusBtn addPlanBtnReadonly'><i
																class="fas fa-plus x2"></i></span>

														</div>
													</div>


												</div>
											</div>

											<div style="width: 100%">
												<div style="width: 16%; float: left;">절감 목표 목록</div>

												<div style="width: 84%; float: left;">
													<table
														class="table table-bordered table-hover dataTable ntcListTable"
														id="planTable" width="100%" cellspacing="0" role="grid"
														aria-describedby="dataTable_info"
														style="width: 100%; text-align: center;">

														<tr>
															<th width="18%">계측기</th>
															<th width="18%">절감시간</th>
															<th width="18%">절감목표</th>
															<th width="18%">예상 절감량</th>
															<th width="18%">예상 절감 요금</th>
															<th width="10%"></th>
														</tr>

													</table>
												</div>
											</div>

										</div>
									</div>

								</div>
							</div>
						</div>
						<!-- 절감 계획 만들기 끝 -->



						<!-- 절감 예상 요약 시작 -->
						<div class="row">
							<div class="col-xl-12">
								<div class="card shadow mb-4">
									<div
										class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">절감 예상 요약</h6>

									</div>

									<div class="card-body">

										<table
											class="table table-bordered table-hover dataTable ntcListTable"
											id="planSummary" width="100%" cellspacing="0" role="grid"
											aria-describedby="dataTable_info"
											style="width: 100%; text-align: center;">

											<tr>
												<th width="33.33%"></th>
												<th width="33.33%">사용량 (kWh)</th>
												<th width="33.33%">사용 요금 (원)</th>
											</tr>

											<tr>
												<td>하루평균 절감 예상</td>
												<td id='save_kwh_total_from_elem'>-</td>
												<td id='save_won_total_from_elem'>-</td>

											</tr>

											<tr>
												<td>월 평균 절감예상<span style='color: red;'><sup>*</sup></span></td>
												<td id='save_kwh_month'>-</td>
												<td id='save_won_month'>-</td>
											</tr>

										</table>

										<hr />

										<div>
											<span style='color: red;'><sup>*</sup></span> 월평균 절감예상 = 하루평균
											절감 예상 X 23 (근무일)
										</div>

									</div>
								</div>
							</div>
						</div>
						<!-- 절감 예상 요약 끝 -->

						<!-- 계측기별 절감 예상 시작 -->
						<div class="row">
							<div class="col-xl-12">
								<div class="card shadow mb-4">
									<div
										class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">계측기별 절감 예상</h6>

									</div>

									<div class="card-body">

										<table class="org-table-bordered org-table-style"
											id="meter_plan" width="100%" cellspacing="0" role="grid"
											aria-describedby="dataTable_info"
											style="width: 100%; text-align: center;">

											<tr class="org-table-title-usage">
												<th rowspan="2" style=''>계측기</th>
												<th colspan='4' style=''>사용량 (kWh)</th>
												<th colspan='4' style=''>사용 요금 (원)</th>
											</tr>

											<tr class="org-table-title-usage">

												<th>합계</th>
												<th>경부하</th>
												<th>중간부하</th>
												<th>최대부하</th>
												<th>합계</th>
												<th>경부하</th>
												<th>중간부하</th>
												<th>최대부하</th>
											</tr>

										</table>

									</div>
								</div>
							</div>
						</div>
						<!-- 계측기별 절감 예상 끝 -->

						<!-- 차트  전체계측기 사용량-->
						<div class="row" id="kwhChartContainer" style='display: none;'>
							<div class="col-xl-12">
								<div class="card shadow mb-4">
									<div
										class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">전체 계측기(사용량)</h6>
									</div>

									<div class="card-body">

										<!-- 차트 -->
										<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
											<!-- IE 아닌 경우 -->
											<div
												style="height: 500px; width: 100%; display: inline-block;">
												<canvas id="kwhChart"
													style="height: 500px; width: 100%; display: unset;"></canvas>
											</div>
										</c:if>


										<c:if test="${sessionScope.BROWSER eq 'MSIE' }">
											<!-- IE 인 경우 -->
											<div style="height: 400px;">
												<canvas id="kwhChart" style=""></canvas>
											</div>
										</c:if>

									</div>
								</div>
							</div>
						</div>
						<!-- 차트 끝 -->

						<!-- 차트 전체계측기 사용요금 -->
						<div class="row" id="wonChartContainer" style='display: none;'>
							<div class="col-xl-12">
								<div class="card shadow mb-4">
									<div
										class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">전체
											계측기(사용요금)</h6>
									</div>
									<div class="card-body">

										<!-- 차트 -->
										<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
											<!-- IE 아닌 경우 -->
											<div
												style="height: 500px; width: 100%; display: inline-block;">
												<canvas id="wonChart"
													style="height: 500px; width: 100%; display: unset;"></canvas>
											</div>
										</c:if>


										<c:if test="${sessionScope.BROWSER eq 'MSIE' }">
											<!-- IE 인 경우 -->
											<div style="height: 400px;">
												<canvas id="wonChart" style=""></canvas>
											</div>
										</c:if>

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
		<div id="cloneDiv" style="display: none">
			<div class="row delChartAera">
				<div class="col-xl-12">
					<div class="card shadow mb-4">
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary chart_title"></h6>
						</div>
						<div class="card-body">

							<!-- 차트 -->
							<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
								<!-- IE 아닌 경우 -->
								<div style="height: 500px; width: 100%; display: inline-block;">
									<canvas class="chart_aera"
										style="height: 500px; width: 100%; display: unset;"></canvas>
								</div>
							</c:if>


							<c:if test="${sessionScope.BROWSER eq 'MSIE' }">
								<!-- IE 인 경우 -->
								<div style="height: 400px;">
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