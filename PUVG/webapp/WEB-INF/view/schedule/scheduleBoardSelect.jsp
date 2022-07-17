<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="main.puvg.schedule.vo.ScheduleVO"%>
<%@ page import="java.util.List"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% 
    Logger logger = LogManager.getLogger(this.getClass());
    logger.info("scheduleBoardSelect.jsp 일정 번호로 확인하기 ");

    List<ScheduleVO> select = (List<ScheduleVO>)request.getAttribute("select");
    int nCnt = select.size();
    
    String vsname = "";
    String vnum = "";
    String vsstart="";
    String vsend="";
    String vsmemo="";
    String insertdate ="";
    String vname ="";
    String vsnum ="";
    String vsstatus ="";
    
 	for(int i = 0 ; i < nCnt ; i++ ){
    	ScheduleVO svoSelect = select.get(i);
    	vsname = svoSelect.getVsname();
    	vnum = svoSelect.getVnum();
    	vsstart = svoSelect.getVsstart();
    	vsend = svoSelect.getVsend();
    	vsmemo = svoSelect.getVsmemo();
    	vname = svoSelect.getVname();
    	insertdate = svoSelect.getInsertdate();
    	vsnum = svoSelect.getVsnum();
    	vsstatus = svoSelect.getVsstatus();
 	}
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 조회</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/PUVG/css/schedule/scheduleBoardSelect.css">

<script type="text/javascript">



$(document).ready(function(){
	
	// 게시글 검색하기 ============================================
	$("#serchbtn").click(function(){
		$("#select").attr({
			"action":"sheduleBoardSerch.puvg",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"
		}).submit();
	});
	// 게시글 검색하기 ============================================
		
	// 게시글 등록하기  ============================================
	$("#insrtbtn").click(function(){
		location.href="sheduleBoardInsertForm.puvg"
	});
	
	// 게시글 수정  ==============================================================
	$("#updatebtn").click(function(){
		$("#select").attr({
			"action":"scheduleBoardUpdateForm.puvg",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"
		}).submit();
	});
	// 게시글 수정  ==============================================================
	
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
	
	// 삭제하기 ================================================================	
	$("#deletebtn").click(function(){
		if (!confirm("해당 글을 삭제하겠습니까?")) {
		} else {
			$("#select").attr({
				"action":"scheduledDelete.puvg",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		}
	});
	
	// 일정상태 수정 ===============================
	$(".scdBSbtn3").click(function(){
		$("#lodding").css({"transform":"translateY(0)"});
		setTimeout(function(){
		$("#perfect").css({"transform":"translateY(0)"});	
		}, 100);
		setTimeout(function(){
		$("#fail").css({"transform":"translateY(0)"});	
		}, 200);
	});
	
	$("#lodding").click(function(){
		$("#vsstatus").val("01");
		if (!confirm("진행중으로 상태를 변경하시겠습니까?")) {
		} else {
			if (!confirm("작성하고 있던 글이 지워집니다. 지금 바로 바꿀까요?")) {
			} else {
				$("#select").attr({
					"action":"scheduledUpdateStatus.puvg",
					"method":"GET",
					"enctype":"application/x-www-form-urlencoded"
				}).submit();
			}
		}
	});
	
	$("#perfect").click(function(){
		$("#vsstatus").val("02");
		if (!confirm("완료 상태로 변경하시겠습니까?")) {
		} else {
			if (!confirm("작성하고 있던 글이 지워집니다. 지금 바로 바꿀까요?")) {
			} else {
				$("#select").attr({
					"action":"scheduledUpdateStatus.puvg",
					"method":"GET",
					"enctype":"application/x-www-form-urlencoded"
				}).submit();
			}
		}
	});
	
	$("#fail").click(function(){
		$("#vsstatus").val("03");
		if (!confirm("미완성 상태로 변경하시겠습니까?")) {
		} else {
			if (!confirm("작성하고 있던 글이 지워집니다. 지금 바로 바꿀까요?")) {
			} else {
				$("#select").attr({
					"action":"scheduledUpdateStatus.puvg",
					"method":"GET",
					"enctype":"application/x-www-form-urlencoded"
				}).submit();
			}
		}
	});
			
		
		
});
</script>

</head>
<!-- 수정, 삭제 버튼은 세션을 받아와서
해당 사용자가 맞으면 보이게 하기 -->

<body>
<div class="scdBSDiv12">
	<%@include file ="../sidebar/LeftSidebar.jsp" %>
</div>
<%@include file ="../schedule/scheduleBoardMenuIcon.jsp" %>

<form id="select">
<input type="hidden" id="vnum" name="vnum" value="<%= vnum %>"/>
<input type="hidden" id="vsnum" name="vsnum" value="<%= vsnum %>"/>
<input type="hidden" id="vsstatus" name="vsstatus" value="<%= vsstatus %>"/>
<div class="scdBSDiv10">
	<div class="scdBSDiv11">
	<button type="button" id="lodding" class="scdBSbtn4">진행중</button>
	<button type="button" id="perfect" class="scdBSbtn4">완료</button>
	<button type="button" id="fail" class="scdBSbtn4">미완성</button>
	</div>
	<div class="scdBSDiv9">
	게시글 검색 <input type="text" id="vsname" name="vsname" class="scdBSI1"/>
	<button type="button" id="serchbtn" class="scdBSbtn2">검색하기</button>
	</div>
	<div class="scdBSDiv2">
		<button type="button" id="insrtbtn" class="scdBSbtn1">등록</button>
		<button type="button" id="updatebtn" class="scdBSbtn1">수정</button>
		<button type="button" id ="deletebtn" class="scdBSbtn1">삭제</button>
		<button type="button" class="scdBSbtn3">일정상태수정</button>
	</div>
	<div class="scdBSDiv1">

		<div class="scdBSDiv4">
		<%= vsname %>
		</div>
		<div class="scdBSDiv5">
		작성자 : <%= vname %>
		</div>
		<div class="scdBSDiv6">
		<%= insertdate %>
		</div><br><br>
		<div class="scdBSDiv8">
			<%= vsstart %> - <%= vsend %>
		</div>
		<div class="scdBSDiv7">
			<%= vsmemo %>
		</div>

	</div>
</div>

</form>
</body>
</html>