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
	<title>홈</title>
	
	
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<script type="text/javascript">
	var _meterList = [];
	
	<c:forEach items="${SITE_INFO_BLD.meter_list}" var="METER_LIST">
		var _meterMap = {};
		_meterMap.seq_meter = "${METER_LIST.seq_meter}";
		_meterMap.mid = "${METER_LIST.mid}";
		_meterMap.mac_address = "${METER_LIST.mac_address}";
		_meterMap.meter_name = "${METER_LIST.meter_name}";
		_meterMap.descr = "${METER_LIST.descr}";
		_meterMap.floor_installed = "${METER_LIST.floor_installed}";
		_meterList.push(_meterMap);
	</c:forEach>
	
	
	</script>
	
	<c:if test="${not empty sessionScope}">
		
		
		<script type="text/javascript" src="<c:url value='../resources/admin/bld/js/bldHome.js'/>"></script>
	</c:if>
	

<style>




</style>	
	
	
	
</head>


<body id="page-top" oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
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

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">홈</h1>
					</div>
						
						<div class="row">
							<div class="col-lg-6" >
								<!-- Basic Card Example -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">
											사용량
										</h6>
									</div>
									<div class="card-body">
										<div class="row">
											<!-- 오늘 사용량 ~ 이번달 사용량 ~ 이번년도 사용량  -->
											<div class="col-xl-4 col-lg-12 col-md-12 mb-6">
											
												<div class="card shadow border-left-primary">
													<div class="card-body bldHomeCardBody">
														<div class="col mr-2 bldHomeCardBodyTitleOuter">
															<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
																오늘 사용량
															</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800">
																${USAGE_CURRENT.from_day} kWh
															</div>
														</div>
														
														<div class="bldHomeCardBodyFasDiv">
															<i class="fas fa-calendar fa-2x text-gray-300 bldHomeCardBodyFasUnset">
															</i>
														</div>
													</div>
												</div>

												<div class="card shadow border-left-primary">
													<div class="card-body bldHomeCardBody">
														<div class="col mr-2 bldHomeCardBodyTitleOuter">
															<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
																이번달 사용량
															</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800">
																${USAGE_CURRENT.from_month} kWh
															</div>
														</div>
														
														<div class="bldHomeCardBodyFasDiv">
															<i class="fas fa-calendar fa-2x text-gray-300 bldHomeCardBodyFasUnset">
															</i>
														</div>
													</div>
												</div>
												
												<div class="card shadow border-left-primary">
													<div class="card-body bldHomeCardBody">
														<div class="col mr-2 bldHomeCardBodyTitleOuter">
															<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
																이번년도 사용량
															</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800">
																${USAGE_CURRENT.from_year} MWh
															</div>
														</div>
														
														<div class="bldHomeCardBodyFasDiv">
															<i class="fas fa-calendar fa-2x text-gray-300 bldHomeCardBodyFasUnset">
															</i>
														</div>
													</div>
												</div>
											</div>
											<!-- 오늘 사용량 ~ 이번달 사용량 ~ 이번년도 사용량 끝 -->
											
											<!-- 작년 대비  -->
											<div class="col-xl-4 col-lg-12 col-md-12 mb-6">
											
												<div class="card shadow border-left-success">
													<div class="card-body bldHomeCardBody">
														<div class="col mr-2 bldHomeCardBodyTitleOuter">
															<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
																작년 대비 사용량 (일)
															</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800">
																${USAGE_CURRENT.compare_day} kWh
															</div>
														</div>
														
														<div class="bldHomeCardBodyFasDiv">
															<c:set value="${USAGE_CURRENT.compare_to_day}" var="compare_to_day" />
														
															<c:if test="${compare_to_day > 0 }">
																<i class="fas fa-arrow-up fa-2x text-up-300 bldHomeCardBodyFasUnset"></i>															
															</c:if>
															
															<c:if test="${compare_to_day eq 0 }">
																<i class="fas fa-window-minimize fa-2x text-equal-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
															
															<c:if test="${compare_to_day < 0 }">
																<i class="fas fa-arrow-down fa-2x text-down-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
															
														</div>
													</div>
												</div>

												<div class="card shadow border-left-success">
													<div class="card-body bldHomeCardBody">
														<div class="col mr-2 bldHomeCardBodyTitleOuter">
															<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
																작년 대비 사용량 (월)
															</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800">
																${USAGE_CURRENT.compare_month} kWh
															</div>
														</div>
														
														<div class="bldHomeCardBodyFasDiv">
															<c:set value="${USAGE_CURRENT.compare_to_month}" var="compare_to_month" />
														
															<c:if test="${compare_to_month > 0 }">
																<i class="fas fa-arrow-up fa-2x text-up-300 bldHomeCardBodyFasUnset"></i>															
															</c:if>
															
															<c:if test="${compare_to_month eq 0 }">
																<i class="fas fa-window-minimize fa-2x text-equal-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
															
															<c:if test="${compare_to_month < 0 }">
																<i class="fas fa-arrow-down fa-2x text-down-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
														</div>
													</div>
												</div>
												
												<div class="card shadow border-left-success">
													<div class="card-body bldHomeCardBody">
														<div class="col mr-2 bldHomeCardBodyTitleOuter">
															<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
																작년 대비 사용량 (연)
															</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800">
																${USAGE_CURRENT.compare_year} MWh
															</div>
														</div>
														
														<div class="bldHomeCardBodyFasDiv">
															<c:set value="${USAGE_CURRENT.compare_to_year}" var="compare_to_year" />
														
															<c:if test="${compare_to_year > 0 }">
																<i class="fas fa-arrow-up fa-2x text-up-300 bldHomeCardBodyFasUnset"></i>															
															</c:if>
															
															<c:if test="${compare_to_year eq 0 }">
																<i class="fas fa-window-minimize fa-2x text-equal-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
															
															<c:if test="${compare_to_year < 0 }">
																<i class="fas fa-arrow-down fa-2x text-down-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
														</div>
													</div>
												</div>
											</div>
											<!-- 작년 대비 끝  -->
											
											<!-- 온실 가스 증가량 -->
											<div class="col-xl-4 col-lg-12 col-md-12 mb-6">
											
												<div class="card shadow border-left-info">
													<div class="card-body bldHomeCardBody">
														<div class="col mr-2 bldHomeCardBodyTitleOuter">
															<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
																온실 가스 증가량 (일)
															</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800">
																${USAGE_CURRENT.day_gas} kg
															</div>
														</div>
														
														<div class="bldHomeCardBodyFasDiv">
															<c:if test="${compare_to_day > 0 }">
																<i class="fas fa-arrow-up fa-2x text-up-300 bldHomeCardBodyFasUnset"></i>															
															</c:if>
															
															<c:if test="${compare_to_day eq 0 }">
																<i class="fas fa-window-minimize fa-2x text-equal-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
															
															<c:if test="${compare_to_day < 0 }">
																<i class="fas fa-arrow-down fa-2x text-down-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
														</div>
													</div>
												</div>

												<div class="card shadow border-left-info">
													<div class="card-body bldHomeCardBody">
														<div class="col mr-2 bldHomeCardBodyTitleOuter">
															<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
																온실 가스 증가량 (월)
															</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800">
																${USAGE_CURRENT.month_gas} ton
															</div>
														</div>
														
														<div class="bldHomeCardBodyFasDiv">
															
														
															<c:if test="${compare_to_month > 0 }">
																<i class="fas fa-arrow-up fa-2x text-up-300 bldHomeCardBodyFasUnset"></i>															
															</c:if>
															
															<c:if test="${compare_to_month eq 0 }">
																<i class="fas fa-window-minimize fa-2x text-equal-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
															
															<c:if test="${compare_to_month < 0 }">
																<i class="fas fa-arrow-down fa-2x text-down-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
														</div>
													</div>
												</div>
												
												<div class="card shadow border-left-info">
													<div class="card-body bldHomeCardBody">
														<div class="col mr-2 bldHomeCardBodyTitleOuter">
															<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
																온실 가스 증가량 (연)
															</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800">
																${USAGE_CURRENT.year_gas} ton
															</div>
														</div>
														
														<div class="bldHomeCardBodyFasDiv">
															<c:if test="${compare_to_year > 0 }">
																<i class="fas fa-arrow-up fa-2x text-up-300 bldHomeCardBodyFasUnset"></i>															
															</c:if>
															
															<c:if test="${compare_to_year eq 0 }">
																<i class="fas fa-window-minimize fa-2x text-equal-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
															
															<c:if test="${compare_to_year < 0 }">
																<i class="fas fa-arrow-down fa-2x text-down-300 bldHomeCardBodyFasUnset"></i>
															</c:if>
														</div>
													</div>
												</div>
											</div>
											<!-- 온실 가스 증가량  끝-->
											

										</div>
									</div>
								</div>
								
								<!-- 건물 정보 -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">
											건물 정보
										</h6>
									</div>
									<div class="card-body">
										<table class="table table-bordered table-hover dataTable" id="" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
											<tr>
												<td>층수</td>
												<td> 
													${SITE_INFO_BLD.floor_info.replace(',' ,' /') }
												</td>
											</tr>
											
											<tr>
												<td>면적</td>
												<td>
													<fmt:formatNumber value="${SITE_INFO_BLD.area}" pattern="#,###" />㎡ 
												</td>
											</tr>
											
											<tr>
												<td>완공일</td>
												<td>
													${SITE_INFO_BLD.built_year}년 &nbsp ${SITE_INFO_BLD.built_month}월 
												</td>
											</tr>
											
											<tr>
												<td>주소</td>
												<td>${SITE_INFO_BLD.address}</td>
											</tr>
											
											<tr>
												<td>홈페이지</td>
												<td>${SITE_INFO_BLD.home_page}</td>
											</tr>
										</table>
									</div>
								</div>
								
								
								<!-- 건물 관리자 리스트 -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">
											건물 관리자
										</h6>
									</div>
									<div class="card-body">
										<table class="table table-bordered table-hover dataTable" id="" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
											<tr>
												<td>이름</td>
												<td>전화번호</td>
												<td>최근 로그인</td>
											</tr>
											
											<c:forEach items="${ADMIN_LIST}" var="ADMIN_LIST">
											<tr>
												<td>${ADMIN_LIST.admin_name}</td>
												<td>${ADMIN_LIST.admin_phone}</td>
												<td>${ADMIN_LIST.admin_last_login}</td>
											</tr>
											</c:forEach>
										</table>
									</div>
								</div>

							</div>
							
							<!-- 계측기 리스트 -->
							<div class="col-xl-6 col-lg-6">
								<div class="card shadow mb-4">
									
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">계측기 정보</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
									
										
										<div id="bldHomeMeterListTableDiv">
										
										</div>
										
									</div>
								</div>
							</div>
							
							
						</div>
						<!-- row end -->

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
