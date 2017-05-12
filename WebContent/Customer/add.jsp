<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm mới nhân viên</title>
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
<form action="<%=request.getContextPath()%>/NhanVienController"
		method="post" class="form-horizontal">
		<input type="hidden" name="hidAction" value="add">
		<div class="generic-container">
			<div class="well lead">Thêm mới nhân viên</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtMaNV">Mã nhân viên</label>
					<div class="col-md-7">
						<input type="text" id="txtMaNV" name="txtMaNV"
							class="form-control input-sm" />
						<%if(request.getAttribute("error")!=null)
							out.print("<font color=\"red\">" + (String) request.getAttribute("error") + "</font>");%>
						</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtTenNV">Tên nhân viên</label>
					<div class="col-md-7">
						<input type="text" id="txtTenNV" name="txtTenNV"
							class="form-control input-sm" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtQueQuan">Quê quán</label>
					<div class="col-md-7">
						<input type="text" id="txtQueQuan" name="txtQueQuan"
							class="form-control input-sm" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtChucVu">Chức vụ</label>
					<div class="col-md-7">
						<input type="text" id="txtChucVu" name="txtChucVu"
							class="form-control input-sm" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtMaPB">Mã phòng ban</label>
					<div class="col-md-7">
						<input type="text" id="txtMaPB" name="txtMaPB"
							class="form-control input-sm" />
					<%if(request.getAttribute("error2")!=null)
							out.print("<font color=\"red\">" + (String) request.getAttribute("error2") + "</font>");%>
						</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtHeSo">Hệ số lương</label>
					<div class="col-md-7">
						<input type="text" id="txtHeSo" name="txtHeSo"
							class="form-control input-sm" />
					<%if(request.getAttribute("error3")!=null)
							out.print("<font color=\"red\">" + (String) request.getAttribute("error3") + "</font>");%>
					<%if(request.getAttribute("error4")!=null)
							out.print("<font color=\"red\">" + (String) request.getAttribute("error4") + "</font>");%>
						</div>
				</div>
			</div>

			<input type="submit" value="Cập nhật" class="btn btn-primary btn-sm" />
			or <a href="<c:url value='/NhanVienController?action=index' />">Quay
				lại</a>
	</form>
</body>
</html>