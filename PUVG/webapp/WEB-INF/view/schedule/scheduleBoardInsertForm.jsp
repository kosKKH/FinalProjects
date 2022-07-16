<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file ="../schedule/scheduleBoardMenuIcon.jsp" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>일정 게시판으로 등록하기</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 제이쿼리 날짜등록 -->
<link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
<link rel="stylesheet" href="/PUVG/css/schedule/scheduleBoardInsertForm.css">

<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script src="./jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
    $.datepicker.setDefaults({
        dateFormat: 'yymmdd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });

    $(function() {
        $("#datepicker1").datepicker();
        $("#datepicker2").datepicker();
    });
    
    // 시간 등록 버튼 ==============================================
    $(".scdBIDiv3").hide();
    $("#timeBtn").click(function(){
    	var status = $("#scdBSbtn1Status").val();
    	if(status == "N"){
    		$("#scdBSbtn1Status").val("Y");
    		$(".scdBIDiv3").slideDown();
    	}else if(status == "Y"){
    		$("#scdBSbtn1Status").val("N");
    		$(".scdBIDiv3").slideUp();
    	}
    	
    });
 	// 시간 등록 버튼 ==============================================
    
	// 셀렉트박스 애니메이션  =====================================================
	$("#scdBISelect1").change(function(){
		$("#scdBISelect1").css({"background":"#6165f8", "color":"#fff"});
	});
	$("#scdBISelect2").change(function(){
		$("#scdBISelect2").css({"background":"#6165f8", "color":"#fff"});
	});
	$("#scdBISelect3").change(function(){
		$("#scdBISelect3").css({"background":"#6165f8", "color":"#fff"});
	});
	$("#scdBISelect4").change(function(){
		$("#scdBISelect4").css({"background":"#6165f8", "color":"#fff"});
	});
	// 셀렉트박스 애니메이션  =====================================================
		
	// 체크박스 선택  ==========================================================
	$(".scdBIDiv6").hide();
	$("#shareAll").click(function(){
		$("#shareAll").css({"background":"#6165f8", "color":"#6165f8"});
		$("#shareDept").css({"background":"#fff", "color":"#fff"});
		$("#shareMe").css({"background":"#fff", "color":"#fff"});
		$("#shareOther").css({"background":"#fff", "color":"#fff"});
		$("#vspublic").val("01");
		$(".scdBIDiv6").slideUp();
		
	});
	
	$("#shareDept").click(function(){
		$("#shareDept").css({"background":"#6165f8", "color":"#6165f8"});
		$("#shareAll").css({"background":"#fff", "color":"#fff"});
		$("#shareMe").css({"background":"#fff", "color":"#fff"});
		$("#shareOther").css({"background":"#fff", "color":"#fff"});
		$("#vspublic").val("02");
		$(".scdBIDiv6").slideUp();
	});
	
	$("#shareMe").click(function(){
		$("#shareMe").css({"background":"#6165f8", "color":"#6165f8"});
		$("#shareAll").css({"background":"#fff", "color":"#fff"});
		$("#shareDept").css({"background":"#fff", "color":"#fff"});
		$("#shareOther").css({"background":"#fff", "color":"#fff"});
		$("#vspublic").val("03");
		$(".scdBIDiv6").slideUp();
	});
	
	$("#shareOther").click(function(){
		$("#shareOther").css({"background":"#6165f8", "color":"#6165f8"});
		$("#shareAll").css({"background":"#fff", "color":"#fff"});
		$("#shareDept").css({"background":"#fff", "color":"#fff"});
		$("#shareMe").css({"background":"#fff", "color":"#fff"});
		$("#vspublic").val("04");
		$(".scdBIDiv6").slideDown();
		
	});
	// 체크박스 선택  ==========================================================
		
	// 사원이름검색  ==========================================================
	$(".scdBII6").hide();
	$(".scdBSbtn3").hide();	
	$("#serchMemBtn").click(function(){
		var serchMem = $("#serchMem").val();
		if(serchMem == ""){
			alert("사원 이름을 한 글자 이상 입력해주세요!");
		}else{
			$.ajax({
				url : "sheduleMemSerch.puvg",
				type : "POST",
				data : {vname : serchMem},
				dataType : "text", //이 부분 수정해야 함
				success : sfun,
				error : efun
			});
			
			function sfun(response){
				$("#shareText").attr({ "value":response});
				var shareText = $("#shareText").val();
				
				// 현재 중복된 공유 사원은 등록 불가한 오류가 있다.
				
				// 카운트 세준다.
				var shareCount = 0; //$(".scdBII6").length;
				var share1 = $("#share1").val();
				var share2 = $("#share2").val();
				var share3 = $("#share3").val();
				var share4 = $("#share4").val();
				var share5 = $("#share5").val();
				var share6 = $("#share6").val();
				var share7 = $("#share7").val();
				var share8 = $("#share8").val();
				var share9 = $("#share9").val();
				var share10 = $("#share10").val();
				var share11 = $("#share11").val();
				var share12 = $("#share12").val();
				var share13 = $("#share13").val();
				var share14 = $("#share14").val();
				var share15 = $("#share15").val();
				var share16 = $("#share16").val();
				var share17 = $("#share17").val();
				var share18 = $("#share18").val();
				var share19 = $("#share19").val();
				var share20 = $("#share20").val();
				
				if(response == "등록된 사원 이름이 없습니다. 다시 검색해주세요."){
					alert("response : " + response);
					return response = "";
				}else if(response =="검색하시면 여기에 적힌 사원을 클릭해서 등록할 수 있습니다."){
					alert('이름을 검색해주세요.');
					return;
				}else{
					if(shareCount < 10){
						$("#shareText").one("click", function(){
						
							if(share11 == "Y"){
								if(share2 == ""){
									$("#share12").val("Y");
								}
								$("#share1").show();
								$("#shareDelete1").show();
								$("#share1").val(response);
								shareCount = shareCount + 1;
								$("#share11").val("W");
								return;
							}else if(share12 == "Y"){
								if(share3 == ""){
									$("#share13").val("Y");
								}
								$("#share2").show();
								$("#shareDelete2").show();
								$("#share2").val(response);
								shareCount = shareCount + 1;
								$("#share12").val("W");
								return;
							}else if(share13 == "Y"){
								if(share4 == ""){
									$("#share14").val("Y");
								}
								$("#share3").show();
								$("#shareDelete3").show();
								$("#share3").val(response);
								shareCount = shareCount + 1;
								$("#share13").val("W");
								return;
							}else if(share14 == "Y"){
								if(share5 == ""){
									$("#share15").val("Y");
								}
								$("#share4").show();
								$("#shareDelete4").show();
								$("#share4").val(response);
								shareCount = shareCount + 1;
								$("#share14").val("W");
								return;
							}else if(share15 == "Y"){
								if(share6 == ""){
									$("#share16").val("Y");
								}
								$("#share5").show();
								$("#shareDelete5").show();
								$("#share5").val(response);
								shareCount = shareCount + 1;
								$("#share15").val("W");
								return;
							}else if(share16 == "Y"){
								if(share7 == ""){
									$("#share17").val("Y");
								}
								$("#share6").show();
								$("#shareDelete6").show();
								$("#share6").val(response);
								shareCount = shareCount + 1;
								$("#share16").val("W");
								return;
							}else if(share17 == "Y"){
								if(share8 == ""){
									$("#share18").val("Y");
								}
								$("#share7").show();
								$("#shareDelete7").show();
								$("#share7").val(response);
								shareCount = shareCount + 1;
								$("#share17").val("W");
								return;
							}else if(share18 == "Y"){
								if(share9 == ""){
									$("#share19").val("Y");
								}
								$("#share8").show();
								$("#shareDelete8").show();
								$("#share8").val(response);
								shareCount = shareCount + 1;
								$("#share18").val("W");
								return;
							}else if(share19 == "Y"){
								if(share10 == ""){
									$("#share20").val("Y");
								}
								$("#share9").show();
								$("#shareDelete9").show();
								$("#share9").val(response);
								shareCount = shareCount + 1;
								$("#share19").val("W");
								return;
							}else if(share20 == "Y"){
								$("#share10").show();
								$("#shareDelete10").show();
								$("#share10").val(response);
								shareCount = shareCount + 1;
								$("#share20").val("W");
								return;
							}
							
						});
					}else{
						alert('공유는 10명까지만 가능합니다.');
					}
				}
			}//function sfun
			function efun(request,status,error){
				alert("죄송합니다. 오류가 생겨 일정등록에 문제가 생겼습니다. ");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		}
	});
	
	
	
	//취소하기 ===========================================================
	$("#canclebtn").click(function(){
		if (!confirm("작성중인 글을 취소하시겠습니까?")) {
	    } else {
	    	window.history.go(-1);
	    }
	});
	//취소하기 ===========================================================
	
	//등록버튼 클릭하기 ===========================================================
	$("#insertbtn").click(function(){
		var vspublic = $("#vspublic").val();
		
		// 공유가 04(일부만공개)가 아닐 경우 ============================
		if(vspublic == "04"){
		}else{
			$(".scdBII6").val("");
		}
		// 공유가 04(일부만공개)가 아닐 경우 ============================
		
		// 제목 안 쓸 경우 back
		var vsname = $("#vsname").val();
		if(vsname == ""){
			alert("일정 제목을 입력해주세요.");
			return;
		}
		
		// 등록할 캘린더 종류
		var vscalendarnum = $("#vscalendarnum").val();
		
		var dateStart = $("#datepicker1").val();
		var dateEnd = $("#datepicker2").val();

		// 시간 설정을 안 했을 경우 오늘 날짜로 등록됨. ======================================
		if(dateStart == "" || dateEnd ==""){
			var now = new Date()
			year = now.getFullYear();
			month = now.getMonth()+1;
			monthS = String(month);
			monthL = monthS.length;
			if(monthL < 2){
				monthS = "0" + month;
			}
			day = now.getDate();
			dayS = String(day);
			dayL = dayS.length;
			if(dayL < 2){
				dayS = "0" + day;
			}
			todayStart = year + "-" + monthS + "-" + dayS + "T00:00";
			console.log("today : " + todayStart);
			
			var yearE = year;
			var monthE = monthS;
			var dayE = day + 1;
			var dayES = String(dayE);
			var dayEL = dayES.length;
			if(dayEL < 2){
				dayES = "0" + dayE;
			}
			
			if(monthS=="12" && dayS =="31"){
				yearE = year + 1;
				monthE = "01";
				dayES = "01";
			}
			if(monthS=="01" || monthS=="03" || monthS=="05" || monthS=="07" || monthS=="08" || monthS=="10"){
				if(dayS=="31"){
					monthE = String(month + 1);
					dayES = "01";
				}
			}else if(monthS=="04" || monthS=="06" || monthS=="09" || monthS=="11"){
				if(dayS=="30"){
					monthE = String(month + 1);
					dayES = "01";
				}
			}
			 todayEnd = yearE + "-" + monthE + "-" + dayES + "T00:00";
			 console.log("todayEnd : " + todayEnd);
			$("#vsstart").val(todayStart);
			$("#vsend").val(todayEnd);

		}else if(dateStart > dateEnd){ // 시간설정이 있을 경우 ======================================
			alert("날짜를 잘못 선택하셨습니다. 다시 등록해주세요.");
			return;
		}else if(dateStart == dateEnd){
			var startH = $("#scdBISelect1").val();
			var startM = $("#scdBISelect2").val();
			var endH = $("#scdBISelect3").val();
			var endM = $("#scdBISelect4").val();
			var startHI = parseInt(startH);
			var startMI = parseInt(startM);
			var endHI = parseInt(endH);
			var endMI = parseInt(endM);
			if(startHI > endHI){
				alert("시간을 잘못 선택하셨습니다. 다시 선택해주세요.");
				return;
			}else if(startH == endH){
				if(startMI > endMI){
					alert("시간을 잘못 선택하셨습니다. 다시 선택해주세요.");
					return;
				}else if(startM == endM){
					alert("최소 일정 진행 설정 시간은 30분 입니다.");
				}
			}
		}else{	
			
			var cYear1 = dateStart.slice(0,4);
			var cMonth1 = dateStart.slice(4,6);
			var cDay1 = dateStart.slice(6,8);
			var time1_1 = $("#scdBISelect1").val();
			var time1_2 = $("#scdBISelect2").val();
			
			var cYear2 = dateEnd.slice(0,4);
			var cMonth2 = dateEnd.slice(4,6);
			var cDay2 = dateEnd.slice(6,8);
			var time2_1 = $("#scdBISelect3").val();
			var time2_2 = $("#scdBISelect4").val();

			var todayStart0 = cYear1 + "-" + cMonth1 + "-" + cDay1 + "T" + time1_1 + ":" + time1_2;
			console.log("todayStart0 : " + todayStart0);
			var todayEnd0 = cYear2 + "-" + cMonth2 + "-" + cDay2 + "T" + time2_1 + ":" + time2_2;
			console.log("todayEnd0 : " + todayEnd0);
			var vsstart = $("#vsstart").val(todayStart0);
			var vsend = $("#vsend").val(todayEnd0);
		}
		
		$("#insertDetail").attr({
			"action":"sheduleBoardInsert.puvg",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"
		}).submit();
		
	});
	//등록버튼 클릭하기 ===========================================================
	
	//공유하기 삭제버튼 ===========================================================
	$("#shareDelete1").click(function(){
		$("#share1").hide();
		$("#shareDelete1").hide();
		$("#share11").val("Y");
	});
	$("#shareDelete2").click(function(){
		$("#share2").hide();
		$("#shareDelete2").hide();
		$("#share11").val("Y");
	});
	$("#shareDelete3").click(function(){
		$("#share3").hide();
		$("#shareDelete3").hide();
		$("#share13").val("Y");
	});
	$("#shareDelete4").click(function(){
		$("#share4").hide();
		$("#shareDelete4").hide();
		$("#share14").val("Y");
	});
	$("#shareDelete5").click(function(){
		$("#share5").hide();
		$("#shareDelete5").hide();
		$("#share15").val("Y");
	});
	$("#shareDelete6").click(function(){
		$("#share6").hide();
		$("#shareDelete6").hide();
		$("#share16").val("Y");
	});
	$("#shareDelete7").click(function(){
		$("#share7").hide();
		$("#shareDelete7").hide();
		$("#share17").val("Y");
	});
	$("#shareDelete8").click(function(){
		$("#share8").hide();
		$("#shareDelete8").hide();
		$("#share18").val("Y");
	});
	$("#shareDelete9").click(function(){
		$("#share9").hide();
		$("#shareDelete9").hide();
		$("#share19").val("Y");
	});
	$("#shareDelete10").click(function(){
		$("#share10").hide();
		$("#shareDelete10").hide();
		$("#share20").val("Y");
	});
	//공유하기 삭제버튼 ===========================================================
		
	// 메뉴버튼 ================================================================	
	$(".scheduleBoardImg_Menue").click(function(){
		if (!confirm("게시판으로 이동할까요?")) {
	    } else {
			$("#insertDetail").attr({
				"action":"scheduleBoardSelectAll.puvg",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
	    }
	});
	// 메뉴버튼 ================================================================
});
</script>

<style type="text/css">




</style>

</head>
<body>

<form id="insertDetail">

<!-- 가라데이터--> 
<input type="hidden" id="vnum" name="vnum" value="V202207100001" />
<input type="hidden" id="vdept" name="vdept" value="영업부" />
<input type="hidden" id="vname" name="vname" value="황신애" />
<!-- 등록하기 같은 경우 일정은 항상 진행중으로 표기됨 -->
<input type="hidden" id="vsstatus" name="vsstatus" value="01" />

<!-- 공유번호 :: 기본 전체, 버튼클릭하면 해당 공유버튼으로 바뀜-->
<input type="hidden" id="vspublic" name="vspublic" value="01" />




<div class="scdBIDiv1">
	<div class="scdBIDiv2">
		<select id="vscalendarnum" name="vscalendarnum" class="scdSelect1">
			<option value="01">개인</option>
			<option value="02">부서(팀 최고위원자만 가능)</option>
			<option value="03">전체(관리자만 가능)</option>
		</select><br>
		<span class="scdBISpan1">제목</span><br>
		<input type="text" id="vsname" name="vsname" class="scdBII1" /><br>
		<button type="button" id="timeBtn" class="scdBSbtn1">시간 추가</button>
		<span class="scdBISpan3">등록하지 않을 경우 오늘 하루 일정으로 등록됩니다.</span><br>
		<input type="hidden" id="scdBSbtn1Status" value="N"/>
		<div class="scdBIDiv3">
			<table class="scdBITable1">
				<!-- 시작시간 -->
				<input type="hidden" id="vsstart" name="vsstart" value=""/>
				<input type="hidden" id="vsend" name="vsend" value=""/>
				<tr>
					<td class="scdBITD1"><span class="scdBISpan2">시작</span></td>
					<td class="scdBITD2"><input type="text" id="datepicker1" class="scdBII2"></td>
					<td class="scdBITD3"><span class="scdBISpan2">마감</span></td>
					<td class="scdBITD4"><input type="text" id="datepicker2" class="scdBII2"></td>
				</tr>
				<tr>
					<td class="scdBITD1"></td>
					<td class="scdBITD2">
						<select id="scdBISelect1" class="scdBISelect">
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
						</select> 시
						<select id="scdBISelect2" class="scdBISelect">
							<option value="00">00</option>
							<option value="30">30</option>
						</select> 분
					</td>
					<td class="scdBITD3"></td>
					<td class="scdBITD4">
						<select id="scdBISelect3" class="scdBISelect">
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
						</select> 시
						<select id="scdBISelect4" class="scdBISelect">
							<option value="00">00</option>
							<option value="30">30</option>
						</select> 분
					</td>
				</tr>
			</table>
		</div>
		<div class="scdBIDiv4">
			<span class="scdBISpan1">내용</span><br>
			<textarea id="vsmemo" name="vsmemo" class="scdBTIT" placeholder="이곳에 메모를 남겨주세요."></textarea>
		</div>
		<button type="button" id="shareBtn" class="scdBSbtn1">공유하기</button>
		<span class="scdBISpan3">기본 전체공유로 되어있어요.</span><br>
		<div class="scdBIDiv5">
			<table class="scdBITable2" >
				<tr>
					<td class="scdBITD5"><input type="button" id="shareAll" value="01" class="sharebtn"/></td>
					<td class="scdBITD6"><span class="scdBISpan4">전체 공개</spna></td>
					<td class="scdBITD5"><input type="button" id="shareDept" value="02" class="sharebtn"/></td>
					<td class="scdBITD6"><span class="scdBISpan4">부서만</spna></td>
					<td class="scdBITD5"><input type="button" id="shareMe" value="03" class="sharebtn"/></td>
					<td class="scdBITD6"><span class="scdBISpan4">나만보기</spna></td>
					<td class="scdBITD5"><input type="button" id="shareOther" value="04" class="sharebtn"/></td>
					<td class="scdBITD6"><span class="scdBISpan4">공유 선택</spna></td>
				</tr>
			</table>		
		</div>
		<div class="scdBIDiv6">
			<div class="scdBIDiv7">
			<span class="scdBISpan5">공유하실 분을 검색해주세요.</span><br>
				<span class="scdBISpan6">최대 10명까지만 가능합니다.</span><br>
				<input type="text" id="serchMem" class="scdBII3">
				<button type="button" id="serchMemBtn" class="scdBSbtn1">검색</button><br>
				<input type="text" id="shareText" class="scdBII5" value="검색하시면 여기에 적힌 사원을 클릭해서 등록할 수 있습니다." readonly />
			</div>
			<div class="scdBIDiv8">
				<table class="scdBITable3">
					<tr>
						<td class="scdBITD7" >
							<input type="text" id="share1" name="share1" class="scdBII6" value=""/>
							<button type="button" id="shareDelete1" class="scdBSbtn3">×</button>
							<input type="hidden" id="share11" value="Y"/>
							
							<input type="text" id="share2" name="share2" class="scdBII6" value=""/>
							<button type="button" id="shareDelete2" class="scdBSbtn3">×</button>
							<input type="hidden" id="share12" value="N"/>
							
							<input type="text" id="share3" name="share3" class="scdBII6" value=""/>
							<button type="button" id="shareDelete3" class="scdBSbtn3">×</button>
							<input type="hidden" id="share13" value="N"/>
							
							<input type="text" id="share4" name="share4" class="scdBII6" value=""/>
							<button type="button" id="shareDelete4" class="scdBSbtn3">×</button>
							<input type="hidden" id="share14" value="N"/>
							
							<input type="text" id="share5" name="share5" class="scdBII6" value=""/>
							<button type="button" id="shareDelete5" class="scdBSbtn3">×</button>
							<input type="hidden" id="share15" value="N"/>
							
						</td>
					</tr>
					<tr>
						<td class="scdBITD7">
							<input type="text" id="share6" name="share6" class="scdBII6" value=""/>
							<button type="button" id="shareDelete6" class="scdBSbtn3">×</button>
							<input type="hidden" id="share16" value="N"/>
							
							<input type="text" id="share7" name="share7" class="scdBII6" value=""/>
							<button type="button" id="shareDelete7" class="scdBSbtn3">×</button>
							<input type="hidden" id="share17" value="N"/>
							
							<input type="text" id="share8" name="share8" class="scdBII6" value=""/>
							<button type="button" id="shareDelete8" class="scdBSbtn3">×</button>
							<input type="hidden" id="share18" value="N"/>
							
							<input type="text" id="share9" name="share9" class="scdBII6" value=""/>
							<button type="button" id="shareDelete9" class="scdBSbtn3">×</button>
							<input type="hidden" id="share19" value="N"/>
							
							<input type="text" id="share10" name="share10" class="scdBII6" value=""/>
							<button type="button" id="shareDelete10" class="scdBSbtn3">×</button>
							<input type="hidden" id="share20" value="N"/>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class=scdBIDiv9>
		<button type="button" id="canclebtn" class="scdBSbtn2">작성취소</button>
		<button type="button" id="insertbtn" class="scdBSbtn2">등록하기</button>
	</div>
</div>
</form>
</body>
</html>