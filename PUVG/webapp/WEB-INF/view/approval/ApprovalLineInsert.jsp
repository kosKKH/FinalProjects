<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	function setData(){
		var msg = $("#vLine").val();
		opener.liness(msg);
		window.close();
	}

	$(document).ready(function(){
		
		var lines = "";
		
		$('#app1 li').click(function(){
			if(lines == ""){
				lines = lines + $(this).text();
				document.getElementById("vLine").value = lines;
			}else{
				lines = lines + '->';
				lines = lines + $(this).text();
				document.getElementById("vLine").value = lines;
			}
		})
		
	});
	
</script>
<style>

	#ApprovalLine{
		width: 515px;
		height: 430px;
		border: 3px solid black;
	}
	
	#ApprovalRes{
		width: 515px;
		height: 300px;
		border: 3px solid black;
	}
	
	#vLine{
		border: none;
		background: transparent;
	}
	#buttons{
		width: 515px;
	}
	
	input:focus{
		outline: none;
	}
 
</style>
</head>
<body>
	<form name="ApprForm" id="ApprForm">
	<div id="ApprovalLine">
		<ul>
		<li id="toc-toggle">인사부
			<ul id="app1">
				<li>주형팍 사장</li>
				<li>도강수 부장</li>
				<li>박주형 부장</li>
				<li>민창호 대리</li>
				<li>고창석 대리</li>
				<li>민수영 주임</li>
				<li>박주원 주임</li>
				<li>전민규 신입</li>
			</ul>
		</li>
		</ul>
	</div>
	<div id="ApprovalRes">
		<h3>결재라인</h3>
		<input type="text" name="vLine" id="vLine" style="width:450px;">
	</div>
	<div id="buttons" style="text-align: right">
		<input type="button" name="commit" id="commit" value="확인" onclick="setData()">
		<input type="button" name="cancle" id="cancle" onclick="window.close()" value="취소">
	</div>
	</form>
</body>
</html>