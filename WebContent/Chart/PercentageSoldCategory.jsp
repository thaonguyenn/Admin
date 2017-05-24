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
	<jsp:include page="../menu.jsp" />
	<!-- menu -->
	<!-- end of menu -->
	<!-- contend of  page -->
	<div class="col-md-12 bdheading">
		<span>Category</span>
	</div>
	<div id="chart" style="text-align: center;">
	</div>
	<div class="col-md-12 bdheading">
		<span>Cake</span>
	</div>
	<div id="Chart1">
	</div>
	<div class="col-md-12 bdheading">
		<span>Candy</span>
	</div>
	<div id="Chart2">
	</div>
	<div class="col-md-12 bdheading">
		<span>Drink</span>
	</div>
	<div id="Chart3">
	</div>
	<div class="col-md-12 bdheading">
		<span>Something else</span>
	</div>
	<div id="Chart4">
	</div>

</body>
</html>