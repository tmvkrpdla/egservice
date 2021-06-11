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
	<title>계측기별 사용량 - 시간대 다중 비교</title>
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<style>


	</style>
<c:if test="${not empty sessionScope.ADMIN }">		
	<script type="text/javascript">
	$(function(){
		enernet.modules.evt.makeDateY("usage_month");
		
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
									<span class="mb-0 text-gray-800 page-heading-title">시간대별 다중 분석</span> 
									
									&nbsp &nbsp &nbsp
									
									
									<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 계측기별 사용량 분석 > 시간대별 다중 분석</span>
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
									<div style="width:100px;float:left;">
										<span style="display: inline-block;height: 21px;"></span>계측기 선택
									</div>
									
									<div style="width:200px;float:left;">
										<select id="" class="custom-select custom-select-sm" style="width:190px;">
											<option>1</option>
											<option>2</option>
										</select>
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
					
					<!-- row text -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								
								<div class="card-body">
								
									<div class="lightbulb-img-style">
										<i class="far fa-lightbulb"></i>
									</div>
									
									<div class="lightbulb-text-style">
										- 비오는 날 근무일과 맑은 날 근무일을 비교해 보세요! <br> 
										- 여름철 평균과 겨울철 평균을 비교해 보세요! <br> 
										- 지난해 여름철 평균을 올해 여름철 평균과 비교해 보세요! <br>
									</div>
								
								</div>
							</div>
						</div>
					</div>
					<!-- row text end -->
									
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
