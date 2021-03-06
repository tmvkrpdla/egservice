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
	<title>계측기별 사용량 분석 - 시간대별 분석</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>

	<c:if test="${not empty sessionScope.ADMIN }">		
<script type="text/javascript">
$(function(){
	enernet.modules.evt.makeDateYMD("usage_time");
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
									<span class="mb-0 text-gray-800 page-heading-title">시간대별 분석</span> 
									
									&nbsp &nbsp &nbsp
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 계측기별 사용량 분석 > 시간대별 분석</span>
								</div>
							
								<div class="page-heading-report-div" style="">
									<span class="page-heading-report-helper" style=""></span>
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
									<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
								</div>
							</div>			
						</div>
					</div>
					
					
									
					<!-- 검색 -->
					<div class="row">
					
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
																		
										<form id="" name="" method="get" action="<c:url value=''/>">
											<div style="width:200px;float:left;">
												<select id="" class="custom-select custom-select-sm" style="width:190px;">
													<option>1</option>
													<option>2</option>
												</select>
											</div>
											
											<div style="width:200px;float:left;">
												<input class="custom-date custom-date-sm" id="usage_time" name="usage_time" type="text" style="width:95%;">
											</div>
											
											<div style="width:15%;float:left;">
												<input type="button" id="" class="btn btn-outline-primary btn-sm" value="조회">	
											</div>
										</form>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 검색 끝 -->
					
					<!-- 계측기 정보 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">계측기 정보</h6>
								
								</div>
							
								<div class="card-body">
									<div class="row">
									
										<div class="col-lg-3 col-sm-6">
											명칭 | 정화조
										</div>
										<div class="col-lg-3 col-sm-6">
											MID | 21831412
										</div>
										<div class="col-lg-3 col-sm-6">
											차단기 규격 | 150A
										</div>
										<div class="col-lg-3 col-sm-6">
											CT 규격 | 50A
										</div>
									</div>
									
									
									<div class="row">
										<div class="col-lg-3 col-sm-6">
											NID | ENN202
										</div>
										<div class="col-lg-3 col-sm-6">
											모뎀 MAC | 24:53:BF:01:00:59 
										</div>
										<div class="col-lg-6 col-sm-12">
											MTU MAC | 24:BF:01:00:58 
										</div>
										<div class="col-lg-6 col-sm-12">
											설명 | 정화조 펌프, 지하 1층 전기실에 설치 됨 
										</div>
										
									</div>
									
								</div>
								
							</div>
						</div>
					</div>
					<!-- 계측기 정보 끝 -->
					
					<!-- text -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="lightbulb-img-style">
										<i class="far fa-lightbulb"></i>
									</div>
									
									<div class="lightbulb-text-style"> 
										- 근무일 평균보다 월등히 많은 사용량이 있으면 원인을 찾아보세요. <br>
										- 해당 날짜의 복지관 특별 프로그램 진행 여부  <br> 
										- 휴무일 인 경우 낭비되는 전기가 있는지 살펴보세요. <br>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- text 끝 -->
					
					<!-- 차트 -->
					<div class="row">
						<div class="col-lg-12">
							
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary"> 2020-04-04 날씨 : 맑음</h6>
								</div>
								<div class="card-body">
									1
								</div>
								
								<div class="card-body">
									<i class="fas fa-star-of-life"></i> 30일 평균(근무일) : 선택한 날로 부터 30일 이전의 사용량에서 근무일의 사용량 평균입니다.
								</div>
									
							</div>
						</div>
					</div>
					<!-- 차트 -->
					
					<!-- 30일 평균 사용량  -->
					<div class="row"> 
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-body">
																		
									<div class="row">
									
										<!-- table 1 -->
										<div class="col-lg-6">
											<table class="table-hover org-table-bordered org-table-style" width="100%" cellspacing="0" role="grid" aria-describedby="" style="width: 100%;">
												<tr>
													<td rowspan='2' width="15%">시간</td>
													<td rowspan='2' width="25%">사용량</td>
													<td colspan='2' width="60%">30일 평균 사용량</td>
												</tr>
												<tr>
													<td>근무일</td>
													<td>휴무일</td>
												</tr>
											</table>	
										</div>
										<!-- table 1 end -->
										
										<!-- table 2 -->
										<div class="col-lg-6">
											<table class="table-hover org-table-bordered org-table-style" width="100%" cellspacing="0" role="grid" aria-describedby="" style="width: 100%;">
												<tr>
													<td rowspan='2' width="15%">시간</td>
													<td rowspan='2' width="25%">사용량</td>
													<td colspan='2' width="60%">30일 평균 사용량</td>
												</tr>
												<tr>
													<td>근무일</td>
													<td>휴무일</td>
												</tr>
											</table>	
										</div>
										<!-- table 2 end -->
										
									</div>
									
								</div>
							</div>
						</div>
					</div>
					<!-- 30일 평균 사용량 끝 -->
						

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
