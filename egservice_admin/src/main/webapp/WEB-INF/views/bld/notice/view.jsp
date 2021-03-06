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
	<title>공지사항</title>
	
	
	
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">
	<script type="text/javascript" src="<c:url value='../resources/admin/bld/notice/js/bldNoticeView.js'/>"></script>
	
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
					<div class="row">
						<div class="col-xl-12">
							<div class="mb-4 page-heading-div">
						
								<div class="page-heading-title-div">
									<span class="mb-0 text-gray-800 page-heading-title">공지사항</span> 
									
									&nbsp &nbsp &nbsp
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 공지사항</span>
								</div>
							</div>			
						</div>
					</div>


					<!-- contents -->

					<div class="row">
						
						<div class="col-lg-12 col-md-12">

						
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">
										${NOTICE.title}
										
									</h6>
								</div>
								
								<!-- card-body start -->
								<div class="card-body">
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div style="overflow:auto;">
												${NOTICE.content}
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-sm-12 col-md-12">&nbsp</div>
									</div>

									<div class="row">
										<div class="col-sm-12 col-md-12" style='text-align: right;'>
												<div class='aptNoticeViewButton'>
													<div class='aptNoticeViewButtonDiv1'>
														<c:if
															test="${NOTICE.writer_type == 1 || NOTICE.writer_type == '1'}">
	
															
															<!-- <span class='isTopTitleClass'>고정</span> -->
															<label>
																고정 
															<input type="checkbox" id='isTopBtn'
																value='${NOTICE.is_top}'
																${NOTICE.is_top == 1? 'checked' : 'unchecked'}>
															</label>				
														</c:if>
													</div>

													<hr />
													
													<div class='aptNoticeViewButtonDiv2'>
														<input type='button' value='목록' class='btn btn-outline-primary btn-sm'
															id='noticeListBtn'>
	
														<c:if
															test="${NOTICE.writer_type == 1 || NOTICE.writer_type == '1'}">
															<input type='button' value='수정' class='btn btn-outline-primary btn-sm'
																id='noticeModBtn'>
														</c:if>
													</div>

													<input type='hidden' id='nowPage' name='nowPage'
													value='${nowPage}'>

													<c:if
														test="${NOTICE.writer_type == 1 || NOTICE.writer_type == '1'}">
														<form name="noticeModForm" method='post' id='noticeModForm'>
															<input type='hidden' id='seqNotice' name='seq_notice'
																value='${NOTICE.seq_notice}' readonly> <input
																type='hidden' id='noticeTitle' name='title'
																value='${NOTICE.title}' readonly>
															<textarea id='noticeContent' name='content'
																style='display: none' readonly>${NOTICE.content}</textarea>
															<input type='hidden' name='is_top'
																value='${NOTICE.is_top}' readonly> <input
																type='hidden' name='writer_type'
																value='${NOTICE.writer_type}' readonly> <input
																type='hidden' name='target_type'
																value='${NOTICE.target_type}' readonly> <input
																type='hidden' name='time_created'
																value='${NOTICE.time_created}' readonly> <input
																type='hidden' name='time_read'
																value='${NOTICE.time_read}' readonly> <input
																type='hidden' name='nowPage' value='${nowPage}'>
														</form>
													</c:if>
												
											</div>

										</div>
									</div>

								</div><!-- card-body end -->
								
								
							</div>
							
						</div>
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
	</c:if>
</body>

</html>
