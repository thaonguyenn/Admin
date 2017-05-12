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
	<form action="<%=request.getContextPath()%>/CategoryController"
		method="post" class="form-horizontal">
		<input type="hidden" name="hidAction" value="add">
			<div class="well lead">Thêm mới category</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtId">Mã
						category</label>
					<div class="col-md-7">
						<input type="text" id="txtCode" name="txtId"
							class="form-control input-sm" />
						<%
							if (request.getAttribute("errorId") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorId") + "</font>");

							if (request.getAttribute("errorIdM") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorIdM") + "</font>");
						
							if (request.getAttribute("errorIdS") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorIdS") + "</font>");
						%>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtName">Tên
						category</label>
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
					<label class="col-md-3 control-label" for="txtLink">Link
						category</label>
					<div class="col-md-7">
						<input type="text" id="txtLink" name="txtLink"
							class="form-control input-sm" />
						<%
							if (request.getAttribute("errorLink") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorLink") + "</font>");
						%>
					</div>
				</div>
			</div>

			<input type="submit" value="Cập nhật" class="btn btn-primary btn-sm" />
			or <a href="<c:url value='/CategoryController?action=index' />">Quay
				lại</a>
	</form>
</body>
</html>