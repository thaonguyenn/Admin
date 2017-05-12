<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<form action="<%=request.getContextPath()%>/ProductController"
		method="post" class="form-horizontal">
		<input type="hidden" name="hidAction" value="search">
		<div class="generic-container">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span
						style="color: maroon; font-size: 30px; font-family: sans-serif;"><b>Danh
							sách sản phẩm của Coffee Shop</b></span>
					<div class="col-md-6 form-group pull-right">
						<div class="input-group">
							<input type="text" name="txtSearch" class="form-control input-sm"
								placeholder="Nhập giá trị tìm kiếm..."> <span
								class="input-group-btn">
								<button class="btn btn-primary btn-sm" type="submit">
									<span class="glyphicon glyphicon-search"></span>&nbsp; Tìm
								</button> <a href="ProductController?action=create"
								class="btn btn-primary btn-sm"><span
									class="glyphicon glyphicon-plus "></span> Thêm</a> <a
								target="_blank" href="ProductController?action=print"
								class="btn btn-primary btn-sm"><span
									class="glyphicon glyphicon-print "></span> In ấn</a>

							</span>

						</div>
					</div>

					<table class="table table-hover">
						<thead>
							<tr>
								<th title="Số thứ tự">STT</th>
								<th title="Mã sản phẩm">Mã SP</th>
								<th title="Tên sản phẩm">Tên sản phẩm</th>
								<th title="Giá tiền">Giá</th>
								<th title="Khuyến mại">Khuyến mại</th>
								<th title="Link hình ảnh">Link hình ảnh</th>
								<th title="Category">Category</th>
								<th colspan="3">Thao tác</th>
							</tr>
						</thead>
						<tbody id="myTable">
							<%
								int i = 1;
							%>
							<c:choose>
								<c:when test="${fn:length(listProduct) > 0}">
									<c:forEach items="${listProduct}" var="product">
										<tr class="success">
											<td width="5%" style="align: center"><%=i++%></td>
											<td width="10%"><c:out value="${product.code}" /></td>
											<td width="28%"><c:out value="${product.name}" /></td>
											<td width="10%"><fmt:formatNumber type="number"
													value="${product.price}" /></td>
											<td width="10%"><fmt:formatNumber type="number"
													value="${product.sale}" /></td>
											<td width="30%"><c:out value="${product.image}" /></td>
											<td width="10%"><c:out value="${product.category}" /></td>
											<td width="10%"><a class="btn btn-primary btn-sm"
												href="../<%=request.getContextPath()%>/ProductController?action=detail&productId=<c:out value="${product.id }"/>"><span
													class="glyphicon glyphicon-info-sign"></span> Chi tiết</a></td>
											<td width="10%"><a class="btn btn-primary btn-sm"
												href="<%=request.getContextPath()%>/ProductController?action=edit&productId=<c:out value="${product.id }"/>"><span
													class="glyphicon glyphicon-pencil"></span> Sửa</a></td>
											<td width="8%"><a class="btn btn-danger"
												href="<%=request.getContextPath()%>/ProductController?action=delete&productId=<c:out value="${product.id }"/>">Xóa</a></td>
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