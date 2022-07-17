<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="main.puvg.schedule.vo.ScheduleVO"%>
<%@ page import="java.util.List"%>

<%@include file ="../sidebar/LeftSidebar.jsp" %>
   
<% request.setCharacterEncoding("UTF-8");%>
<% 
    Logger logger = LogManager.getLogger(this.getClass());
    logger.info("scheduleBoardSelectAll.jsp 일정관리 게시판 이동 ");

    List<ScheduleVO> selectAll = (List<ScheduleVO>)request.getAttribute("selectAll");
    int nCnt = selectAll.size();
%>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리 게시판 목록 조회하기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/PUVG/css/schedule/scheduleBoardSelectAll.css">
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
			
			
		// 등록버튼 클릭 ========================================================
		$("#scdInsert").click(function(){
			location.href="sheduleBoardInsertForm.puvg";
		});
		// 등록버튼 클릭 ========================================================
			
		// 메뉴버튼 클릭 ========================================================
		$(".scheduleBoardImg_C1").click(function(){
			$("#scheduleBoardSelectAll").attr({
				"action":"scheduleCalender.puvg",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
		// 메뉴버튼 클릭 ========================================================
	});

</script>

<style type="text/css">

.scdBDiv8{
width:1000px;
height : 65px;
margin-left : auto;
margin-right : auto;
text-align:left;
}
.scdBDiv9{
width : 65px;
height : 65px;
overflow: hidden;
position : relative;
}

.scheduleBoardImg_C2{
width : 60px;
height : 60px;
position : absolute;
/*transform:translateY(-100%);*/
display : none;
transition: 0.5s;
}

.scheduleBoardImg_C1{
width : 60px;
height : 60px;
position : absolute;
}

</style>
</head>
<body>

<form id="scheduleBoardSelectAll">
<!-- 얘는 반드시 세션에서 받아야 함. for로 돌리면 3번 들어감!!!! 반드시 수정할것!!!! -->
<input type="hidden"  id="vnum" name="vnum" value="V202207100001"/>

<div style="width:100%; height:100px; position:static;"></div>
<div class="scdBDiv8" >
	<div class="scdBDiv9">
		<img src = "/PUVG/img/scheduleIcon.png" class="scheduleBoardImg_C1" 
		onmouseover="this.src='/PUVG/img/scheduleIcon3.png'" onmouseout="this.src='/PUVG/img/scheduleIcon.png'"/>
	</div>
</div>

<div class="scdBDiv1">
	<div class="scdBDiv5">
		<div class="scdBDiv2">
			<span class="scdBSpan1">일정 제목 검색</span><br>
			<input type="text" id="vsname" name="vsname" class="scdBItext" /><br>
			<button type="button" id="scdSerch" class="scdSerchbtn">검색</button>
		</div>
		<div class="scdBDiv3">
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
<%   
String vsnum = "";
String vsstart = "";
String vsend ="";
String vsstatus ="";
String vscalendarnum = "";

for(int i = 0; i < nCnt; i++){
	ScheduleVO svoAll = selectAll.get(i);
	vsnum = svoAll.getVsnum();
	vsnum = vsnum.substring(10);
	vsstart = svoAll.getVsstart();
	vsstart = vsstart.substring(2, 10);
	vsstart = vsstart.replace("-", "/");
	vsend = svoAll.getVsend();
	vsend = vsend.substring(2, 10);
	vsend = vsend.replace("-", "/");
	
	vsstatus = svoAll.getVsstatus();
	if(vsstatus.equals("01")){
		vsstatus = "진행중";
	}else if(vsstatus.equals("02")){
		vsstatus = "완료";
	}else if(vsstatus.equals("03")){
		vsstatus = "미완료";
	}
	vscalendarnum = svoAll.getVscalendarnum();

%>
		<tr>
			<td class="scdTd11"><span class="scdBSpan4"><%= vsnum %></span></td>
			<% 	if(vscalendarnum.equals("01")){ %>
			<td class="scdTd12"><span class="scdBSpan5"><a href="scheduleBoardSelect.puvg?vsnum=<%=svoAll.getVsnum() %>" class="scdBA1"><%= svoAll.getVsname() %></a></span></td>
			<% }else if(vscalendarnum.equals("02")){%>
			<td class="scdTd12"><span class="scdBSpan6">부 서</span><span class="scdBSpan5"><a href="scheduleBoardSelect.puvg?vsnum=<%=svoAll.getVsnum() %>" class="scdBA1"><%= svoAll.getVsname() %></a></span></td>
			<% 	}else if(vscalendarnum.equals("03")){%>
			<td class="scdTd12"><span class="scdBSpan7">회 사</span><span class="scdBSpan5"><a href="scheduleBoardSelect.puvg?vsnum=<%=svoAll.getVsnum() %>" class="scdBA1"><%= svoAll.getVsname() %></a></span></td>
			<%} %>
			<td class="scdTd13"><span class="scdBSpan4"><%= vsstart %></span></td>
			<td class="scdTd14"><span class="scdBSpan4"><%= vsend %></span></td>
			<td class="scdTd15"><span class="scdBSpan4"><%= vsstatus %></span></td>
			<td class="scdTd16"><span class="scdBSpan4"><%= svoAll.getInsertdate() %></span></td>
		</tr>			
		<input type="hidden"  id="vsstatus" name="vsstatus" value=""/>
		<input type="hidden"  id="vscalendarnum" name="vscalendarnum" value=""/>
		<input type="hidden"  id="checkstatus" name="checkstatus" value="123"/><!-- 수정X -->
<%
	}
%>
		</table>
	</div>
	

</div>
</form>

</body>
</html>