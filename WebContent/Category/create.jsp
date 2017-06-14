<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm mới</title>
<link href='<%=request.getContextPath()%>/image/favicon.ico' rel='shortcut icon' type='image/vnd.microsoft.icon'/>
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
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-header">
				<li><a href="#" ; style="font-size: 20px">Nhom011-2017</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Quản lý sản phẩm <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/showProduct.jsp">Sản
								phẩm</a></li>
						<li><a href="<%=request.getContextPath()%>/showCategory.jsp">Loại
								sản phẩm</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath()%>/showUser.jsp">Quản lý khách hàng</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Thống kê <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<%=request.getContextPath()%>/showPercent.jsp">Thống kê tỷ trọng sản phẩm đã bán</a></li>
									<li><a href="<%=request.getContextPath()%>/showBill.jsp">Thống kê hóa đơn</a></li>
									<li><a href="<%=request.getContextPath()%>/Chart/StatisticWareHouse.jsp">Thống kê kho hàng</a></li>
								</ul></li>
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="http://2017-nhom011.azurewebsites.net/">Website</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	
	
	<form action="<%=request.getContextPath()%>/Category/create"
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
			or <a href="<c:url value='../Category/create?action=index' />">Quay
				lại</a>
	</form>
</body>
</html>