<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>LTOP</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/assets/css/plugins/AdminLTE/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/assets/css/plugins/AdminLTE/AdminLTE.min.css">
	<link rel="stylesheet" href="/resources/assets/css/plugins/AdminLTE/_all-skins.min.css">
</head>
<body>

<div>
	<div>
		<div class="error-page" style="text-align:center; margin-top: 15%;">
			<h2><i class="fa fa-warning text-black"></i> <c:out value="${msg}"/></h2>
			<p>You do not have access rights, or you have not obtained administrator rights after registering as a member. Please contact the administrator.</p>
		</div>
	</div>
</div>

</body>
</html>
