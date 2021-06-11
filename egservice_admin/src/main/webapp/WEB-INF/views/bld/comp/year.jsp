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

<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/favicon-16x16_3.png"> <!-- 파비콘 -->
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">

	<title>계측기간 사용량 비교 - 월별 비교</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>

<c:if test="${not empty sessionScope}">
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/bld/comp/js/bldCompYear.js"></script>
		

<script type="text/javascript">
<c:set value="${USAGE_METER_YEAR_LIST[0].list_usage}" var="LABEL_LIST" />

	var _chartLabels = [];
	<c:forEach items="${LABEL_LIST}" var="LABEL_LIST">
		
		_chartLabels.push("${LABEL_LIST.unit}" + "월");
	</c:forEach>

	var _chartData = [];
			
	<c:forEach items="${USAGE_METER_YEAR_LIST}" var="USAGE_METER_YEAR_LIST" varStatus="STATUS"> 
	var _dataObj = {};
		
		_dataObj.label = "${USAGE_METER_YEAR_LIST.descr}";
		_dataObj.borderWidth = 2;
		_dataObj.backgroundColor = _chartColors[${STATUS.index}%10];
		_dataObj.borderColor = _chartColors[${STATUS.index}%10];
		_dataObj.fill = false;
		_dataObj.data = [];	
			
		<c:forEach var="LIST_USAGE" items="${USAGE_METER_YEAR_LIST.list_usage}">

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
									<span class="mb-0 text-gray-800 page-heading-title">월별 비교</span> 
									
									&nbsp; &nbsp; &nbsp;
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 계측기간 사용량 비교 > 월별 비교</span>
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
									
								<form id="searchForm" name="searchForm" method="get" action="<c:url value='../bld/compYear'/>">
									<div style="width:100px;float:left;">
										<span style="display: inline-block;height: 21px;"></span>연도 선택
									</div>
									
									<div style="width:200px;float:left;">
										<input class="custom-date custom-date-sm" id="dateTarget" name="dateTarget" type="text" style="width:95%;" value="${DATETARGET}">
									</div>		
																		
									<div style="width:15%;float:left;">
										<input type="button" id="searchBtn" class="btn btn-outline-primary btn-sm" value="조회">	
									</div>
								</form>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 검색 끝 -->
					

					<!-- 계측기 테이블  -->
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
											- 계절 변화에 따른 계측기 사용량 변화 패턴을 살펴 보세요.
										</div>
										
										<div>
											- 복지관 연간 프로그램이 전기 사용량에 미치는 영향을 살펴 보세요.
										</div>
										
										<div>
											- 여름철 변압기 과부하에 주의해야할 계측기를 찾아 보세요.
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 내용 끝 -->									
									<div style="text-align: right;width: 100%;">
											단위 : kWh
									</div>
									
                            		<!-- table -->
                            		
                            		<div>
										<table class="table-hover org-table-bordered org-table-style">
											<c:set value="${USAGE_METER_YEAR_LIST[0].list_usage}" var="month" />
											<tr class="org-table-title-usage">
												<td></td>
											<c:forEach items="${month}" var="MONTH" varStatus="STATUS">
												
												<td width="7%">${MONTH.unit} 월</td>
											</c:forEach>
											</tr>
											
											<c:forEach items="${USAGE_METER_YEAR_LIST}" var="USAGE_METER_YEAR_LIST">
											<tr>
												<td>${USAGE_METER_YEAR_LIST.descr}</td>
												
												
												<c:forEach items="${USAGE_METER_YEAR_LIST.list_usage}" var="LIST_USAGE">
												
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
					<!-- 계측기 테이블 끝 -->

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
