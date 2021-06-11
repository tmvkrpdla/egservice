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
	<title>설정</title>
	
	
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">
		<!-- 부트 스트랩 토글 -->
		<link rel="stylesheet" type="text/css" href="<c:url value='../resources/vendor/bootstrap-toggle/css/bootstrap2-toggle.css'/>">
		<!-- 부트 스트랩 토글 커스텀 -->
		<link rel="stylesheet" type="text/css" href="<c:url value='../resources/vendor/bootstrap-toggle/css/bootstrap-toggle-custom.css'/>">
	
		<script type="text/javascript" src="<c:url value='../resources/vendor/bootstrap-toggle/js/bootstrap-toggle.min.js'/>"></script>
		
		<script type="text/javascript" src="<c:url value='../resources/admin/bld/set/js/bldSetAlarm.js'/>"></script>
	</c:if>
	
	
</head>

<%
String[] notiHourArr = {"0시","1시","2시","3시","4시","5시","6시","7시","8시", "9시",
                		"10시", "11시", "12시","13시", "14시", "15시", "16시", "17시", "18시", "19시",
                		"20시", "21시", "22시", "23시"};
String[] notiTypeArr = {"매일", "매주 일요일", "매주 월요일", "매주 화요일", "매주 수요일", "매주 목요일", "매주 금요일", "매주 토요일"};

pageContext.setAttribute("notiHourArr", notiHourArr);
pageContext.setAttribute("notiTypeArr", notiTypeArr);

%>
<style>


