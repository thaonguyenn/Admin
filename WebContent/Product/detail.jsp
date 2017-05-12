<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi tiết sản phẩm</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="generic-container">
		<div class="well lead">Chi tiết sản phẩm</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-label" for="txtCode">Mã sản
					phẩm</label>
				<div class="col-md-7">
					<input type="text" id="txtCode" name="txtCode"
						class="form-control input-sm"
						value="<c:out value="${product.code}" />" readonly="readonly" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-label" for="txtName">Tên sản
					phẩm</label>
				<div class="col-md-7">
					<input type="text" id="txtName" name="txtName" readonly="readonly"
						class="form-control input-sm"
						value="<c:out value="${product.name}" />" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-label" for="txtPrice">Giá
					tiền</label>
				<div class="col-md-7">
					<input type="text" path="txtPrice" id="txtPrice" name="txtPrice"
						readonly="readonly" class="form-control input-sm"
						value="<c:out value="${product.price}" />" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-label" for="txtSale">Khuyến
					mại</label>
				<div class="col-md-7">
					<input type="text" path="txtSale" id="txtSale" name="txtSale"
						readonly="readonly" class="form-control input-sm"
						value="<c:out value="${product.sale}" />" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-label" for="txtDesc">Mô tả</label>
				<div class="col-md-7">
					<input type="text" path="txtDesc" id="txtDesc" name="txtDesc"
						class="form-control input-sm"
						value="<c:out value="${product.description}" />"
						readonly="readonly" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-label" for="txtImg">Link hình ảnh</label>
				<div class="col-md-7">
					<input type="text" path="txtImg" id="txtImg" name="txtImg"
						class="form-control input-sm"
						value="<c:out value="${product.image}" />"
						readonly="readonly" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-label" for="txtCate">Category</label>
				<div class="col-md-7">
					<input type="text" path="txtDesc" id="txtCate" name="txtCate"
						class="form-control input-sm"
						value="<c:out value="${product.category}" />"
						readonly="readonly" />
				</div>
			</div>
		</div>

		<a href="<c:url value='/ProductController?action=index' />">Quay lại</a>
</body>
</html>