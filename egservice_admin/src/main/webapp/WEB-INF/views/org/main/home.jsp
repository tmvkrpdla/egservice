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
		<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
		

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
									
								&nbsp; &nbsp; &nbsp;
									
									
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
							<div class="card border-left-primary shadow">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2 font-size-17">
											<div class="font-weight-bold text-primary mb-1">
												사용량 (kWh)
											</div>
											<div class="mb-0 font-weight-bold text-gray-800" id="sum"></div>
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
							<div class="card border-left-primary shadow">
								<div class="card-body">
								
									<div class="row no-gutters align-items-center">
										<div class="col mr-2 font-size-17">
											<div class="font-weight-bold text-primary mb-1">
												30일 평균 사용량 (kWh)
											</div>
											<div class="mb-0 font-weight-bold text-gray-800" id="sum_avg"></div>
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
							<div class="card border-left-primary shadow">
								<div class="card-body">
								
									<div class="row no-gutters align-items-center">
										<div class="col mr-2 font-size-17">
											<div class="font-weight-bold text-primary mb-1">
												사용량 증감(kWh)
											</div>
											<div class="mb-0 font-weight-bold text-gray-800" id="">
												<span id="delta_sum_img"></span>
												<span id="delta_sum"></span>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<!-- CO2 발생 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow">
								<div class="card-body">
								
									<div class="row no-gutters align-items-center">
										<div class="col mr-2 font-size-17">
											<div class="font-weight-bold text-primary mb-1">
												CO<sub>2</sub> 발생량 (kg)																
											</div>
											<div class="mb-0 font-weight-bold text-gray-800" id="">
												<span id="delta_carbon_img"></span>
												<span id="delta_carbon"></span>
											</div>
										</div>
										<!-- <div class="col-auto">
											<div id="delta_carbon_img"></div>
										</div> -->
									</div>
									
								</div>
							</div>
						</div>
					
					</div>
					<!-- 사용량, 30일 평균 사용량, 사용량 비교, CO2발생량 끝-->
						

					
					<!-- chart -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-body">
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
								</div>
							</div>
						</div>
					</div>
					<!-- chart 끝 -->
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
												<span id="get_api_time"></span> 
												<span id="refreshBtn" style="cursor: pointer;"> <i class="fas fa-redo"></i> </span>
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
									
								</div>

								<div class="card-body" style="width:100%; height:540px; ">
									
									<!-- <div style="width: 100%;" >
										<div style="">
												
											<div style="float:right">
												<img alt="" src="../resources/images/red.png" style="width:22px;float:right">
												<div style="padding-top: 1px; float:right"> 아파트 </div>
											</div>
											<div>
												<img alt="" src="../resources/images/yellow.png" style="width:22px;float:right;">
												<div style="padding-top: 1px; float:right"> 건물 </div>
											</div>
											
											 
										</div>
										
									</div>
									
									<br> -->
									<div style="overflow: auto;width: 100%; height: 450px;">
										<table class="table-hover org-table-bordered org-table-style" width="100%" cellspacing="0" role="grid" aria-describedby="" style="width: 100%;" id="listSiteTable">
											
											<tr class="" style="height:52px; font-weight: bold;" >
												<td class="orgTdTopAttach">번호</td>
												<td class="orgTdTopAttach">시설명</td>
												<td class="orgTdTopAttach">오늘 사용량</td>
												<td class="orgTdTopAttach">30일 평균</td>
												<td class="orgTdTopAttach">사용량 비교</td>
												<td class="orgTdTopAttach">CO2 발생량</td>
											</tr>
											
										</table>	
									</div>
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
								
									<!-- <div id="siteListMapLayout" style="width: 100%;height: 500px;display: table;">
										<div id="siteListMap" style="display: table-cell;"></div>
									</div> -->
									
									<div id="siteListMapLayout" style="width: 100%; height: 500px; display: table;">
										<div id="siteListMap" style="width: 100%; height: 500px; overflow: hidden; display: block; position: relative;"></div>
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
										<div class="col-lg-6">
											<table class="table-hover org-table-bordered org-table-style" width="100%" cellspacing="0" role="grid" aria-describedby="" style="width: 100%;" id="list_usage_table1">
												<tr class="org-table-title">
													<td rowspan='2' width="10%">시간</td>
													<td rowspan='2' width="20%">사용량 <br>(kWh)</td>
													<td colspan='2' width="30%">30일 평균 사용량</td>
													<td rowspan='2' width="20%">사용량 증감</td>
													<td rowspan='2' width="20%">CO<sub>2</sub> 발생 <br> (kg)	</td>
												</tr>
												<tr class="org-table-title">
													<td>근무일</td>
													<td>휴무일</td>
												</tr>
											</table>		
										</div>
										<!-- table 1 end -->
										
										<!-- table 2 -->
										<div class="col-lg-6">
											<table class="table-hover org-table-bordered org-table-style" width="100%" cellspacing="0" role="grid" aria-describedby="" style="width: 100%;" id="list_usage_table2">
												<tr class="org-table-title">
													<td rowspan='2' width="10%">시간</td>
													<td rowspan='2' width="20%">사용량<br>(kWh)</td>
													<td colspan='2' width="30%">30일 평균 사용량</td>
													<td rowspan='2' width="20%">사용량 증감</td>
													<td rowspan='2' width="20%">CO<sub>2</sub> 발생 <br> (kg)</td>
												</tr>
												<tr class="org-table-title">
													<td>근무일</td>
													<td>휴무일</td>
												</tr>
											</table>		
										</div>
										<!-- table 2 end -->
										
										
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
	
	
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7X1qdWEkxShDHppcouSnLq9IpjoMpiG8&callback=init">
	</script>
	
	</c:if>
</body>

</html>
