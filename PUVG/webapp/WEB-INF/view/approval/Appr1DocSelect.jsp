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
	
		$(document).ready(function(){
			$(document).on('click', '#approval', function(){
				$("#Appr1Doc").attr({
					"action":"Appr1DocInsert.puvg",
					"method":"POST",
					"enctype":"multipart/form-data"
				}).submit(); 
			});
			
			$(document).on('click', '#temps', function(){
				$("#Appr1Doc").attr({
					"action":"ApprovalTempInsert1.puvg",
					"method":"POST",
					"enctype":"multipart/form-data"
				}).submit(); 
			});
			
			$(document).on('click', '#tempbtn', function(){
				$("#Appr1Doc").attr({
					"action":"ApprovalTempSelectAll.puvg",
					"method":"GET",
					"enctype":"application/x-www-form-urlencoded"
				}).submit(); 
			});
				
			var dates = new Date();
			document.getElementById("insertdate").value = dates.toLocaleDateString();

			
		});
		
	</script>
	<style>
	  *{
	    font-family: "paybooc-Light", sans-serif;
	  }
	  
	  .MemInsertDiv1{
		width : 1000px;
		/*height : 800px;*/
		height : 1500px;
		border : 1px solid #eee;
		box-shadow: 3px 3px 5px 1px rgba(0, 0, 0, .1);
		margin-left : auto;
		margin-right : auto;
		margin-bottom : 100px;
		background : #ececf6;
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
	
	.maintable{
		height: 550px;
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
	
    </style>
	</head>
	<body>
	
	<div>
		<jsp:include page="../sidebar/LeftSidebar.jsp" flush="true"/>
	</div>
	<div class="MemInsertDiv1">
	<div class="mainss" style="width: 100%">
	<div style="width:100%; height:100px; position:static;"></div>
	<h1 style="margin:30px">휴가신청서</h1>
	<input type="button" id="tempbtn" class="w-btn temp" value="임시파일">
	<input type="button" id="apprbtn" class="w-btn approval" value="문서함">
	<hr>
	<form id="Appr1Doc" name="Appr1Doc">
	<div style="border: 1px solid black; top: 240px; left: 340px;">
		<input class="vsubj" id="vsubj" name="vsubj" type="text" style="width: 99%; height: 30px; font-size: 15px; border:0 solid black; background-color: transparent;" placeholder="제목을 입력해 주세요.">
	</div>
	<div class="maintable" style="border: none; margin: 10px 0px; background-color: #BCA9F5;">
	<div>
		<div style="float:left; margin-left: 100px; margin-right: 100px;">
		<table class="Appr1Table" style="border: none; top: 300px; left: 527px; text-align: center;">
			<tr>
				<td> 문서번호
				</td>
				<td>
					<input type="text" id="vdocnum" name="vdocnum" value="${vdocnum}">
				</td>
			</tr>
			<tr>
				<td> 작성일자
				</td>
				<td>
					<input type="text" id="insertdate" name="insertdate" value="${insertdate}">
				</td>
			</tr>
			<tr>
				<td> 부서
				</td>
				<td>
					<input type="text" id="vdept" name="vdept" value="인사부">
				</td>
			</tr>
			<tr>
				<td> 작성자
				</td>
				<td>
					<input type="text" id="vname" name="vname" value="박주형">
				</td>
			</tr>
		</table>
		</div>
		<div style="float:left; margin-left: 30px; margin-right: 40px; top: 300px; left: 1000px;">
		<table class="Appr2Table" style="border: none;">
			<tr>
				<td> 결재라인
				</td>
			</tr>
			<tr>
				<td><input type="text" id="vline" name="vline" style="width: 300px; height: 100px;" value="${vline}"></td>
			</tr>
			<tr>
				<td style="border: none; text-align: right"><input type="button" id="vlines" name="vlines" class="btns1" value="결재선" onclick='open_popup()'></td>
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
				<td><input type="text" id="vfile" name="vfile" style="width: 300px; height: 100px;"></td>
			</tr>
			<tr>
				<td style="border: none; text-align: right"><input type="file" id="upbtn" name="upbtn" value="파일첨부" value="${vfile}"></td>
			</tr>
		</table>
		</div>
	</div>
			<div>
			<table class="Appr4Table" style="border: none; position: absolute; top: 550px; left: 527px; text-align: center;">
			<tr>
				<td style="width: 350px"> 휴가 종류
				</td>
				<td>
					<input type="text" id="vtype" name="vtype" value="${vtype}">
				</td>
			</tr>
			<tr>
				<td> 휴가 시작/종료일
				</td>
				<td style="text-align: left;">
					<input type="text" style="width: 300px;" id="vstart" name="vstart" onchange="call()" value="${vstart}"> 
					~
					<input type="text" style="width: 300px;" id="vend" name="vend" onchange="call()" value="${vend}">
				</td>
			</tr>
			<tr>
				<td> 휴가일수
				</td>
				<td>
					<input type="text" id="vdate" name="vdate" value="${vdate}">
				</td>
			</tr>
			<tr>
				<td> 남은휴가일수
				</td>
				<td>
					<input type="text" id="vleft" name="vleft" value="${vleft}">
				</td>
			</tr>
		</table>
		</div>
	</div>
	<div style="text-align:right">
		<input type="button" id="temps" name="temps" class="w-btn temps" value="임시저장">	
		<input type="button" id="approval" name="approval" class="w-btn approval" value="제출하기">
		<input type="button" id="cancle" name="cancle" class="w-btn cancle" value="취소하기">
		<input type="hidden" id="vnum" name="vnum" value="V202207040001">
		<input type="hidden" id="vlinecode" name="vlinecode" value="V0001">
		<input type="hidden" id="vfile" name="vfile">
		<input type="hidden" id="vsubnum" name="vsubnum">
		<input type="hidden" id="vcheck" name="vcheck" value="0">
	</div>
	</form>
	</div>
	</div>
	</body>
</html>