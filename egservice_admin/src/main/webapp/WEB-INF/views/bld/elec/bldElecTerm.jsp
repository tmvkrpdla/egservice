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
	<title>절감 계획 용어</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">	
		
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecTerm.js"></script>
	
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
				<div class="container-fluid" id="container-fluid">

					
					
					<!-- Page Heading -->
					<div class="row">
						<div class="col-xl-12">
							<div class="mb-4a page-heading-div">
						
								<div class="page-heading-title-div">
									<span class="mb-0 text-gray-800 page-heading-title">절감 계획 용어</span> 
									
									&nbsp &nbsp &nbsp
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 전기요금 절감하기 > 절감 계획 용어</span>
								</div>
							
								
							</div>			
						</div>
					</div>
					
					<!--  -->
					<!-- 절감계획 새로 만들기 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">절감 계획 새로 만들기</h6>	
								</div>
							
								<div class="card-body">
									
									<div>
										<div>
											<p>
												<i class="fab fa-quora"></i>
												절감 계획이란?
											</p> 
										</div>
										<div>
											<p>
												&nbsp;<i class="fas fa-angle-right"></i>
												특정 기간의 평균 전기 사용량을 “절감 기준”으로 설정하고, 계측기별 및 시간대별로 몇 % 의 전기사용량을 절감할지에 대한 목표를 “절감 목표”로 지정하여 실제로 전기 사용 절약을 유도하기 위한 방안 <br/> 
												수립된 “절감 목표”를 시행할수 있도록 건물 관리자에게 문자 알림을 자동으로 전송함
											</p>
										</div>
									</div>
																		
									<div style="padding-top: 20px;">
										<div>
											<p>
												<i class="fab fa-quora"></i>
												절감 기준이란?
											</p>
										</div>
										
										<div>
											<p>
												&nbsp;<i class="fas fa-angle-right"></i>
												특정 기간의 전기 사용량 평균으로서 절감 목표 설정의 기준이 되는 값
											</p>
										</div>
									</div>

									<div style="padding-top: 20px;">
										<div>
											<p>
												<i class="fab fa-quora"></i>
												절감 목표란?
											</p>
										</div>
										
										<div>
											<p>
												&nbsp;<i class="fas fa-angle-right"></i>
												절감 기준 대비 각각의 계측기의 시간대별 전기 사용량을 몇 % 절감할지 설정한 목표값
											</p>
										</div>
									</div>
									
									<div style="padding-top: 20px;">
										<div>
											<p>
												<i class="fab fa-quora"></i>
												절감 예상이란?
											</p>
										</div>
										
										<div>
											<p>
												&nbsp;<i class="fas fa-angle-right"></i>
												설정한 절감 목표를 달성할 경우 하루의 예상 절감 사용량과 월간 예상 절감 사용량 예측값
											</p>
										</div>
									</div>
									
									<hr />
									
									<div style="float:right;">
										<input class="btn btn-outline-primary btn-sm" type="button" id="popupBtn" value="절감 계획 매뉴얼">
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 절감계획 새로 만들기 끝	-->
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">일간 절감 성과 보기</h6>	
								</div>
							
								<div class="card-body">
									
									<div>
										<div>
											<p>
												<i class="fab fa-quora"></i>
												일간 절감 성과 보기란?
											</p> 
										</div>
										<div>
											<p>
												&nbsp;<i class="fas fa-angle-right"></i>
												시간대별로 절감기준, 절감목표 및 실제 사용량을 하나의 차트에 표시하여 절감 목표를 달성하도록 유도함
												<br />
												<br />
												&nbsp;<i class="fas fa-angle-right"></i>
												시간대별로 절감기준, 절감목표 및 실제사용을 비교한 차트는 사용량별, 사용요금별로 제공되고 계측기별로도 제공됨
											</p>
										</div>
									</div>
																		
									

								</div>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">기간별 절감 성과보기</h6>	
								</div>
							
								<div class="card-body">
									
									<div>
										<div>
											<p>
												<i class="fab fa-quora"></i>
												기간별 절감 성과보기란?
											</p> 
										</div>
										<div>
											<p>
												&nbsp;<i class="fas fa-angle-right"></i>
												절감 계획에 따른 절감기준과 절감목표 값을 기준으로 날짜별 실제 사용량을 같은 차트에 표시하여 날짜별로 절감 계획을 어느정도 달성했는지 비교할수 있도록 함
												
											</p>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
							
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">계측기별 절감 성과보기</h6>	
								</div>
							
								<div class="card-body">
									
									<div>
										<div>
											<p>
												<i class="fab fa-quora"></i>
												계측기별 절감 성과보기란?
											</p> 
										</div>
										<div>
											<p>
												&nbsp;<i class="fas fa-angle-right"></i>
												절감 계획에 따른 절감기준과 절감목표 값을 기준으로 계측기별 실제 사용량을 같은 차트에 표시하여 계측기별 절감 계획 달성 수준을 비교할수 있도록 함
												
											</p>
										</div>
									</div>
									
								</div>
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
