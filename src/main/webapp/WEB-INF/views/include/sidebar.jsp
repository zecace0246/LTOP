<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<!-- [ navigation menu ] start -->
	<nav class="pcoded-navbar menupos-fixed menu-light ">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div " >
				<ul class="nav pcoded-inner-navbar ">
					<!-- li class="nav-item pcoded-menu-caption">
						<label>Navigation</label>
					</li-->
					<li class="nav-item pcoded-singlemenu" id="introMenu">
						<a href="#" data-url="/dashboardv1" class="nav-link "><span class="pcoded-micon"><i class="feather icon-home"></i></span>데쉬보드</a>
						<!-- ul class="pcoded-submenu">
							<li id="introSubMenu"><a href="#" data-url="/dashboardv1">Analytics</a></li>
							<li><a href="#" data-url="/dashboardv2">Sales</a></li>
						</ul-->
					</li>

					<li class="nav-item pcoded-singlemenu">
						<a href="#" data-url="/user" class="nav-link ">
							<span class="pcoded-micon"><i class="feather icon-users"></i></span>
							<span class="pcoded-mtext">사용자 모니터링</span>
						</a>
					</li>

					<li class="nav-item pcoded-singlemenu">
						<a href="#!"  data-url="/summary" class="nav-link ">
							<span class="pcoded-micon"><i class="feather icon-bar-chart-2"></i></span>
							<span class="pcoded-mtext">통계</span>
						</a>
					</li>
					<li class="nav-item pcoded-singlemenu">
						<a href="#" data-url="/alarm" class="nav-link ">
							<span class="pcoded-micon"><i class="feather icon-bell"></i></span>
							<span class="pcoded-mtext">알림</span>
						</a>
					</li>

					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-settings"></i></span><span class="pcoded-mtext">설정</span></a>
						<ul class="pcoded-submenu">
						    <li><a href="#" data-url="/menu5/sub3/agencyList">기관관리</a></li>
						    <li><a href="#" data-url="/menu5/sub5/groupList">그룹관리</a></li>
							<li><a href="#" data-url="/menu5/sub2/matList">매트관리</a></li>
							<li><a href="#" data-url="/menu5/sub1/userList">사용자관리</a></li>
						</ul>
					</li>

					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<!-- li class="nav-item pcoded-singlemenu">
						<a href="#" data-url="/board/boardList" class="nav-link ">
							<span class="pcoded-micon"><i class="feather icon-file-text"></i></span>
							<span class="pcoded-mtext">자유게시판 (샘플)</span>
						</a>
					</li-->
					</sec:authorize>

				</ul>


			</div>
		</div>
	</nav>
	<!-- [ navigation menu ] end -->