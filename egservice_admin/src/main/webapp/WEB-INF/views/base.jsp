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
<jsp:include page="common/common.jsp"></jsp:include>

<style>


.org-table-bordered{
    border: 1px solid #e3e6f0;
}


.org-table-bordered th,
.org-table-bordered td {
  border: 1px solid #e3e6f0;
}

.org-table-style{
	text-align: center;
	margin-top: 6px !important; 
    margin-bottom: 6px !important;
}

</style>

</head>

<body id="page-top" oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="common/sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content" >

				<!-- Topbar -->
				<jsp:include page="common/topbar.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content /.container-fluid-->
				<div class="container-fluid" style="width:85%;">

					<!-- Page Heading -->
					<!-- <div class="d-sm-flex align-items-center justify-content-between mb-4"> -->
					<div class="mb-2">
						<span class="mb-0 text-gray-800 page-content-title">Home</span> 
						
						&nbsp &nbsp &nbsp
						
						<span>
							<i class="fas fa-fw fa-home"></i> 
						</span>
					</div>
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="row">
										
									</div>


									<div class="row">
										<div class="col-xl-12">
											<div class="card shadow mb-4">
												<div class="card-body">
													- 오늘 사용량은 0시부터 현재 시간까지의 사용량 입니다. <br> 
													- 오늘 사용량은 15분마다 수집되어 변경 됩니다.<br> 
													- 30일 평균 사용량은 어제까지의 30일 사용량의 평균입니다. (근무일과 휴무일 구분) <br> 
													- 사용량 비교는 오늘 사용량과 30일 평균 사용량의 비교이며 오늘이 근무일이면 근무일 평균과 비교합니다.
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										

										
									</div>
									
									
									<!-- table -->
									<div class="row">
										
									</div>
									<!-- table end -->

								</div>
							</div>
						</div>
					</div>
					<!-- end of row -->	
					
					
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->

			<jsp:include page="common/footer.jsp"></jsp:include>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<!-- Logout Modal-->
	<%-- util.jsp : logout/scroll top.. --%>
	<jsp:include page="common/logout.jsp"></jsp:include>

</body>

</html>