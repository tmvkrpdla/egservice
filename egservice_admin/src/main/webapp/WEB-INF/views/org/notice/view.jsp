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
	<title>공지사항 작성</title>
	
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
	<c:if test="${not empty sessionScope}">
	<script type="text/javascript" src="<c:url value='../resources/vendor/ckeditor/ckeditor.js'/>"></script>
	<script type="text/javascript" src="<c:url value='../resources/vendor/ckeditor/ckFileUpload-custom.js'/>"></script>
	<script type="text/javascript" src="<c:url value='../resources/admin/apt/js/aptNoticeWrite.js'/>"></script>
	</c:if>
		
	
	<script type="text/javascript">

	
	/*
	//	fileupload
	
	$(function(){
		$("#fileUploadBtn").on('change', function(){
			fileUpload(this)
		});
		
		
	});
	
	function delFile(that){
		$(that).parent('div').remove();		
	}
	  
    function fileUpload(that) {
     
      var _formData = new FormData();
      _formData.append("file", that.files[0]);
      
      
     $.ajax({
    	 type : "post",
    	 url : "../file/uploadAjax",
    	 data : _formData,
    	 processData: false, 
    	 contentType: false,
    	 beforeSend : function(){
    		 $('.wrap-loading').removeClass('display-none');
    	 },
    	 success : function(response){
    		// console.log(2)
    		
  			//datePath: "2020/05/13"
  			//fileName: "1589350133516.pptx"
      		//oriFileName: "EG_기획_건물_구청_Web_2020_04_07_a.pptx"
      		//realFullPath: "D:\kepco_safety\file\2020\05\13\1589350133516.pptx"
      		//realPath: "D:\kepco_safety\file\2020\05\13" 
      		
      		var _tag = "<div>";
      		_tag += response.result.oriFileName +" &nbsp&nbsp&nbsp <i class='far fa-trash-alt' style='cursor:pointer;' onclick=delFile(this)></i>";
      		_tag += "</div>";
      		
      		$("#fileList").append(_tag);
    	 },
    	 complete:function(){
    		  $('.wrap-loading').addClass('display-none');
    	 }
    	 ,error : function(e){
    		 console.log(e)
    	 }
      });
    }
  	*/

	
    </script>	
	
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
							<span class="mb-0 text-gray-800 page-heading-title">공지사항</span> 
								
							&nbsp &nbsp &nbsp
								
								
							<span class="page-heading-navi-span"><i class="fas fa-fw fa-home"></i> > 공지사항</span>  
						</div>
							
							
						<!-- 	
						<div class="page-heading-report-div" style="">
							<span class="page-heading-report-helper" style=""></span>
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 미리보기">
							<input type="button" id="" class="btn btn-outline-primary btn-sm" value="레포트 인쇄">
						</div>
						 -->
					</div>	
					<!-- contents -->

					<div class="row">
						
						<div class="col-lg-12 col-md-12">

							<form id="noticeWriteForm" name="noticeWriteForm" >
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">
										<div class="form-group">
											<label for="noticeTitle">제목</label>
											<input class="form-control form-control-solid" id="noticeTitle" name="noticeTitle" type="text" placeholder="">
										</div>
									
										
									</h6>
								</div>
								
								<!-- card-body start -->
								<div class="card-body">
									
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<textarea id="ckeditor" name="ntcContent"></textarea>
											
											
										</div>
									</div>

									<div class="row">
										<div class="col-sm-12 col-md-12">&nbsp</div>
									</div>
									
									<!-- <div class="row">
										<div class="col-sm-12 col-md-12">
									
											<table id="fileTable">
												<tr> 
													<td style="width:200px;"><label class=''>파일 첨부</label></td>
													<td>
														<label for="fileUploadBtn" class="btn btn-outline-primary btn-sm" style="cursor: pointer;">
															File &nbsp<i class="fas fa-upload"></i>
														</label>
														<input type="file" name="files" id="fileUploadBtn" style='width: 0px;'>
													</td>
												</tr>
											</table>
											
											<div id="fileList" style="height:100px;border: 0.5px dashed gray;overflow: auto; padding:15px;">
												
											</div>
											
										</div> 
										
									</div>
									-->
									
									<div class="row">
										<div class="col-sm-12 col-md-12">&nbsp</div>
									</div>

									<div class="row">
										<div class="col-sm-12 col-md-12" style='text-align: right;'>
											
											<input type="hidden" id="nowPage" name="nowPage" value="${nowPage}" readonly>
											
											
											<input type="button" id="noticeListBtn" name="" class="btn btn-outline-primary btn-sm" style="" value="목록"> 
											<input type="button" id="noticeSaveBtn" name="" class="btn btn-outline-primary btn-sm" style="" value="저장">
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
