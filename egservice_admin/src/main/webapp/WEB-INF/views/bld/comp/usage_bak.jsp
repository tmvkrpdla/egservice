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
	<title>계측기별 사용량</title>


	<jsp:include page="../../common/common.jsp"></jsp:include>

	<c:if test="${not empty sessionScope}">
	<script src="../resources/vendor/chart.js/js/Chart.js"></script>
	
	<script src="../resources/admin/bld/js/bldUsage.js"></script>
	
	</c:if>

<style type="text/css">
/*
 .div {
	border: 1px solid red;
} 

.printPage {
	border: 1px solid red;
} 

* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.printPage {
	width: 21cm;
	margin: auto;

	padding-top: 30px;
	padding-bottom: 30px;
	
	padding-left: 25px;
	padding-right: 25px;
	border: 1px solid black;
}

@page {
	size: A4;
	margin: 0;
}

@media print {
	html, body {
		width: 210mm;
	
	}
	.printPage {
		padding-left: 25px;
		padding-right: 25px;;
		padding-top:20px;
		padding-bottom : 20px;
		border: initial;
		width: initial;
		min-height: initial;
		box-shadow: initial;
		background: initial;
	} 
}


.printHeaderDiv {
	width: 100%;
	height: 70px;
	
}

.headerImgGcGu {
	width: 10%;
	height: 100%;
	float: left;
	text-align: center;
}

.imgGcGu {
	width: 90%;
	height: 100%;
	margin: 0px auto;
}

.headerBldName {
	width: 80%;
	height: 100%;
	float: left;
}

.headerImgEgservice {
	width: 10%;
	height: 100%;
	float: left;
	text-align: center;
}

.imgEgservice {
	width: 90%;
	height: 100%;
	margin: 0px auto;
}

.headerBldTitle {
	width: 100%;
	height: 60%;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	padding-top: 5px;
}

.headerBldCurr {
	width: 100%;
	height: 40%;
	text-align: center;
	font-size: 13px;
	padding-top: 2px;
}


.printContentBldInfo {
	width: 100%;
	height: 150px;
}

.printBldInfo {
	width: 33.33%;
	float: left;
	height: 100%;
	padding: 5px;
}

.printBldInfoTable {
	width: 100%;
	height: 100%;
	text-align: center;
	border-collapse: collapse;
	border: 1px solid black;
}

.printBldInfoTable tr {
	border: 1px solid black;
	text-align: center;
}

.printBldInfoTable td {
	border: 1px solid black;
}

.printBldInfoTitle {
	font-weight: bold;
	text-align: center;
	font-size: 14px;
}

.printBldInfoSiteName {
	font-size: 13px;
	text-align: center;
}

.printBldInfoScale {
	font-size: 13px;
	text-align: center;
}

.printBldUsage {
	width: 33.33%;
	float: left;
	height: 100%;
	padding: 5px;
}

.printBldUsageTable {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	border: 1px solid black;
}

.printBldUsageTable tr {
	border: 1px solid black;
}

.printBldUsageTable td {
	border: 1px solid black;
}

.printBldUsageTitle {
	font-weight: bold;
	text-align: center;
	font-size: 14px;
}

.printBldUsageTd1 {
	font-size: 12px;
	width: 50%;
	text-align: center;
}

.printBldUsageTd2 {
	font-size: 12px;
	width: 50%;
	padding-right: 7px;
	text-align: right;
}

.printBldEffect {
	width: 33.33%;
	float: left;
	height: 100%;
	padding: 5px;
}

.printBldEnergyTable {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	border: 1px solid black;
}

.printBldEnergyTable tr {
	border: 1px solid black;
}

.printBldEnergyTable td {
	border: 1px solid black;
}

.printBldEnergyTitle {
	font-weight: bold;
	text-align: center;
	font-size: 14px;
}

.printBldEnergyTd1 {
	font-size: 12px;
	width: 50%;
	text-align: center;
}

.printBldEnergyTd2 {
	font-size: 12px;
	width: 50%;
	padding-right: 7px;
	text-align: right;
}


.printContentUsage {
	width: 100%;
	
}

.printContentUsageTitle {
	width: 100%;
	height: 25px;
	padding-top: 5px;
	font-size: 15px;
	font-weight: bold;
}

.printContentChart {
	width: 100%;
	height: 330px;
}

.printChart {
	width: 100%;
	height: 100%;
}

.printContentTableOuter {
	width: 100%;
	
}

.printContentTable {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	border: 1px solid black;
	font-size : 10px;
}

.printContentTable tr {
	border: 1px solid black;
}

.printContentTable td {
	border: 1px solid black;
	height: 35px;
	text-align: center;
}

.printContentTableFirstTr {
	
    font-weight: bold;
}
*/
</style>
		


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
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">계측기별 사용량</h1>
					</div>

					<!-- contents -->
					<div class="row">	
						<div class="col-lg-12 ">
							<div class="card shadow">
								<div class="card-header shadow">
									
										<ul class="nav nav-pills card-header-pills" id="cardPill" role="tablist">
											<li class="nav-item">
												<a class="nav-link" id="usage-dd" href="<c:url value='../bld/usage?usageType=dd'/>" >일간 사용량</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" id="usage-mm" href="<c:url value='../bld/usage?usageType=mm'/>">월간 사용량</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" id="usage-yy" href="<c:url value='../bld/usage?usageType=yy'/>">연간 사용량</a>
												<!-- <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
											</li>
										</ul>
								</div>
							</div>
						</div>
						<!-- col- end -->	
					</div>
					<!-- row end -->
					
					<div class="row">
						<div class="col-lg-6">
							<div class="card shadow mb-4">
								<!-- Card Body -->
								<div class="card-body">
									<div class="row">
										<div class='col-lg-12'>
										<form id="usageSearchForm" name="usageSearchForm" method="post" action="../bld/usage">
											<div class="bldUsageSearchDiv">
												
												<span style="display: inline-block; padding-right: 10px; padding: 0.25rem 0.5rem; vertical-align: middle;">
												 	조회 일자 :
												 </span> 
													
												<span style="display: inline-block;padding-right: 10px;">
													<input class="bldUsageDate" id="usageDate" name="usageDate" type="text"  value="${usageDate}">
												</span>				 
												
												<span style="display: inline-block;">
													<input type="button" id="usageSearchBtn" class="btn btn-outline-primary btn-sm" value="조회">
												</span>	
														
											</div>
												
											<!-- <div class="usageSearchBtnDiv">
												<input type="button" id="usageSearchBtn" class="btn btn-outline-primary btn-sm" value="조회">	 
											</div>	
											 -->
											<input type="hidden" id="usageType" name="usageType" value="${usageType}" readonly>
												
										</form>
										
										</div>
										
									</div>
									<hr />	
								
									<!-- <table class="table table-bordered table-hover dataTable ntcListTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
									
										<tr class="">
											<td>적용</td>
											<td>MID</td>
											<td>일간사용량</td>
											<td>전년 동일대비</td>
											<td>이번달 사용량</td>
											<td>금년 사용량</td>
											<td>정시 사용량</td>
										</tr>
											
									
									</table>  -->
									
									<div id="usageTableDiv">
									
									</div>
									
									<hr>
										
								</div>
								
							</div>
						</div>
						<!-- col-lg end -->
						
						<!-- chart -->
						<div class="col-lg-6">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="">
										<canvas id="cvsChart"></canvas>
		            		 		</div>
		            		 		
		            		 		<hr>
		            		 		
		            		 		<div class="bldUsageChartBotBtn">
		            		 			<input type='button' id='printViewBtn' name='printViewBtn' value='미리보기' class='btn btn-outline-primary btn-sm'>
		            		 			<input type='button' id='printBtn' name='printBtn' value='인쇄' class='btn btn-outline-primary btn-sm'>
		            		 		</div>
								</div>
								<!-- card-body end -->
							</div>
						</div>
						<!-- end of chart -->
						
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

	<!-- Scroll to Top Button-->
	<!-- Logout Modal-->
	<%-- util.jsp : logout/scroll top.. --%>
	<jsp:include page="../../common/logout.jsp"></jsp:include>
	

