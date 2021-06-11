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
	<title>공지사항 목록</title>
	
	
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">
		<script src="${pageContext.request.contextPath}/resources/admin/org/common/js/orgSideBar.js"></script>
		<script src="../resources/admin/org/notice/js/orgNoticeList.js"></script>
	</c:if>
	
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
					<div class="mb-4 page-heading-div">
						
						<div class="page-heading-title-div">
							<span class="mb-0 text-gray-800 page-heading-title">공지사항</span> 
								
							&nbsp &nbsp &nbsp
								
								
							<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 공지사항</span>  
					</div>
							
							
						<!-- 	
						<div class="page-heading-report-div" style="">
							<span class="page-heading-report-helper" style=""></span>
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
						</div>
						 -->
					</div>	


					<!-- contents -->
					<!-- row -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									
									
									<div class="row">
										<div class="col-lg-12">
											<div class="card shadow mb-4">
												<div class="card-body">
												
													<div class="table-responsive">
														<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
													
															<!-- table -->
															<table class="table table-bordered table-hover dataTable ntcListTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
													
															</table>
													
														
															<!-- button -->
															<div style='text-align:right;'>
																<input type="hidden" id="nowPage" name="nowPage" value="${nowPage}"  readonly>
																<input type="button" id="noticeWriteBtn" name="" class="btn btn-outline-primary btn-sm" value="작성">
															</div>
														
															<!-- 페이징 -->
															<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
																<ul class="pagination">
																<c:if test="${PAGEUTIL.startPage eq 1}">
																	<li class="paginate_button page-item previous" id="dataTable_previous">
																		<a class="page-link">
																			<
																		</a>
																	</li>
																	</c:if>
																	
																	<c:if test="${PAGEUTIL.startPage ne 1}">
																	<li class="paginate_button page-item previous" id="">
																		<a href="../apt/noticeList?nowPage=${PAGEUTIL.startPage - 1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
																			<
																		</a>
																	</li>			
																	</c:if>
				
																	<c:if test="${PAGEUTIL.totalCount eq 0}">
																	<li class="paginate_button page-item" id="">
																		<a href="../apt/noticeList?nowPage=1" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
																			1
																		</a>
																	</li>			
																	</c:if>
																	
																	<c:if test="${PAGEUTIL.totalCount ne 0}">
																	<!-- 	PAGE	[1][2][3] -->
																	<c:forEach var="page" begin="${PAGEUTIL.startPage}" end="${PAGEUTIL.endPage}">
																	<li class="paginate_button page-item" id="">
																		<a href="../apt/noticeList?nowPage=${page}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
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
																		<a href="../apt/noticeList?nowPage=${PAGEUTIL.endPage+1}" class="page-link">
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
										</div>
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
