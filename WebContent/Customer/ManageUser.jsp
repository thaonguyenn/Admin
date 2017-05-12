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
	<jsp:include page="../menu.jsp" />
	<!-- menu -->
	<!-- end of menu -->
	<!-- contend of  page -->
	
	<form action="<%=request.getContextPath()%>/UserController"
		method="post" class="form-horizontal">
		<input type="hidden" name="hidAction" value="search">
		<div class="generic-container">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span style="color: maroon; font-size: 30px; font-family: sans-serif;"><b>Danh sách khách hàng của Coffee Shop</b></span>
					<div class="col-md-6 form-group pull-right">
						<div class="input-group">
						<input type="text" name="txtSearch" class="form-control input-sm"
								placeholder="Nhập giá trị tìm kiếm..."> <span
								class="input-group-btn">
								<button class="btn btn-primary btn-sm" type="submit">
									<span class="glyphicon glyphicon-search"></span>&nbsp; Tìm
								</button>
							<a
								target="_blank" href="UserController?action=print"
								class="btn btn-primary btn-sm"><span
									class="glyphicon glyphicon-print "></span> In ấn</a>
							</span>
						</div>
					</div>

					<table id="example" class="table table-striped">
						<thead>
							<tr>
								<th title="Số thứ tự">STT</th>
								<th title="Tên tài khoản">Tên tài khoản</th>
								<th title="Mật khẩu tài khoản">Mật khẩu tài khoản</th>
								<th title="Họ">Họ</th>
								<th title="Tên">Tên</th>
								<th title="Email">Email</th>
								<th title="Phone">Phone</th>
							</tr>
						</thead>
						<tbody>
							<%
								int i = 1;
							%>
							<c:choose>
								<c:when test="${fn:length(listCustomer) > 0}">
									<c:forEach items="${listCustomer}" var="cus">
										<tr>
											<td width="5%" style="align: center"><%=i++%></td>
											<td width="10%"><c:out value="${cus.userName}" /></td>
											<td width="28%"><c:out value="${cus.password}" /></td>
											<td width="30%"><c:out value="${cus.firstName}"/></td>
											<td width="10%"><c:out value="${cus.lastName}"/></td>
											<td width="10%"><c:out value="${cus.email}"/></td>
											<td width="10%"><c:out value="${cus.phone}"/></td>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7"><center>
												<b><font color="red">Không có dữ liệu! </b>
											</center></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>


				</div>

				<!-- end of content -->
			</div>
		</div>
	</form>
</body>
</html>