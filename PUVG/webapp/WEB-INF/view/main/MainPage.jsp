<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "main.puvg.chart.vo.MemberChartVO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>PUVG GroupWare</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="css/MemberChart.css" rel="stylesheet" type="text/css"/>
		<script src="https://www.gstatic.com/charts/loader.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		<%
			List<MemberChartVO> list = (List<MemberChartVO>)request.getAttribute("chartdata");
			MemberChartVO mvo = list.get(0);
			
		%>

		
		
		google.charts.load('current', {'packages':['corechart']});
		
		//부서별 인원수 현황
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				['Task', 'Hours per Day'],
		        ['총무부', <%=Integer.parseInt(mvo.getAffairs()) %>],
		        ['인사부', <%=Integer.parseInt(mvo.getPersonnel()) %>],
		        ['영업부', <%=Integer.parseInt(mvo.getSales()) %>],
		        ['경영지원부', <%=Integer.parseInt(mvo.getManagement()) %>],
		        ['기술지원부', <%=Integer.parseInt(mvo.getTechnical()) %>],
		        ['기술개발부', <%=Integer.parseInt(mvo.getDevelop()) %>],
		        ['연구기획부', <%=Integer.parseInt(mvo.getPlanning()) %>],
		        ['생산관리부', <%=Integer.parseInt(mvo.getProduction()) %>],
		        ['품질관리부', <%=Integer.parseInt(mvo.getQuality()) %>],
		        ['해외사업부', <%=Integer.parseInt(mvo.getInternational()) %>]
		      ]);
			var options = {
			        title: "부서별 인원 수 현황",
			        width: 600,
			        height: 400,
			        pieHole: 0.4,
			      };
			
			
			var chart = new google.visualization.PieChart(document.getElementById('pie_chart'));
			chart.draw(data, options);
		}
		
		//직책별 인원수 현황
		function drawChart2() {	
			var data1 = google.visualization.arrayToDataTable([
		        ['직책명', '인원수', { role: 'style' } ],
		        ['이사', <%=Integer.parseInt(mvo.getDirector()) %>, 'color: #d20962'],
		        ['부장', <%=Integer.parseInt(mvo.getDepartment()) %>, 'color: #f47721'],
		        ['과장', <%=Integer.parseInt(mvo.getManager()) %>, 'color: #7ac143'],
		        ['대리', <%=Integer.parseInt(mvo.getEngineer()) %>, 'color: #00a78e'],
		        ['주임', <%=Integer.parseInt(mvo.getAssistant()) %>, 'color: #00bce4'],
		        ['신입', <%=Integer.parseInt(mvo.getClerk()) %>, 'color: #7d3f98']
		      ]);
			var options1 = {
			        title: "직책별 인원 수 현황",
			        width: 600,
			        height: 400,
			        bar: {groupWidth: "95%"},
			        legend: { position: "none" },
			      };
			
			
			var chart1 = new google.visualization.ColumnChart(document.getElementById('column_chart'));
			chart1.draw(data1, options1);
		}
		
		//사내 전체 근무인원 현황
		function drawChart3() {
			var data2 = google.visualization.arrayToDataTable([
				['직책명', '인원수', { role: 'style' } ],
		        ['근무', <%=Integer.parseInt(mvo.getWorking()) %>, 'color: red'],
		        ['파견', <%=Integer.parseInt(mvo.getDispatch()) %>, 'color: blue'],
		        ['휴직', <%=Integer.parseInt(mvo.getRest()) %>, 'color: yellow']
		      ]);
			
			var options2 = {
			        title: "사내 전체 인원 현황",
			        width: 600,
			        height: 400,
			        bar: {groupWidth: "95%"},
			        legend: { position: "none" },
			      };
			
			
			var chart2 = new google.visualization.ColumnChart(document.getElementById('column_chart2'));
			chart2.draw(data2, options2);
		}
		
		$(document).ready(function(){
			drawChart();
			drawChart2();
			drawChart3();
		});
		
		//부서별 근무인원 파견인원 휴직인원 현황 / 보류
		/*function drawChart4() {
	        var data = google.visualization.arrayToDataTable([
	          ['부서', '근무', '파견', '휴직'],
	          ['2014', 1000, 400, 200],
	          ['2015', 1170, 460, 250],
	          ['2016', 660, 1120, 300],
	          ['2017', 1030, 540, 350]
	        ]);
	
	        var options = {
	          chart: {
	            title: 'Company Performance',
	            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
	          }
	        };
	
	        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	
	        chart.draw(data, google.charts.Bar.convertOptions(options));
      }*/
		</script>
	</head>
	<body>
		<div>
			<jsp:include page ="../sidebar/LeftSidebar.jsp" flush ="true"/>
		</div>
		<div id="chart_div">
			<div style="width:100%; height:100px; position:static;">
			</div>
			<div class="chart_box">
				<div id="pie_chart"></div>
			</div>
			<div class="chart_box">
				<div id="column_chart"></div>
			</div>
			<div class="chart_box">
				<div id="column_chart2"></div>
			</div>
			<div class="chart_box">
			</div>
			<div class="chart_box">
			</div>
			<div class="chart_box">
			</div>
		</div>
	</body>
</html>