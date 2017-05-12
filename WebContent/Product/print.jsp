<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Export</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css">
<style type="text/css" class="init">
</style>
<script type="text/javascript"
	src="/media/js/site.js?_=9a83ad61fa12260d710e54eb5f3203dc">
	
</script>
<script type="text/javascript"
	src="/media/js/dynamic.php?comments-page=extensions%2Fbuttons%2Fexamples%2Finitialisation%2Fexport.html"
	async>
	
</script>
<script type="text/javascript" language="javascript"
	src="//code.jquery.com/jquery-1.12.4.js">
	
</script>
<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js">
	
</script>
<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/buttons/1.2.4/js/dataTables.buttons.min.js">
	
</script>
<script type="text/javascript" language="javascript"
	src="//cdn.datatables.net/buttons/1.2.4/js/buttons.flash.min.js">
	
</script>
<script type="text/javascript" language="javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js">
	
</script>
<script type="text/javascript" language="javascript"
	src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.24/build/pdfmake.min.js">
	
</script>
<script type="text/javascript" language="javascript"
	src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.24/build/vfs_fonts.js">
	
</script>
<script type="text/javascript" language="javascript"
	src="//cdn.datatables.net/buttons/1.2.4/js/buttons.html5.min.js">
	
</script>
<script type="text/javascript" language="javascript"
	src="//cdn.datatables.net/buttons/1.2.4/js/buttons.print.min.js">
	
</script>
<script type="text/javascript" language="javascript"
	src="../../../../examples/resources/demo.js">
	
</script>
<script type="text/javascript" class="init">
	$(document).ready(function() {
		$('#example').DataTable({
			dom : 'Bfrtip',
			buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]
		});
	});
</script>
</head>
<body>
	<h1>In danh sách sản phẩm</h1>
	<table id="example" class="display nowrap" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>STT</th>
				<th>Mã SP</th>
				<th>Tên sản phẩm</th>
				<th>Giá</th>
				<th>Khuyến mại</th>
				<th>Link hình ảnh</th>
				<th>Category</th>
			</tr>
		</thead>
		<%
			int i = 0;
		%>
		<tbody>
			<c:forEach items="${listProduct}" var="product">
				<tr>
					<td><%=i++%></td>
					<td><c:out value="${product.code}" /></td>
					<td><c:out value="${product.name}" /></td>
					<td><c:out value="${product.price}" /></td>
					<td><c:out value="${product.sale}" /></td>
					<td><c:out value="${product.image}" /></td>
					<td><c:out value="${product.category}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>