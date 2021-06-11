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
	<title>세대 정보</title>
	
	
	<jsp:include page="../../../../common/common.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/admin/org/pop/apt/common/js/popAptSidebar.js"></script>
	
	<c:if test="${not empty sessionScope}">
	
	</c:if>
	
</head>

<body id="page-top" oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<c:if test="${empty sessionScope.ADMIN}">
		<jsp:include page="../../../../common/emptySession.jsp"></jsp:include>		
	</c:if>

	<c:if test="${not empty sessionScope.ADMIN}">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="../common/popAptSidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="../common/popAptTopbar.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="mb-4 page-heading-div">
						
						<div class="page-heading-title-div">
							<span class="mb-0 text-gray-800 page-heading-title">세대 정보</span> 
								
							&nbsp; &nbsp; &nbsp;
								
								
							<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 세대 정보</span> 
						</div>
							
							
							
						<div class="page-heading-report-div" style="">
							<span class="page-heading-report-helper" style=""></span>
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
						</div>
						
					</div>


					<!-- contents -->
					<div class="card shadow mb-4">
						<!-- <div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">DataTables
								Example</h6>
						</div> -->
						<div class="card-body">
							<div class="table-responsive">
								<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
									
									<div class="row">
										<div class="col-sm-12">
											<table class="table table-bordered table-hover dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;text-align: center;">
												<thead>
													<tr>
														<td width="5%">동</td>
														<td width="5%">호</td>
														<td width="10%">세대주</td>
														<td width="15%">전화번호</td>
														<td width="15%">입주시기</td>
														<td width="15%">MID</td>
														<td width="15%">세대주 App ID</td>
														<td width="20%">최근 로그인</td>
													</tr>
												</thead>
												
												<tbody>
													<c:forEach items="${LIST_MEMBER}" var="LIST_MEMBER">
														<tr>
															<td>${LIST_MEMBER.dong_name}</td>
															
															<td>${LIST_MEMBER.ho_name}</td>
															
															<td>
																<c:if test="${LIST_MEMBER.candidate_name eq null}">
																	-
																</c:if>
																<c:if test="${LIST_MEMBER.candidate_name ne null}">
																	${LIST_MEMBER.candidate_name}
																</c:if>
															</td>
															
															<td>
																<c:if test="${LIST_MEMBER.candidate_phone eq null}">
																	-
																</c:if>
																
																<c:if test="${LIST_MEMBER.candidate_phone ne null}">
																	<c:set value="${LIST_MEMBER.candidate_phone}" var="CANDIDATE_PHONE"/>
																	
																	<c:out value="${fn:substring(CANDIDATE_PHONE, 0, 3)}-${fn:substring(CANDIDATE_PHONE, 3, 7)}-${fn:substring(CANDIDATE_PHONE, 7, fn:length(CANDIDATE_PHONE))}"/>
																	
																</c:if>
															</td>
															
															
															<td> - </td>
															
															<td>
																<c:if test="${LIST_MEMBER.mid eq null}">
																	-
																</c:if>
																
																<c:if test="${LIST_MEMBER.mid ne null}">
																	${LIST_MEMBER.mid}
																</c:if>
															</td>
															
															<td>
																<c:if test="${LIST_MEMBER.member_id eq null}">
																	-
																</c:if>
																
																<c:if test="${LIST_MEMBER.member_id ne null}">
																	${LIST_MEMBER.member_id}
																</c:if>
															
															</td>
															
															<td>
																<c:if test="${LIST_MEMBER.last_login eq null}">
																	-
																</c:if>
																
																<c:if test="${LIST_MEMBER.last_login ne null}">
																	<c:set value="${LIST_MEMBER.last_login}" var="LAST_LOGIN"/>
																	
																	<c:out value="${fn:substring(LAST_LOGIN, 0, 4)}-${fn:substring(LAST_LOGIN, 4, 6)}-${fn:substring(LAST_LOGIN, 6, 8)}"/> &nbsp;
																	<c:out value="${fn:substring(LAST_LOGIN, 8, 10)}:${fn:substring(LAST_LOGIN, 10, 12)}:${fn:substring(LAST_LOGIN, 12, 14)}"/> 
																	<%-- ${LIST_MEMBER.last_login} --%>
																</c:if>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									
								
									
									
								</div>
							</div>
						</div>
						<!-- end of card-body -->
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->

			<jsp:include page="../../../../common/footer.jsp"></jsp:include>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	


	<!-- Scroll to Top Button-->
	<!-- Logout Modal-->
	<%-- util.jsp : logout/scroll top.. --%>
	<jsp:include page="../../../../common/logout.jsp"></jsp:include>
	</c:if>	


</body>

</html>
