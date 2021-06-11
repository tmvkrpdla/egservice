<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>절감 조치 만들기</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">	
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/js/Chart.color.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPopStdList.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPlanWrite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPopActWrite.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			var _seq_plan_elem = opener.$(".cn").val();
			console.log("_seq_plan_elem = ", _seq_plan_elem);
			$('#seq_plan_elem').val(_seq_plan_elem);

			var _seq_save_plan = opener.$("#seq_save_plan").val();
			$('#seq_save_plan').val(_seq_save_plan);
		});
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
					
					<!-- 절감 조치 만들기 시작 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">절감 조치 만들기</h6>
									
								</div>
							
								<div class="card-body">
									
									<div class="row">
										<div class="col-xl-12">
										
											<div style="width:100%;">
												<div style='text-align: right;padding-bottom: 15px;'>
													<span style='color:red'> * </span> 필수입력
												</div>
												<div style="width:100%;">
													<div style='padding-bottom:10px;'> 
														<span style='color:red'> * </span> 절감 조치를 적으세요.
													</div>
													
													<div style="width:100%;padding-bottom:65px;">
														<div style='width:80%;float:left;'>
															<input type='hidden' name='seq_save_plan' class='seq_save_plan' id="seq_save_plan">
															<input type='hidden' name='seq_plan_elem' class='seq_plan_elem' id="seq_plan_elem">
															<input type='text' class='form-control actContent' style='height:52px;' id='actContent' name='actContent'>
														</div>
														
													</div>
												</div>
												
												
												<div style="width:100%;">
													<div style='padding-bottom:5px;width: 100%;text-align: right;'>  
														<input type="button" value='저장' class='btn btn-outline-success btn-sm' id='actSaveBtn'>
													</div>
												</div>
												
											</div>
											
										</div>
									</div>
									
								</div>
								
							</div>
						</div>
					</div>
					<!-- 절감 조치 만들기 끝 -->
					
					
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
