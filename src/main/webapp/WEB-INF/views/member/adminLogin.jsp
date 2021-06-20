<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<!-- [ auth-signin ] start -->
<div class="auth-wrapper">
  <div class="auth-content">
    <div class="card">
      <div class="row align-items-center text-center">
        <div class="col-md-12">
          <div class="card-body">
            <img src="/resources/assets/images/logo-dark.png" alt="" class="img-fluid mb-4">
            <h4 class="mb-3 f-w-400">로그인</h4>
            <h6><code><c:out value="${loginError}"/></code></h6>
            <h6><c:out value="${registerResult}"/></h6>
            <form action="/login" method="post">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="feather icon-user"></i></span>
                </div>
                <input type="text" class="form-control" placeholder="Userid" name="username" required oninvalid="this.setCustomValidity('ID를 입력하세요')" oninput="this.setCustomValidity('')">
              </div>
              <div class="input-group mb-4">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="feather icon-lock"></i></span>
                </div>
                <input type="password" class="form-control" placeholder="Password" name="password" required oninvalid="this.setCustomValidity('비밀번호를 입력하세요')" oninput="this.setCustomValidity('')">
              </div>
              <div class="form-group text-left mt-2">
                <div class="checkbox checkbox-primary d-inline">
                  <input type="checkbox" name="remember-me">
                  <label for="checkbox-fill-a1" class="cr"> 아이디 저장</label>
                </div>
              </div>
              <button type="submit" class="btn btn-block btn-primary mb-4" name="signIn">로그인</button>
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
            <p class="mb-0 text-muted"> <a href="/member/adminRegister" class="f-w-400">회원가입</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- [ auth-signin ] end -->

<!-- Required Js -->
<script src="/resources/assets/js/vendor-all.min.js"></script>
<script src="/resources/assets/js/plugins/bootstrap.min.js"></script>
<script src="/resources/assets/js/waves.min.js"></script>

<script>
  $(document).ready(function() {

  });
</script>

</body>
</html>
