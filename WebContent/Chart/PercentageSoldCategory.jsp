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
<title>Chart of sold product follow category</title>
<link href='<%=request.getContextPath()%>/image/favicon.ico' rel='shortcut icon' type='image/vnd.microsoft.icon'/>
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/css/myweb.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['columnchart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.    
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
                    <c:forEach var="cake" items="${cakeDetail}">['${cake.getKey()}',${cake.getValue()}],</c:forEach>
                ]);
                // Set chart options
                var options = {
                    'title': 'Thống kê tỷ lệ bánh đã bán được',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('Chart1'));
                chart.draw(data, options);
            }
        </script>

<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['columnchart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.    
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
                    <c:forEach var="candy" items="${candyDetail}">['${candy.getKey()}',${candy.getValue()}],</c:forEach>
                ]);
                // Set chart options
                var options = {
                    'title': 'Thống kê tỷ lệ kẹo đã bán được',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('Chart2'));
                chart.draw(data, options);
            }
        </script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['columnchart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.    
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
                    <c:forEach var="drink" items="${drinkDetail}">['${drink.getKey()}',${drink.getValue()}],</c:forEach>
                ]);
                // Set chart options
                var options = {
                    'title': 'Thống kê tỷ lệ thức uống đã bán được',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('Chart3'));
                chart.draw(data, options);
            }
        </script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['columnchart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.    
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
                    <c:forEach var="some" items="${someDetail}">['${some.getKey()}',${some.getValue()}],</c:forEach>
                ]);
                // Set chart options
                var options = {
                    'title': 'Thống kê tỷ lệ loại khác đã bán được',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('Chart4'));
                chart.draw(data, options);
            }
        </script>




<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
            //load the Google Visualization API and the chart
            google.load('visualization', '1', {'packages': ['columnchart']});
 
            //set callback
            google.setOnLoadCallback (createChart);
 
            //callback function
            function createChart() {
 
                //create data table object
                var dataTable = new google.visualization.DataTable();
 
                //define columns
                dataTable.addColumn('string','Quarters 2009');
                dataTable.addColumn('number', 'số lượng');
 
                //define rows of data
                dataTable.addRows([['Cake', ${quantityCake}], ['Candy',${quantityCandy}], ['Drink',${quantityDrink}], ['Something else',${quantitySome}]]);
 
                //instantiate our chart object
                var chart = new google.visualization.ColumnChart (document.getElementById('chart'));
 
                //define options for visualization
                var options = {width: 700, height: 300, is3D: true, title: 'Thống kê số hàng đã bán theo từng loại'};
 
                //draw our chart
                chart.draw(dataTable, options);
 
            }
        </script>
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
	
	
	
	
	
	<div class="col-md-12 bdheading">
		<span>Category</span>
	</div>
	<div id="chart" style="text-align: center;"></div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 bdheading">
			<span>Cake</span>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6">
		<table id="example"  class="table table-striped" >
				<thead>
					<tr>
						<th title="Số thứ tự">STT</th>
						<th title="Mã sp">Mã sản phẩm</th>
						<th title="Số lượng sp">Số lượng sản phẩm đã bán</th>
					</tr>
				</thead>
				<tbody>
				<%int i =1; %>
					<c:choose>
								<c:when test="${fn:length(cakeDetail) > 0}">
									<c:forEach items="${cakeDetail}" var="cake">
										<tr>
											<td width="5%" style="align: center"><%=i++%></td>
											<td width="10%"><c:out value="${cake.key}" /></td>
											<td width="10%"><c:out value="${cake.value}" /></td>
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
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6">
		<div id="Chart1">
		</div>
		</div>
		
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 bdheading">
		<span>Candy</span>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6">
		<table id="example"  class="table table-striped" >
				<thead>
					<tr>
						<th title="Số thứ tự">STT</th>
						<th title="Mã sp">Mã sản phẩm</th>
						<th title="Số lượng sp">Số lượng sản phẩm đã bán</th>
					</tr>
				</thead>
				<tbody>
				<%int j =1; %>
					<c:choose>
								<c:when test="${fn:length(candyDetail) > 0}">
									<c:forEach items="${candyDetail}" var="candy">
										<tr>
											<td width="5%" style="align: center"><%=j++%></td>
											<td width="10%"><c:out value="${candy.key}" /></td>
											<td width="10%"><c:out value="${candy.value}" /></td>
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
		</div>
	</div>
	<div id="Chart2"></div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 bdheading">
		<span>Drink</span>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6">
		<table id="example"  class="table table-striped" >
				<thead>
					<tr>
						<th title="Số thứ tự">STT</th>
						<th title="Mã sp">Mã sản phẩm</th>
						<th title="Số lượng sp">Số lượng sản phẩm đã bán</th>
					</tr>
				</thead>
				<tbody>
				<%int k =1; %>
					<c:choose>
								<c:when test="${fn:length(drinkDetail) > 0}">
									<c:forEach items="${drinkDetail}" var="drink">
										<tr>
											<td width="5%" style="align: center"><%=k++%></td>
											<td width="10%"><c:out value="${drink.key}" /></td>
											<td width="10%"><c:out value="${drink.value}" /></td>
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
		</div>
	</div>
	<div id="Chart3"></div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 bdheading">
		<span>Something else</span>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6">
		<table id="example"  class="table table-striped" >
				<thead>
					<tr>
						<th title="Số thứ tự">STT</th>
						<th title="Mã sp">Mã sản phẩm</th>
						<th title="Số lượng sp">Số lượng sản phẩm đã bán</th>
					</tr>
				</thead>
				<tbody>
				<%int e =1; %>
					<c:choose>
								<c:when test="${fn:length(someDetail) > 0}">
									<c:forEach items="${someDetail}" var="some">
										<tr>
											<td width="5%" style="align: center"><%=e++%></td>
											<td width="10%"><c:out value="${some.key}" /></td>
											<td width="10%"><c:out value="${some.value}" /></td>
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
		</div>
	</div>
	<div id="Chart4"></div>

</body>
</html>