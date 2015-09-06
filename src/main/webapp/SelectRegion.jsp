<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#Locale').change(function() {
		var reg = $('#Locale').val();
		$.ajax({
			type:'POST',
			url: 'getSite',
			data : "region="+reg,
			success : function(result) {
				console.log("===>"+result.length);
				$("#Site").show();
				var allSiteList = result.allSiteList;
				var select = $('#Site').empty();
				select.removeAttr('disabled');
				select.append('<option value="-1">--Select Site--</option>')
				$.each(allSiteList,function(i,v) {
					select.append('<option value="'+i+'">'+v+'</option>');
				});
			},
			error : function (xhr,status,error) {
				
			}
		
		});
	});
	
	$("#Site").change(function(){
		var siteName = $('#Site :selected').text();
		console.log("#Site Changed.....");
		$.ajax({
			type: 'POST',
			url: 'getSiteDetailedInfo',
			data : "site="+siteName,
			success : function (result) {
				$("#SiteTable").show();
				$(".attributeLinks").show();
				$("#siteDetail").empty();
				$("#Locale").fadeOut(2000);$("#Site").fadeOut(2000);
				var siteInfo = result.siteInfo;
				var res = siteInfo.split(";");
				$("#siteDetail").append("<tr><th>Retailer</th><th>Site</th><th>Domain</th><th>Region</th></tr><tr>")
				$.each(res,function(i,value){
					$("#siteDetail").append("<td align=\"center\">"+value+"</td>");
				});
				$("#siteDetail").append("</tr>");
				
				var importInfo = result.importList;
				$("#SiteImport").empty();
				$("#SiteImport").append("<tr><th>Import Date</th><th>Num Prods</th><th>Num Prods on Sale</th><th>Num Prods With Colors</th><th>Num Prods With Sizes</th><th>Action</th></tr>");
				$.each(importInfo, function(i,value){
					var record = value.split(";");
					$("#SiteImport").append("<tr><td>"+record[0]+"</td><td>"+record[1]+"</td><td>"+record[2]+"</td><td>"+record[3]+"</td><td>"+record[4]+"</td><td><a href='getProductList?entryPoint="+record[5]+"&count="+record[1]+"'>Products</a></td></tr>");
					
				});
			}
		});
		
	});
	
	$("#backImage").click(function() {
		window.location.href='selectRegion';
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select The Region</title>
</head>
<body>

	<center>
		<s:select id="Locale" list="allRegionList" name="region"
			headerKey="-1" headerValue="---Select Region---"></s:select>
		<s:select id="Site" list="allSiteList" name="site" headerKey="-1"
			headerValue="---Select Site--" style='display:none'></s:select>
			
		<br> <br>
		<div class="siteTableData" id="SiteTable" style='display: none'
			cellpadding="50" width="50" height="50">
			<div id="backImage" style="float: left">
				<img src="back.jpg" alt="Hello" style="margin-left: 15%;">
			</div>
			<table id="siteDetail" border="1">
			</table>
		</div>
	</center>
	<p>
	
	<div id="ImportLogs">
		<h3></h3>
		<table id="SiteImport" border="1">

		</table>
	</div>
	</p>
	
	<br>
	<p>
	<div class="attributeLinks" style='display:none'>
	<a href="">Products</a> <a href="">Price</a> <a href="">Colors</a> <a href="">Size</a>
	</div> 
	</p>
</body>
</html>