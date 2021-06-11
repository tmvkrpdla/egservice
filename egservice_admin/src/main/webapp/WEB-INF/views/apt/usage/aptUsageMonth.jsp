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
	<title>세대간 사용량 비교 > 월별 사용량 비교</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">
	
	
	<script src="${pageContext.request.contextPath}/resources/admin/apt/usage/js/aptUsageMonth.js"></script>

			
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
							<span class="mb-0 text-gray-800 page-heading-title">월별 사용량 비교</span> 
								
							&nbsp; &nbsp; &nbsp;
								
								
							<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 세대간 사용량 비교 > 월별 사용량 비교</span> 
						</div>
							
							
							
						<div class="page-heading-report-div" style="">
							<span class="page-heading-report-helper" style=""></span>
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
						</div>
						
					</div>
					
			
					
					<!-- 검색, text -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div style="width:100%;display: inline-block;">				
										<form id="searchForm" name="searchForm" method="get" action="<c:url value='../apt/usageMonth'/>">
											<div style="width:100px;float:left;">
												<span style="display: inline-block;height: 21px;"></span>날짜 선택
											</div>
											
											<div style="width:200px;float:left;">
												<input class="custom-date custom-date-sm" id="monthTarget" name="monthTarget" type="text" style="width:95%;" value="${MONTHTARGET}">
											</div>
											
											<div style="width:15%;float:left;">
												<input type="button" id="searchBtn" class="btn btn-outline-primary btn-sm" value="조회">	
											</div>
										</form>
									</div>
									
									
									<div class="width:100%;display: inline-block;">
										<span>
                  							<span style="color:red">*</span> 평균기온
                  						</span>	&emsp;
                  						
                  						
                  						<span> 
                  							최고 기온 :		
                  										<c:set value="${WEATHERMONTH.avg_temp_max}" var="AVG_TEMP_MAX"/>
                  									
                  										<c:if test="${AVG_TEMP_MAX < 0}"> - </c:if>
                  										<c:if test="${AVG_TEMP_MAX > 0}"> <fmt:formatNumber value="${AVG_TEMP_MAX}" pattern="#,###.00"/>  ℃  </c:if>
                  									
                  										
                  						</span> &emsp;
                  						
                  						<span> 
                  							최저 기온 :		
                  										<c:set value="${WEATHERMONTH.avg_temp_min}" var="AVG_TEMP_MIN"/>
                  										
                  										
                  										<c:if test="${AVG_TEMP_MIN < 0}"> - </c:if>
                  										<c:if test="${AVG_TEMP_MIN > 0}"> <fmt:formatNumber value="${AVG_TEMP_MIN}" pattern="#,###.00"/> ℃ </c:if>
                  										
                  										
                  										
                  						</span> &emsp;
                  						<span> 
                  							평균 기온 : 	
                  										<c:set value="${WEATHERMONTH.avg_temp_avg}" var="AVG_TEMP_AVG"/>
                  										
                  										<c:if test="${AVG_TEMP_AVG < 0}"> - </c:if>
                  										<c:if test="${AVG_TEMP_AVG > 0}"> <fmt:formatNumber value="${AVG_TEMP_AVG}" pattern="#,###.00"/> ℃ </c:if>
                  									
                  										
                  						</span> &emsp; 
									
									</div>
									
								</div>
							</div>
						</div>
										
						<!-- text -->	
					<!-- 	<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-body">
									<div class="lightbulb-img-style">
										<i class="far fa-lightbulb"></i>
									</div>
									
									<div class="lightbulb-text-style">
										- <span style="text-decoration: underline;">날씨와 온도의 변화</span>에 따른 아파트와 복지관 전기 사용 패턴의 차이를 비교해 보세요! <br>  
										- 근무일과 휴무일의 전기 사용 패턴을 비교해 보세요! <br>
										- 전기 사용 패턴과 날씨의 관계를 비교해서 <span style="text-decoration: underline;">전기 사용량 절약 아이디어</span>를 제안해 보세요! <br>
									</div>
									
								</div>
							</div>
						</div> -->
					</div>
					<!-- 검색, text 끝-->
					
					
					<!-- 차트 -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									<!-- table -->
									
									<div>
																				
										<c:if test="${fn:length(USAGELISTMAP.list_usage) eq 0 }">
										
										<table class="table-hover org-table-bordered org-table-style">
											<tr>
												<td> 데이터가 없습니다. </td>
											</tr>
										</table>
										</c:if>
										
										
										<c:if test="${fn:length(USAGELISTMAP.list_usage) ne 0 }">
										
										<div style="width:100%;">
											<span>단지 평균 사용량 (kWh) : <span>${USAGELISTMAP.text_kwh_avg}</span> </span> 
											&emsp;&emsp;
											<span>단지 평균 사용요금 (원) : <span>${USAGELISTMAP.text_won_avg}</span> </span>
										</div>	
										
										<hr/>
										<div style="width:100%;">
											<span style="width:100px;display: inline-block;"> 정렬 기준 </span> 
											<span style="width:150px;display: inline-block;"> <label class="labelRadio"> <input class="sortRadio" type="radio" name="sort" value="1" ${SORT eq 1 ? 'checked' : '' }> 동 호 순서  </label> </span>
											<span style="width:150px;display: inline-block;"> <label class="labelRadio"> <input class="sortRadio" type="radio" name="sort" value="2" ${SORT eq 2 ? 'checked' : '' }> 사용량 순서 </label> </span>
											<span style="width:150px;display: inline-block;"> <label class="labelRadio"> <input class="sortRadio" type="radio" name="sort" value="3" ${SORT eq 3 ? 'checked' : '' }> 사용량 역순  </label> </span>
										</div>	
										
										<table class="table-hover org-table-bordered org-table-style">
											<tr class="org-table-title">
												<td style="width:6%;"> No </td>
												<td style="width:7%;"> 동 </td>
												<td style="width:7%;"> 호 </td>
												<td style="width:15%;"> 사용량(kWh) </td>
												<td style="width:20%;"> 단지 평균 대비 (kWh) </td>
												<td style="width:15%;"> 사용요금 (원) </td>
												<td style="width:20%;"> 단지 평균 대비 (원) </td>
												<td style="width:10%;"> 사용량 순위 </td>
											</tr>
											<c:forEach items="${USAGELISTMAP.list_usage}" var="LIST_USAGE">
											<c:set var="i" value="${i+1 }"/>
											<tr class="listUsageClass">
												<td>${i }</td>
												<td>${LIST_USAGE.dong_name}</td>
												<td>${LIST_USAGE.ho_name}</td>
												<td>${LIST_USAGE.text_kwh}</td>
												<td>
													<c:if test="${LIST_USAGE.kwh_delta > 0}">
														+${LIST_USAGE.text_kwh_delta}
													</c:if>
													
													<c:if test="${LIST_USAGE.kwh_delta <= 0}">
														${LIST_USAGE.text_kwh_delta}
													</c:if>
													
												</td>
												<td>${LIST_USAGE.text_won}</td>
												<td>
													<c:if test="${LIST_USAGE.won_delta > 0}">
														+${LIST_USAGE.text_won_delta}
													</c:if>
													<c:if test="${LIST_USAGE.won_delta <= 0}">
														${LIST_USAGE.text_won_delta}
													</c:if>
												</td>
												<td>${LIST_USAGE.ranking}</td>
											</tr>
											</c:forEach>
										</table>
										</c:if>
										
										
									</div>
									<!--  -->
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
