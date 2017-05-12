<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cập nhật</title>
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
		<input type="hidden" name="hidAction" value="edit">
		<input type="hidden" name="hidId" value="<c:out value="${category.id}" />">
			<div class="well lead">Cập nhật sản phẩm</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtId">Mã sản
						phẩm</label>
					<div class="col-md-7">
						<input type="text" id="txtCode" name="txtId"
							class="form-control input-sm" value="<c:out value="${category.id}" />" readonly="readonly"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtName">Tên sản
						phẩm</label>
					<div class="col-md-7">
						<input type="text" id="txtName" name="txtName"
							class="form-control input-sm" value="<c:out value="${category.name}" />"/>
					<%
							if (request.getAttribute("errorName") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorName") + "</font>");
						%>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-label" for="txtLink">Link sản
						phẩm</label>
					<div class="col-md-7">
						<input type="text" id="txtLink" name="txtLink"
							class="form-control input-sm" value="<c:out value="${category.link}" />"/>
					<%
							if (request.getAttribute("errorLink") != null)
								out.print("<font color=\"red\">" + (String) request.getAttribute("errorLink") + "</font>");
						%>
					</div>
				</div>
			</div>

			<input type="submit" value="Cập nhật" class="btn btn-primary btn-sm" />
			or <a href="<c:url value='/CategoryController?action=index' />">Quay lại</a>
	</form>
    
</body>
</html>