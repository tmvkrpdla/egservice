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
	<title>절감 계획 새로 만들기 사용 방법</title>
	
	<jsp:include page="../../common/common.jsp"></jsp:include>
	
		<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
			<link href="${pageContext.request.contextPath}/resources/vendor/swiper/css/swiper-bundle.css" rel="stylesheet">
			<script src="${pageContext.request.contextPath}/resources/vendor/swiper/js/swiper-bundle.js"></script>
		</c:if>
	
		<c:if test="${sessionScope.BROWSER eq 'MSIE' }">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.css">
			<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>
		</c:if>
	
	<c:if test="${not empty sessionScope}">	
	
		
	<script src="${pageContext.request.contextPath}/resources/admin/bld/elec/js/bldElecPopHelpful.js"></script>


<style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    
	hr.dashed{
		border-top : 1px dashed grey;
	}
	 
  
</style>
	
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
	
		<!-- Slider main container -->
		<div class="swiper-container">
		    <!-- Additional required wrapper -->
		    <div class="swiper-wrapper" >
		    
		        <!--	slide1	-->
		        <div class="swiper-slide">
		        	<div style="overflow: auto; height: 96%; width:96%;">
		        		<div style="margin-top:30px;">Step 1. 절감 계획 명칭 작성</div>
					    
						<div style="margin-top:30px;">
							<img style="width:95%;" src="<c:out value='${pageContext.request.contextPath}/resources/images/bldElecHelpful/elec_0001.jpg'/>">
						</div>

						<div style="margin-top : 30px;margin-left:60px;margin-right : 60px; text-align: left;">
							
							<p> ① `절감 계획 명칭`을 작성합니다 </p>
							<p> ② `절감 기준 선택` 버튼을 누르면 `절감 기준 목록` 팝업창이 활성화 됩니다 </p>
							
						</div>
				  </div>
		        
		        	
		        </div>
		        <!--	slide1	-->
		        
		        
		        <!--	slide2	-->
		        <div class="swiper-slide">
		        
		        	<div style="overflow: auto; height: 96%; width:96%;">
		        		
		        		<div style="margin-top:30px;">Step 2. 절감 기준 추가</div>
		        		
		        		
		        		<div style="margin-top:30px;">
		        			<img  style="width:95%;" src="<c:out value='${pageContext.request.contextPath}/resources/images/bldElecHelpful/elec_0002.jpg'/>">
		        		</div>
		        		
		        		<div style="margin-top : 30px;margin-left:60px;margin-right : 60px; text-align: left;">
							
							<p> ① `추가` 버튼을 누르면 `절감 기준 만들기` 팝업창이 활성화 됩니다 </p>
							
						</div>
		        	</div>
		        </div>
		        <!--	slide2	-->
		        
		        
		        <!--	slide3	-->
		        <div class="swiper-slide">
		        	<div style="overflow: auto; height: 96%; width:96%;">
		        		<div style="margin-top:30px;">Step 3. 절감 기준 만들기</div>
		        		
			        		<div style="margin-top:30px;">
			        			<img  style="width:95%;" src="<c:out value='${pageContext.request.contextPath}/resources/images/bldElecHelpful/elec_0003_0001.jpg'/>">
			        		</div>
			        		
			        		<hr class="dashed"/>
			        		
			        		<div style="margin-top:30px;">
			        			<img  style="width:95%;" src="<c:out value='${pageContext.request.contextPath}/resources/images/bldElecHelpful/elec_0003_0002.jpg'/>">
			        		</div>
			        		
			        		<div style="margin-top : 30px;margin-left:60px;margin-right : 60px; text-align: left;">
								
								<p>
									① `절감 기준 명칭`을 작성합니다
							    </p>
								<p> 
									② `절감 기준 설명`을 작성합니다  
								</p>
								<p> 
									③ `기간 설정 시작일과 종료일`을 작성합니다 
								</p>
								<p> 
									④ `조회`버튼을 누르면  절감 기준 요약, 전체 사용량 및 사용 요금, 계측기별 사용량 및 사용 요금 등을 확인 할 수 있습니다 
								</p>
								
								<p> 
									⑤ `저장`버튼을 누르면, `절감 기준 만들기`팝업 창이 닫히고 `절감 기준 목록`화면으로 돌아갑니다 
								</p>
								
							</div>
		        		
		        		
		        	</div>
		        </div>
		        <!--	slide3	-->
		        
		        
		        <!--	slide4	-->
		        <div class="swiper-slide">
		        	<div style="overflow: auto; height: 96%; width:96%;">
		        		<div style="margin-top:30px;">Step 4. 절감 기준 선택</div>
		        		
		        		<div style="margin-top:30px;">
			        		<img  style="width:95%;" src="<c:out value='${pageContext.request.contextPath}/resources/images/bldElecHelpful/elec_0004.jpg'/>">
			        	</div>
			        	
			        	<div style="margin-top : 30px;margin-left:60px;margin-right : 60px; text-align: left;">
								
							<p>
								① 작성한 절감 기준을 선택 합니다
						    </p>
							<p> 
								② 선택하기 버튼을 누르면, `절감 기준 목록` 팝업창이 닫히며, `절감 계획 새로 만들기`화면으로 돌아갑니다   
							</p>
								
						</div>
		        		
		        	</div>
		        </div>
		        <!--	slide4	-->
		        
		        
		        <!--	slide5	-->
		        <div class="swiper-slide">
		        	<div style="overflow: auto; height: 96%; width:96%;">
		        		<div style="margin-top:30px;">Step 5. 절감 목표 추가 및 시행</div>
		        		
		        		<div style="margin-top:30px;">
			        		<img  style="width:95%;" src="<c:out value='${pageContext.request.contextPath}/resources/images/bldElecHelpful/elec_0005_0001.jpg'/>">
			        	</div>
			        	
			        	<hr class="dashed"/>
			        	
			        	<div style="margin-top:30px;">
			        		<img  style="width:95%;" src="<c:out value='${pageContext.request.contextPath}/resources/images/bldElecHelpful/elec_0005_0002.jpg'/>">
			        	</div>
			        	
			        	<div style="margin-top : 30px;margin-left:60px;margin-right : 60px; text-align: left;">
								
							<p>
								① `계측기, 시간, 백분율`을 선택합니다
						    </p>
							<p> 
								② `+` 버튼을 누르면, `절감 목표 목록`에 리스트가 추가 됩니다 <br>
								절감 예상 요약, 계측기별 절감 예상, 전체 계측기 사용량 및 사용 요금 등을 확인 할 수 있습니다
							</p>
							<p> 
								③ `절감계획 시행`버튼을 누르면 절감계획이 활성화 되며, 일간 절감 성과, 기간별 절감 성과, 계측기별 절감 성과를 확인할 수 있습니다
							</p>
							
								
						</div>
		        		
		        	</div>	
		        </div>
		        <!--	slide5	-->
		      
		    </div>
		    <!-- If we need pagination -->
		    <div class="swiper-pagination"></div>
		
		    <!-- If we need navigation buttons -->
		    <div class="swiper-button-prev"></div>
		    <div class="swiper-button-next"></div>
		
		    <!-- If we need scrollbar -->
		    <div class="swiper-scrollbar"></div>
		</div>
	
	
	
	
	
	</c:if>
</body>

</html>
