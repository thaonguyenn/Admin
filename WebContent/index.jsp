<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý sản phẩm</title>
<link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/css/app.css' />" rel="stylesheet"></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" media="screen" href="./css/bootstrap.min.css">
<script src="./js/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
</head>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<!-- menu -->
	<!-- end of menu -->
	<!-- contend of  page -->
	<div class="container">
	<h3 style="color: maroon; font-family: fantasy;">Chào cô và các bạn đã đến với trang Admin của nhóm 11 !</h3>
	<br>
	<h4 style="color: maroon; font-family: sans-serif;">Hướng dẫn :</h4>
	- <b>Danh sách sản phẩm :</b> Vào menu Quản lý sản phẩm -> Chọn sản phẩm<br>
	- <b>Danh sách loại sản phẩm :</b> Vào menu Quản lý sản phẩm -> Chọn loại sản phẩm<br>
	- <b>Danh sách khách hàng :</b> Vào menu Quản lý khách hàng<br>
	- <b>Trang bán hàng :</b>Vào website
	</div>
	
</body>
</html>
