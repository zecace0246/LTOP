<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">

<head>

	<title>LTOP</title>
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

	<!-- vendor css -->
	<link rel="stylesheet" href="/resources/assets/css/style.css">
	
</head>

<!-- [ auth-signup ] start -->
<div class="auth-wrapper">
	<div class="auth-content">
		<div class="card">
			<div class="row align-items-center text-center">
				<div class="col-md-12">
					<div class="card-body">
						<img src="/resources/assets/images/logo-dark.png" alt="" class="img-fluid mb-4">
						<h4 class="mb-3 f-w-400">Sign up</h4>
						<form action="/member/memberRegister" method="post">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="feather icon-user"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="Userid" name="userId" required oninvalid="this.setCustomValidity('Userid cannot be empty')" oninput="this.setCustomValidity('')">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="feather icon-user"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="Username" name="userName" required oninvalid="this.setCustomValidity('Username cannot be empty')" oninput="this.setCustomValidity('')">
							</div>
							<div class="input-group mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="feather icon-lock"></i></span>
								</div>
								<input type="password" class="form-control" placeholder="Password" name="userPw" required oninvalid="this.setCustomValidity('Password cannot be empty')" oninput="this.setCustomValidity('')">
							</div>
							<div class="input-group mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="feather icon-lock"></i></span>
								</div>
								<input type="password" class="form-control" placeholder="Retype password" name="retypePassword" required oninvalid="this.setCustomValidity('Retype password cannot be empty')" oninput="this.setCustomValidity('')">
							</div>							
							<button type="submit" class="btn btn-primary btn-block mb-4" name="register">Sign up</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
						<p class="mb-2">Already have an account? <a href="/member/adminLogin" class="f-w-400">Signin</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- [ auth-signup ] end -->

<!-- Required Js -->
<script src="/resources/assets/js/vendor-all.min.js"></script>
<script src="/resources/assets/js/plugins/bootstrap.min.js"></script>
<script src="/resources/assets/js/waves.min.js"></script>

<script>
$(function () {		
	$('button[name=register]').click(function(){ 			
		if ($('input[name=userPw]').val() != $('input[name=retypePassword]').val()) {
			alert('Password and Retype password check please!!');
			return false;
		}
	});
});
</script>

</body>
</html>
