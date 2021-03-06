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
	<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<!-- <input type="text" class="form-control bg-light border-0 small" placeholder="" aria-label="Search" aria-describedby="basic-addon2" readonly> -->
			
			<span class=''>	
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
		
		
		<!-- 날씨 기온 -->
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

		<!-- <div class="topbar-divider d-none d-sm-block"></div> -->

		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow top-bar-font-size">
			<!-- <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="" aria-haspopup="" aria-expanded=""> -->
			<div style="display: block;padding: 0.5rem 1rem;"> 
				<span class="mr-2 d-lg-inline">${sessionScope.ADMIN.admin_name} (${sessionScope.ADMIN.admin_id}) 님
					<input type="hidden" id="seq_admin" value="${sessionScope.ADMIN.seq_admin}" readonly>
					
					<input type="hidden" id="team_type" value="${sessionScope.ADMIN.team_type}" readonly>
					<input type="hidden" id="seq_team" value="${sessionScope.ADMIN.seq_team}" readonly>
					
				</span> 
				
				<!-- <span class="logoutBtn" style="cursor:pointer;"> <i class="fas fa-sign-out-alt"></i></span> -->
			</div>
			<!-- </a> --> 
		</li>

	</ul>

</nav>
<!-- End of Topbar -->