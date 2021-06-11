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
	<title> - 요일별</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>

<c:if test="${not empty sessionScope.ADMIN }">	
	<script type="text/javascript">
	$(function(){
		enernet.modules.evt.makeDateYMD("usage_begin_day");
		enernet.modules.evt.makeDateYMD("usage_end_day");
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
							<div class="mb-4 page-heading-div">
						
								<div class="page-heading-title-div">
									<span class="mb-0 text-gray-800 page-heading-title">날짜별 분석</span> 
									
									&nbsp &nbsp &nbsp
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 계측기별 사용량 분석 > 날짜별 분석</span>
								</div>
							
								<div class="page-heading-report-div" style="">
									<span class="page-heading-report-helper" style=""></span>
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
								</div>
							</div>			
						</div>
					</div>

					<!-- row search -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									
								<form id="" name="" method="get" action="<c:url value=''/>">
									<div style="width:100px;float:left;">
										<span style="display: inline-block;height: 21px;"></span>날짜 선택
									</div>
									
									<div style="width:200px;float:left;">
										<input class="custom-date custom-date-sm" id="usage_begin_day" name="usage_begin_day" type="text" style="width:95%;">
									</div>
									
									<div style="width:52px;float:left;text-align: center">
										<span style="display: inline-block;height: 21px;"></span>~
									</div>
									
									<div style="width:200px;float:left;">
										<input class="custom-date custom-date-sm" id="usage_end_day" name="usage_end_day" type="text" style="width:95%;">
									</div>
									
									
									<div style="width:15%;float:left;">
										<input type="button" id="searchBtn" class="btn btn-outline-primary btn-sm" value="조회">	
									</div>
								</form>
									
								</div>
							</div>
						</div>
										
						<!-- text -->	
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="lightbulb-img-style">
										<i class="far fa-lightbulb"></i>
									</div>
									
									<div class="lightbulb-text-style">
										- 아파트 단지와 복지관의 차이점을 비교해 보세요! <br>  
										- 아파트 단지 사이에도 차이점이 있는지 살펴 보세요! <br>
										- 복지관 사이에도 차이점이 있는지 살펴 보세요! <br>
										- 여름철 변압기 과부하 가능성이 큰 요일과 시설을 찾아보세요! <br>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					<!-- row search end -->

					<!-- row chart -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									1
								</div>
							</div>
						</div>
					</div>
					<!-- row chart end -->
									
					<!-- row table -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-body">
								
									<!-- button row -->
									<div class="row">
										<div class="col-lg-12" style="text-align:right;">
											
											<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
											<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
																			
										</div>			
									</div>
									
									<hr />
									<!-- button row end-->
									
									<div class="row">
										<div class="col-lg-12">
											<table class="table-hover org-table-bordered org-table-style">
												<tr>
													<td colspan='12'> 신도 브래뉴 </td>
												</tr>
												<tr>
													<td>1시</td>
													<td>24.45</td>
													<td>5시</td>
													<td>24.45</td>
													<td>9시</td>
													<td>24.45</td>
													<td>13시</td>
													<td>24.45</td>
													<td>17</td>
													<td>24.45</td>
													<td>21시</td>
													<td>24.45</td>
													
													
												</tr>
											</table>
										</div>
									</div>
									
									<br>
									
									<div class="row">
										<div class="col-lg-12">
											<table class="table-hover org-table-bordered org-table-style">
												<tr>
													<td colspan='12'> 신도 브래뉴 </td>
												</tr>
												<tr>
													<td>1시</td>
													<td>24.45</td>
													<td>5시</td>
													<td>24.45</td>
													<td>9시</td>
													<td>24.45</td>
													<td>13시</td>
													<td>24.45</td>
													<td>17</td>
													<td>24.45</td>
													<td>21시</td>
													<td>24.45</td>
													
													
												</tr>
											</table>
										</div>
									</div>
									
									
									
								</div>
								<!-- card-body end -->
							</div>
						</div>
					</div>
					<!-- row table end -->
					
						

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
