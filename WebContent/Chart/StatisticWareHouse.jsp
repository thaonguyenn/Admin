<%@page import="java.util.ArrayList"%>
<%@page import="model.Value"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Statistic warehouse</title>
<link href='<%=request.getContextPath()%>/image/favicon.ico' rel='shortcut icon' type='image/vnd.microsoft.icon'/>
<script src="<%=request.getContextPath()%>/js/Chart.min.js"></script>
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/css/statistic.css">
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
	
	
	
	
	
	<form action="<%=request.getContextPath()%>/StatisticWareHouse"
		method="post">
		<div id="menu">
			<ul>
				<li><a
					href="<%=request.getContextPath()%>/StatisticWareHouse?statistic=date">Thống
						kê theo ngày</a></li>

				<li><a
					href="<%=request.getContextPath()%>/StatisticWareHouse?statistic=month">Thống
						kê theo tháng</a></li>

				<li><a
					href="<%=request.getContextPath()%>/StatisticWareHouse?statistic=precious">Thống
						kê theo quý</a></li>

				<li><a
					href="<%=request.getContextPath()%>/StatisticWareHouse?statistic=year">Thống
						kê theo năm</a></li>

			</ul>
		</div>
		<%if(request.getAttribute("error")!=null){ %>
		<h3 style="text-align: center; color: red;"><%=request.getAttribute("error") %></h3>
		<%} %>
		<%
			if (request.getAttribute("statistic") != null) {
				String statistic = (String) request.getAttribute("statistic");
				if (statistic.equalsIgnoreCase("date")) {
		%>
		<h4><b>Theo 7 ngày gần đây nhất: </b></h4><br>
		<select name="date" style="text-align: center;">
			<option value="<%=new Date().getDate()%>">Ngày:
				<%=new Date().getDate()%></option>
			<option value="<%=new Date().getDate() - 1%>">Ngày:
				<%=new Date().getDate() - 1%></option>
			<option value="<%=new Date().getDate() - 2%>">Ngày:
				<%=new Date().getDate() - 2%></option>
			<option value="<%=new Date().getDate() - 3%>">Ngày:
				<%=new Date().getDate() - 3%></option>
			<option value="<%=new Date().getDate() - 4%>">Ngày:
				<%=new Date().getDate() - 4%></option>
			<option value="<%=new Date().getDate() - 5%>">Ngày:
				<%=new Date().getDate() - 5%></option>
			<option value="<%=new Date().getDate() - 6%>">Ngày:
				<%=new Date().getDate() - 6%></option>
		</select>
		<button type="submit" name="b1" value="b1">Lọc</button>
		<br> 
		<h4><b>Theo khoảng ngày: </b></h4><br>
		Từ ngày: <select name="d1" style="text-align: center;">
			<%
				for (int i = 1; i <= 31; i++)
							out.print("<option value=\"" + i + "" + "\">Ngày: " + i + "</option>");
			%>
		</select>
		<select name="m1" style="text-align: center;">
			<%
				for (int i = 1; i <= 12; i++)
							out.print("<option value=\"" + i + "" + "\">Tháng: " + i + "</option>");
			%>
		</select>
		<select name="y1" style="text-align: center;">
			<%
				for (int i = 2000; i <= 2017; i++)
							out.print("<option value=\"" + i + "" + "\">Năm: " + i + "</option>");
			%>
		</select>
		<br>
		Đến ngày:<select name="d2" style="text-align: center;">
			<%
				for (int i = 1; i <= 31; i++)
							out.print("<option value=\"" + i + "" + "\">Ngày: " + i + "</option>");
			%>
		</select>
		<select name="m2" style="text-align: center;">
			<%
				for (int i = 1; i <= 12; i++)
							out.print("<option value=\"" + i + "" + "\">Tháng: " + i + "</option>");
			%>
		</select>
		<select name="y2" style="text-align: center;">
			<%
				for (int i = 2000; i <= 2017; i++)
							out.print("<option value=\"" + i + "" + "\">Năm: " + i + "</option>");
			%>
		</select>
		<button type="submit" name="b2" value="b2">Lọc</button>
		<%
			}

				if (statistic.equalsIgnoreCase("month")) {
		%>
		<select name="month" style="text-align: center;">
			<%
				for (int i = 1; i < 13; i++)
							out.print("<option value=\"" + i + "" + "\">Tháng: " + i + "</option>");
			%>
		</select>
		<button type="submit">Lọc</button>
		<%
			}
				if (statistic.equalsIgnoreCase("precious")) {
		%>
		<select name="precious" style="text-align: center;">
			<%
				for (int i = 1; i < 5; i++)
							out.print("<option value=\"" + i + "" + "\">Qúy: " + i + "</option>");
			%>
		</select>
		<button type="submit">Lọc</button>
		<%
			}
				if (statistic.equalsIgnoreCase("year")) {
		%>
		<select name="year" style="text-align: center;">
			<%
				for (int i = 2010; i <= 2017; i++)
							out.print("<option value=\"" + i + "" + "\">Năm: " + i + "</option>");
			%>
		</select>
		<button type="submit">Lọc</button>
		<%
			}
			}
		%>
	</form>
	<h2 style="text-align: center;"><b>Thông tin về sản phẩm đã bán được</b></h2><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th title="Số thứ tự">STT</th>
				<th title="Tên sản phẩm">Tên sản phẩm</th>
				<th title="Số lượng nhập kho">Số lượng nhập kho</th>
				<th title="Số lượng xuất kho">Số lượng xuất kho</th>
				<th title="Số lượng tồn kho">Số lượng tồn kho</th>
			</tr>
		</thead>
		<tbody id="myTable">
			<%
				int i = 1;
				ArrayList<Value> cakeDetail = (ArrayList<Value>) request.getAttribute("cakeDetail");
				ArrayList<Value> candyDetail = (ArrayList<Value>) request.getAttribute("candyDetail");
				ArrayList<Value> drinkDetail = (ArrayList<Value>) request.getAttribute("drinkDetail");
				ArrayList<Value> someDetail = (ArrayList<Value>) request.getAttribute("someDetail");
			%>
			<c:choose>

				<c:when test="${fn:length(cakeDetail) > 0}">
					<c:forEach items="${cakeDetail}" var="product">
						<tr class="success">
							<td width="5%" style="align: center"><%=i++%></td>
							<td width="28%"><c:out value="${product.key}" /></td>
							<td width="10%"><c:out value="10" /></td>
							<td width="10%"><c:out value="${product.value}" /></td>
							<td width="10%"><c:out
									value="<%=10 - cakeDetail.get(i - 2).getValue()%>" /></td>
						</tr>
					</c:forEach>
				</c:when>

			</c:choose>
			<c:choose>

				<c:when test="${fn:length(candyDetail) > 0}">
					<c:forEach items="${candyDetail}" var="product">
						<tr class="success">
							<td width="5%" style="align: center"><%=i++%></td>
							<td width="28%"><c:out value="${product.key}" /></td>
							<td width="10%"><c:out value="10" /></td>
							<td width="10%"><c:out value="${product.value}" /></td>
							<td width="10%"><c:out
									value="<%=10 - candyDetail.get(i - cakeDetail.size() - 2).getValue()%>" /></td>
						</tr>
					</c:forEach>
				</c:when>

			</c:choose>
			<c:choose>

				<c:when test="${fn:length(drinkDetail) > 0}">
					<c:forEach items="${drinkDetail}" var="product">
						<tr class="success">
							<td width="5%" style="align: center"><%=i++%></td>
							<td width="28%"><c:out value="${product.key}" /></td>
							<td width="10%"><c:out value="10" /></td>
							<td width="10%"><c:out value="${product.value}" /></td>
							<td width="10%"><c:out
									value="<%=10 - drinkDetail.get(i - cakeDetail.size() - candyDetail.size() - 2).getValue()%>" /></td>
						</tr>
					</c:forEach>
				</c:when>

			</c:choose>
			<c:choose>

				<c:when test="${fn:length(someDetail) > 0}">
					<c:forEach items="${someDetail}" var="product">
						<tr class="success">
							<td width="5%" style="align: center"><%=i++%></td>
							<td width="28%"><c:out value="${product.key}" /></td>
							<td width="10%"><c:out value="10" /></td>
							<td width="10%"><c:out value="${product.value}" /></td>
							<td width="10%"><c:out
									value="<%=10 - someDetail
								.get(i - cakeDetail.size() - candyDetail.size() - drinkDetail.size() - 2).getValue()%>" /></td>
						</tr>
					</c:forEach>
				</c:when>

			</c:choose>
		</tbody>
	</table><br>
	<h2 style="text-align: center;"><b>Biểu đồ lợi nhuận trong khoảng thời gian đã chọn</b></h2>
	<br><div style="text-align: center;"><canvas id="buyers" width="600" height="400"></canvas></div>
	<script>
		// line chart data
		var buyerData = {
			labels : [ <c:forEach var="cake" items="${cakeDetail}">"${cake.getKey()}",</c:forEach>
			<c:forEach var="candy" items="${candyDetail}">"${candy.getKey()}",</c:forEach>
			<c:forEach var="drink" items="${drinkDetail}">"${drink.getKey()}",</c:forEach>
			<c:forEach var="some" items="${someDetail}">"${some.getKey()}",</c:forEach>
			],
			datasets : [ {
				fillColor : "rgba(252,147,65,0.5)",
				strokeColor : "#ACC26D",
				pointColor : "#fff",
				pointStrokeColor : "#9DB86D",
				data : [ <c:forEach var="cake" items="${cakeDetail}">"${cake.getValue()}",</c:forEach> <c:forEach var="candy" items="${candyDetail}">"${candy.getValue()}",</c:forEach> <c:forEach var="drink" items="${drinkDetail}">"${drink.getValue()}",</c:forEach> <c:forEach var="some" items="${someDetail}">"${some.getValue()}",</c:forEach>],
			},{
				fillColor : "rgba(151,249,190,0.5)",
				strokeColor : "#ACC26D",
				pointColor : "#fff",
				pointStrokeColor : "#9DB86D",
				data : [ <c:forEach var="cake" items="${cakeDetail}">${cake.getValue()}+3,</c:forEach> <c:forEach var="candy" items="${candyDetail}">${candy.getValue()}+2,</c:forEach> <c:forEach var="drink" items="${drinkDetail}">${drink.getValue()}+1,</c:forEach> <c:forEach var="some" items="${someDetail}">${some.getValue()}+4,</c:forEach>]
			
			}
			]
		}
		var buyers = document.getElementById('buyers').getContext('2d');
		new Chart(buyers).Line(buyerData);
	</script><br>
	<h2 style="text-align: center;"><b>Thông tin về sản phẩm chưa bán được</b></h2><br>
	<table id="example" class="table table-striped">
						<thead>
							<tr>
								<th title="Số thứ tự">STT</th>
								<th title="Mã sp">Mã sản phẩm</th>
								<th title="Tên sp">Tên sản phẩm</th>
								<th title="Gía sp">Gía sản phẩm</th>
								<th title="sale">Sale</th>
								<th title="SL nhập kho">Số lượng nhập kho</th>
								<th title="SL xuất kho">Số lượng xuất kho</th>
							</tr>
						</thead>
						<tbody>
							<%
								int n = 1;
								double sum =0;
							%>
							<c:choose>
								<c:when test="${fn:length(isNotBought) > 0}">
									<c:forEach items="${isNotBought}" var="p">
										<tr>
											<td width="5%" style="align: center"><%=n++%></td>
											<td width="10%"><c:out value="${p.code}" /></td>
											<td width="10%"><c:out value="${p.name}" /></td>
											<td width="10%">$ <c:out value="${p.price}"/></td>
											<td width="15%"><c:out value="${p.sale}" /> %</td>
											<td width="15%"><c:out value="10" /></td>
											<td width="15%"><c:out value="0" /></td>
											<td width="8%">
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
</body>

</html>