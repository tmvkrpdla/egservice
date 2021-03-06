<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	
	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- time form -->
	<%-- <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"> --%>
	
	<form class="d-none d-sm-inline-block">
		<div class="">
			<!-- <input type="text" class="form-control bg-light border-0 small" placeholder="" aria-label="Search" aria-describedby="basic-addon2" readonly> -->
			
			<span class='top-bar-font-size'>	
				${sessionScope.ADMIN.team_name }
			</span>
			
			<!-- <div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div> -->
		</div>
	</form>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">
		<!-- 시간 -->
		<li>
			<div style="display: block;padding: 0.5rem 1rem;" class='top-bar-font-size'>
				<span id="time-span" class='mr-2 d-lg-inline'></span>
				
			</div>		 
		</li>
		
		<div class="topbar-divider d-none d-sm-block"></div>
		
		<!-- 근무일 휴무일 -->
		<li>
			<div style="display: block;padding: 0.5rem;" class='top-bar-font-size'>
				<span id="" class='mr-2 d-lg-inline'>${TODAY_WEATHER.text_is_holiday}</span>
				
			</div>		 
		</li>
		
		<div class="topbar-divider d-none d-sm-block"></div>
		
		
		<li>
			<div style="display: block;padding: 0.5rem;" class='top-bar-font-size'>
			
				<span id="" class='mr-2 d-lg-inline'>
					<c:if test="${TODAY_WEATHER.weather_code < 0 }">
						날씨 : -
					</c:if>
					
					<c:if test="${TODAY_WEATHER.weather_code > 0  }">
					 	날씨 : <img src="${pageContext.request.contextPath}/${TODAY_WEATHER.text_weather_code}" style="width:20px;">
					 </c:if>
				</span>
				
				<span id="" class='mr-2 d-lg-inline'>
				
					<c:if test="${TODAY_WEATHER.temp < 0 }">
						 기온 : - 
					</c:if>
					
					<c:if test="${TODAY_WEATHER.temp > 0 }">
						기온 : <fmt:formatNumber pattern="#,###.00" value="${TODAY_WEATHER.temp}" />  ℃
					</c:if>
				</span>
			</div>
			
		</li>
		
	
		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow top-bar-font-size">
			
			<div style="display: block;padding: 0.5rem;"> 
				<span class="mr-2 d-lg-inline">${sessionScope.ADMIN.admin_name} (${sessionScope.ADMIN.admin_id}) 님
					<input type="hidden" id="seq_admin" value="${sessionScope.ADMIN.seq_admin}" readonly>
					
					<input type="hidden" id="team_type" value="${sessionScope.ADMIN.team_type}" readonly>
					<input type="hidden" id="seq_team" value="${sessionScope.ADMIN.seq_team}" readonly>
					
					<!-- 아파트 및 건물 관리자 인경우 -->
					<c:if test="${sessionScope.ADMIN.team_type eq 4 ||  sessionScope.ADMIN.team_type eq 3}">
					<input type="hidden" id="seq_site" value="${sessionScope.ADMIN.list_site[0].seq_site}" readonly>
					</c:if>
				</span> 
				
				<span class="logoutBtn" style="cursor:pointer;"> <i class="fas fa-sign-out-alt"></i></span>
			</div>
			<!-- </a> --> 
		</li>

	</ul>

</nav>
<!-- End of Topbar -->