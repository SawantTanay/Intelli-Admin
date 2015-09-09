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
	function myfunction(x,y){
		$.ajax({
			type:'POST',
			url:'getPaginationList',
			data : 'currentPage='+x+'&entryPoint='+y,
			async: false,
			success : function(result) {
				var resultList = result.resultList;
				console.log(resultList);
				$("#productdatatable").empty();
				$("#productdatatable").append("<tr>");
				var d =0;
				var str="<tr>";
				$.each(resultList,function(i,v){
					d++;
					str=str+"<td><img src='"+v.imageURL+"' width='100' height='100'/>"+v.productName
					+"<div class='jsonData' style='margin-right:15%'><br/><span style='color:gray'>Brand</span> : "+v.brand+"<br/><span style='color:gray'>RetailerName</span>: "+v.retailerConfigs.retailer
					+"<br/><span style='color:gray'>category</span>: <span style='color:red'>"+v.categoryList[0].category
					+"</span><br/><span style='color:gray'>view</span> : <a href='"+v.productUrl.feed+"'>Retailer Ste</a> <a href='"+v.productUrl.feed+"'>History</a></div></td>";
					if(d%3==0){
						str = str+"</tr><tr>";
					}
				});
				str = str + "</tr>";
				console.log(str);
				$("#productdatatable").append(str);
			}
		});
	}
	</script>
<script>
$(document).ready(function() {
	var entryPoint =$('#EntryPoint').text();
	var total_pages = $("#ProductPageList option:last").val();
	$(".pagination .total_pages").html(total_pages);
	
	var selected_page = $("#ProductPageList").val();
	if(selected_page == 1){
		$(".pagination span.backNavigation").html("First · Previous ");
		var nextPg = parseInt(selected_page) + 1;
		$(".pagination span.frontNavigation").html("<a class='next' href='getPaginationList?entryPoint="+entryPoint+"&currentPage="+nextPg+"'>Next</a> · <a class='last' href='getPaginationList?entryPoint="+entryPoint+"&currentPage="+total_pages+"'>Last</a>");
	}
	else if (selected_page == total_pages) {
		$(".pagination span.frontNavigation").html("Next · Last ");
		var prevPg = parseInt(selected_page) - 1;
		$(".pagination span.backNavigation").html("<a class='first' href='getPaginationList?entryPoint="+entryPoint+"&currentPage=1'>First</a> ·  <a class='prev' href='getPaginationList?entryPoint="+entryPoint+"&currentPage="+prevPg+">Previous</a>");
	}
	
	console.log("before Function"+selected_page);
	myfunction(selected_page,entryPoint);	
	console.log("after Function"+selected_page);
	
	$("#ProductPageList").change(function() {	
		selected_page = $("#ProductPageList").val();
		if(selected_page == 1){
			$(".pagination span.backNavigation").html("First · Previous ");
			var nextPg = parseInt(selected_page) + 1;
			$(".pagination span.frontNavigation").html("<a class='next' href='getPaginationList?entryPoint="+entryPoint+"&currentPage="+nextPg+"'>Next</a> · <a class='last' href='getPaginationList?entryPoint="+entryPoint+"&currentPage="+total_pages+"'>Last</a>");
		}
		else if (selected_page == total_pages) {
			$(".pagination span.frontNavigation").html("Next · Last ");
			var prevPg = parseInt(selected_page) - 1;
			$(".pagination span.backNavigation").html("<a class='first' href='getPaginationList?entryPoint="+entryPoint+"&currentPage=1'>First</a> ·  <a class='prev' href='getPaginationList?entryPoint="+entryPoint+"&currentPage="+prevPg+">Previous</a>");
		}
		else {
			var prevPg = parseInt(selected_page) - 1;
			//console.log("Hellelo");
			//console.log(prevPg);
			$(".pagination span.backNavigation").html("<a class='first' href='getPaginationList?entryPoint="+entryPoint+"&currentPage=1'>First</a> ·  <a class='prev' href='getPaginationList?entryPoint="+entryPoint+"&currentPage="+prevPg+">Previous</a>");
			var nextPg = parseInt(selected_page) + 1;
			$(".pagination span.frontNavigation").html("<a class='next' href='getPaginationList?entryPoint="+entryPoint+"&currentPage="+nextPg+"'>Next</a> · <a class='last' href='getPaginationList?entryPoint="+entryPoint+"&currentPage="+total_pages+"'>Last</a>");
		}
		myfunction(selected_page,entryPoint);
		
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

<br/>
<br/>
<br/>

<div id="ProductData">
<table id="productdatatable" border="1">

</table>
</div>
</body>
</html>