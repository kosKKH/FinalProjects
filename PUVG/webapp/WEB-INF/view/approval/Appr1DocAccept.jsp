<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.puvg.approval.vo.Appr1DocVO"%>
<%@ page import="java.util.List"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<script type="text/javascript">


	function call()
	{
	    var sdd = document.getElementById("vstart").value;
	    var edd = document.getElementById("vend").value;
	    var ar1 = sdd.split('/');
	    var ar2 = edd.split('/');
	    var da1 = new Date(ar1[2], ar1[0], ar1[1]);
	    var da2 = new Date(ar2[2], ar2[0], ar2[1]);
	    var dif = da2 - da1;
	    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
	    if(sdd && edd){
	    	document.getElementById('vdate').value = parseInt(dif/cDay)
	 	}
	}
		
	$(function(){
		
		$("#vstart").datepicker({
			showOn: "button",
	        buttonImage: "/PUVG/css/icons/calendar.gif",
		    buttonImageOnly: false,
			buttonText: "Select date"
		});
		
		$("#vend").datepicker({
			showOn: "button",
	        buttonImage: "/PUVG/css/icons/calendar.gif",
		    buttonImageOnly: false,
			buttonText: "Select date"
		});
		
	});
	
	function open_popup(){
		window.open("ApprovalLineInsertForm.puvg","결재선","left=150, top=150, width=500px, height=800px");
	}
	
	function liness(vline){
		document.getElementById("vline").value = vline;
	}
	
    $(document).on("click", "#temps", function(){
    	
    	let URL = "ApprovalAcceptUpdate.puvg";
    	let reqType = "GET"
    	let dataParam = {vline: $("#vline").val(),
    					vcheck: $("#vcheck").val(),};
    	
    	$.ajax({
    		url: URL,
    		type: reqType,
    		data: dataParam,
    		success: whenSuccess,
    		error: whenError
    	});
    	
    	function whenSuccess(resData){
    		alert('good');
    		let target =  document.getElementById("vcheck").value;
    		let tags = "<img src ='/PUVG/css/icons/approval_stamp.jpg' style='width:100px; height:100px;'/>";
    		$(".stamp td").eq(target).html(tags);
    		location.reload();
    	}
    	
    	function whenError(resData){
    		alert('bad');
    	}
    	
    })
	
		$(document).ready(function(){
	
		    var lines = document.getElementById("vline").value;
		    var stamps = lines.split('->');
		    var tamp1 = stamps[0];
		    var tamp2 = stamps[1];
		    var tamp3 = stamps[2];
		    
		    document.getElementById("tamp1").value = tamp1;
		    document.getElementById("tamp2").value = tamp2;
		    document.getElementById("tamp3").value = tamp3;
		    
    		let target =  document.getElementById("vcheck").value;
    		let tags = "<img src ='/PUVG/css/icons/approval_stamp.jpg' style='width:100px; height:100px;'/>"; 
    		if(target == 0){
    		}else{
    			for(var i = 0; i <= target-1; i++){
            		$(".stamp td").eq(i).html(tags);
        		}
    		}
		});
		
	</script>
	<style>
	  *{
	    font-family: "paybooc-Light", sans-serif;
	  }
	
      table, td {
        border: 1px solid #000;
		margin: auto;
      }
      
      form {
		justify-content: center;
		align-items: center;
		min-height: 100vh;
      }
      
      h1{
      	text-align: right;
      }
      
      .temp{
    	background-color: #6165f8;
    	color: #fff;
      }
      
      .w-btn, .btns1, .btns2{
	    position: relative;
	    border: none;
	    display: inline-block;
	    padding: 10px 20px;
	    margin: 0px 0px 0px 10px;
	    border-radius: 15px;
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
		}
		
	.t1{
		margin: 30px;
		justify-content: center;
		width: 1200px;
	}
	
	.mainss{
		margin: 0px 30px 0px 430px;
		width: 1200px;
	}
	
	.maintable{
		width: 1463px;
		height: 575px;
	}
	
	input:focus {
		outline: none;
	}
	
	.Appr1Table, .Appr2Table, .Appr3Table{
		margin-top: 30px;
		margin-left: auto;
		margin-right: auto;
	}
	
	table.Appr1Table > tbody > tr > td > input[type=text] {
		width: 400px;
		line-height: 30px;
	}
	
	table.Appr4Table > tbody > tr > td > input[type=text] {
		width: 800px;
		line-height: 30px;
	}
	
	tr.stamp > td {
		width: 100px;
		height: 100px;
	}
	
	tr.stampname {
		text-align: center;
	}
	
	tr.stampname > td > input[type=text]{
		font-size: 15pt;
	}
	
    </style>
	</head>
	<body>
	<div>
		<jsp:include page="../sidebar/LeftSidebar.jsp" flush="true"/>
	</div>
	<div class="mainss" style="width: 1465px">
	<div style="width:100%; height:100px; position:static;"></div>
	<h1 style="margin:30px">휴가신청서</h1>
	<input type="button" id="apprbtn" class="w-btn approval" value="문서함">
	<hr>
	<form id="Appr1Doc" name="Appr1Doc">
	<div style="border: 1px solid black; top: 240px; left: 340px;">
		<input class="vsubj" id="vsubj" name="vsubj" type="text" style="width: 1450px; height: 30px; font-size: 15px; border:0 solid black;" placeholder="제목을 입력해 주세요." readonly>
	</div>
	<div style="width: 1450px; height: 100px; align: right; float: left;">
		<div style="margin: auto; float: right;">
			<table id="accept" class="accept" style="margin: 20px 0px 0px 0px;">
			<tr>
				<tr class="stampname">
				<td><input type="text" id="tamp1" style="border: none; height: 30px; width: 60px; background: transparent;" readonly></td>
				<td><input type="text" id="tamp2" style="border: none; height: 30px; width: 60px; background: transparent;" readonly></td>
				<td><input type="text" id="tamp3" style="border: none; height: 30px; width: 60px; background: transparent;" readonly></td>
			</tr>
			<tr>
				<tr class="stamp">
				<td></td>
				<td></td>
				<td></td>
			</tr>
			</table>
		</div>
	</div>
	<div class="maintable" style="border: none; margin: 10px 0px; background-color: #BCA9F5; top: 300px; left: 340px;" readonly>
	<div>
		<div style="float:left; margin-left: 100px; margin-right: 100px;">
		<table class="Appr1Table" style="border: none; top: 300px; left: 400px; text-align: center;">
			<tr>
				<td> 문서번호
				</td>
				<td>
					<input type="text" id="vdocnum" name="vdocnum" value="${vdocnum}" readonly>
				</td>
			</tr>
			<tr>
				<td> 작성일자
				</td>
				<td>
					<input type="text" id="insertdate" name="insertdate" value="${insertdate}" readonly>
				</td>
			</tr>
			<tr>
				<td> 부서
				</td>
				<td>
					<input type="text" id="vdept" name="vdept" value="인사부" readonly>
				</td>
			</tr>
			<tr>
				<td> 작성자
				</td>
				<td>
					<input type="text" id="vname" name="vname" value="박주형" readonly>
				</td>
			</tr>
		</table>
		</div>
		<div style="float:left">
		<table class="Appr3Table" style="border: none;  margin-right: 40px; top: 300px; left: 1400px;">
			<tr>
				<td> 첨부파일
				</td>
			</tr>
			<tr>
				<td><input type="text" id="vfile" name="vfile" style="width: 300px; height: 100px;" readonly></td>
			</tr>
			<tr>
				<td style="border: none; text-align: right"><input type="file" id="upbtn" name="upbtn" value="파일첨부" value="${vfile}" readonly></td>
			</tr>
		</table>
		</div>
	</div>
			<div>
			<table class="Appr4Table" style="border: none; position: absolute; top: 650px; left: 527px; text-align: center;">
			<tr>
				<td style="width: 350px"> 휴가 종류
				</td>
				<td>
					<input type="text" id="vtype" name="vtype" value="${vtype}" readonly>
				</td>
			</tr>
			<tr>
				<td> 휴가 시작/종료일
				</td>
				<td style="text-align: left;">
					<input type="text" style="width: 300px;" id="vstart" name="vstart" onchange="call()" value="${vstart}" readonly> 
					~
					<input type="text" style="width: 300px;" id="vend" name="vend" onchange="call()" value="${vend}" readonly>
				</td>
			</tr>
			<tr>
				<td> 휴가일수
				</td>
				<td>
					<input type="text" id="vdate" name="vdate" value="${vdate}" readonly>
				</td>
			</tr>
			<tr>
				<td> 남은휴가일수
				</td>
				<td>
					<input type="text" id="vleft" name="vleft" value="${vleft}" readonly>
				</td>
			</tr>
		</table>
		</div>
	</div>
	<div style="text-align:right">
		<input type="button" id="temps" name="temps" class="w-btn approvals" value="결재하기">	
		<input type="button" id="approval" name="approval" class="w-btn rejects" value="반려하기">
		<input type="button" id="cancle" name="cancle" class="w-btn returns" value="되돌아가기">
		<input type="hidden" id="vnum" name="vnum">
		<input type="hidden" id="vlinecode" name="vlinecode">
		<input type="hidden" id="vfile" name="vfile">
		<input type="hidden" id="vsubnum" name="vsubnum">
		<input type="hidden" id="vline" name="vline" value="${vline}">
		<input type="hidden" id="vcheck" name="vcheck" value="${vcheck}">
	</div>
	</form>
	</div>
	</body>
</html>