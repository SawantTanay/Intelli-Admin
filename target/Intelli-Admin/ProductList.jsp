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
	function updateAnchors(x,y) {
		console.log(x);
		$("#ProductPageList").val(x);
		myfunction(x, y);
	}
	</script>
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
				//console.log(str);
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
		$(".pagination span.frontNavigation").html("<a id='next' href='#'>Next</a> · <a id='last' href='#'>Last</a>");
	}
	else if (selected_page == total_pages) {
		$(".pagination span.frontNavigation").html("Next · Last ");
		$(".pagination span.backNavigation").html("<a id='first' href='#'>First</a> ·  <a id='prev' href='#'>Previous</a>");
	}
	
	console.log("Before Function...");
	myfunction(selected_page,entryPoint);
	console.log("After Function...");
	
	$("#ProductPageList").change(function() {	
		selected_page = $("#ProductPageList").val();
		if(selected_page == 1){
			$(".pagination span.backNavigation").html("First · Previous ");
			$(".pagination span.frontNavigation").html("<a id='next' href='#'>Next</a> · <a id='last' href='#'>Last</a>");
		}
		else if (selected_page == total_pages) {
			$(".pagination span.frontNavigation").html("Next · Last ");
		    $(".pagination span.backNavigation").html("<a id='first' href='#'>First</a> ·  <a id='prev' href='#'>Previous</a>");
		}
		else {
			$(".pagination span.backNavigation").html("<a id='first' href='#'>First</a> ·  <a id='prev' href='#'>Previous</a>");
			$(".pagination span.frontNavigation").html("<a id='next' href='#'>Next</a> · <a id='last' href='#'>Last</a>");
		}
		myfunction(selected_page, entryPoint);
	});
	
	$(".pagination span.backNavigation").on("click","a",function(e){
		var elem = $(this);
		if(elem.is("[id^='prev']")) {
			var current_Page = $("#ProductPageList").val();
			current_Page = parseInt(current_Page)-1;
			myfunction(current_Page, entryPoint);
			$("#ProductPageList").val(current_Page);
			if(current_Page == 1) {
				$(".pagination span.backNavigation").html("First · Previous ");
				$(".pagination span.frontNavigation").html("<a id='next' href='#'>Next</a> · <a id='last' href='#'>Last</a>");
			}
			else {
				$(".pagination span.frontNavigation").html("<a id='next' href='#'>Next</a> · <a id='last' href='#'>Last</a>");
			}
		}
		else if(elem.is("[id^='first']")) {
			myfunction(1, entryPoint);
			$("#ProductPageList").val(1);
			$(".pagination span.backNavigation").html("First · Previous ");
			$(".pagination span.frontNavigation").html("<a id='next' href='#'>Next</a> · <a id='last' href='#'>Last</a>");
		}
	});
	
	$(".pagination span.frontNavigation").on("click","a",function() {
		var elem = $(this);
		if(elem.is("[id^='next']")){
			var current_Page = $("#ProductPageList").val();
			current_Page = parseInt(current_Page)+1;
			myfunction(current_Page, entryPoint);
			$("#ProductPageList").val(current_Page);
			if(current_Page== total_pages){
				$(".pagination span.frontNavigation").html("Next · Last ");
			}
			else {
				$(".pagination span.backNavigation").html("<a id='first' href='#'>First</a> ·  <a id='prev' href='#'>Previous</a>");
			}
		}
		else if(elem.is("[id='last']")) {
			myfunction(total_pages, entryPoint);
			$("#ProductPageList").val(total_pages);
			$(".pagination span.frontNavigation").html("Next · Last ");
		}
	});
	

});

</script></head>
<body>
<div id="EntryPoint" style="display:none"><s:property value="entryPoint"/></div>
<div class="pagination">
« <span class="backNavigation"> </span>· Page 
<s:select list="pageList" id="ProductPageList" name="pgno"/> of <span class="total_pages"></span> · <span class="frontNavigation"> </span> »
</div>

<br/>
<br/>
<br/>

<div id="ProductData">
<table id="productdatatable" border="1" height="100%" width="100%">

</table>
</div>
</body>
</html>