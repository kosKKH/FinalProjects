<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="main.puvg.member.vo.MemberVO"%>  
<%@page import="java.util.List"%> 

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link href="css/LeftSidebar.css" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">

$(document).ready(function(){
	
	var tabcheck = $("#tabCheck").val();
	$(".tabSpan1").click(function(){
		if(tabcheck=="N"){
			tabcheck = "Y";
			setTimeout(function(){
			$("#myImfo").css({"transform":"translateY(0)"});	
			}, 100);
			setTimeout(function(){
			$("#logOut").css({"transform":"translateY(0)"});	
			}, 200);
		}else if(tabcheck=="Y"){
			tabcheck = "N";
			setTimeout(function(){
			$("#myImfo").css({"transform":"translateY(-150%)"});	
			}, 100);
			setTimeout(function(){
			$("#logOut").css({"transform":"translateY(-150%)"});	
			}, 200);
		}
	});
	
	$("#myImfo").click(function(){
		location.href="memberSelect.puvg";
	});
	
	$("#logOut").click(function(){
		if (!confirm("로그아웃 하시겠습니까?")) {
		} else {
			location.href="logout.puvg";
		}
	});
	
	//==================================================================
		
	$("#menuBoard").click(function(){
		$(".menuSmall2").css({"height":"70px"});
		$(".menuSmall1").css({"height":"0px"});
		$(".menuSmall3").css({"height":"0px"});
		$(".menuSmall4").css({"height":"0px"});
		$(".menuSmall5").css({"height":"0px"});
	});
	
	$("#menuMEM").click(function(){
		$(".menuSmall3").css({"height":"140px"});
		$(".menuSmall1").css({"height":"0px"});
		$(".menuSmall2").css({"height":"0px"});
		$(".menuSmall4").css({"height":"0px"});
		$(".menuSmall5").css({"height":"0px"});
	});
	
	$("#menuApproval").click(function(){
		$(".menuSmall1").css({"height":"110px"});
		$(".menuSmall2").css({"height":"0px"});
		$(".menuSmall3").css({"height":"0px"});
		$(".menuSmall4").css({"height":"0px"});
		$(".menuSmall5").css({"height":"0px"});
	});
	
	$("#menuSchedule").click(function(){
		$(".menuSmall4").css({"height":"70px"});
		$(".menuSmall1").css({"height":"0px"});
		$(".menuSmall2").css({"height":"0px"});
		$(".menuSmall3").css({"height":"0px"});
		$(".menuSmall5").css({"height":"0px"});
	});
	
	$("#menuCompany").click(function(){
		$(".menuSmall5").css({"height":"110px"});
		$(".menuSmall1").css({"height":"0px"});
		$(".menuSmall2").css({"height":"0px"});
		$(".menuSmall3").css({"height":"0px"});
		$(".menuSmall4").css({"height":"0px"});
	});
});
</script>

</head>
<body>


<div id="tab" class="tabDiv1">
	<%
		HttpSession Session = request.getSession(false);
		String VNAME = (String)Session.getAttribute("VNAME");
	%>
</div>
<div class="tabDiv2"><span class="tabSpan1"><%= VNAME %></span>님, 안녕하세요!
	<div class="tabDiv3">
	<input type="hidden" id="tabCheck" value="N"/>
		<button type="button" id="myImfo" class="tabBtn1">내 정보 보기</button>
		<button type="button" id="logOut" class="tabBtn1">로그아웃</button>
	</div>
</div>

<div class="menu">
	<div class="menu_img">
		<a href="mainpage.puvg"><img src="/PUVG/css/icons/logo.png" class="menuImg"/></a>
	</div>
	<div class="menuCategory">
		<div id="menuMEM" class="menuBig">개인정보 관리</div>
		<div class="menuSmall3">
			<a href="memberSelectWork.puvg?&nowpage=1" class="menuA">- 사원 검색</a><br>
			<a href="memberInsertForm.puvg" class="menuA">- 사원 등록</a><br>
			<a href="memberSelectAll.puvg?&nowpage=1" class="menuA">- 사원 관리</a><br>
			<a href="memberChart.puvg" class="menuA">- 인원 현황판</a>
		</div>
	
		<div id="menuApproval" class="menuBig">전자결재</div>
		<div class="menuSmall1">
			<a href="ApprovalListSelectAll.puvg" class="menuA">- 결재양식</a><br>
			<a href="ApprovalListAcceptAll.puvg" class="menuA">- 상신함</a><br>
			<a href="ApprovalViewAll.puvg" class="menuA">- 후열함</a>
		</div>
		<div id="menuBoard" class="menuBig">게시판</div>
		<div class="menuSmall2">
			<a href="BoardSelectAll.puvg" class="menuA">- 사내게시판</a><br>
			<a href="BoardInsert.puvg" class="menuA">- 게시글 작성</a>
		</div>
		<div id="menuSchedule" class="menuBig">일정관리</div>
		<div class="menuSmall4">
			<a href="scheduleMain.puvg?checkstatus=123" class="menuA">- 일정 달력</a><br>
			<a href="scheduleBoardSelectAll.puvg?checkstatus=123" class="menuA">- 일정 게시판</a><br>
		</div>
		<div id="menuCompany" class="menuBig">회사</div>
		<div class="menuSmall5">
			<a href="#" class="menuA">- 회사 소개</a><br>
			<a href="#" class="menuA">- 회사 내부</a><br>
			<a href="mapapi.puvg" class="menuA">- 오시는 길</a><br>
		</div>
		
	</div>
	
	

</div>
</body>
</html>