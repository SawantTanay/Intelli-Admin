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
<script type="text/javascript">
$(document).ready(function() {
	var total_pages = $("#ProductPageList option:last").val();
	$(".pagination .total_pages").html(total_pages);
	
	var selected_page = $("#ProductPageList").val();
	if(selected_page == 1) {
		$(".first").addClass("disabled");
	}
});
</script>
</head>
<body>
<div class="pagination">
« <a class="first"  href="">First</a>   <a class="prev" href="">Previous</a> *Page 
<s:select list="pageList" id="ProductPageList" name="pgno"/> of <span class="total_pages"></span> <a class="next" href="">Next</a> <a class="last" href="">Last</a> »
</div>
</body>
</html>