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
	<title>절감 계획 목록 조회</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPlanList.js"></script>
	<c:if test="${not empty sessionScope}">	
	
<script type="text/javascript">

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
					<div class="row">
						<div class="col-xl-12">
							<div class="mb-4a page-heading-div">
						
								<div class="page-heading-title-div">
									<span class="mb-0 text-gray-800 page-heading-title">절감 계획 목록 조회</span> 
									
									&nbsp &nbsp &nbsp
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 전기요금 절감하기 > 절감 계획 목록 조회</span>
								</div>
							
								<!-- <div class="page-heading-report-div" style="">
									<span class="page-heading-report-helper" style=""></span>
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
								</div> -->
							</div>			
						</div>
					</div>
					
					<!-- row 목록 시작 -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									
									<c:if test="${fn:length(LIST_SAVE_PLAN) eq 0 }">
									<div class="row">
										<div class="col-xl-12">
											<div class="card shadow mb-4">
												<div class="card-body">
													<div class="row" style="height: 150px;text-align: center;display: flex;justify-content: center; align-items: center;">
														절감 계획 데이터가 없습니다
													</div>
												</div>
											</div>
										</div>
										
									</div>
									</c:if>
									
									<!-- 목록 반복 시작 -->
									<c:if test="${fn:length(LIST_SAVE_PLAN) ne 0 }">
									<c:forEach items="${LIST_SAVE_PLAN}" var="LIST_SAVE_PLAN">
									<div class="row">
										<div class="col-xl-12">
											<div class="card shadow mb-4">
												<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
													<h6 class="m-0 font-weight-bold text-primary">
														명칭 | ${LIST_SAVE_PLAN.save_plan_name}
														<c:if test="${LIST_SAVE_PLAN.is_active eq 1}">
															<span style="padding-left: 20px;">(진행중)</span>
														</c:if>
													</h6>
													
												</div>
											
												<div class="card-body">
													
													<div class="row">
														<div style="width:80%">
															
															<div style="width:100%;padding-left: 10px;">
																<div style="width:50%;float:left">
																	생성일(시작일) | ${LIST_SAVE_PLAN.date_created}
																</div>
																
																<div style="width:50%;float:left">
																	종료일 | ${LIST_SAVE_PLAN.date_ended}
																</div> 
															</div>
															
															<div style="width:100%;padding-left: 10px;">
																절감기준 | ${LIST_SAVE_PLAN.save_ref_name}
															</div>
															
															<div style="width:100%;padding-left: 10px;">
																 
																<div style="width:50%;float:left">
																	일간절감 목표 |	사용량	
																	<span style="padding-left: 10px;">
																		<fmt:formatNumber value="${LIST_SAVE_PLAN.save_expected_kwh}" pattern="#,##0.00" />
																	</span>
																</div>
																<div style="width:50%;float:left">
																	사용요금 
																	<span style="padding-left: 10px;">
																		<fmt:formatNumber value="${LIST_SAVE_PLAN.save_expected_won}" pattern="#,##0.00" />
																	</span>
																</div>
															</div>
															
														</div>
														
														
														
														<div style="width:20%">
															<div style="width:100%;height:100%;display: flex;justify-content: center;align-items: center">
																<div>
																	<form method="POST" name="bldElecPlanView" id="bldElecPlanView" action="../bld/elecPopPlanView">
																		<input type="hidden" name="seq_save_plan" value="${LIST_SAVE_PLAN.seq_save_plan}" readonly>
																		<input type="hidden" name="date_created" value="${LIST_SAVE_PLAN.date_created}" readonly>
																		<input type="hidden" name="date_ended" value="${LIST_SAVE_PLAN.date_ended}" readonly> 
																	</form>
																	<input type="button" id="" class="btn btn-outline-primary btn-sm bldElecPlanViewBtn" style='height:70px;' value="상세 정보">
																</div>
															</div>
														</div>
														
													</div>
																												
												</div>
												
											</div>
										</div>
									</div>
									
									</c:forEach>
									</c:if>
									
									<!-- 목록 반복 끝 -->
									
									<input type="hidden" id="nowPage" value="${nowPage}">
									
									<!-- 페이징 -->
									<div class="row">
										<div class="col-xl-12">
											<div class="card shadow">
												<div class="card-body">
													
													<div class="dataTables_paginate paging_simple_numbers"
														id="dataTable_paginate" >
														<ul class="pagination" style='justify-content: center;'>
														<c:if test="${PAGEUTIL.startPage eq 1}">
															<li class="paginate_button page-item previous" id="dataTable_previous">
																<a class="page-link">
																	<
																</a>
															</li>
															</c:if>
															
															<c:if test="${PAGEUTIL.startPage ne 1}">
															<li class="paginate_button page-item previous" id="">
																<a href="../bld/elecPlanList?nowPage=${PAGEUTIL.startPage - 1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
																	<
																</a>
															</li>			
															</c:if>
		
															<c:if test="${PAGEUTIL.totalCount eq 0}">
															<li class="paginate_button page-item" id="">
																<a href="../bld/elecPlanList?nowPage=1" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
																	1
																</a>
															</li>			
															</c:if>
															
															<c:if test="${PAGEUTIL.totalCount ne 0}">
															<!-- 	PAGE	[1][2][3] -->
															<c:forEach var="page" begin="${PAGEUTIL.startPage}" end="${PAGEUTIL.endPage}">
															<li class="paginate_button page-item" id="">
																<a href="../bld/elecPlanList?nowPage=${page}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
																	${page}
																</a>
															</li>			
															</c:forEach>
															</c:if>
															
															<c:if test="${PAGEUTIL.endPage eq PAGEUTIL.totalPage}">
															<li class="paginate_button page-item next" id="dataTable_previous">
																<a class="page-link">
																	>
																</a>
															</li>		
															</c:if>
															
															<c:if test="${PAGEUTIL.endPage ne PAGEUTIL.totalPage}">
															<li class="paginate_button page-item next" id="dataTable_previous">
																<a href="../bld/elecPlanList?nowPage=${PAGEUTIL.endPage+1}" class="page-link">
																	>
																</a>
															</li>		
															</c:if>
														</ul>
													</div>
																															
												</div>
											</div>
										</div>
									</div>
									<!-- 페이징 끝 -->
									
									
								</div>
							</div>
						</div>
					</div>
					<!-- row 목록 끝 -->
					
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
