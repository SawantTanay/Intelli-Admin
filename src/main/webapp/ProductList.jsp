<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script>
	function myfunction(x,y) {
		$.ajax({
			trpe:'POST',
			url:'getPaginationList',
			data : 'currentPage='+x+'&entryPoint='+y,
			async: false,
			success : function(result) {
				console.log(result);
			}
		});
	}
	</script>
<script type="text/javascript">
$(document).ready(function() {
	var entryPoint =$('#EntryPoint').text();
	var total_pages = $("#ProductPageList option:last").val();
	$(".pagination .total_pages").html(total_pages);
	
	var selected_page = $("#ProductPageList").val();
	if(selected_page == 1){
		$(".pagination span.backNavigation").html("First · Previous ");
		$(".pagination span.frontNavigation").html('<a class="next" href="">Next</a> · <a class="last" href="">Last</a>');
	}
	else if (selected_page == total_pages) {
		$(".pagination span.frontNavigation").html("Next · Last ");
		$(".pagination span.backNavigation").html('<a class="first"  href="">First</a> ·  <a class="prev" href="">Previous</a>');
	}
	
	console.log("before Function"+selected_page);
	myfunction(selected_page,entryPoint);
	console.log("after Function"+selected_page);
	$("#ProductPageList").change(function() {	
		selected_page = $("#ProductPageList").val();
		if(selected_page == 1){
			$(".pagination span.backNavigation").html("First · Previous ");
			$(".pagination span.frontNavigation").html('<a class="next" href="">Next</a> · <a class="last" href="">Last</a>');
		}
		else if (selected_page == total_pages) {
			$(".pagination span.frontNavigation").html("Next · Last ");
			$(".pagination span.backNavigation").html('<a class="first"  href="">First</a> ·  <a class="prev" href="">Previous</a>');
		}
		else {
			console.log($("#ProductPageList").val());
			$(".pagination span.frontNavigation").html('<a class="next" href="">Next</a> · <a class="last" href="">Last</a>');
			$(".pagination span.backNavigation").html('<a class="first"  href="">First</a> ·  <a class="prev" href="">Previous</a>');
		}
		
		
	});
});
</script>
</head>
<body>
<div id="EntryPoint" style="display:none"><s:property value="entryPoint"/></div>
<div class="pagination">
« <span class="backNavigation"> </span>· Page 
<s:select list="pageList" id="ProductPageList" name="pgno"/> of <span class="total_pages"></span> · <span class="frontNavigation"> </span>»
</div>

<div id="ProductData">
<table id="productdatatable">

</table>
</div>
</body>
</html>