<div id='printPageOuter' style='display:none'>  
<!-- <div id='printPageOuter'> -->    
	<div class='printPage' id='printPage'>
		<div class='printHeaderDiv'>
			<div class='headerImgGcGu'>
				<img src='../resources/images/gcgu.png' class='imgGcGu'>
			</div>
			<div class='headerBldName'>
				<div class='headerBldTitle' id='headerBldTitle'>
					
				</div>
				<div class='headerBldCurr' id='headerBldCurr'>
					
				</div>
			</div>
			<div class='headerImgEgservice'>
				<img src='../resources/images/egservice.png' class='imgEgservice'>
			</div>
		</div>
		
		<div class='printContentBldInfo'>
			<div class='printBldInfo'>
				<table class='printBldInfoTable'>
					<tr>
						<td class='printBldInfoTitle' id='printBldInfoTitle'>건물 명 및 현황
						
						</td>
					</tr>
					<tr>
						<td class='printBldInfoSiteName' id='printBldInfoSiteName'>
							
						</td>
					</tr>
					<tr>
						<td class='printBldInfoScale' id='printBldInfoScale'>
							
						</td>
					</tr>
				</table>
			</div>
			
			<div class='printBldUsage'>
				<table class='printBldUsageTable'>
					<tr>
						<td colspan=2 class='printBldUsageTitle'> 총 전기사용량 (kWh)</td>
					</tr>
					<tr>
						<td class='printBldUsageTd1'>당월 총 사용량</td>
						<td class='printMonthUsageCurrent printBldUsageTd2' id='printMonthUsageCurrent'></td>
					</tr>
					<tr>
						<td class='printBldUsageTd1'>전년 동일 대비</td>
						<td class='printMonthFlucture printBldUsageTd2' id='printMonthFlucture'></td>
					</tr>
					<tr>
						<td class='printBldUsageTd1'>금년 누적 사용량</td>
						<td class='printYearUsageCurrent printBldUsageTd2' id='printYearUsageCurrent'></td>
					</tr>
					<tr>
						<td class='printBldUsageTd1'>전년 동기 대비</td>
						<td class='printYearFlucture printBldUsageTd2' id='printYearFlucture'></td>
					</tr>
				</table>
			</div>
			
			<div class='printBldEffect'>
				<table class='printBldEnergyTable'>
					<tr>
						<td colspan="2" class='printBldEnergyTitle'>에너지 절감 효과</td>
					</tr>
					<tr>
						<td class='printBldEnergyTd1'>전기사용량 절감량</td>
						<td class='printEnergyDecrease printBldEnergyTd2' id='printEnergyDecrease'></td>
					</tr>
					<tr>
						<td class='printBldEnergyTd1'>온실가스 감축량</td>
						<td class='printGasDecrease printBldEnergyTd2' id='printGasDecrease'></td>
					</tr>
					<tr>
						<td class='printBldEnergyTd1'>전년 동월 대비</td>
						<td class='printEnergyFlucture printBldEnergyTd2' id='printEnergyFlucture'></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class='printContentUsage'>
			<div class='printContentUsageTitle' id='printContentUsageTitle'></div>
			<div class='printContentChart'>
				<div class='printChart' id='printChart'></div>

			</div>
			
			<div class='printContentTableOuter' id='printContentTableOuter'>
			
			</div>
		</div>
	</div>
</div>
	

</body>

</html>
