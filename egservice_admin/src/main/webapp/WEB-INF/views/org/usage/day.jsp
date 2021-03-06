<%@page import="java.util.HashMap"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
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
	<title>시설별 사용량 분석 - 시간대별 분석</title>
	
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/org/common/js/orgSideBar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/org/usage/js/orgUsageDay.js"></script>
	
	<c:if test="${not empty sessionScope}">


<script>
/* datasets: [
	{
        label: '오늘 사용량',
        data: [1,2,3,0,0,1,2,3,4],
        borderWidth: 2,
        backgroundColor: 'rgba(255, 0, 0, 0.5)',
        fill : false
    }
	]
 */
 
 var _chartLabels = [];
 <c:forEach var="LIST_USAGE" items="${USAGE_SITE_DAY_LIST[0].list_usage}">
 	_chartLabels.push("${LIST_USAGE.unit + 1}" + "시");
 	
 </c:forEach>
 
var _usage_site_day_list = [];

<c:forEach var="USAGE_SITE_DAY_LIST" items="${USAGE_SITE_DAY_LIST}" varStatus="STATUS">
	var _siteObj = {};
	_siteObj.seq_site = "${USAGE_SITE_DAY_LIST.seq_site}";
	_siteObj.label = "${USAGE_SITE_DAY_LIST.site_name}";
	_siteObj.borderWidth = 2;
    _siteObj.backgroundColor = _chartColors[${STATUS.index}%10];
    _siteObj.borderColor = _chartColors[${STATUS.index}%10];
    _siteObj.fill = false;
	_siteObj.data = [];
	
	<c:forEach var="LIST_USAGE" items="${USAGE_SITE_DAY_LIST.list_usage}">
		
		<c:if test="${LIST_USAGE.round_usage eq null}">
			_siteObj.data.push(null);
		</c:if>
		
		<c:if test="${LIST_USAGE.round_usage ne null}">
			_siteObj.data.push("${LIST_USAGE.round_usage}");
		</c:if>
		
				
	</c:forEach>

	_usage_site_day_list.push(_siteObj);	
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
							<span class="mb-0 text-gray-800 page-heading-title">시간대별 분석</span> 
								
							&nbsp; &nbsp; &nbsp;
								
								
							<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 시설별 사용량 분석 > 시간대별 분석</span> 
														
							
						</div>
							
							
						<div class="page-heading-report-div" style="">
							<span class="page-heading-report-helper" style=""></span>
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
						</div>
						
					</div>		
					
									
					<!-- 검색, text -->
					<div class="row">
						<!-- 검색 -->
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div style="width:100%;display: inline-block;">									
										<form id="usageDaySearchForm" name="usageDaySearchForm" method="get" action="<c:url value='../org/usageDay'/>">
											<div style="width:100px;float:left;">
												<span style="display: inline-block;height: 21px;"></span>날짜 선택
											</div>
											
											<div style="width:200px;float:left;">
												<input class="custom-date custom-date-sm" id="dateTarget" name="dateTarget" type="text" style="width:95%;" value="${DATETARGET}">
											</div>
											
											<div style="width:15%;float:left;">
												<input type="button" id="usageDaySearchBtn" class="btn btn-outline-primary btn-sm" value="조회">	
											</div>
										</form>
									</div>
									
									
									<div class="width:100%;display: inline-block;">
											<span>
	                  							${DATETARGET}
	                  									
	                  									${WEATHERDAY.text_day_of_week}
	                  									
	                  									(${WEATHERDAY.text_is_holiday}) 
	                  									
	                  						</span>	&emsp;
	                  						<span> 
	                  							날씨 : 	<c:if test="${WEATHERDAY.weather_code < 0}"> - </c:if>
	                  									<c:if test="${WEATHERDAY.weather_code > 0}"> <img src="${pageContext.request.contextPath}/${WEATHERDAY.text_weather_code}" style="width:20px;"> </c:if>
	                  						</span>	&emsp;
	                  						<span> 
	                  							최고 기온 :		<c:if test="${WEATHERDAY.temp_max < 0}"> - </c:if>
	                  										<c:if test="${WEATHERDAY.temp_max > 0}"> ${WEATHERDAY.temp_max} ℃ </c:if>
	                  						</span> &emsp;
	                  						<span> 
	                  							최저 기온 :		<c:if test="${WEATHERDAY.temp_min < 0}"> - </c:if>
	                  										<c:if test="${WEATHERDAY.temp_min > 0}"> ${WEATHERDAY.temp_min} ℃ </c:if>
	                  						</span> &emsp;
	                  						<span> 
	                  							평균 기온 : 	<c:if test="${WEATHERDAY.temp_avg < 0}"> - </c:if>
	                  										<c:if test="${WEATHERDAY.temp_avg > 0}"> ${WEATHERDAY.temp_avg} ℃ </c:if>
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
										- 오늘의 사용량을 조회해서 <span style="text-decoration: underline;">각 시설의 데이터 수집이 현재 잘 되고 있는지</span> 확인 하세요! <br> 
										- 아파트 단지와 복지관의 전기 사용 패턴을 비교해 보세요! <br>
										- 겨울철과 여름철의 전기 사용 패턴을 비교해 보세요! <br> 
										- 근무일과 휴무일의 전기사용 패턴을 비교해 보세요! <br> 
										- 전기 사용 패턴 비교를 통해 <span style="text-decoration: underline;">전기 사용량 절약 아이디어</span>를 제안해 보세요!
									</div>
								</div>
							</div>
						</div>
						
									<div style="text-align: right;width: 100%;">
											단위 : kWh
									</div>
									<!-- table -->
									
									<c:forEach items="${USAGE_SITE_DAY_LIST}" var="USAGE_SITE_DAY_LIST">
										<table class="table-hover org-table-bordered org-table-style">
											<tr>
												<td colspan='24' class="org-table-title-usage" style=""> ${USAGE_SITE_DAY_LIST.site_name}  </td>
											</tr>
											
											<c:if test="${fn:length(USAGE_SITE_DAY_LIST.list_usage) eq 0 }">
											<tr>
												<td colspan="24"> 데이터가 없습니다 </td>
											
											</tr>
											</c:if>
											
											<tr>
											<%-- <c:set var="LIST_USAGE" value="${USAGE_SITE_DAY_LIST.list_usage}"/> --%>
											<c:forEach items="${USAGE_SITE_DAY_LIST.list_usage}" var="LIST_USAGE" varStatus="STATUS">
											
												<td style="width:calc(100%/24)">${LIST_USAGE.unit + 1} 시</td>
											
											</c:forEach>
											</tr>
											
											<tr>
											<c:forEach items="${USAGE_SITE_DAY_LIST.list_usage}" var="LIST_USAGE" varStatus="STATUS">
												<td style="width:calc(100%/24)">
												<c:if test="${LIST_USAGE.text_usage eq null}">
													-
												</c:if>
												
												<c:if test="${LIST_USAGE.text_usage ne null}">
													${LIST_USAGE.text_usage}
												</c:if>
												</td>
											</c:forEach>
											</tr>
										</table>
										
										<br>
									</c:forEach>
									
									<%-- <c:forEach items="${USAGE_SITE_DAY_LIST}" var="USAGE_SITE_DAY_LIST">
								
									
									<div>
										<table class="table-hover org-table-bordered org-table-style">
											<tr>
												<td colspan='12' class="org-table-title-usage" style=""> ${USAGE_SITE_DAY_LIST.site_name}  </td>
											</tr>
											
											<!-- 데이터가 없는경우 -->
											<c:if test="${fn:length(USAGE_SITE_DAY_LIST.list_usage) eq 0 }">
											<tr>
												<td colspan="12"> 데이터가 없습니다 </td>
											
											</tr>
											</c:if>
											
											<!-- 데이터가 있는 경우 -->
											
											
											
											<c:if test="${fn:length(USAGE_SITE_DAY_LIST.list_usage) ne 0 }">
											
												
											
											<tr>
											 <c:forEach items="${USAGE_SITE_DAY_LIST.list_usage}" var="LIST_USAGE" varStatus="STATUS">
											
												
												<c:if test="${STATUS.index == 0 || STATUS.index == 4 || STATUS.index == 8 || STATUS.index == 12 || STATUS.index == 16 || STATUS.index == 20}">
												
												<td style="width:calc(100%/12)">${LIST_USAGE.unit + 1} 시</td>
												
												<td style="width:calc(100%/12)">${LIST_USAGE.text_usage}</td>
												
												</c:if>
											
											</c:forEach>
											</tr>
											
											<tr>
											<c:forEach items="${USAGE_SITE_DAY_LIST.list_usage}" var="LIST_USAGE" varStatus="STATUS">
											
												<c:if test="${STATUS.index == 1 || STATUS.index == 5 || STATUS.index == 9 || STATUS.index == 13 || STATUS.index == 17 || STATUS.index == 21}">
												
												<td>${LIST_USAGE.unit + 1} 시</td>
												
												<td>${LIST_USAGE.text_usage}</td>
												
												</c:if>
											
											</c:forEach>
											</tr>
											
											<tr>
											<c:forEach items="${USAGE_SITE_DAY_LIST.list_usage}" var="LIST_USAGE" varStatus="STATUS">
											
												<c:if test="${STATUS.index == 2 || STATUS.index == 6 || STATUS.index == 10 || STATUS.index == 14 || STATUS.index == 18 || STATUS.index == 22}">
												
												<td>${LIST_USAGE.unit + 1} 시</td>
												
												<td>${LIST_USAGE.text_usage}</td>
												
												</c:if>
											
											</c:forEach>
											</tr>
											
											<tr>
											<c:forEach items="${USAGE_SITE_DAY_LIST.list_usage}" var="LIST_USAGE" varStatus="STATUS">
											
												<c:if test="${STATUS.index == 3 || STATUS.index == 7 || STATUS.index == 11 || STATUS.index == 15 || STATUS.index == 19 || STATUS.index == 23}">
												
												<td>${LIST_USAGE.unit + 1} 시</td>
												
												<td>${LIST_USAGE.text_usage}</td>
												
												</c:if>
											
											</c:forEach> 
											</tr>
											</c:if>
										</table>
									</div>
									<br>
									</c:forEach> --%>
									
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
