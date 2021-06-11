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
<title>Home</title>
	
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">
		
		<script src="${pageContext.request.contextPath}/resources/admin/org/common/js/orgSideBar.js"></script>
		<script src="${pageContext.request.contextPath}/resources/admin/org/main/js/orgMainHome.js"></script>
		
<script>
var _siteList = [];

<c:forEach items="${SITE_LIST}" var="SITE_LIST" varStatus="STATUS">
	var _tempSiteMap = {}
	_tempSiteMap.label = "${STATUS.count}";
	_tempSiteMap.site_type = "${SITE_LIST.site_type}";
	_tempSiteMap.seq_site = "${SITE_LIST.seq_site}";
	_tempSiteMap.site_name = "${SITE_LIST.site_name}";
	_tempSiteMap.site_x = "${SITE_LIST.site_x}";
	_tempSiteMap.site_y = "${SITE_LIST.site_y}";	
	
	_siteList.push(_tempSiteMap);
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
			<div id="content" >

				<!-- Topbar -->
				<jsp:include page="../../common/topbar.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content /.container-fluid-->
				<!-- <div class="container-fluid" style="width:85%;"> -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between">
						<div class="mb-4 page-heading-div">
						
							<div class="page-heading-title-div">
								<span class="mb-0 text-gray-800 page-heading-title">Home</span> 
									
								&nbsp &nbsp &nbsp
									
									
								<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i></span>	 
							</div>
							
							<div class="page-heading-report-div" style="">
								<span class="page-heading-report-helper" style=""></span>
								<input type="button" id="reportPreView" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
								<input type="button" id="reportPrintBtn" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
							</div>
						</div>			
					</div>
					
					
						
					<!-- 사용량, 30일 평균 사용량, 사용량 비교, CO2발생량 -->
					<div class="row">
						<!-- 오늘 사용량 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary mb-1">
												사용량 (kWh)
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
										</div>
										<div class="col-auto">
											<!-- <i class="fas fa-calendar fa-2x text-gray-300"></i> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 30일 평균 사용량 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary mb-1">
												30일 평균 사용량 (kWh)
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
										</div>
										<div class="col-auto">
											<!-- <i class="fas fa-calendar fa-2x text-gray-300"></i> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 사용량 비교 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary mb-1">
												사용량 비교(kWh)
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												$40,000
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- CO2 발생 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary mb-1">
												CO<sub>2</sub> 발생량 (kg)																
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					
					</div>
					<!-- 사용량, 30일 평균 사용량, 사용량 비교, CO2발생량 끝-->
						
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
											<div style="width:50%;float:left"> 
												- 오늘 사용량은 0시부터 현재 시간까지의 사용량 입니다. 
											</div>
											<div style="width:50%;float:right; text-align: right;">  
												<span> 2020-06-11 18:32:45 </span> 
												<span> <i class="fas fa-redo"></i> </span>
											</div>
										</div>
										
										<div>
											- 오늘 사용량은 15분마다 수집되어 변경 됩니다.
										</div>
										
										<div>
											- 30일 평균 사용량은 어제까지의 30일 사용량의 평균입니다. (근무일과 휴무일 구분)
										</div>
										
										<div>
											- 사용량 비교는 오늘 사용량과 30일 평균 사용량의 비교이며 오늘이 근무일이면 근무일 평균과 비교합니다.
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 내용 끝 -->
					
					<!-- 시설 목록,  시설 위치 -->
					<div class="row">
						<!-- 그래프, 테이블 -->
						<div class="col-lg-6">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="/*height:52px;*/">
									<h6 class="m-0 font-weight-bold text-primary">
										시설 목록
									</h6>
									
									
									<!-- <a class="btn-primary btn-sm" href="javascript:void(0);" tabindex="0" data-trigger="focus" title="" data-container="body" data-toggle="popover" data-placement="top" data-content="* 시설명을 클릭하면 해당시설 관리 페이지가 POP UP 됩니다.">
										<i class="fas fa-question"></i>
									</a> -->
								</div>
							
								<div class="card-body" style="width:100%; height:540px; overflow: auto;">
									<table class="table-hover org-table-bordered org-table-style" width="100%" cellspacing="0" role="grid" aria-describedby="" style="width: 100%;" id="siteListTable">
										<tr>
											<td> 번호 </td>
											<td> 시설명 </td>
											<td> 오늘 사용량 </td>
											<td> 30일 평균 </td>
											<td> 사용량 비교 </td>
											<td> CO2 발생량 </td>
										</tr>
										<c:forEach var="SITE_LIST" items="${SITE_LIST}" varStatus="STATUS">
										<tr class="siteTrEvt">
											
											<input type="hidden" name="seq_site" value="${SITE_LIST.seq_site}">
											<input type="hidden" name="site_type" value="${SITE_LIST.site_type}">
											
											<td> <!-- site_type : 1 아파트 / 2 건물 -->
												<c:if test="${SITE_LIST.site_type eq '1'}">
													<div style="background-image: url(../resources/images/red.png);background-repeat: no-repeat;background-size: contain; background-position: center">
														${STATUS.count}	 
													</div>		 
												</c:if> 
												
												<c:if test="${SITE_LIST.site_type eq '2'}">
													<div style="background-image: url(../resources/images/yellow.png);background-repeat: no-repeat;background-size: contain; background-position: center">
														${STATUS.count}	
													</div>
												</c:if>
											</td>
											<td>${SITE_LIST.site_name}</td>
											<td>${SITE_LIST.site_kwh_from_day}</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
										</tr>	
										</c:forEach>
										
									</table>	
									
									<hr />
									* 시설명을 클릭하면 해당 시설 관리페이지가 POP-UP 됩니다.
								</div>
							</div>
				
						</div>
				
						<!-- map -->
						<div class="col-lg-6">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										시설 위치
									</h6>
								</div>
								
								<div class="card-body">
									
									<div id="siteListMapLayout" style="width: 100%;height: 500px;display: table;">
										<div id="siteListMap" style="display: table-cell;"></div>
									</div>
									
								</div>
							</div>
						</div>
					
						
					</div>
					<!-- 시설 목록,  시설 위치 끝 -->
					
					
					<!-- 30일 평균 사용량  -->
					<div class="row"> 
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-body">
																		
									<div class="row">
										<!-- table 1 -->
										<div class="col-lg-4">
											<table class="table-hover org-table-bordered org-table-style" width="100%" cellspacing="0" role="grid" aria-describedby="" style="width: 100%;">
												<tr>
													<td rowspan='2' width="15%">시간</td>
													<td rowspan='2' width="25%">사용량</td>
													<td colspan='2' width="60%">30일 평균 사용량</td>
												</tr>
												<tr>
													<td>근무일</td>
													<td>휴무일</td>
												</tr>
												<!-- 반복 -->
												<tr>
													<td>09:00</td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</table>	
										</div>
										<!-- table 1 end -->
										
										<!-- table 2 -->
										<div class="col-lg-4">
											<table class="table-hover org-table-bordered org-table-style" width="100%" cellspacing="0" role="grid" aria-describedby="" style="width: 100%;">
												<tr>
													<td rowspan='2' width="15%">시간</td>
													<td rowspan='2' width="25%">사용량</td>
													<td colspan='2' width="60%">30일 평균 사용량</td>
												</tr>
												<tr>
													<td>근무일</td>
													<td>휴무일</td>
												</tr>
											</table>	
										</div>
										<!-- table 2 end -->
										
										<!-- table 3 -->
										<div class="col-lg-4">
											<table class="table-hover org-table-bordered org-table-style" width="100%" cellspacing="0" role="grid" aria-describedby="" style="width: 100%;">
												<tr>
													<td rowspan='2' width="15%">시간</td>
													<td rowspan='2' width="25%">사용량</td>
													<td colspan='2' width="60%">30일 평균 사용량</td>
												</tr>
												<tr>
													<td>근무일</td>
													<td>휴무일</td>
												</tr>
												
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
													<td>4</td>
												</tr>
											</table>	
										</div>
										<!-- table 3 end -->
									</div>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 30일 평균 사용량 끝 -->
										
				
					
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
	
	
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7X1qdWEkxShDHppcouSnLq9IpjoMpiG8&callback=initMap">
	</script>  
	
	</c:if>
</body>

</html>
