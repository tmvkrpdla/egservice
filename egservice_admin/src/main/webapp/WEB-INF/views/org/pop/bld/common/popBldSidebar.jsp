<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

	<form>
	
		<input type="hidden" id="mainMenu" value="${mainMenu}">
		<input type="hidden" id="subMenu" value="${subMenu}">
		
	</form>



<!-- Sidebar -->
<!-- <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled" id="accordionSidebar"> -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

	
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='../pop/bldHome'/>" id="logo"
		 style="background-image: url('../../resources/images/geumcheongu_logo.jpg'); background-repeat: no-repeat; background-size:224px;">
		</a>
		
		<hr class="sidebar-divider my-0">
		
		<li class="nav-item bld-home" id='bld-home'>
			<a class="nav-link" href="<c:url value='../pop/bldHome'/> "> 
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
					<a id="sub-day"  class="collapse-item collapse-item-white" href="<c:url value='../pop/bldCompDay' />">시간대별 비교</a> 
					<a id="sub-month" class="collapse-item collapse-item-white" href="<c:url value='../pop/bldCompMonth' />">날짜별 비교</a>
					<a id="sub-week" class="collapse-item collapse-item-white" href="<c:url value='../pop/bldCompWeek' />">요일별 비교</a>
					<a id="sub-year" class="collapse-item collapse-item-white" href="<c:url value='../pop/bldCompYear' />">월별 비교</a>
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
					<%-- <a id="sub-meter-time"  class="collapse-item collapse-item-white" href="<c:url value='../pop/bldMeterTime' />">시간대별 분석</a>  --%>
					<%-- <a id="sub-meter-comptime" class="collapse-item collapse-item-white" href="<c:url value='../pop/bldMeterCompTime' />">시간대별 다중 분석</a> --%>
					<%-- <a id="sub-meter-week" class="collapse-item collapse-item-white" href="<c:url value='../pop/bldMeterWeek' />">날짜별 분석</a> --%>
					<%-- <a id="sub-meter-month" class="collapse-item collapse-item-white" href="<c:url value='../pop/bldMeterMonth' />">요일별 분석</a> --%>
					<a id="sub-weekly" class="collapse-item collapse-item-white" href="<c:url value='../pop/bldMeterWeekly' />">주간 비교 분석</a>
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
		</li>
	 --%>

	
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
<!-- End of Sidebar -->