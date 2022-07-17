<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax_weathergokr_rss</title>
<style>
	.wtable{
		text-align:center}
	.wtable2{
		text-align:center}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(function(){
			let urlv = "ajax_weathergokr_rss.xml";
			let typev = "xml";
			
			$.ajax({
				url : urlv,
				dataType : typev,
				success : suc,
				error : err
			})
			
			function suc(data) {
					var item = $(data).find("item");
					var header = $(data).find("header");
					if(header.length > 0) {
						var title = item.find("title").text();
						var wf = header.find("wf").text();	
						//$(".head").append(title +"<hr>" +wf);	
					}
					
					var location = $(data).find("location");
					var day = ["월","화","수","목","금","토","일"];
					var n = 6;
					$.each(location, function(i, result_data){
						var city = $(result_data).find("city").text();
						if (city == "서울") {
							var wdata = $(result_data).find("data");
							if (wdata.length> 0) {
								var ctable = $("<table border='1' style='width:100%;'/>");
								ctable.append("<tr><td rowspan='2'>요일</td>"+
												"<td colspan='4' align='center'>오전</td>"+
												"<td colspan='4' align='center'>오후</td></tr>"+
										
												"<td>강수확률</td>"+
												"<td>최고기온</td>"+
												"<td>최저기온</td>"+
												"<td>날씨</td>"+
												"<td>강수확률</td>"+
												"<td>최고기온</td>"+
												"<td>최저기온</td>"+
												"<td>날씨</td></tr>"	);
								
								var ctable2 = $("<table border='1' style='width:100%;'/>");
								ctable2.append("<tr><td>요일</td>"+
												"<td>강수확률</td>"+
												"<td>최고기온</td>"+
												"<td>최저기온</td>"+
												"<td>날씨</td></tr>");
								var mod_count = true;
								var A02_row = $("<tr />");
								
								$.each(wdata, function(i, result_data){
									var mode = $(result_data).find("mode").text();
									
									var weather = $(result_data).find("wf").text();
									var maxtemp = $(result_data).find("tmx").text();
									var mintemp = $(result_data).find("tmn").text();
									var rainy = $(result_data).find("rnSt").text();
									
									
									if (mode == "A02") {
										if(mod_count){
											A02_row.append(
												$("<td width='50px'/>").text(day[n] + "요일"),
												$("<td />").text(rainy + " %"),
												$("<td />").text(maxtemp + " 도"),
												$("<td />").text(mintemp + " 도"),
												$("<td align='right'/>").text(weather) 
												);

											mod_count = false;
											n++;
											if(n >= 7) n=0;
										} else if(!mod_count) {
											A02_row.append(
													$("<td />").text(rainy + " %"),
													$("<td />").text(maxtemp + " 도"),
													$("<td />").text(mintemp + " 도"),
													$("<td align='right'/>").text(weather) 
													);
											ctable.append(A02_row);
											A02_row = $("<tr />");
											mod_count = true;
											
										}
										
									
									} else if (mode == "A01") {
										var A01_row =  $("<tr />").append(
											$("<td width='50px'/>").text(day[n] + "요일"),
											$("<td />").text(rainy + " %"),
											$("<td />").text(maxtemp + " 도"),
											$("<td />").text(mintemp + " 도"),
											$("<td align='right'/>").text(weather) 
											);
										n++;
										if(n >= 7) n=0;
										ctable2.append(A01_row);
									}
									
									
									
								}); // wdata each
								$(".wtable").append(ctable);
								$(".wtable2").append(ctable2);
							} // validation check
						} // if city end
					}) // loacation each
					
			} // end suc
				
			function err(e) {
				alert(e.responseText);
			}

		});
	});
</script>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
	String day = sdf.format(date);
	
%>
</head>

<body>
<div></div>
<div class="head" style="text-align:center;">
	<font size="4"><b><%= day %></b></font>
</div>
<div class="wtable"></div>
<div class="wtable2"></div>
</body>
</html>