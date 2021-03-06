<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

	<form>
		<input type="hidden" id="mainMenu" value="${mainMenu}">
		<input type="hidden" id="subMenu" value="${subMenu}">
		<input type="hidden" id="BROWSER" value="${sessionScope.BROWSER}">
	</form>



<!-- Sidebar -->
<!-- <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled" id="accordionSidebar"> -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

<!-- 구청 -->
	<c:if test="${sessionScope.ADMIN.team_type eq '2' }">
	
		<c:if test="${sessionScope.BROWSER eq 'MSIE' }">
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='../org/home'/>" id="logo"
				 style="background-image: url('../resources/images/geumcheongu_logo_ie.jpg'); background-repeat: no-repeat; background-size:224px;">
			</a>
		</c:if>
		
		<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='../org/home'/>" id="logo"
				 style="background-image: url('../resources/images/geumcheongu_logo.jpg'); background-repeat: no-repeat; background-size:224px;">
			</a>
		</c:if>
	
	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Home -->
	<li class="nav-item org-home" id=''>
		<a class="nav-link" href="<c:url value='../org/home'/> "> 
			<i class="fas fa-fw fa-home"></i> 
			<span> 홈 </span>
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<li class="nav-item org-usage">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#org-usage" aria-expanded="true" aria-controls="constructionManagement"> 
			<i class="fas fa-chart-bar"></i>
			<span> 시설별 사용량 분석 </span>
		</a>
		<div id="org-usage" class="collapse show" aria-labelledby="headingConstructionManagement" data-parent="#accordionSidebar">
			<div class="py-2 collapse-inner rounded">
				<a id="sub-day"  class="collapse-item collapse-item-white" href="<c:url value='../org/usageDay' />">시간대별 분석</a> 
				<a id="sub-month" class="collapse-item collapse-item-white" href="<c:url value='../org/usageMonth' />">날짜별 분석</a>
				<a id="sub-week" class="collapse-item collapse-item-white" href="<c:url value='../org/usageWeek' />">요일별 분석</a>
				<a id="sub-year" class="collapse-item collapse-item-white" href="<c:url value='../org/usageYear' />">월별 분석</a>
			</div>
		</div>
	</li>
	
	
	<%-- <li class="nav-item org-notice">
		<a class="nav-link" href="<c:url value='../org/noticeList' />"> 
			<i class="far fa-list-alt"></i>
			<span> 공지사항 </span>
		</a>
	</li> --%>
	
	<li class="nav-item org-dashboard">
		<a class="nav-link" href="#" id="org-dashbaord"> 
			<i class="fas fa-tachometer-alt"></i>
			<span> Dashboard </span>
			
		</a>
	</li>
	
	<form name="orgDashboardForm" action="<c:url value='../org/dashboard'/>">
		<input type="hidden">
	</form>

	<!-- Nav Item - 공지사항 -->
	<%-- <li class="nav-item main-ntc">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#main-ntc" aria-expanded="true" aria-controls="side-ntc"> 
			<i class="fas fa-fw fa-clipboard-list"></i>
			<span>공지사항</span>
		</a>
		
		<div id="main-ntc" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a id="sub-ntc" class="collapse-item" href="<c:url value='../ntc/ntcList' />">공지사항</a> 
				<a id="sub-faq" class="collapse-item" href="">FAQ</a> 
				<a id="sub-re" class="collapse-item" href="">설문</a>
			</div>
		</div></li> --%>

	<!-- Nav Item - System -->
	<%-- <li class="nav-item">
		<a class="nav-link" href="charts.html"> 
			<i class="fas fa-fw fa-tools"></i> 
			<span>시스템</span>
		</a>
	</li> --%>
	</c:if>
	
	<!-- 아파트 관리자 : 3 -->
	<c:if test="${sessionScope.ADMIN.team_type eq '3' }"> 
				
		<c:if test="${sessionScope.BROWSER eq 'MSIE' }">
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='../apt/home'/>" id="logo"
				 style="background-image: url('../resources/images/geumcheongu_logo_ie.jpg'); background-repeat: no-repeat; background-size:224px;">
			</a>
		</c:if>
		
		<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='../apt/home'/>" id="logo"
				 style="background-image: url('../resources/images/geumcheongu_logo.jpg'); background-repeat: no-repeat; background-size:224px;">
			</a>
		</c:if>
		
		<hr class="sidebar-divider my-0">
		
		<li class="nav-item apt-home" id=''>
			<a class="nav-link" href="<c:url value='../apt/home'/> "> 
				<i class="fas fa-fw fa-home"></i> 
				<span> 홈 </span>
			</a>
		</li>
		
		<hr class="sidebar-divider my-0">
		
		<li class="nav-item apt-usage">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#apt-usage" aria-expanded="true" aria-controls="constructionManagement"> 
				<i class="fas fa-chart-bar"></i>
				<span> 세대간 사용량 비교 </span>
			</a>
			<div id="apt-usage" class="collapse show" aria-labelledby="headingConstructionManagement" data-parent="#accordionSidebar">
				<div class="py-2 collapse-inner rounded">
					 
					<a id="sub-day" class="collapse-item collapse-item-white" href="<c:url value='../apt/usageDay' />">날짜별 사용량 비교</a>
					<a id="sub-month" class="collapse-item collapse-item-white" href="<c:url value='../apt/usageMonth' />">월별 사용량 비교</a>
					
				</div>
			</div>
		</li>
		
		<li class="nav-item apt-member">
			<a class="nav-link" href="<c:url value='../apt/memberList'/> "> 
				<i class="fas fa-address-card"></i>
				<span>세대 정보</span>
			</a>
		</li>
		
		
		<li class="nav-item apt-ntc" id=''>
			<a class="nav-link" href="<c:url value='../apt/ntcList'/> "> 
				<i class="fas fa-fw fa-clipboard-list"></i>
				<span>공지사항</span>
			</a>
		</li>
	</c:if>
	
	<!-- 건물관리자 : 4 -->
	<c:if test="${sessionScope.ADMIN.team_type eq '4' }">
	
		<c:if test="${sessionScope.BROWSER eq 'MSIE' }">
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='../bld/home'/>" id="logo"
				 style="background-image: url('../resources/images/geumcheongu_logo_ie.jpg'); background-repeat: no-repeat; background-size:224px;">
			</a>
		</c:if>
		
		<c:if test="${sessionScope.BROWSER ne 'MSIE' }">
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='../bld/home'/>" id="logo"
				 style="background-image: url('../resources/images/geumcheongu_logo.jpg'); background-repeat: no-repeat; background-size:224px;">
			</a>
		</c:if>
	
		<%-- <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='../bld/home'/>" id="logo"
		 style="background-image: url('../resources/images/geumcheongu_logo.jpg'); background-repeat: no-repeat; background-size:224px;">
		</a>
		 --%>
		<hr class="sidebar-divider my-0">
		
		<li class="nav-item bld-home" id=''>
			<a class="nav-link" href="<c:url value='../bld/home'/> "> 
				<i class="fas fa-fw fa-home"></i> 
				<span> 홈 </span>
			</a>
		</li>
		
		<hr class="sidebar-divider my-0">
		
		<%-- <li class="nav-item bld-usage" id=''>
			<a class="nav-link" href="<c:url value='../bld/usage'/> "> 
				<i class="fas fa-chart-bar"></i>
				<span> 사용량 분석 </span>
			</a>
		</li> --%>
		
		<li class="nav-item bld-comp">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#bld-comp" aria-expanded="true" aria-controls="constructionManagement"> 
				<i class="fas fa-chart-bar"></i>
				<span> 계측기간 사용량 비교 </span>
			</a>
			<div id="bld-comp" class="collapse show" aria-labelledby="headingConstructionManagement" data-parent="#accordionSidebar">
				<div class="py-2 collapse-inner rounded">
					<a id="sub-day"  class="collapse-item collapse-item-white" href="<c:url value='../bld/compDay' />">시간대별 비교</a> 
					<a id="sub-month" class="collapse-item collapse-item-white" href="<c:url value='../bld/compMonth' />">날짜별 비교</a>
					<a id="sub-week" class="collapse-item collapse-item-white" href="<c:url value='../bld/compWeek' />">요일별 비교</a>
					<a id="sub-year" class="collapse-item collapse-item-white" href="<c:url value='../bld/compYear' />">월별 비교</a>
				</div>
			</div>
		</li>
		
		<li class="nav-item bld-meter">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#bld-meter" aria-expanded="true" aria-controls="constructionManagement"> 
				<i class="fas fa-chart-line"></i>
				<span> 계측기별 사용량 분석 </span>
			</a>
			<div id="bld-meter" class="collapse show" aria-labelledby="headingConstructionManagement" data-parent="#accordionSidebar">
				<div class="py-2 collapse-inner rounded">
					<%-- <a id="sub-meter-time"  class="collapse-item collapse-item-white" href="<c:url value='../bld/meterTime' />">시간대별 분석</a> 
					<a id="sub-meter-comptime" class="collapse-item collapse-item-white" href="<c:url value='../bld/meterCompTime' />">시간대별 다중 분석</a>
					<a id="sub-meter-week" class="collapse-item collapse-item-white" href="<c:url value='../bld/meterWeek' />">날짜별 분석</a>
					<a id="sub-meter-month" class="collapse-item collapse-item-white" href="<c:url value='../bld/meterMonth' />">요일별 분석</a> --%>
					<a id="sub-weekly" class="collapse-item collapse-item-white" href="<c:url value='../bld/meterWeekly' />">주간 비교 분석</a>
				</div>
			</div>
		</li>
		
		<li class="nav-item bld-elec">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#bld-elec" aria-expanded="true" aria-controls="constructionManagement"> 
				<i class="fab fa-elementor"></i>
				<span>전기요금 절감하기</span>
			</a>
			<div id="bld-elec" class="collapse show" aria-labelledby="headingConstructionManagement" data-parent="#accordionSidebar">
				<div class="py-2 collapse-inner rounded">
					<a id="sub-term"		class="collapse-item collapse-item-white" href="<c:url value='../bld/elecTerm' />">절감 계획 용어</a>
					<a id="sub-daily"		class="collapse-item collapse-item-white" href="<c:url value='../bld/elecDaily' />">일간 절감 성과 보기</a> 
					<a id="sub-date"		class="collapse-item collapse-item-white" href="<c:url value='../bld/elecDate' />">기간별 절감 성과 보기</a>
					<a id="sub-meter"		class="collapse-item collapse-item-white" href="<c:url value='../bld/elecMeter' />">계측기별 절감 성과 보기</a>
					<a id="sub-planWrite"	class="collapse-item collapse-item-white" href="<c:url value='../bld/elecPlanWriteCheck' />">절감 계획 새로 만들기</a>
					<a id="sub-planList"	class="collapse-item collapse-item-white" href="<c:url value='../bld/elecPlanList' />">절감 계획 목록 조회</a>
					<a id="sub-ratesTable"	class="collapse-item collapse-item-white" href="<c:url value='../bld/elecRatesTable' />">전기 요금표</a>
				</div>
			</div>
		</li>
		
		<%-- <li class="nav-item bld-notice" id=''>
			<a class="nav-link" href="<c:url value='../bld/noticeList'/> "> 
				<i class="far fa-list-alt"></i>
				<span> 공지사항 </span>
			</a>
		</li> --%>
		
		<%-- <li class="nav-item bld-alarm" id=''>
			<a class="nav-link" href="<c:url value='../bld/setAlarm'/> "> 
				<i class="fas fa-cogs"></i>
				<span> 설정 </span>
			</a>
		</li> --%>
	</c:if>
	
	

	
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
<!-- End of Sidebar -->