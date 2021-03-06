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
	<title>공지 수정</title>
	
	<jsp:include page="../../common/common.jsp"></jsp:include>
	<c:if test="${not empty sessionScope}">
	<script type="text/javascript" src="<c:url value='../resources/vendor/ckeditor/ckeditor.js'/>"></script>
	<script type="text/javascript" src="<c:url value='../resources/vendor/ckeditor/ckFileUpload-custom.js'/>"></script>
	
	<script type="text/javascript" src="<c:url value='../resources/admin/apt/ntc/js/aptNtcMod.js'/>"></script>	
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
							<span class="mb-0 text-gray-800 page-heading-title">공지 수정</span> 
								
							&nbsp; &nbsp; &nbsp;
								
								
							<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 공지 수정</span> 
						</div>
							
							
							
						
					</div>


					<!-- contents -->

					<div class="row">
						
						<div class="col-lg-12 col-md-12">
						
							<form id="noticeModifyForm" name="noticeModifyForm" >
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">
										<div class="form-group">
											<label for="noticeTitle">제목</label>
											<input class="form-control form-control-solid" id="noticeTitle" type="text" value="${NOTICE.title}">
										</div>
									
										
									</h6>
								</div>
								
								<!-- card-body start -->
								<div class="card-body">
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<textarea id="ckeditor" name="ntcContent">${NOTICE.content}</textarea>
										</div>
									</div>

									<div class="row">
										<div class="col-sm-12 col-md-12">&nbsp</div>
									</div>

									<div class="row">
										<div class="col-sm-12 col-md-12" style='text-align: right;'>
											<input type="hidden" id="nowPage" name="nowPage" value="${nowPage}" readonly>
											<input type="hidden" id="seq_notice" name="seq_notice" value="${NOTICE.seq_notice}" readonly>
											
											<input type="button" id="noticeListBtn" class="btn btn-outline-primary btn-sm" style="" value="목록"> 
											<input type="button" id="noticeModProcBtn" class="btn btn-outline-primary btn-sm" style="" value="저장">
										</div>
									</div>

								</div><!-- card-body end -->
								
								
							</div>
							</form>
							
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
