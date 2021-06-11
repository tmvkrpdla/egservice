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
	<title>절감기준 만들기</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">	
	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPopStdWrite.js"></script>
	
<script type="text/javascript">


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
									<h6 class="m-0 font-weight-bold text-primary">절감 기준 만들기</h6>
									
								</div>
							
								<div class="card-body">
									
									<div class="row">
										<div class="col-xl-12">
										
											<div style="width:100%;">
												<div style='text-align: right;padding-bottom: 15px;'>
													<span style='color:red'> * </span> 필수입력
												</div>
												
												<div style="width:100%;">
													<div style='padding-bottom:10px;'> 
														<span style='color:red'> * </span> 절감 기준 명칭
													</div>
													
													<div style="width:100%;padding-bottom:65px;">
														<div style='width:80%;float:left;'>
															<input type='text' class='form-control' style='height:52px;' id='refName' name='refName'>
														</div>
														
														<!-- <div style='width:20%;float:left;padding-left: 20px;'>
															<div style="width:100%;text-align: right;">
																<span class='btn btn-outline-danger btn-sm' style='width:80%;cursor: pointer;height:52px;overflow: hidden;'>
																	일별 사용량 <br>
																	참고하기
																</span>
															</div>
														</div> -->
														
													</div>
												</div>
												
												<div style="width:100%;padding-bottom:20px;">
													<div style='padding-bottom:10px;'>  
														절감 기준 설명
													</div>
													
													<div>
														<textarea style='height:150px;' rows="" cols="" class='form-control' id='refComment'></textarea>
													</div>
												</div>
												
												<div style="width:100%;">
													<div style='padding-bottom:5px;width: 100%;text-align: right;'>  
														<input type="button" class='btn btn-outline-primary btn-sm' value='저장' id='refSaveBtn'>
													</div>
												</div>
												
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
													<!-- <input class="custom-date custom-date-sm hasDatepicker" id="dateFrom" name="dateFrom" type="text" value=""> -->
													<input class="custom-date custom-date-sm" id="dateFrom" name="dateFrom" type="text" style="width:95%;" value="">
												</div>
												
												<div style="width:5%;float: left;display: flex;align-items: center;height: 100%;justify-content: center;">
													<div>~</div>
												</div>
												
												<div style="width:20%;float:left;">
													<!-- <input class="custom-date custom-date-sm hasDatepicker" id="dateTo" name="dateTo" type="text" value=""> -->
													<input class="custom-date custom-date-sm" id="dateTo" name="dateTo" type="text" style="width:95%;" value="">
												</div>
												
												<div style="float:left;padding-left: 50px;">
													<input type="button" class='btn btn-outline-primary btn-sm' value='조회' id='searchBtn'>
													<input type="hidden" readonly value="${sessionScope.ADMIN.list_site[0].seq_site}" id="seqSite">
													
													<input type="hidden" readonly value='' id='kwhSum'/>
													<input type="hidden" readonly value='' id='kwh1'/>
													<input type="hidden" readonly value='' id='kwh2'/>
													<input type="hidden" readonly value='' id='kwh3'/>
													
													<input type="hidden" readonly value='' id='wonSum'/>
													<input type="hidden" readonly value='' id='won1'/>
													<input type="hidden" readonly value='' id='won2'/>
													<input type="hidden" readonly value='' id='won3'/>
													
													<input type="hidden" readonly value='' id='searchDateFrom' />
													<input type="hidden" readonly value='' id='searchDateTo' />
													
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
					<div class="row" id='hiddenTable' style='display:none;'>
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
					<div class="row" style='display: none;' id='hiddenChart1'>
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
					<div class="row" style='display: none;' id='hiddenChart2'>
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
					<div class="row" style='display: none;' id='hiddenChart3'>
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
					<div class="row" style='display: none;' id='hiddenChart4'>
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">계측기별 사용요금</h6>
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
