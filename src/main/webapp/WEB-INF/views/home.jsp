<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Gradient Able bootstrap admin template by codedthemes</title>
    <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 11]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    	<![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Codedthemes" />
    <!-- Favicon icon -->
    <link rel="icon" href="/resources/assets/images/favicon.ico" type="image/x-icon">

    <!-- data tables css -->
    <link rel="stylesheet" href="/resources/assets/css/plugins/dataTables.bootstrap4.min.css">

    <!-- vendor css -->
    <link rel="stylesheet" href="/resources/assets/css/style.css">
  
	<script>
		// 스프링 시큐리티 CSRF 토큰
		var csrfTokenValue = '${_csrf.token}';
	</script>  
    
</head>
<body class="">
	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
		<div class="loader-track">
			<div class="loader-fill"></div>
		</div>
	</div>
	<!-- [ Pre-loader ] End -->
	
	<%@include file="include/sidebar.jsp"%>

	<%@include file="include/header.jsp"%>

	<!-- [ Main Content ] start -->
	<div class="pcoded-main-container" id="mainContent"></div>
	<!-- [ Main Content ] end -->
    
	<div class="d-flex justify-content-center" style="position: absolute; top: 10%; left: 40px; right: 40px;">
		<div class="toast hide toast-center" role="alert" aria-live="assertive" data-delay="1500" aria-atomic="true">
			<div class="toast-header">
				<img src="resources/assets/images/favicon.ico" alt="" class="img-fluid m-r-5" style="width:20px;">
				<strong class="mr-auto">LTOP Alert</strong>
				<button type="button" class="m-l-5 mb-1 mt-1 close" data-dismiss="toast" aria-label="Close">
					<span>&times;</span>
				</button>
			</div>
			<div class="toast-body"></div>
		</div>
	</div>    
    
	<!-- Required Js -->
    <script src="/resources/assets/js/plugins/jquery.min.js"></script>
    <script src="/resources/assets/js/common.js"></script>
    <script src="/resources/assets/js/vendor-all.min.js"></script>
    <script src="/resources/assets/js/plugins/bootstrap.min.js"></script>
    <script src="/resources/assets/js/pcoded.min.js"></script>
	<script src="/resources/assets/js/menu-setting.min.js"></script>
	
	<!-- Apex Chart -->
	<script src="/resources/assets/js/plugins/apexcharts.min.js"></script>
	
	<!-- datatable Js -->
	<script src="/resources/assets/js/plugins/jquery.dataTables.min.js"></script>
	<script src="/resources/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
	<script src="/resources/assets/js/pages/data-basic-custom.js"></script>	

<script>
	
	$(function () {
		/*
		var csrfTokenValue = '${_csrf.token}';
		
		$.ajaxSetup({
		    beforeSend: function(xhr) {
		        xhr.setRequestHeader("X-CSRF-TOKEN",csrfTokenValue);
		    }
		});
		*/
		
		if ($(location).attr('pathname') == '/home') { 			
			$('#introMenu').addClass('active');
			$('#introMenu').addClass('pcoded-trigger');
			$('#introSubMenu').addClass('pcoded-trigger');
			 			
			gfn_callMenu("GET", "/dashboardv1", true, "", "text", gfn_callMenuResult, 30000);
		}
		 
		$('.pcoded-hasmenu').click(function() {
			$('li').removeClass('active');
			//$('li').removeClass('pcoded-trigger');
			$(this).addClass('active');
		});
		
		$('.pcoded-submenu > li').click(function() {
			//$('.pcoded-submenu > li').removeClass('pcoded-trigger');
			//$(this).addClass('pcoded-trigger');
					
			gfn_callMenu("GET", $("a", this).attr("data-url"), true, "", "text", gfn_callMenuResult, 30000);
		});
		
		$('.pcoded-singlemenu').click(function() {
			$('li').removeClass('active');
			$('li').removeClass('pcoded-trigger');
			$(this).addClass('pcoded-trigger');
			 			
			gfn_callMenu("GET", $("a", this).attr("data-url"), true, "", "text", gfn_callMenuResult, 30000);
		});		
	});	
	 	
</script>

</body>
</html>
