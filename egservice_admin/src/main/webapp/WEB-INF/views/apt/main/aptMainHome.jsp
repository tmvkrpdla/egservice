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
		<script src="${pageContext.request.contextPath}/resources/admin/apt/main/js/aptMainHome.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>	
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
					<div class="row">
						<div class="col-xl-12">
							<div class="mb-4 page-heading-div">
						
								<div class="page-heading-title-div">
									<span class="mb-0 text-gray-800 page-heading-title">Home</span> 
									
									&nbsp; &nbsp; &nbsp;
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i></span>	 
								</div>
							
								<div class="page-heading-report-div" style="">
									<span class="page-heading-report-helper" style=""></span>
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
								</div>
							</div>			
						</div>
					</div>
					
					
					<!-- row 건물 정보 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">아파트 단지 정보</h6>
									
								</div>
							
								<div class="card-body">
									<!-- 처음로딩될때에는 세션에 담긴 변수를 사용하고, 리프레쉬 버튼을 누를 경우 재호출 한다. -->
									<div class="row">
										<div class="col-lg-4 col-sm-6">
											관리실 전화 | ${SITE_INFO_BLD.phone}
										</div>
										<div class="col-lg-4 col-sm-6">
											팩스 | ${SITE_INFO_BLD.fax}
										</div>
										<div class="col-lg-4 col-sm-12">
											검침일 | 매달 ${SITE_INFO_BLD.read_day}일
										</div>
									</div>
									
									
									<div class="row">
										<div class="col-lg-4 col-sm-6">
											완공일 | <span id="site_built_year">${SITE_INFO_BLD.built_year}</span> - <span id="site_built_month">${SITE_INFO_BLD.built_month}</span>
										</div>
										<div class="col-lg-4 col-sm-6">
											주소 | <span id="site_address">${SITE_INFO_BLD.address}</span>
										</div>
										<div class="col-lg-4 col-sm-12">
											
										</div>
									</div>
																											
								</div>
								
							</div>
									
						</div>
					</div>
					<!-- row 건물 정보 끝 -->		
									
					<!-- 사용량, 30일 평균 사용량, 사용량 비교, CO2발생량 -->
					<div class="row">
						<!-- 오늘 사용량 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow">
								<div class="card-body">
								
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="font-weight-bold text-primary mb-1 font-size-20">
												사용량 (kWh)
											</div>
											<div class="mb-0 font-weight-bold text-gray-800 font-size-17" id="sum"></div>
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
										<div class="col mr-2">
											<div class="font-weight-bold text-primary mb-1 font-size-20">
												30일 평균 사용량 (kWh)
											</div>
											<div class="mb-0 font-weight-bold text-gray-800 font-size-17" id="sum_avg"></div>
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
										<div class="col mr-2">
											<div class="font-weight-bold text-primary mb-1 font-size-20">
												사용량 증감(kWh)
											</div>
											<div class="mb-0 font-weight-bold text-gray-800 font-size-17" id="">
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
										<div class="col mr-2">
											<div class="font-weight-bold text-primary mb-1 font-size-20">
												CO<sub>2</sub> 발생량 (kg)																
											</div>
											<div class="mb-0 font-weight-bold text-gray-800 font-size-17" id="">
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
									
					
									
					<!-- 차트 -->
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
					<!-- 차트 끝 -->
					
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
												- 사용량은 모든 세대 사용량의 합계입니다.
											</div>
											<div style="width:50%;float:right; text-align: right;">  
												<span id="get_api_time"></span> 
												<span id="refreshBtn" style="cursor: pointer;"> <i class="fas fa-redo"></i> </span>
											</div>
										</div>
										
										<div>
											- 사용량 수집 주기는 15분입니다.
										</div>
										
										<div>
											- 30일 평균 사용량은 30일 전부터 어제까지 사용량의 평균입니다. (근무일과 휴무일 구분)
										</div>
										
										<div>
											- 사용량 증감은 오늘 사용량과 30일 평균값의 차이입니다.
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 내용 끝 -->
									
					<!-- table -->
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
													<td rowspan='2' width="20%">사용량</td>
													<td colspan='2' width="30%">30일 평균 사용량</td>
													<td rowspan='2' width="20%">사용량 증감</td>
													<td rowspan='2' width="20%">CO<sub>2</sub> 발생</td>
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
													<td rowspan='2' width="20%">사용량</td>
													<td colspan='2' width="30%">30일 평균 사용량</td>
													<td rowspan='2' width="20%">사용량 증감</td>
													<td rowspan='2' width="20%">CO<sub>2</sub> 발생</td>
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
					<!-- table 끝 -->
									
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
