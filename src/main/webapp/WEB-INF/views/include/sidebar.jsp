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
							<li><a href="#" data-url="/menu5/sub2/matList">매트관리</a></li>
							<li><a href="#" data-url="/menu5/sub1/userList">사용자관리</a></li>
							<li><a href="#" data-url="/menu5/sub3/agencyList">기관관리</a></li>
							<li><a href="#" data-url="/menu5/sub5/groupList">그룹관리</a></li>
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

					<!--
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item pcoded-singlemenu"><a href="#" data-url="/member/memberList" class="nav-link "><span class="pcoded-micon"><i class="feather icon-users"></i></span><span class="pcoded-mtext">User</span></a>
					</sec:authorize>
					-->

					<!--
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-layout"></i></span><span class="pcoded-mtext">Page layouts</span></a>
						<ul class="pcoded-submenu">
							<li class="pcoded-hasmenu"><a href="#!">Vertical</a>
								<ul class="pcoded-submenu">
									<li><a href="layout-static.html" target="_blank">Static</a></li>
									<li><a href="layout-fixed.html" target="_blank">Fixed</a></li>
									<li><a href="layout-menu-fixed.html" target="_blank">Navbar fixed</a></li>
									<li><a href="layout-mini-menu.html" target="_blank">Collapse menu</a></li>
									<li><a href="layout-rtl.html" target="_blank">Vertical RTL</a></li>
								</ul>
							</li>
							<li><a href="layout-horizontal.html" target="_blank">Horizontal</a></li>
							<li><a href="layout-horizontal-2.html" target="_blank">Horizontal v2</a></li>
							<li><a href="layout-horizontal-rtl.html" target="_blank">Horizontal RTL</a></li>
							<li><a href="layout-box.html" target="_blank">Box layout</a></li>
							<li><a href="layout-light.html" target="_blank">Light layout</a></li>
							<li><a href="layout-dark.html" target="_blank">Dark layout <span class="pcoded-badge badge badge-danger">Hot</span></a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-layers"></i></span><span class="pcoded-mtext">Widget</span><span class="pcoded-badge badge badge-success">100+</span></a>
						<ul class="pcoded-submenu">
							<li><a href="widget-statistic.html">Statistic</a></li>
							<li><a href="widget-data.html">Data</a></li>
							<li><a href="widget-chart.html">Chart</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-users"></i></span><span class="pcoded-mtext">User</span></a>
						<ul class="pcoded-submenu">
							<li><a href="user-profile.html">Profile</a></li>
							<li><a href="user-card.html">User Card</a></li>
							<li><a href="user-list.html">User List</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-menu-caption">
						<label>UI Element</label>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-box"></i></span><span class="pcoded-mtext">Basic</span></a>
						<ul class="pcoded-submenu">
							<li><a href="bc_alert.html">Alert</a></li>
							<li><a href="bc_button.html">Button</a></li>
							<li><a href="bc_badges.html">Badges</a></li>
							<li><a href="bc_breadcrumb-pagination.html">Breadcrumb & paggination</a></li>
							<li><a href="bc_card.html">Cards</a></li>
							<li><a href="bc_collapse.html">Collapse</a></li>
							<li><a href="bc_carousel.html">Carousel</a></li>
							<li><a href="bc_grid.html">Grid system</a></li>
							<li><a href="bc_progress.html">Progress</a></li>
							<li><a href="bc_modal.html">Modal</a></li>
							<li><a href="bc_spinner.html">Spinner</a></li>
							<li><a href="bc_tabs.html">Tabs & pills</a></li>
							<li><a href="bc_typography.html">Typography</a></li>
							<li><a href="bc_tooltip-popover.html">Tooltip & popovers</a></li>
							<li><a href="bc_toasts.html">Toasts</a></li>
							<li><a href="bc_extra.html">Other</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-gitlab"></i></span><span class="pcoded-mtext">Advance</span></a>
						<ul class="pcoded-submenu">
							<li><a href="ac_alert.html">Sweet alert</a></li>
							<li><a href="ac-datepicker-componant.html">Datepicker</a></li>
							<li><a href="ac_lightbox.html">Lightbox</a></li>
							<li><a href="ac_notification.html">Notification</a></li>
							<li><a href="ac_pnotify.html">Pnotify</a></li>
							<li><a href="ac_rating.html">Rating</a></li>
							<li><a href="ac_rangeslider.html">Rangeslider</a></li>
							<li><a href="ac_syntax_highlighter.html">Syntax highlighter</a></li>
						</ul>
					</li>
					<li class="nav-item"><a href="animation.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-aperture"></i></span><span class="pcoded-mtext">Animations</span></a></li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-feather"></i></span><span class="pcoded-mtext">Icons</span></a>
						<ul class="pcoded-submenu">
							<li><a href="icon-feather.html">Feather</a></li>
							<li><a href="icon-fontawsome.html">Font Awesome 5</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-menu-caption">
						<label>Forms</label>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-file-text"></i></span><span class="pcoded-mtext">Forms</span></a>
						<ul class="pcoded-submenu">
							<li><a href="form_elements.html">Form elements</a></li>
							<li><a href="form-elements-advance.html">Form advance</a></li>
							<li><a href="form-validation.html">Form validation</a></li>
							<li><a href="form-masking.html">Form masking</a></li>
							<li><a href="form-wizard.html">Form wizard</a></li>
							<li><a href="form-picker.html">Form picker</a></li>
							<li><a href="form-select.html">Form select</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-menu-caption">
						<label>table</label>
					 	</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-align-justify"></i></span><span class="pcoded-mtext">Bootstrap table</span></a>
						<ul class="pcoded-submenu">
							<li><a href="tbl_bootstrap.html">Basic table</a></li>
							<li><a href="tbl_sizing.html">Sizing table</a></li>
							<li><a href="tbl_border.html">Border table</a></li>
							<li><a href="tbl_styling.html">Styling table</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-package"></i></span><span class="pcoded-mtext">Data table</span></a>
						<ul class="pcoded-submenu">
							<li><a href="dt_basic.html">Basic initialization</a></li>
							<li><a href="dt_advance.html">Advance initialization</a></li>
							<li><a href="dt_styling.html">Styling</a></li>
							<li><a href="dt_api.html">API</a></li>
							<li><a href="dt_plugin.html">Plug-in</a></li>
							<li><a href="dt_sources.html">Data sources</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-server"></i></span><span class="pcoded-mtext">DT extensions</span></a>
						<ul class="pcoded-submenu">
							<li><a href="dt_ext_autofill.html">Autofill</a></li>
							<li class="nav-item pcoded-hasmenu">
								<a href="#!" class="nav-link "><span class="pcoded-mtext">Button</span></a>
								<ul class="pcoded-submenu">
									<li><a href="dt_ext_basic_buttons.html">Basic button</a></li>
									<li><a href="dt_ext_export_buttons.html">Data export</a></li>
								</ul>
							</li>
							<li><a href="dt_ext_col_reorder.html">Col reorder</a></li>
							<li><a href="dt_ext_fixed_columns.html">Fixed columns</a></li>
							<li><a href="dt_ext_fixed_header.html">Fixed header</a></li>
							<li><a href="dt_ext_key_table.html">Key table</a></li>
							<li><a href="dt_ext_responsive.html">Responsive</a></li>
							<li><a href="dt_ext_row_reorder.html">Row reorder</a></li>
							<li><a href="dt_ext_scroller.html">Scroller</a></li>
							<li><a href="dt_ext_select.html">Select table</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-menu-caption">
						<label>Chart & Maps</label>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-pie-chart"></i></span><span class="pcoded-mtext">Chart</span></a>
						<ul class="pcoded-submenu">
							<li><a href="chart-apex.html">Apex Chart</a></li>
							<li><a href="chart-chartjs.html">Chart js</a></li>
							<li><a href="chart-highchart.html">Highchart</a></li>
							<li><a href="chart-knob.html">Knob</a></li>
							<li><a href="chart-peity.html">Peity</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-map"></i></span><span class="pcoded-mtext">Maps</span></a>
						<ul class="pcoded-submenu">
							<li><a href="map-google.html">Google</a></li>
							<li><a href="map-api.html">Gmap search API</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-menu-caption">
						<label>Pages</label>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-lock"></i></span><span class="pcoded-mtext">Authentication</span></a>
						<ul class="pcoded-submenu">
							<li><a href="auth-signup.html" target="_blank">Sign up</a></li>
							<li><a href="auth-signup-img-side.html" target="_blank">Sign up v2</a></li>
							<li><a href="auth-signin.html" target="_blank">Sign in</a></li>
							<li><a href="auth-signin-img-side.html" target="_blank">Sign in v2</a></li>
							<li><a href="auth-reset-password.html" target="_blank">Reset password</a></li>
							<li><a href="auth-reset-password-img-side.html" target="_blank">Reset password v2</a></li>
							<li><a href="auth-change-password.html" target="_blank">Change password</a></li>
							<li><a href="auth-change-password-img-side.html" target="_blank">Change password v2</a></li>
							<li><a href="auth-profile-settings.html" target="_blank">Profile settings</a></li>
							<li><a href="auth-tabs.html" target="_blank">Tabs Authentication</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-sliders"></i></span><span class="pcoded-mtext">Maintenance</span></a>
						<ul class="pcoded-submenu">
							<li><a href="maint-error.html">Error</a></li>
							<li><a href="maint-offline-ui.html" target="_blank">Offline UI</a></li>
							<li><a href="maint-maintance.html" target="_blank">Maintenance</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-menu-caption">
						<label>App</label>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-mail"></i></span><span class="pcoded-mtext">Email</span></a>
						<ul class="pcoded-submenu">
							<li><a href="email_inbox.html">Inbox</a></li>
							<li><a href="email_read.html">Read mail</a></li>
							<li><a href="email_compose.html">Compose mail</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-clipboard"></i></span><span class="pcoded-mtext">Task</span></a>
						<ul class="pcoded-submenu">
							<li><a href="task-list.html">List</a></li>
							<li><a href="task-board.html">Board</a></li>
							<li><a href="task-detail.html">Detail</a></li>
						</ul>
					</li>
					<li class="nav-item">
						<a href="todo.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-check-square"></i></span><span class="pcoded-mtext">To-Do</span></a>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-image"></i></span><span class="pcoded-mtext">Gallery</span></a>
						<ul class="pcoded-submenu">
							<li><a href="gallery-grid.html">Grid</a></li>
							<li><a href="gallery-masonry.html">Masonry</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-help-circle"></i></span><span class="pcoded-mtext">Helpdesk<span class="pcoded-badge badge badge-success">NEW</span></span></a>
						<ul class="pcoded-submenu">
							<li><a href="hd-help-desk.html">Helpdesk dashboard</a></li>
							<li><a href="hd-dashboard.html">Customer dashboard</a></li>
							<li><a href="hd-cust-list.html">Customer list</a></li>
							<li><a href="hd-detail.html">Customer detail</a></li>
							<li><a href="hd-new-ticket.html">Ticket</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-menu-caption">
						<label>Extension</label>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-file-plus"></i></span><span class="pcoded-mtext">Editor</span></a>
						<ul class="pcoded-submenu">
							<li><a href="editor-classic.html">CK editor</a></li>
							<li><a href="editor-trumbowyg.html">Trumbowyg editor</a></li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-file-minus"></i></span><span class="pcoded-mtext">Invoice</span></a>
						<ul class="pcoded-submenu">
							<li><a href="invoice.html">Invoice</a></li>
							<li><a href="invoice-summary.html">Invoice summary</a></li>
							<li><a href="invoice-list.html">Invoice list</a></li>
						</ul>
					</li>
					<li class="nav-item"><a href="full-calendar.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-calendar"></i></span><span class="pcoded-mtext">Full calendar</span></a></li>
					<li class="nav-item"><a href="file-upload.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-upload-cloud"></i></span><span class="pcoded-mtext">File upload</span></a></li>
					<li class="nav-item"><a href="image_crop.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-scissors"></i></span><span class="pcoded-mtext">Image cropper</span></a></li>
					<li class="nav-item pcoded-menu-caption">
						<label>Other</label>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#" class="nav-link "><span class="pcoded-micon"><i class="feather icon-menu"></i></span><span class="pcoded-mtext">Menu levels</span></a>
						<ul class="pcoded-submenu">
							<li><a href="#">Menu Level 2.1</a></li>
							<li class="pcoded-hasmenu">
								<a href="#">Menu level 2.2</a>
								<ul class="pcoded-submenu">
									<li><a href="#">Menu level 3.1</a></li>
									<li><a href="#">Menu level 3.2</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li class="nav-item disabled"><a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-power"></i></span><span class="pcoded-mtext">Disabled menu</span></a></li>
					<li class="nav-item"><a href="sample-page.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-sidebar"></i></span><span class="pcoded-mtext">Sample page</span></a></li>
					-->
				</ul>

				<!--
				<div class="card text-center">
					<div class="card-block">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<i class="feather icon-sunset f-40"></i>
						<h6 class="mt-3">Help?</h6>
						<p>Please contact us on our email for need any support</p>
						<a href="#!" target="_blank" class="btn btn-primary btn-sm text-white m-0">Support</a>
					</div>
				</div>
				-->

			</div>
		</div>
	</nav>
	<!-- [ navigation menu ] end -->