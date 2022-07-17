<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file ="../sidebar/LeftSidebar.jsp" %>
<%@include file ="../schedule/scheduleBoardMenuIcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리 게시판 목록 조회하기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/PUVG/css/schedule/scheduleBoardSelectError.css">
<script type="text/javascript">
	$(document).ready(function(){
		var dept1 = document.getElementById('dept1');
		var d1check = dept1.checked;
		console.log("d1check : " + d1check);
		
		var dept2 = document.getElementById('dept2');
		var d2check = dept2.checked;
		console.log("d2check : " + d2check);
		
		var dept3 = document.getElementById('dept3');
		var d3check = dept3.checked;
		console.log("d3check : " + d3check);
		
		var vscalendarnum = $("#vscalendarnum").val()
		
		// 한 가지씩 체크할 때 
		if(d1check == true && d2check == false && d3check == false){
			$("#vscalendarnum").val("01");
		}else if(d2check = true && d1check == false && d3check == false){
			$("#vscalendarnum").val("02");
		}else if(d3check = true && d1check == false && d2check == false){
			$("#vscalendarnum").val("03");
		}
		
		// 2개 체크할 때 반대대는 값을 보내고 다른곳으로 보낸다. 
		if(d1check == true && d2check == true && d3check == false){
			$("#vscalendarnum").val("03");
		}else if(d1check == true && d3check == true && d2check == false){
			$("#vscalendarnum").val("02");
		}else if(d2check == true && d3check == true && d1check == false){
			$("#vscalendarnum").val("01");
		}
		
		if(d1check == true && d2check == true && d3check == true){
			$("#vscalendarnum").val("이거 없는 곳으로 보내기");
		}
		
		if(d1check == false && d2check == false && d3check == false){
			alert("일정을 하나 이상 선택해주세요.");
		}
		
		// 제목 검색하기 ========================================================
		$("#scdSerch").click(function(){
			alert("검색 버튼 클릭");
			var vsname = $("#vsname").val();
			if(vsname==""){
				alert("제목을 한 글자 이상 입력하고 검색 버튼을 클릭해주세요!");
			}else{
				$("#scheduleBoardSelectAll").attr({
					"action":"sheduleBoardSerch.puvg",
					"method":"GET",
					"enctype":"application/x-www-form-urlencoded"
				}).submit();
			}
			
		});
		// 제목 검색하기 ========================================================
			
			
		// 등록버튼 크릵 ========================================================
		$("#scdInsert").click(function(){
			location.href="sheduleBoardInsertForm.puvg";
		});
		// 등록버튼 크릵 ========================================================
		
	});

</script>

</head>
<body>
<form id="scheduleBoardSelectAll">
<div class="scdBDiv1">
	<div class="scdBDiv5">
		<div class="scdBDiv2">
			<span class="scdBSpan1">일정 제목 검색</span><br>
			<input type="text" id="vsname" name="vsname" class="scdBItext" /><br>
			<button type="button" id="scdSerch" class="scdSerchbtn">검색</button>
		</div>
		<div class="scdBDiv3">
			<input type="hidden"  id="vscalendarnum" value="">
			<input type="hidden" id="vdept" value="vdept" />
			<table>
				<tr>	
					<td class="scdTd1"><span class="scdBSpan2" >개인 일정</span></td>
					<td class="scdTd2"><input type="checkbox" id="dept1" checked /></td>
				</tr>
				<tr>
					<td class="scdTd1"><span value="dept1" class="scdBSpan2" checked>부서 일정</span></td>
					<td class="scdTd2"><input type="checkbox" id="dept2" checked /></td>
				</tr>
				<tr>
					<td class="scdTd1"><span value="dept1" class="scdBSpan2" checked>회사 일정</span></td>
					<td class="scdTd2"><input type="checkbox" id="dept3" checked /></td>
				</tr>
			</table>
			</div>
		<div class="scdBDiv4">
			<input type="hidden"  id="vscalendarnum1" value="03">
			<table>
				<tr>
					<td class="scdTd3"><span class="scdBSpan2">진행중인 일정</span></td>
					<td class="scdTd4"><input type="checkbox" id="status1" checked /></td>
				</tr>
				<tr>
					<td class="scdTd3"><span class="scdBSpan2">완료한 일정</span></td>
					<td class="scdTd4"><input type="checkbox" id="status2" checked /></td>
				</tr>
				<tr>
					<td class="scdTd3"><span class="scdBSpan2">미완성한 일정</span></td>
					<td class="scdTd4"><input type="checkbox" id="status3" checked /></td>
				</tr>
			</table>	
		</div>
	</div>
	<div class=scdBDiv7>
	<button type="button" id="scdInsert" class="scdSerchbtn">등록</button>
	</div>
	<div class="scdBDiv6">
		<table class="scdTable">
			<tr>
				<td class="scdTd5"><span class="scdBSpan3">번호</span></td>
				<td class="scdTd6"><span class="scdBSpan3">일정 제목</span></td>
				<td class="scdTd7"><span class="scdBSpan3">시작 날짜</span></td>
				<td class="scdTd8"><span class="scdBSpan3">마감 날짜</span></td>
				<td class="scdTd9"><span class="scdBSpan3">상태</span></td>
				<td class="scdTd10"><span class="scdBSpan3">작성날짜</span></td>
			</tr>
			<tr>
				<td colspan="6" class="scdTd17">
					<span class="scdBSpan8">등록된 게시글이 없습니다.</span><br>
					<span class="scdBSpan9">게시글 이름을 다시한 번 확인해주세요.</span><br>
				</td>
			</tr>			
		</table>
	</div>
</div>
</form>


</body>
</html>