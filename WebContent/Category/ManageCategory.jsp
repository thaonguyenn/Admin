<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý loại sản phẩm</title>
<link href='<%=request.getContextPath()%>/image/favicon.ico' rel='shortcut icon' type='image/vnd.microsoft.icon'/>
<link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet"></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
.table-responsive {
	height: 180px;
}
</style>
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
	<form action="<%=request.getContextPath()%>/Category/Search"
		method="post" class="form-horizontal">
		<input type="hidden" name="hidAction" value="search">
		<div class="generic-container">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span style="color: maroon; font-size: 30px; font-family: sans-serif;"><b>Danh sách loai sản phẩm của Coffee Shop</b></span>
					<div class="col-md-6 form-group pull-right">
						<div class="input-group">
							<input type="text" name="txtSearch" class="form-control input-sm"
								placeholder="Nhập giá trị tìm kiếm..."> <span
								class="input-group-btn">
								
								<button class="btn btn-primary btn-sm" type="submit">
									<span class="glyphicon glyphicon-search"></span>&nbsp; Tìm
								</button>
								
								<a href="<%=request.getContextPath()%>/Category/create?action=create"
								class="btn btn-primary btn-sm"><span
									class="glyphicon glyphicon-plus "></span> Thêm</a> <a
								target="_blank" href="<%=request.getContextPath()%>/Category/Print?action=print"
								class="btn btn-primary btn-sm"><span
									class="glyphicon glyphicon-print "></span> In ấn</a>
								
							</span>
								
						</div>
					</div>

				<table class="table table-hover">
						<thead>
							<tr>
								<th title="STT">STT</th>
								<th title="Ma loai san pham">Mã SP</th>
								<th title="Ten loai san pham">Tên loại SP</th>
								<th title="Link loai san pham">Link loại SP</th>
							</tr>
						</thead>
						<tbody id="myTable">
							<%
								int i = 1;
							%>
							<c:choose>
								<c:when test="${fn:length(listCategory) > 0}">
									<c:forEach items="${listCategory}" var="cate">
										<tr class="success">
											<td width="5%" style="align: center"><%=i++%></td>
											<td width="10%"><c:out value="${cate.id}" /></td>
											<td width="38%"><c:out value="${cate.name}" /></td>
											<td width="28%"><c:out value="${cate.link}" /></td>
											<td width="10%"><a class="btn btn-primary btn-sm"
												href="<%=request.getContextPath()%>/Category/Detail?action=detail&categoryId=<c:out value="${cate.id}"/>"><span
													class="glyphicon glyphicon-info-sign"></span> Chi tiết</a></td>
											<td width="10%"><a class="btn btn-primary btn-sm"
												href="<%=request.getContextPath()%>/Category/edit?action=edit&categoryId=<c:out value="${cate.id}"/>"><span
													class="glyphicon glyphicon-pencil"></span> Sửa</a></td>
											<td width="8%">
											<a class="btn btn-danger"
										href="<%=request.getContextPath()%>/Category/Delete?action=delete&categoryId=<c:out value="${cate.id}"/>">Xóa</a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7"><center>
												<b><font color="red">Không có dữ liệu! </b></font>Kích vào
												nút <b>Thêm</b> để thêm dữ liệu mới!
											</center></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>


				</div>
					<div class="col-md-12 text-center">
					<ul class="pagination pagination-lg pager" id="myPager"></ul>
				</div>
				<script src="js/pagination.js" type="text/javascript" /></script>
				<!-- end of content -->
			</div>
		</div>
	</form>
</body>
</html>