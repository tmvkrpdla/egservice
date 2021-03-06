<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>절감 기준 목록 선택</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">	
	
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPopStdList.js"></script>
	
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


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				

				<!-- Begin Page Content /.container-fluid-->
				<div class="container-fluid">

					<!-- Page Heading -->
					
					
					<!-- blank -->
					<div class="row" style='height:30px'>
						<div class="col-xl-12">
							
						</div>
					</div>
						
					<!-- 절감 기준 목록 시작 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">절감 기준 목록</h6>
									
								</div>
							
								<div class="card-body">
									
									<div class="row">
										<div class="col-xl-12">
											<table class="table-hover org-table-bordered org-table-style">
												<tr class="org-table-title-usage" style='height:50px;'>
													<th style="width:5%;"> 
														선택 
													</th>
													<th style="width:30%;"> 
														명칭
													</th>
													<th style="width:20%;">
														평균값 생성 대상기간
													</th>
													<th style="width:15%;">
														사용량(kWh)
													</th>
													<th style="width:15%;">
														사용요금 (원)
													</th>
													<th style="width:15%;">
														생성일
													</th>
												</tr>
												<c:if test="${fn:length(LIST_SAVE_REF) eq 0}">
												<tr>
													<td colspan="6" style='height:200px;'> 절감 기준 데이터가 없습니다.</td>
												</tr>
												</c:if>
												
												<c:if test="${fn:length(LIST_SAVE_REF) ne 0}">
													<c:forEach items="${LIST_SAVE_REF}" var="LIST_SAVE_REF">
													<tr class='listTrEvt' style='height:35px;'>
														<td class='radioTdEvt'>
															<input type='radio' name='refRadio' class='refRadio'/>
															
															<form name='stdDetailForm'>
																<input type='hidden' readonly name='seq_save_ref' value='${LIST_SAVE_REF.seq_save_ref}' >
																<input type="hidden" readonly name="save_ref_name" value="${LIST_SAVE_REF.save_ref_name}">
																
															</form>
														</td>
														<td>
															${LIST_SAVE_REF.save_ref_name}
														</td>
														<td>
															${LIST_SAVE_REF.date_from} ~ ${LIST_SAVE_REF.date_to} 
														</td>
														<td>
															<%-- ${LIST_SAVE_REF.kwh_sum} --%>
															<fmt:formatNumber value="${LIST_SAVE_REF.kwh_sum}" pattern="#,##0.00"/>    
														</td>
														<td>
															<%-- ${LIST_SAVE_REF.won_sum} --%>
															<fmt:formatNumber value="${LIST_SAVE_REF.won_sum}" pattern="#,##0.00"/>
														</td>
														<td>
															${LIST_SAVE_REF.time_created}
														</td>
													</tr>
													</c:forEach>
												</c:if>
													
											</table>
										</div>
									</div>
									
									<hr />
									
									
									
									
									<div class='row'>
										<div class="col-xl-12">
											<div style='text-align: right;'>
												<input id='popStdWriteFormBtn' type='button' class='btn btn-outline-primary btn-sm' value='추가'>
												<input id='popStdDelBtn' type='button' class='btn btn-outline-primary btn-sm' value='삭제'>
											</div>
										</div>
									</div>
									
									
									<div class='row'>
										<div class="col-xl-12">
											<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate" >
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
														<a href="../bld/elecPopStdList?nowPage=${PAGEUTIL.startPage - 1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
															<
														</a>
													</li>			
													</c:if>
		
													<c:if test="${PAGEUTIL.totalCount eq 0}">
													<li class="paginate_button page-item" id="">
														<a href="../bld/elecPopStdList?nowPage=1" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
															1
														</a>
													</li>			
													</c:if>
													
													<c:if test="${PAGEUTIL.totalCount ne 0}">
													<!-- 	PAGE	[1][2][3] -->
													<c:forEach var="page" begin="${PAGEUTIL.startPage}" end="${PAGEUTIL.endPage}">
													<li class="paginate_button page-item" id="">
														<a href="../bld/elecPopStdList?nowPage=${page}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
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
														<a href="../bld/elecPopStdList?nowPage=${PAGEUTIL.endPage+1}" class="page-link">
															>
														</a>
													</li>		
													</c:if>
												</ul>
											</div>
										</div>
									</div>
									
									<hr />
									
									
									
									
									<div class='row'>
										<div class="col-xl-12">
											<div style='width:100%;text-align: center;'>
												<input id='popStdChoiceBtn' type='button' class='btn btn-outline-danger btn-sm' value='선 택 하 기' style='width:250px;'>
												<input type='hidden' id='nowPage' name='nowPage' value='${nowPage}'>
											</div>
										</div>
									</div>
																											
								</div>
								
							</div>
						</div>
					</div>
					<!-- 절감 기준 목록 끝-->
					
					
					

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->


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
