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
	<title>전기요금 절감하기 - 전기 요금표</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
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
									<span class="mb-0 text-gray-800 page-heading-title">전기 요금표</span> 
									
									&nbsp &nbsp &nbsp
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 전기요금 절감하기 > 전기 요금표</span>
								</div>
							
								<!-- <div class="page-heading-report-div" style="">
									<span class="page-heading-report-helper" style=""></span>
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
								</div> -->
							</div>			
						</div>
					</div>
					
						
					<!-- 일반용 전력(갑)II : 고압A : 선택II -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">일반용 전력(갑)Ⅱ : 고압 A : 선택Ⅱ</h6>
									
								</div>
							
								<div class="card-body">
									<div class="row">
										<div class="col-xl-12">
											<table class="table-hover org-table-bordered org-table-style">
												<tr class="org-table-title-usage">
													<th> 계절 </th>
													<th> 
														기본요금 <br>
														(원/kW)
													</th>
													<th>
														경부하 <br>
														(원/kWh)
													</th>
													<th>
														중간부하 <br>
														(원/kWh)
													</th>
													<th>
														최대부하 <br>
														(원/kWh)
													</th>
												</tr>
												
												<tr>
													<td>
														여름 <br>
														(6, 7, 8)
													</td>
													<td rowspan="3">
														8,230
													</td>
													<td>57.4</td>
													<td>108.6</td>
													<td>131.1</td>
												</tr>
												
												<tr>
													<td> 
														봄 / 가을 <br>
														(3, 4, 5, 9, 10)
													</td>
													
													<td>57.4</td>
													<td>64.8</td>
													<td>76.1</td>
												</tr>
												
												<tr>
													<td>
														겨울 <br>
														(11, 12, 1, 2)
													</td>
													
													<td>66.1</td>
													<td>96.5</td>
													<td>111.3</td>
												</tr>
											</table>
											
										</div>		
									</div>
									
																											
								</div>
								
							</div>
						</div>
					</div>
					<!-- 일반용 전력(갑)II : 고압A : 선택II 끝 -->
					
					
					<!-- 계절별, 시간대별 구분 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">계절별, 시간대별 구분</h6>
									
								</div>
							
								<div class="card-body">									
									<div class="row">
										<div class="col-xl-12">
											<table class="table-hover org-table-bordered org-table-style">
												<tr class="org-table-title-usage">
													<th> 계절 </th>
													
													<th>경부하</th>
													<th>중간부하</th>
													<th>최대부하</th>
												</tr>
												
												<tr>
													<td>
														여름 <br>
														(6, 7, 8)
													</td>
													<td>
														23:00 ~ 09:00
													</td>
													<td>
														09:00 ~ 10:00 <br>
														12:00 ~ 13:00 <br>
														17:00 ~ 23:00 
													</td>
													<td>
														10:00 ~ 12:00 <br>
														13:00 ~ 17:00
													</td>
													
												</tr>
												
												<tr>
													<td> 
														봄 / 가을 <br>
														(3, 4, 5, 9, 10)
													</td>
													<td>
														23:00 ~ 09:00
													</td>
													<td>
														09:00 ~ 10:00 <br>
														12:00 ~ 13:00 <br>
														17:00 ~ 23:00
													</td>
													<td>
														10:00 ~ 12:00 <br>
														13:00 ~ 17:00
													</td>
													
												</tr>
												
												<tr>
													<td>
														겨울 <br>
														(11, 12, 1, 2)
													</td>
													<td>
														23:00 ~ 09:00
													</td>
													<td>
														09:00 ~ 10:00 <br>
														12:00 ~ 17:00 <br>
														20:00 ~ 22:00
													</td>
													<td>
														10:00 ~ 12:00 <br>
														17:00 ~ 20:00 <br>
														22:00 ~ 23:00
													</td>
													
												</tr>
											</table>
											
										</div>	
									</div>
									
								</div>
								
							</div>
						</div>
					</div>					
					<!-- 계절별, 시간대별 구분 끝 -->
					
					<!-- 내용 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									
									<div class="lightbulb-img-style">
										<i class="far fa-lightbulb"></i>
									</div>
									
									<div class="lightbulb-text-style">
										
										<div>2019년 7월 1일 시행</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 내용 끝 -->

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
