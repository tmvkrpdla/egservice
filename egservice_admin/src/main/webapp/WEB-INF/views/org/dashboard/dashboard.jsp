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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>DASHBOARD</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<style>
/* .map-card-body{
	width: 100%;
    height: 750px;
    background: white;
    padding: 5px;
}

.dashboard-map {
	height: 100%;
    width: 100%;
    padding: 1px;
    border-radius: 15px;
}

.dashboard-table {
	width: 98%;
	height: 98%;
	margin: auto;
	font-size: 15px;
}

.dashboard-table tr{
	border : 1px solid gainsboro
}

.dashboard-table td{
	border : 1px solid gainsboro	
}

.dashboard-table-title {
	text-align: center;
    font-size: 15px;
    font-weight: 600;
	
}

.dashboard-evt-tr:hover {
	cursor: pointer;
}

.site-type-2 {
	background: pink;
}

.site-type-1 {
	background: cornsilk;
}

.dashboard-td-num{
	text-align: center;
}

.dashboard-td-right{
	text-align: right;
    padding-right: 15px;
}

.dashboard-td-siteName{
	padding-left: 15px;
}

 */

	</style>
	
<script>

</script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/org/dashboard/js/orgDashboard.js"></script>
		 
</head>

<body id="page-top" oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<c:if test="${empty sessionScope.ADMIN}">
		<jsp:include page="../../common/emptySession.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${not empty sessionScope.ADMIN}">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="./dashboardTopbar.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<!-- <div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">
							Home
						</h1>
					</div> -->


					<!-- ?????????, 30??? ?????? ?????????, ????????? ??????, CO2????????? -->
					<div class="row">
						<!-- ?????? ????????? -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2 font-size-17">
											<div class="font-weight-bold text-primary mb-1">
												????????? (kWh)
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
						
						<!-- 30??? ?????? ????????? -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow">
								<div class="card-body">
								
									<div class="row no-gutters align-items-center">
										<div class="col mr-2 font-size-17">
											<div class="font-weight-bold text-primary mb-1">
												30??? ?????? ????????? (kWh)
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
						
						<!-- ????????? ?????? -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow">
								<div class="card-body">
								
									<div class="row no-gutters align-items-center">
										<div class="col mr-2 font-size-17">
											<div class="font-weight-bold text-primary mb-1">
												????????? ??????(kWh)
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
						<!-- CO2 ?????? -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow">
								<div class="card-body">
								
									<div class="row no-gutters align-items-center">
										<div class="col mr-2 font-size-17">
											<div class="font-weight-bold text-primary mb-1">
												CO<sub>2</sub> ????????? (kg)																
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
					<!-- ?????????, 30??? ?????? ?????????, ????????? ??????, CO2????????? ???-->
						

					
						<!-- chart -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									<!-- ?????? -->
									<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
									<!-- IE ?????? ?????? -->	
									<div style="height:500px; width:100%;display: inline-block;">
										<canvas id="myChart" style="height:500px; width:100%;display: unset;"></canvas>
									</div>
									</c:if>
									
																		
									<c:if test="${sessionScope.BROWSER eq 'MSIE' }">	
									<!-- IE ??? ?????? -->
									<div style="height:400px;">
    									<canvas id="myChart" style=""></canvas>
									</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<!-- chart ??? -->
										<!-- ?????? -->
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
												- ?????? ???????????? 0????????? ?????? ??????????????? ????????? ?????????. 
											</div>
											<div style="width:50%;float:right; text-align: right;">  
												<span id="get_api_time"></span> 
												<span id="refreshBtn" style="cursor: pointer;"> <i class="fas fa-redo"></i> </span>
											</div>
										</div>
										
										<div>
											- ???????????? 15????????? ???????????????.
										</div>
										
										<div>
											- 30??? ?????? ???????????? ??????????????? 30??? ???????????? ???????????????. (???????????? ????????? ??????)
										</div>
										
										<div>
											- ????????? ????????? ?????? ???????????? 30??? ?????? ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????????.
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ?????? ??? -->
										
					<!-- ?????? ??????,  ?????? ?????? -->
					<div class="row">
						<!-- ?????????, ????????? -->
						<div class="col-lg-6">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="/*height:52px;*/">
									<h6 class="m-0 font-weight-bold text-primary">
										?????? ??????
									</h6>
									
									
									<!-- <a class="btn-primary btn-sm" href="javascript:void(0);" tabindex="0" data-trigger="focus" title="" data-container="body" data-toggle="popover" data-placement="top" data-content="* ???????????? ???????????? ???????????? ?????? ???????????? POP UP ?????????.">
										<i class="fas fa-question"></i>
									</a> -->
								</div>
							
								<div class="card-body" style="width:100%; height:540px;">
									<div style="overflow: auto;width: 100%; height: 450px;">
										<table class="table-hover org-table-bordered org-table-style" width="100%" cellspacing="0" role="grid" aria-describedby="" style="width: 100%;" id="listSiteTable">
											
											<tr class="" style="height:52px; font-weight: bold;" >
												<td class="orgTdTopAttach">??????</td>
												<td class="orgTdTopAttach">?????????</td>
												<td class="orgTdTopAttach">?????? ?????????</td>
												<td class="orgTdTopAttach">30??? ??????</td>
												<td class="orgTdTopAttach">????????? ??????</td>
												<td class="orgTdTopAttach">CO2 ?????????</td>
											</tr>
											
										</table>	
									</div>
									
									<hr />
									* ???????????? ???????????? ?????? ?????? ?????????????????? POP-UP ?????????.
								</div>
							</div>
				
						</div>
				
						<!-- map -->
						<div class="col-lg-6">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										?????? ??????
									</h6>
								</div>
								
								<div class="card-body">
									<div id="siteListMapLayout" style="width: 100%; height: 500px; display: table;">
										<div id="siteListMap" style="width: 100%; height: 500px; overflow: hidden; display: block; position: relative;"></div>
									</div>
									
								</div>
							</div>
						</div>
					
						
					</div>
					<!-- ?????? ??????,  ?????? ?????? ??? -->
					

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->

	<%-- 		<jsp:include page="../../common/footer.jsp"></jsp:include> --%>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<!-- Logout Modal-->
	<%-- util.jsp : logout/scroll top.. --%>
	<%-- <jsp:include page="../../common/logout.jsp"></jsp:include> --%>
	
	<script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7X1qdWEkxShDHppcouSnLq9IpjoMpiG8&callback=init">
	</script>  
	
	</c:if>
</body>

</html>
