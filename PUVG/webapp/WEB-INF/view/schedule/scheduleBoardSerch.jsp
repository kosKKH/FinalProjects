<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="main.puvg.schedule.vo.ScheduleVO"%>
<%@ page import="java.util.List"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% 
    Logger logger = LogManager.getLogger(this.getClass());
    logger.info("scheduleBoardSerch.jsp 일정관리 게시판 제목찾기 ");

    List<ScheduleVO> serch = (List<ScheduleVO>)request.getAttribute("serch");
    int nCnt = serch.size();
%>

<%@include file ="../schedule/scheduleBoardMenuIcon.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 제목 찾기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/PUVG/css/schedule/scheduleBoardSelectAll.css">

<script type="text/javascript">

$(document).ready(function(){
	// 메뉴버튼 ================================================================	
	$(".scheduleBoardImg_Menue").click(function(){
		if (!confirm("게시판으로 이동할까요?")) {
	    } else {
			$("#scheduleBoardSelectAll").attr({
				"action":"scheduleBoardSelectAll.puvg",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
	    }
	});
	// 메뉴버튼 ================================================================
		
	// 제목 검색하기 =============================================================
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
	// 제목 검색하기 =============================================================
		
	// 메뉴버튼 ================================================================	
	$(".scheduleBoardImg_Menue").click(function(){
		if (!confirm("게시판으로 이동할까요?")) {
	    } else {
			$("#select").attr({
				"action":"scheduleBoardSelectAll.puvg",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
	    }
	});
	// 메뉴버튼 ================================================================
		
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
			<div class=scdBDiv7>
			
			</div>
			
			<!-- 
			<table>
				<input type="hidden" id="vdept" value="vdept" />
				<tr>	
					<input type="hidden" id="dept1" value="Y" />
					<td class="scdTd1"><span class="scdBSpan2">개인 일정</span></td>
					<td class="scdTd2"><img src="/PUVG/img/btnOnOff.png" id="scdBImg01" class="scdBImg"/></td>
				</tr>
				<tr>
					<input type="hidden" id="dept2" value="Y" />
					<td class="scdTd1"><span class="scdBSpan2">부서 일정</span></td>
					<td class="scdTd2"><img src="/PUVG/img/btnOnOff.png" id="scdBImg02" class="scdBImg"/></td>
				</tr>
				<tr>
					<input type="hidden" id="dept3" value="Y" />
					<td class="scdTd1"><span class="scdBSpan2">회사 일정</span></td>
					<td class="scdTd2"><img src="/PUVG/img/btnOnOff.png" id="scdBImg03" class="scdBImg"/></td>
				</tr>
			</table>
			 -->
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
			<!-- 
			<table>
				<tr>
					<td class="scdTd3"><span class="scdBSpan2">진행중인 일정</span></td>
					<td class="scdTd4"><img src="/PUVG/img/btnOnOff.png" class="scdBImg"/></td>
				</tr>
				<tr>
					<td class="scdTd3"><span class="scdBSpan2">완료한 일정</span></td>
					<td class="scdTd4"><img src="/PUVG/img/btnOnOff.png" class="scdBImg"/></td>
				</tr>
				<tr>
					<td class="scdTd3"><span class="scdBSpan2">미완성한 일정</span></td>
					<td class="scdTd4"><img src="/PUVG/img/btnOnOff.png" class="scdBImg"/></td>
				</tr>
			</table>
			 -->
			 <!-- 
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
			 -->
		</div>
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
String vnum = "";
String vsnum = "";
String vsstart = "";
String vsend ="";
String vsstatus ="";
String vscalendarnum = "";

for(int i = 0; i < nCnt; i++){
	ScheduleVO svoAll = serch.get(i);
	vnum = svoAll.getVnum();
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

%>			<input type="hidden" id="vnum" name="vnum" value="<%= vnum %>" />
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
<%
	}
%>
		</table>
	
	</div>
	

</div>
</form>

</body>
</html>