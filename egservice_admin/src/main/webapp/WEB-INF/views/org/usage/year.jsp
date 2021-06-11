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
	<title>시설별 사용량 분석 - 월별 분석</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>


	<c:if test="${not empty sessionScope}">
	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/org/common/js/orgSideBar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/org/usage/js/orgUsageYear.js"></script>
	
<script type="text/javascript">


var _chartLabels = [];

<c:set value="${USAGE_SITE_YEAR_LIST[0].list_usage}" var="LIST_LABEL" />
	
<c:forEach items="${LIST_LABEL}" var="LIST_LABEL" varStatus="STATUS">
	
	_chartLabels.push("${LIST_LABEL.unit}" + "월");
	
</c:forEach>

	


var _usage_site_year_list = [];

<c:forEach var="USAGE_SITE_YEAR_LIST" items="${USAGE_SITE_YEAR_LIST}" varStatus="STATUS">
	var _siteObj = {};
	_siteObj.seq_site = "${USAGE_SITE_YEAR_LIST.seq_site}";
	_siteObj.label = "${USAGE_SITE_YEAR_LIST.site_name}";
	_siteObj.borderWidth = 2;
	_siteObj.backgroundColor = _chartColors[${STATUS.index}%10];
    _siteObj.borderColor = _chartColors[${STATUS.index}%10];
	_siteObj.fill = false;
	_siteObj.data = [];

	<c:forEach var="LIST_USAGE" items="${USAGE_SITE_YEAR_LIST.list_usage}">
		
	<c:if test="${LIST_USAGE.round_usage eq null}">
		_siteObj.data.push(null);
	</c:if>

	<c:if test="${LIST_USAGE.round_usage ne null}">
		_siteObj.data.push("${LIST_USAGE.round_usage}");
	</c:if>
		
	</c:forEach>

_usage_site_year_list.push(_siteObj);	
</c:forEach>

</script>
			
	</c:if>	

	

	
</head>

<body id="page-top" oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

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
							<span class="mb-0 text-gray-800 page-heading-title">월별 분석</span> 
								
							&nbsp &nbsp &nbsp
								
								
							<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 시설별 사용량 분석 > 월별 분석</span> 
						</div>
							
							
							
						<div class="page-heading-report-div" style="">
							<span class="page-heading-report-helper" style=""></span>
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
						</div>
						
					</div>		
					
				
					<!-- 검색, text  -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									
								<form id="usageSiteYearSearchForm" name="usageSiteYearSearchForm" method="get" action="<c:url value='../org/usageYear'/>">
									<div style="width:100px;float:left;">
										<span style="display: inline-block;height: 21px;"></span>연도 선택
									</div>
									
									<div style="width:200px;float:left;">
										<input class="custom-date custom-date-sm" id="dateTarget" name="dateTarget" type="text" style="width:95%;" value="${DATETARGET}">
									</div>		
																		
									<div style="width:15%;float:left;">
										<input type="button" id="usageSiteYearSearchBtn" class="btn btn-outline-primary btn-sm" value="조회">	
									</div>
								</form>
									
								</div>
							</div>
						</div>
										
						
					</div>
					<!-- 검색, text  끝-->	
					
					<!-- 차트, 테이블 -->
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
										- 아파트 단지 사이 / 복지관 사이 차이점을 찾아보세요! <br>
										- <span style="text-decoration: underline;">여름철 전기 사용량이 급증</span>하는 아파트 단지나 복지관에 유의하세요! <br>
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
											<c:set value="${USAGE_SITE_YEAR_LIST[0].list_usage}" var="month" />
											<tr class="org-table-title-usage">
												<td></td>
											<c:forEach items="${month}" var="MONTH" varStatus="STATUS">
												
												<td width="7%">${MONTH.unit} 월</td>
											</c:forEach>
											</tr>
											
											<c:forEach items="${USAGE_SITE_YEAR_LIST}" var="USAGE_SITE_YEAR_LIST">
											<tr>
												<td>${USAGE_SITE_YEAR_LIST.site_name }</td>
												
												
												
												<c:forEach items="${USAGE_SITE_YEAR_LIST.list_usage}" var="LIST_USAGE">
												
												<td><c:if test="${LIST_USAGE.text_usage eq null}">
														-
													</c:if>
													
													<c:if test="${LIST_USAGE.text_usage ne null}">
														${LIST_USAGE.text_usage}
													</c:if>
												</td>
												
												</c:forEach>	
												
												<!-- 빈공간 채우기 -->
												<c:if test="${fn:length(USAGE_SITE_YEAR_LIST.list_usage) ne 12}">
												
													<c:forEach begin="${fn:length(USAGE_SITE_YEAR_LIST.list_usage)}" end="12" step="1">
														<td></td>
													</c:forEach>
												
												</c:if>
												
												
											</tr>
											</c:forEach>
										</table>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 차트, 테이블 끝 -->
					
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

</body>

</html>