</style>

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
					<div class="row">
						<div class="col-xl-12">
							<div class="mb-4 page-heading-div">
						
								<div class="page-heading-title-div">
									<span class="mb-0 text-gray-800 page-heading-title">설정</span> 
									
									&nbsp &nbsp &nbsp
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 설정</span>
								</div>
							
								<!-- <div class="page-heading-report-div" style="">
									<span class="page-heading-report-helper" style=""></span>
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
								</div> -->
							</div>			
						</div>
					</div>
					
					<!-- <div class="row">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
							
							
							</div>
						</div>
					</div>
					 -->
					<!-- 알림 설정 --> 
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">알림 설정</h6>
								</div>
								
								<div class="card-body">
									
									<div class="row">
									
										<div class="col-xl-3 col-md-6 mb-12">
											<div class="card shadow h-100 py-2">
												<div class="card-body">
													<div class="row no-gutters align-items-center">
														<div class="col mr-2">
															<div class="text-xs font-weight-bold text-primary mb-1"> 
																오늘 사용량 초과 알림
															</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800"> 
																
																<input type="text" class="bldAlarmTextInput" id="todayUsageStr" name="todayUsageStr" value="<fmt:formatNumber value="${ADMIN_MAP.threshold_kwh_daily}" pattern="#,###" />"> kWh 
												
												
																<input type="hidden" class="bldAlarmTextInput" id="todayUsage" name="todayUsage" value="${ADMIN_MAP.threshold_kwh_daily}">
															</div>
														</div>
														
														<div class="col-auto">
															<span> <input id="todayUsageToggle" type="checkbox" ${ADMIN_MAP.noti_kwh_daily == 1 ? 'checked' : 'unchecked'}> </span>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-xl-3 col-md-6 mb-12">
											<div class="card shadow h-100 py-2">
												<div class="card-body">
													<div class="row no-gutters align-items-center">
														<div class="col mr-2">
															<div class="text-xs font-weight-bold text-primary mb-1"> 사용량 비교(kWh)</div>
																<div class="h5 mb-0 font-weight-bold text-gray-800"> $40,000</div>
														</div>
														
														<div class="col-auto">
															<i class="fas fa-calendar fa-2x text-gray-300"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-xl-3 col-md-6 mb-12">
											<div class="card shadow h-100 py-2">
												<div class="card-body">
													<div class="row no-gutters align-items-center">
														<div class="col mr-2">
															<div class="text-xs font-weight-bold text-primary mb-1"> 사용량 비교(kWh)</div>
																<div class="h5 mb-0 font-weight-bold text-gray-800"> $40,000</div>
														</div>
														
														<div class="col-auto">
															<i class="fas fa-calendar fa-2x text-gray-300"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-xl-3 col-md-6 mb-12">
											<div class="card shadow h-100 py-2">
												<div class="card-body">
													<div class="row no-gutters align-items-center">
														<div class="col mr-2">
															<div class="text-xs font-weight-bold text-primary mb-1"> 사용량 비교(kWh)</div>
																<div class="h5 mb-0 font-weight-bold text-gray-800"> $40,000</div>
														</div>
														
														<div class="col-auto">
															<i class="fas fa-calendar fa-2x text-gray-300"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
										
									</div>
									
									<hr/>
									
								</div>
								
							</div>
						</div>
					</div> 
					<!-- 알림 설정 끝 -->
					 
					 	
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">알림 문자 발송 대상자</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<table class="table table-bordered table-hover dataTable ntcListTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
										<tr class="">
											<td>아이디</td>
											<td>이름</td>
											<td>등록 연락처</td>
											<td>오늘 사용량</td>
											<td>이번달 사용량</td>
											<td>금년 사용량</td>
											<td>정시 사용량</td>
										</tr>
										<c:forEach items="${ADMIN_LIST}" var="ADMIN_LIST">
										<tr>
											<td>${ADMIN_LIST.admin_id}</td>
											<td>${ADMIN_LIST.admin_name}</td>
											<td>${ADMIN_LIST.admin_phone}</td>
											<td> <input type='checkbox' disabled ${ADMIN_LIST.noti_kwh_daily == 1? 'checked' : 'unchecked' } > &nbsp (<fmt:formatNumber value="${ADMIN_LIST.threshold_kwh_daily}" pattern="#,###" />)</td>
											<td> <input type='checkbox' disabled ${ADMIN_LIST.noti_kwh_monthly == 1? 'checked' : 'unchecked' } > &nbsp (<fmt:formatNumber value="${ADMIN_LIST.threshold_kwh_monthly}" pattern="#,###" />)</td>
											<td> <input type='checkbox' disabled ${ADMIN_LIST.noti_kwh_yearly == 1? 'checked' : 'unchecked'} > &nbsp (<fmt:formatNumber value="${ADMIN_LIST.threshold_kwh_yearly}" pattern="#,###" />)</td>
											<td> <input type='checkbox' disabled ${ADMIN_LIST.noti_usage_at_time == 1? 'checked' : 'unchecked'} > &nbsp (${notiTypeArr[ADMIN_LIST.usage_noti_type] }  ${notiHourArr[ADMIN_LIST.usage_noti_hour] }) </td>
										</tr>
										</c:forEach>
										
									</table> 
									<hr>
									
								</div>
							</div>
						</div>							
					</div> 	
					 	
					 	
					 
					<div class="row">
						<!-- 설정 -->
						<div class="col-xl-5 col-lg-5">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">알림 설정</h6>
								</div>
																	
								<div class="card-body">
									<div class="row">
										<div class="card-body">
											
										
											<div class="bldAlarmText">
											
												<span class='bldAlarmTextTitle'> 
														오늘 사용량 초과 알림 
												</span>
												 
												<span> 
													<input type="text" class="bldAlarmTextInput" id="todayUsageStr" name="todayUsageStr" value="<fmt:formatNumber value="${ADMIN_MAP.threshold_kwh_daily}" pattern="#,###" />"> kWh 
												</span>
												
												<input type="hidden" class="bldAlarmTextInput" id="todayUsage" name="todayUsage" value="${ADMIN_MAP.threshold_kwh_daily}">
											</div>
											
											<div class="bldAlarmToggle">
												<span> <input id="todayUsageToggle" type="checkbox" ${ADMIN_MAP.noti_kwh_daily == 1 ? 'checked' : 'unchecked'}> </span>	 
											</div>	
										</div>
									</div>
											
									<div class="row">
										<div class="card-body">
											<div class="bldAlarmText"> 
												<span class='bldAlarmTextTitle'>
													 이번달 사용량 초과 알림 
												</span> 
												<span>
													<input type="text" class="bldAlarmTextInput" id="monthUsageStr" name="monthUsageStr" value="<fmt:formatNumber value="${ADMIN_MAP.threshold_kwh_monthly}" pattern="#,###" />">  kWh 
												</span>
												<input type="hidden" class="bldAlarmTextInput" id="monthUsage" name="monthUsage" value="${ADMIN_MAP.threshold_kwh_monthly}"> 
											</div>
											<div class="bldAlarmToggle">
												<span>
													<input id="monthUsageToggle" type="checkbox" ${ADMIN_MAP.noti_kwh_monthly == 1 ? 'checked' : 'unchecked'}>
												</span>  
											</div> 
										</div>
									</div>
									
									
									
									<div class="row">
										<div class="card-body">
											<div class="bldAlarmText"> 
												<span class='bldAlarmTextTitle'>
													이번년도 사용량 초과 알림
												</span> 
												<span>
													<input type="text"  class="bldAlarmTextInput" id="yearUsageStr" name="yearUsageStr" value="<fmt:formatNumber value="${ADMIN_MAP.threshold_kwh_yearly}" pattern="#,###" />"> kWh 
												</span> 
												<input type="hidden"  class="bldAlarmTextInput" id="yearUsage" name="yearUsage" value="${ADMIN_MAP.threshold_kwh_yearly}"> 
											</div>
											<div class="bldAlarmToggle">
												<span><input id="yearUsageToggle" type="checkbox" ${ADMIN_MAP.noti_kwh_yearly == 1 ? 'checked' : 'unchecked'}></span> 
											</div>
										</div>
									</div>
									
								
									
									<div class="row">
										<div class="card-body">
											<div class="bldAlarmText"> 
												<span class='bldAlarmTextTitle'> 정시 사용량 알림 </span> 
												
												<span>
													<select class="bldNotiTypeSelect" id="notiTypeSelect" name="notiTypeSelect">
														<option value="0" ${ADMIN_MAP.usage_noti_type == 0? 'selected' : ''}>매일</option>
											  			<option value="1" ${ADMIN_MAP.usage_noti_type == 1? 'selected' : ''}>매주 일요일</option>
											  			<option value="2" ${ADMIN_MAP.usage_noti_type == 2? 'selected' : ''}>매주 월요일</option>
											  			<option value="3" ${ADMIN_MAP.usage_noti_type == 3? 'selected' : ''}>매주 화요일</option>
											  			<option value="4" ${ADMIN_MAP.usage_noti_type == 4? 'selected' : ''}>매주 수요일</option>
											  			<option value="5" ${ADMIN_MAP.usage_noti_type == 5? 'selected' : ''}>매주 목요일</option>
											  			<option value="6" ${ADMIN_MAP.usage_noti_type == 6? 'selected' : ''}>매주 금요일</option>
											  			<option value="7" ${ADMIN_MAP.usage_noti_type == 7? 'selected' : ''}>매주 토요일</option>
													</select>
													
													<select class="bldNotiHourSelect"  id="notiHourSelect" name="notiHourSelect">
														<option value="0" ${ADMIN_MAP.usage_noti_hour == 0? 'selected' : ''}>0시</option>
											  			<option value="1" ${ADMIN_MAP.usage_noti_hour == 1? 'selected' : ''}>1시</option>
											  			<option value="2" ${ADMIN_MAP.usage_noti_hour == 2? 'selected' : ''}>2시</option>
											  			<option value="3" ${ADMIN_MAP.usage_noti_hour == 3? 'selected' : ''}>3시</option>
											  			<option value="4" ${ADMIN_MAP.usage_noti_hour == 4? 'selected' : ''}>4시</option>
											  			<option value="5" ${ADMIN_MAP.usage_noti_hour == 5? 'selected' : ''}>5시</option>
											  			<option value="6" ${ADMIN_MAP.usage_noti_hour == 6? 'selected' : ''}>6시</option>
											  			<option value="7" ${ADMIN_MAP.usage_noti_hour == 7? 'selected' : ''}>7시</option>
											  			<option value="8" ${ADMIN_MAP.usage_noti_hour == 8? 'selected' : ''}>8시</option>
											  			<option value="9" ${ADMIN_MAP.usage_noti_hour == 9? 'selected' : ''}>9시</option>
											  			<option value="10" ${ADMIN_MAP.usage_noti_hour == 10? 'selected' : ''}>10시</option>
											  			<option value="11" ${ADMIN_MAP.usage_noti_hour == 11? 'selected' : ''}>11시</option>
											  			<option value="12" ${ADMIN_MAP.usage_noti_hour == 12? 'selected' : ''}>12시</option>
											  			<option value="13" ${ADMIN_MAP.usage_noti_hour == 13? 'selected' : ''}>13시</option>
											  			<option value="14" ${ADMIN_MAP.usage_noti_hour == 14? 'selected' : ''}>14시</option>
											  			<option value="15" ${ADMIN_MAP.usage_noti_hour == 15? 'selected' : ''}>15시</option>
											  			<option value="16" ${ADMIN_MAP.usage_noti_hour == 16? 'selected' : ''}>16시</option>
											  			<option value="17" ${ADMIN_MAP.usage_noti_hour == 17? 'selected' : ''}>17시</option>
											  			<option value="18" ${ADMIN_MAP.usage_noti_hour == 18? 'selected' : ''}>18시</option>
											  			<option value="19" ${ADMIN_MAP.usage_noti_hour == 19? 'selected' : ''}>19시</option>
											  			<option value="20" ${ADMIN_MAP.usage_noti_hour == 20? 'selected' : ''}>20시</option>
											  			<option value="21" ${ADMIN_MAP.usage_noti_hour == 21? 'selected' : ''}>21시</option>
											  			<option value="22" ${ADMIN_MAP.usage_noti_hour == 22? 'selected' : ''}>22시</option>
											  			<option value="23" ${ADMIN_MAP.usage_noti_hour == 23? 'selected' : ''}>23시</option>
													</select>
												</span>
											</div>
											
											<div class="bldAlarmToggle">
												<span><input id="timeUsage" type="checkbox" ${ADMIN_MAP.noti_usage_at_time == 1 ? 'checked' : 'unchecked'}></span>												
											</div>	
										
										</div>	
									</div>	
									
									<hr>
									
									<div style="float:right;">
										<input type="button" class="btn btn-outline-primary btn-sm" id="alarmSetBtn" name="alarmSetBtn" value="저장">
									</div>
								</div>
									<!-- card body end -->
								
							</div>
						</div>
						
						
							

						<!-- 리스트 -->
						<div class="col-xl-7 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">알림 문자 발송 대상자</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<table class="table table-bordered table-hover dataTable ntcListTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
										<tr class="">
											<td>아이디</td>
											<td>이름</td>
											<td>등록 연락처</td>
											<td>오늘 사용량</td>
											<td>이번달 사용량</td>
											<td>금년 사용량</td>
											<td>정시 사용량</td>
										</tr>
										<c:forEach items="${ADMIN_LIST}" var="ADMIN_LIST">
										<tr>
											<td>${ADMIN_LIST.admin_id}</td>
											<td>${ADMIN_LIST.admin_name}</td>
											<td>${ADMIN_LIST.admin_phone}</td>
											<td> <input type='checkbox' disabled ${ADMIN_LIST.noti_kwh_daily == 1? 'checked' : 'unchecked' } > &nbsp (<fmt:formatNumber value="${ADMIN_LIST.threshold_kwh_daily}" pattern="#,###" />)</td>
											<td> <input type='checkbox' disabled ${ADMIN_LIST.noti_kwh_monthly == 1? 'checked' : 'unchecked' } > &nbsp (<fmt:formatNumber value="${ADMIN_LIST.threshold_kwh_monthly}" pattern="#,###" />)</td>
											<td> <input type='checkbox' disabled ${ADMIN_LIST.noti_kwh_yearly == 1? 'checked' : 'unchecked'} > &nbsp (<fmt:formatNumber value="${ADMIN_LIST.threshold_kwh_yearly}" pattern="#,###" />)</td>
											<td> <input type='checkbox' disabled ${ADMIN_LIST.noti_usage_at_time == 1? 'checked' : 'unchecked'} > &nbsp (${notiTypeArr[ADMIN_LIST.usage_noti_type] }  ${notiHourArr[ADMIN_LIST.usage_noti_hour] }) </td>
										</tr>
										</c:forEach>
										
									</table> 
									<hr>
									
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
