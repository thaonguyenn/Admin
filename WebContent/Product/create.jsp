<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm mới</title>
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
	<form action="<%=request.getContextPath()%>/ProductController"
		method="post" class="form-horizontal">
		<input type="hidden" name="hidAction" value="add">
		<div class="generic-container">
			<div class="well lead">Thêm mới sản phẩm</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtCode">Mã sản
						phẩm</label>
					<div class="col-md-7">
						<input type="text" id="txtCode" name="txtCode"
							class="form-control input-sm" />
						<%
							if (request.getAttribute("errorCode") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorCode") + "</font>");
						%>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtName">Tên sản
						phẩm</label>
					<div class="col-md-7">
						<input type="text" id="txtName" name="txtName"
							class="form-control input-sm" />
						<%
							if (request.getAttribute("errorName") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorName") + "</font>");
						%>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtPrice">Giá
						tiền</label>
					<div class="col-md-7">
						<input type="text" path="txtPrice" id="txtPrice" name="txtPrice"
							class="form-control input-sm" />
						<%
							if (request.getAttribute("errorPrice") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorPrice") + "</font>");
							if (request.getAttribute("errorPriceM") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorPriceM") + "</font>");
						%>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtSale">Khuyến
						mại</label>
					<div class="col-md-7">
						<input type="text" path="txtSale" id="txtSale" name="txtSale"
							class="form-control input-sm" />
						<%
							if (request.getAttribute("errorSale") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorSale") + "</font>");
							if (request.getAttribute("errorSaleM") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorSaleM") + "</font>");
						%>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtDesc">Mô tả</label>
					<div class="col-md-7">
						<input type="text" path="txtDesc" id="txtDesc" name="txtDesc"
							class="form-control input-sm" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtImg">Link
						hình ảnh</label>
					<div class="col-md-7">
						<input type="text" path="txtImg" id="txtImg" name="txtImg"
							class="form-control input-sm" />
						<%
							if (request.getAttribute("errorImg") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorImg") + "</font>");
						%>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtCate">Category</label>
					<div class="col-md-7">
						<input type="text" path="txtCate" id="txtCate" name="txtCate"
							class="form-control input-sm" />
						<%
							if (request.getAttribute("errorCate") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorCate") + "</font>");
						%>
					</div>
				</div>
			</div>
		</div>
		<input type="submit" value="Cập nhật" class="btn btn-primary btn-sm" />
		or <a href="<c:url value='/ProductController?action=index' />">Quay
			lại</a>
	</form>
</body>
</html>