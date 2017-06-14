<%@page import="model.Bill"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Statistic Bill</title>
<link href='<%=request.getContextPath()%>/image/favicon.ico' rel='shortcut icon' type='image/vnd.microsoft.icon'/>
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
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/css/myweb.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
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
	
	
	
	

	<form action="<%=request.getContextPath()%>/StatisticBill" method="post">
		<input type="hidden" name="hidAction1" value="search1">
		<div class="generic-container">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<div class="col-md-12 bdheading">
						<span>Hóa đơn chưa giao</span>
					</div>
					<div class="col-md-6 form-group pull-right">
						<div class="input-group">
							<input type="text" name="txtSearch1" class="form-control input-sm"
								placeholder="Nhập giá trị tìm kiếm..."> <span
								class="input-group-btn">
								<button class="btn btn-primary btn-sm" type="submit">
									<span class="glyphicon glyphicon-search"></span>&nbsp; Tìm
								</button>
							</span>
						</div>
					</div>

					<table id="example" class="table table-striped">
						<thead>
							<tr>
								<th title="Số thứ tự">STT</th>
								<th title="Mã hóa đơn">Mã hóa đơn</th>
								<th title="Tên tài khoản khách">Tên tài khoản</th>
								<th title="Tổng hóa đơn">Tổng hóa đơn</th>
								<th title="Địa chỉ">Địa chỉ</th>
								<th title="Hình thức thanh toán">Hình thức thanh toán</th>
								<th title="Ngày mua hàng">Ngày mua hàng</th>
							</tr>
						</thead>
						<tbody>
							<%
								int i = 1;
								double sum =0;
							%>
							<c:choose>
								<c:when test="${fn:length(unchecked) > 0}">
									<c:forEach items="${unchecked}" var="bill">
										<tr>
											<td width="5%" style="align: center"><%=i++%></td>
											<td width="10%"><c:out value="${bill.billId}" /></td>
											<td width="10%"><c:out value="${bill.userName}" /></td>
											<%
											List<Bill> unchecked = (List<Bill>)request.getAttribute("unchecked");
											NumberFormat nf = NumberFormat.getInstance();
											nf.setMaximumFractionDigits(2);
											String totalBillFormat = nf.format(unchecked.get(i-2).getTotalBill());
											if(unchecked.size()>1)
											sum+=unchecked.get(i-2).getTotalBill();
											%>
											<td width="10%">$ <c:out value="<%=totalBillFormat%>"/></td>
											<td width="15%"><c:out value="${bill.address}" /></td>
											<td width="15%"><c:out value="${bill.payment}" /></td>
											<td width="15%"><c:out value="${bill.dateTime}" /></td>
											<td width="8%">
											<a class="btn btn-danger"
										href="<%=request.getContextPath()%>/StatisticBill?action=check&billId=<c:out value="${bill.billId}"/>">Check</a></td>
										</tr>
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
<%
NumberFormat f = NumberFormat.getInstance();
f.setMaximumFractionDigits(2);
String total = f.format(sum); 
if(sum>0){
%>
<h4 style="text-align: right;">Tổng doanh thu hiện tại: <b>$ <%=total%></b></h4>
<%} %>
				</div>

				<!-- end of content -->
			</div>
		</div>
	
		<input type="hidden" name="hidAction2" value="search2">
		<div class="generic-container">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<div class="col-md-12 bdheading">
						<span>Hóa đơn đã giao</span>
					</div>
					<div class="col-md-6 form-group pull-right">
						<div class="input-group">
							<input type="text" name="txtSearch2" class="form-control input-sm"
								placeholder="Nhập giá trị tìm kiếm..."> <span
								class="input-group-btn">
								<button class="btn btn-primary btn-sm" type="submit">
									<span class="glyphicon glyphicon-search"></span>&nbsp; Tìm
								</button>
							</span>
						</div>
					</div>

					<table id="example" class="table table-striped">
						<thead>
							<tr>
								<th title="Số thứ tự">STT</th>
								<th title="Mã hóa đơn">Mã hóa đơn</th>
								<th title="Tên tài khoản khách">Tên tài khoản</th>
								<th title="Tổng hóa đơn">Tổng hóa đơn</th>
								<th title="Địa chỉ">Địa chỉ</th>
								<th title="Hình thức thanh toán">Hình thức thanh toán</th>
								<th title="Ngày mua hàng">Ngày mua hàng</th>
							</tr>
						</thead>
						<tbody>
							<%
								int j = 1;
								double sum2 =0;
							%>
							<c:choose>
								<c:when test="${fn:length(checked) > 0}">
									<c:forEach items="${checked}" var="billc">
										<tr>
											<td width="5%" style="align: center"><%=j++%></td>
											<td width="10%"><c:out value="${billc.billId}" /></td>
											<td width="10%"><c:out value="${billc.userName}" /></td>
											<%
											List<Bill> checked = (List<Bill>)request.getAttribute("checked");
											NumberFormat nf = NumberFormat.getInstance();
											nf.setMaximumFractionDigits(2);
											String totalBillFormat = nf.format(checked.get(j-2).getTotalBill());
											if(checked.size()>1)
											sum2+=checked.get(j-2).getTotalBill();
											%>
											<td width="10%"><c:out value="<%=totalBillFormat%>" /></td>
											<td width="15%"><c:out value="${billc.address}" /></td>
											<td width="15%"><c:out value="${billc.payment}" /></td>
											<td width="15%"><c:out value="${billc.dateTime}" /></td>
										
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
<%
NumberFormat f2 = NumberFormat.getInstance();
f2.setMaximumFractionDigits(2);
String total2 = f2.format(sum2);
if(sum2>0){
%>
<h4 style="text-align: right;">Tổng doanh thu hiện tại: <b>$ <%=total2%></b></h4>
<%} %>
				</div>

				<!-- end of content -->
			</div>
		</div>
	</form>
</body>
</html>